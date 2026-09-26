#!/usr/bin/env python3
"""Minimal pure-stdlib PDF text extractor.

Handles: FlateDecode streams, object streams (ObjStm), ToUnicode CMaps,
simple-font /Type1 differences fallback, and content-stream text operators
(Tj, TJ, ', ", BT/ET, Tf, Td, TD, T*, Tm, T*).
"""
import re
import sys as _sys
_sys.path.insert(0, "/tmp/opencode/xdr")
import sys
import zlib

# ---------------------------------------------------------------- object scan

def find_objects(data):
    """Return {objnum: (raw_body_bytes, stream_bytes_or_None)}."""
    objs = {}
    for m in re.finditer(rb"(\d+)\s+(\d+)\s+obj\b", data):
        num = int(m.group(1))
        start = m.end()
        end = data.find(b"endobj", start)
        if end == -1:
            end = len(data)
        objs[num] = data[start:end]
    return objs


def get_stream(body):
    """Extract and inflate the stream payload of an object body."""
    i = body.find(b"stream")
    if i == -1:
        return None
    j = i + len(b"stream")
    if data_at(body, j) == b"\r":
        j += 1
    if j < len(body) and body[j:j + 1] == b"\n":
        j += 1
    k = body.rfind(b"endstream")
    if k == -1:
        k = len(body)
    raw = body[j:k]
    head = body[:i]
    if b"FlateDecode" in head:
        for attempt in (raw, raw.strip(b"\r\n")):
            try:
                return zlib.decompress(attempt)
            except zlib.error:
                pass
        try:
            d = zlib.decompressobj()
            return d.decompress(raw)
        except zlib.error:
            # truncated stream: salvage what we can
            try:
                d = zlib.decompressobj()
                out = d.decompress(raw)
                out += d.flush()
                return out
            except zlib.error:
                return None
    return raw


def data_at(b, i):
    return b[i:i + 1]


# ------------------------------------------------------------- CMap decoding

