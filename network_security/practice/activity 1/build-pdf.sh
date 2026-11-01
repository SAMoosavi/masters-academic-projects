#!/usr/bin/env bash
# Markdown report -> PDF (A4, RTL, Vazirmatn), screenshots embedded.
set -e
cd "$(dirname "$0")"
MD="Activity 1 - گزارش نهایی.md"
OUT="Activity 1 - گزارش نهایی.pdf"

[ -x .venv/bin/python ] || { python3 -m venv .venv && .venv/bin/pip -q install markdown; }

.venv/bin/python - "$MD" <<'PY'
import sys, markdown
src = open(sys.argv[1], encoding="utf-8").read()
body = markdown.markdown(src, extensions=["tables", "fenced_code"])
html = f"""<!doctype html>
<html dir="rtl" lang="fa"><head><meta charset="utf-8">
<title>گزارش فعالیت ۱</title>
<style>
@page {{ size: A4; margin: 16mm 14mm; }}
body {{ font-family: Vazirmatn, "Noto Naskh Arabic", sans-serif; font-size: 11pt;
        line-height: 1.85; color: #111; text-align: right; }}
h1 {{ font-size: 19pt; border-bottom: 2px solid #333; padding-bottom: 6px; }}
h2 {{ font-size: 15pt; margin-top: 22px; border-bottom: 1px solid #bbb; }}
h3 {{ font-size: 12.5pt; margin-top: 16px; }}
table {{ border-collapse: collapse; width: 100%; margin: 10px 0; font-size: 9.5pt; }}
th, td {{ border: 1px solid #888; padding: 5px 6px; vertical-align: top; }}
table {{ break-inside: avoid; }}
th {{ background: #eee; }}
pre {{ direction: ltr; text-align: left; background: #f5f5f5; border: 1px solid #ccc;
       padding: 8px; font-size: 8.5pt; line-height: 1.4; white-space: pre-wrap;
       page-break-inside: avoid; }}
code {{ font-family: "JetBrainsMono Nerd Font", monospace; direction: ltr;
        unicode-bidi: isolate; }}
blockquote {{ border-right: 3px solid #999; margin: 10px 0; padding: 4px 12px;
              background: #fafafa; color: #333; }}
img {{ max-width: 100%; border: 1px solid #999; margin: 6px 0;
       page-break-inside: avoid; }}
.shot {{ break-inside: avoid; page-break-inside: avoid; }}
.shot img {{ display: block; break-inside: avoid; }}
p {{ widows: 2; orphans: 2; }}
.shot img {{ width: 100%; }}
h2, h3 {{ page-break-after: avoid; }}
hr {{ border: none; border-top: 1px solid #ccc; margin: 18px 0; }}
</style></head><body>
{body}
</body></html>"""
open("report.html", "w", encoding="utf-8").write(html)
PY

chromium --headless=new --disable-gpu --no-pdf-header-footer \
         --user-agent="Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36" \
         --print-to-pdf="$OUT" "file://$PWD/report.html" 2>/dev/null
rm -f report.html
echo "PDF: $PWD/$OUT"