def parse_tounicode(cmap_bytes):
    """Parse a ToUnicode CMap -> {(nbytes, code): str}."""
    mapping = {}
    txt = cmap_bytes
    for blk in re.findall(rb"beginbfchar(.*?)endbfchar", txt, re.S):
        for src, dst in re.findall(rb"<([0-9A-Fa-f]+)>\s*<([0-9A-Fa-f]+)>", blk):
            mapping[(len(src) // 2, int(src, 16))] = utf16be_hex(dst)
    for blk in re.findall(rb"beginbfrange(.*?)endbfrange", txt, re.S):
        # array form: <lo> <hi> [<d1> <d2> ...]
        for lo, hi, arr in re.findall(
            rb"<([0-9A-Fa-f]+)>\s*<([0-9A-Fa-f]+)>\s*\[(.*?)\]", blk, re.S
        ):
            lo_i = int(lo, 16)
            n = len(lo) // 2
            dsts = re.findall(rb"<([0-9A-Fa-f]+)>", arr)
            for k, d in enumerate(dsts):
                mapping[(n, lo_i + k)] = utf16be_hex(d)
        # 3-arg form: <lo> <hi> <dststart>
        for lo, hi, dst in re.findall(
            rb"<([0-9A-Fa-f]+)>\s*<([0-9A-Fa-f]+)>\s*<([0-9A-Fa-f]+)>\s*(?!\s*\[)", blk
        ):
            lo_i, hi_i = int(lo, 16), int(hi, 16)
            base = int(dst, 16)
            n = len(lo) // 2
            if hi_i - lo_i > 65535:
                continue
            for k in range(lo_i, hi_i + 1):
                mapping[(n, k)] = utf16be_hex(format(base + (k - lo_i), "0%dx" % len(dst)))
    return mapping


def utf16be_hex(hexstr):
    if isinstance(hexstr, bytes):
        hexstr = hexstr.decode("ascii")
    if len(hexstr) % 4 != 0:
        hexstr = hexstr.rjust(len(hexstr) + (4 - len(hexstr) % 4), "0")
    out = []
    for i in range(0, len(hexstr), 4):
        try:
            out.append(chr(int(hexstr[i:i + 4], 16)))
        except ValueError:
            pass
    return "".join(out)


# ------------------------------------------------------------- content stream

STR_TOKEN = re.compile(rb"\((?:\\.|[^\\()])*\)|<[0-9A-Fa-f\s]*>|\[|\]|[-+.0-9]+|/[^\s/\[\]()<>]+|[A-Za-z'\"*]+")


def unescape_literal(s):
    s = s[1:-1]
    out = bytearray()
    i = 0
    esc = {b"n": 10, b"r": 13, b"t": 9, b"b": 8, b"f": 12,
           b"(": 40, b")": 41, b"\\": 92}
    while i < len(s):
        c = s[i:i + 1]
        if c == b"\\":
            nxt = s[i + 1:i + 2]
            if nxt in esc:
                out.append(esc[nxt])
                i += 2
            elif nxt.isdigit():
                oct_digits = b""
                j = i + 1
                while j < len(s) and len(oct_digits) < 3 and s[j:j + 1].isdigit():
                    oct_digits += s[j:j + 1]
                    j += 1
                out.append(int(oct_digits, 8) & 0xFF)
                i = j
            elif nxt == b"\n":
                i += 2
            else:
                out.append(nxt[0] if nxt else 92)
                i += 2
        else:
            out.append(c[0])
            i += 1
    return bytes(out)


def decode_string(tok, cmap, two_byte):
    """Decode a PDF string token to text using cmap (or latin-1 fallback)."""
    if tok.startswith(b"<"):
        hx = re.sub(rb"\s", b"", tok[1:-1])
        if len(hx) % 2:
            hx += b"0"
        data = bytes.fromhex(hx.decode("ascii"))
    else:
        data = unescape_literal(tok)

    if not cmap:
        return data.decode("latin-1", "replace")

    out = []
    if two_byte:
        for i in range(0, len(data) - 1, 2):
            code = (data[i] << 8) | data[i + 1]
            out.append(cmap.get((2, code), ""))
        return "".join(out)

    # 1-byte codes: only 1-byte cmap entries are valid here. Never fall back to
    # 2-byte entries -- that mixes code-unit widths and yields garbage.
    for b in data:
        if (1, b) in cmap:
            out.append(cmap[(1, b)])
        else:
            out.append(chr(b))
    return "".join(out)


def extract_page_text(content, fontmaps, font_is2byte):
    """Walk content stream tokens, emitting text with layout hints."""
    parts = []
    stack = []
    cur_cmap = None
    cur_two = False
    pending = []
    last_y = None
    last_x = None
    leading = 0.0

    for m in STR_TOKEN.finditer(content):
        tok = m.group(0)

        if tok.startswith(b"/"):
            stack.append(("name", tok[1:].decode("latin-1", "replace")))
            continue
        if tok in (b"[", b"]"):
            stack.append(("tok", tok.decode()))
            continue
        if re.fullmatch(rb"[-+.0-9]+", tok):
            stack.append(("num", float(tok)))
            continue
        if tok.startswith(b"(") or tok.startswith(b"<"):
            stack.append(("str", tok))
            continue

        op = tok.decode("latin-1", "replace")

        if op == "Tf":
            for kind, val in reversed(stack):
                if kind == "name":
                    fm = fontmaps.get(val)
                    cur_cmap = fm[0] if fm else None
                    cur_two = fm[1] if fm else False
                    break
        elif op in ("Tj", "'", '"'):
            for kind, val in stack:
                if kind == "str" and cur_cmap is not None or (kind == "str" and op in ("'", '"')):
                    txt = decode_string(val, cur_cmap, cur_two)
                    if txt:
                        parts.append(txt)
                        pending.append(txt)
            if op in ("'", '"'):
                parts.append("\n")
        elif op == "TJ":
            arr = [v for k, v in stack if k == "str"]
            buf = []
            for val in arr:
                buf.append(decode_string(val, cur_cmap, cur_two))
                if val.startswith(b"<"):
                    continue
            parts.append("".join(buf))
        elif op in ("Td", "TD"):
            nums = [v for k, v in stack if k == "num"]
            if len(nums) >= 2:
                tx, ty = nums[-2], nums[-1]
                if op == "TD":
                    leading = -ty
                if abs(ty) > 0.5:
                    parts.append("\n")
                elif tx > 1.0:
                    parts.append(" ")
                last_x, last_y = tx, ty
        elif op == "Tm":
            nums = [v for k, v in stack if k == "num"]
            if len(nums) >= 6:
                x, y = nums[4], nums[5]
                if last_y is None or abs(y - last_y) > 0.5:
                    parts.append("\n")
                elif last_x is not None and x - last_x > 1.0:
                    parts.append(" ")
                last_x, last_y = x, y
        elif op == "T*":
            parts.append("\n")
        elif op == "ET":
            parts.append("\n")

        stack = []

    return "".join(parts)


# ------------------------------------------------------------------ main flow

def build_font_maps(objs, page_fonts=None):
    """objnum -> ToUnicode mapping + composite flag; keyed by font resource name later."""
    import truetype
    tounicode = {}
    composite = {}
    for num, body in objs.items():
        if b"/ToUnicode" in body and b"/Font" in body:
            m = re.search(rb"/ToUnicode\s+(\d+)\s+\d+\s+R", body)
            if m:
                tgt = int(m.group(1))
                st = get_stream(objs.get(tgt, b"")) if tgt in objs else None
                if st:
                    tounicode[num] = parse_tounicode(st)
        if re.search(rb"/Subtype\s*/(Type0|CIDFontType0|CIDFontType2)", body):
            composite[num] = True

    # For composite fonts, the embedded font program's own cmap is more
    # reliable than the producer's ToUnicode. Resolve through the descendant
    # font descriptor's /FontFile2 and merge as an override.
    for num, body in objs.items():
        if not composite.get(num):
            continue
        gid2uni = None
        dm = re.search(rb"/DescendantFonts\s+(\d+)\s+\d+\s+R", body)
        dbody = objs.get(int(dm.group(1)), b"") if dm else b""
        if dbody.lstrip().startswith(b"["):
            # /DescendantFonts points at an array of indirect refs
            k = re.search(rb"(\d+)\s+\d+\s+R", dbody)
            dbody = objs.get(int(k.group(1)), b"") if k else b""
        fd = re.search(rb"/FontDescriptor\s+(\d+)\s+\d+\s+R", dbody)
        if not fd:
            fm2 = re.search(rb"/FontDescriptor\s+(\d+)\s+\d+\s+R", body)
            if fm2:
                fd = fm2
        if fd:
            fdesc = objs.get(int(fd.group(1)), b"")
            ff = re.search(rb"/FontFile2\s+(\d+)\s+\d+\s+R", fdesc)
            if not ff:
                ff = re.search(rb"/FontFile3\s+(\d+)\s+\d+\s+R", fdesc)
            if ff:
                data = get_stream(objs.get(int(ff.group(1)), b""))
                if data:
                    gid2uni = truetype.font_gid_to_unicode(data)
        if gid2uni:
            merged = dict(tounicode.get(num, {}))
            for gid, uni in gid2uni.items():
                merged[(2, gid)] = chr(uni) if uni < 0x110000 else ""
            tounicode[num] = merged
    return tounicode, composite


def resource_font_map(objs, res_body, tounicode, composite, inherited=None):
    """Map /F1 -> (cmap, two_byte) using a /Resources dict body."""
    out = dict(inherited or {})
    if not res_body:
        return out
    fm = re.search(rb"/Font\s*(\d+)\s+\d+\s+R", res_body)
    font_dict = None
    if fm:
        font_dict = objs.get(int(fm.group(1)), b"")
    else:
        fm = re.search(rb"/Font\s*<<(.*?)>>", res_body, re.S)
        if fm:
            font_dict = fm.group(1)
    if not font_dict:
        return out
    for name, onum in re.findall(rb"/([A-Za-z0-9#+._-]+)\s+(\d+)\s+\d+\s+R", font_dict):
        onum = int(onum)
        cmap = tounicode.get(onum)
        two = bool(composite.get(onum))
        if cmap and not two:
            # Heuristic: a non-composite font whose ToUnicode only carries
            # 2-byte codes is still addressed with 2-byte code units.
            has1 = any(k[0] == 1 for k in cmap)
            has2 = any(k[0] == 2 for k in cmap)
            if has2 and not has1:
                two = True
        out[name.decode("latin-1")] = (cmap, two)
    return out


def extract(path):
    with open(path, "rb") as fh:
        data = fh.read()

    objs = find_objects(data)

    # expand object streams (ObjStm) so compressed page objects are visible
    for num, body in list(objs.items()):
        if b"/ObjStm" not in body:
            continue
        st = get_stream(body)
        if not st:
            continue
        n_m = re.search(rb"/N\s+(\d+)", body)
        first_m = re.search(rb"/First\s+(\d+)", body)
        if not (n_m and first_m):
            continue
        n, first = int(n_m.group(1)), int(first_m.group(1))
        header = st[:first].split()
        try:
            pairs = [(int(header[2 * i]), int(header[2 * i + 1]))
                     for i in range(n)]
        except (IndexError, ValueError):
            continue
        for onum, off in pairs:
            if onum in objs and len(objs[onum]) > 0:
                continue
            start = first + off
            end = first + pairs[pairs.index((onum, off)) + 1][1] if (onum, off) != pairs[-1] else len(st)
            objs[onum] = st[start:end]

    tounicode, composite = build_font_maps(objs)

    # collect pages in document order
    page_nums = []
    for num, body in objs.items():
        if re.search(rb"/Type\s*/Page\b", body) and b"/Pages" not in body[:200]:
            page_nums.append(num)
    if not page_nums:
        for num, body in objs.items():
            if re.search(rb"/Type\s*/Pages\b", body):
                kids = re.search(rb"/Kids\s*\[(.*?)\]", body, re.S)
                if kids:
                    page_nums = [int(x) for x in re.findall(rb"(\d+)\s+\d+\s+R", kids.group(1))]
                break

    # page order from /Kids if available (better than object-number order)
    order = []
    for num, body in objs.items():
        if re.search(rb"/Type\s*/Pages\b", body) and b"/Parent" not in body:
            kids = re.search(rb"/Kids\s*\[(.*?)\]", body, re.S)
            if kids:
                cand = [int(x) for x in re.findall(rb"(\d+)\s+\d+\s+R", kids.group(1))]
                if len(cand) >= len(page_nums):
                    order = cand
    if order:
        page_nums = order

    out = []
    for pnum in page_nums:
        body = objs.get(pnum, b"")
        cm = re.search(rb"/Contents\s+(\d+)\s+\d+\s+R", body)
        content = b""
        if cm:
            content = get_stream(objs.get(int(cm.group(1)), b"")) or b""
        else:
            cm = re.search(rb"/Contents\s*\[(.*?)\]", body, re.S)
            if cm:
                for onum in re.findall(rb"(\d+)\s+\d+\s+R", cm.group(1)):
                    content += (get_stream(objs.get(int(onum), b"")) or b"") + b"\n"

        # resources: page-level, else inherited from Pages node
        res_body = b""
        rm = re.search(rb"/Resources\s+(\d+)\s+\d+\s+R", body)
        if rm:
            res_body = objs.get(int(rm.group(1)), b"")
        else:
            rm = re.search(rb"/Resources\s*<<(.*)", body, re.S)
            if rm:
                res_body = rm.group(1)
        if b"/Font" not in res_body:
            for onum, ob in objs.items():
                if re.search(rb"/Type\s*/Pages\b", ob):
                    rm2 = re.search(rb"/Resources\s+(\d+)\s+\d+\s+R", ob)
                    if rm2:
                        cand = objs.get(int(rm2.group(1)), b"")
                        if b"/Font" in cand:
                            res_body = cand
                            break

        fontmaps = resource_font_map(objs, res_body, tounicode, composite)
        out.append(extract_page_text(content, fontmaps, composite))

    return out


def main():
    path = sys.argv[1]
    pages = extract(path)
    for i, txt in enumerate(pages, 1):
        print("\n\n========== PAGE %d ==========" % i)
        # tidy: collapse runs of spaces, trim trailing ws per line
        lines = [re.sub(r"[ \t]+", " ", ln).rstrip() for ln in txt.split("\n")]
        lines = [ln for ln in lines if ln]
        print("\n".join(lines))


if __name__ == "__main__":
    main()
