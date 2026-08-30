#!/usr/bin/env python3
"""
Gantt Chart — Persian RTL with progress bars and hierarchical tasks.
Uses Pillow for proper RTL text rendering.
"""
from PIL import Image, ImageDraw, ImageFont
import os

# ── Font ──
FONT = '/usr/share/fonts/vazirmatn-fonts/Vazirmatn-Regular.ttf'
FONT_B = '/usr/share/fonts/vazirmatn-fonts/Vazirmatn-SemiBold.ttf'

def fnt(size, bold=False):
    return ImageFont.truetype(FONT_B if bold else FONT, size)

# ── Layout constants ──
MONTH_LEN = 4  # pixels per day
MONTH_NAMES = [
    'مهر ۱۴۰۵', 'آبان ۱۴۰۵', 'آذر ۱۴۰۵', 'دی ۱۴۰۵', 'بهمن ۱۴۰۵', 'اسفند ۱۴۰۵',
    'فروردین ۱۴۰۶', 'اردیبهشت ۱۴۰۶', 'خرداد ۱۴۰۶', 'تیر ۱۴۰۶', 'مرداد ۱۴۰۶',
    'شهریور ۱۴۰۶'
]
TOTAL_DAYS = 365

PHASE_COLORS = {
    '۱': '#1976D2',  # blue
    '۲': '#F57C00',  # orange
    '۳': '#388E3C',  # green
    '۴': '#D32F2F',  # red
}

# ── Tasks ──
tasks = [
    # Phase 1
    {'name': '۱. مطالعه و تحلیل پیشینه پژوهش', 'type': 'main', 'start': 0, 'end': 90},
    {'name': '۱.۱ استخراج و یافتن مقالات مهم حوزه', 'type': 'sub', 'start': 0, 'end': 20, 'progress': 0, 'weight': 1},
    {'name': '۱.۲ مطالعه طرح های منتخب و ساختار آن ها', 'type': 'sub', 'start': 14, 'end': 45, 'progress': 0, 'weight': 1},
    {'name': '۱.۳ بررسی مدل های مهاجم و حملات امنیتی', 'type': 'sub', 'start': 31, 'end': 61, 'progress': 0, 'weight': 1},
    {'name': '۱.۴ تحلیل نقاط ضعف و شکاف پژوهشی', 'type': 'sub', 'start': 45, 'end': 76, 'progress': 0, 'weight': 1},
    {'name': '۱.۵ تعیین الزامات امنیتی و عملکردی', 'type': 'sub', 'start': 61, 'end': 90, 'progress': 0, 'weight': 1},
    # Phase 2
    {'name': '۲. طراحی طرح پیشنهادی و تحلیل امنیت', 'type': 'main', 'start': 61, 'end': 181},
    {'name': '۲.۱ طراحی ساختار کلی و Setup/KeyGen', 'type': 'sub', 'start': 61, 'end': 80, 'progress': 0, 'weight': 1},
    {'name': '۲.۲ طراحی تولید و تأیید امضا', 'type': 'sub', 'start': 75, 'end': 105, 'progress': 0, 'weight': 1},
    {'name': '۲.۳ طراحی تجمیع و تأیید تجمعی', 'type': 'sub', 'start': 91, 'end': 120, 'progress': 0, 'weight': 1},
    {'name': '۲.۴ طراحی الگوریتم تشخیص امضای نامعتبر', 'type': 'sub', 'start': 105, 'end': 135, 'progress': 0, 'weight': 2},
    {'name': '۲.۵ طراحی شبه نام و ردیابی مشروط', 'type': 'sub', 'start': 121, 'end': 151, 'progress': 0, 'weight': 1},
    {'name': '۲.۶ تحلیل مقاومت در برابر حملات', 'type': 'sub', 'start': 135, 'end': 166, 'progress': 0, 'weight': 2},
    {'name': '۲.۷ بازبینی و اصلاح طرح', 'type': 'sub', 'start': 152, 'end': 181, 'progress': 0, 'weight': 1},
    # Phase 3
    {'name': '۳. پیاده سازی، شبیه سازی و ارزیابی', 'type': 'main', 'start': 121, 'end': 273},
    {'name': '۳.۱ آماده سازی محیط و کتابخانه MIRACL', 'type': 'sub', 'start': 121, 'end': 135, 'progress': 0, 'weight': 1},
    {'name': '۳.۲ پیاده سازی طرح پیشنهادی', 'type': 'sub', 'start': 135, 'end': 166, 'progress': 0, 'weight': 2},
    {'name': '۳.۳ تست صحت عملکرد الگوریتم ها', 'type': 'sub', 'start': 152, 'end': 181, 'progress': 0, 'weight': 1},
    {'name': '۳.۴ پیاده سازی تشخیص امضای نامعتبر', 'type': 'sub', 'start': 182, 'end': 211, 'progress': 0, 'weight': 2},
    {'name': '۳.۵ اندازه گیری زمان عملیات رمزنگاری', 'type': 'sub', 'start': 196, 'end': 226, 'progress': 0, 'weight': 1},
    {'name': '۳.۶ ارزیابی مقیاس پذیری', 'type': 'sub', 'start': 212, 'end': 242, 'progress': 0, 'weight': 1},
    {'name': '۳.۷ شبیه سازی VANET با SUMO و NS-3', 'type': 'sub', 'start': 226, 'end': 242, 'progress': 0, 'weight': 2},
    {'name': '۳.۸ ارزیابی تأخیر End-to-End', 'type': 'sub', 'start': 243, 'end': 257, 'progress': 0, 'weight': 1},
    {'name': '۳.۹ مقایسه با طرح های موجود و تحلیل نتایج', 'type': 'sub', 'start': 243, 'end': 267, 'progress': 0, 'weight': 2},
    {'name': '۳.۱۰ اصلاح و بهینه سازی نهایی', 'type': 'sub', 'start': 257, 'end': 273, 'progress': 0, 'weight': 1},
    # Phase 4
    {'name': '۴. نگارش پایان نامه و آماده سازی دفاع', 'type': 'main', 'start': 196, 'end': 365},
    {'name': '۴.۱ نگارش فصل اول: مقدمه و بیان مسئله', 'type': 'sub', 'start': 196, 'end': 211, 'progress': 0, 'weight': 1},
    {'name': '۴.۲ نگارش فصل دوم: پیشینه پژوهش', 'type': 'sub', 'start': 212, 'end': 242, 'progress': 0, 'weight': 1},
    {'name': '۴.۳ نگارش فصل سوم: روش پیشنهادی', 'type': 'sub', 'start': 226, 'end': 257, 'progress': 0, 'weight': 2},
    {'name': '۴.۴ نگارش فصل چهارم: نتایج', 'type': 'sub', 'start': 243, 'end': 273, 'progress': 0, 'weight': 2},
    {'name': '۴.۵ نگارش فصل پنجم: جمع بندی', 'type': 'sub', 'start': 258, 'end': 288, 'progress': 0, 'weight': 1},
    {'name': '۴.۶ یکپارچه سازی و ویرایش پایان نامه', 'type': 'sub', 'start': 288, 'end': 319, 'progress': 0, 'weight': 2},
    {'name': '۴.۷ اعمال اصلاحات با نظر استاد', 'type': 'sub', 'start': 242, 'end': 334, 'progress': 0, 'weight': 2},
    {'name': '۴.۸ آماده سازی ارائه و اسلاید دفاع', 'type': 'sub', 'start': 319, 'end': 345, 'progress': 0, 'weight': 1},
    {'name': '۴.۹ آماده سازی نسخه نهایی پایان نامه', 'type': 'sub', 'start': 339, 'end': 350, 'progress': 0, 'weight': 2},
    {'name': '۴.۱۰ دفاع', 'type': 'sub', 'start': 350, 'end': 365, 'progress': 0, 'weight': 1},
]


# ── Calculate main task progress (weighted) ──
for t in tasks:
    if t['type'] == 'main':
        prefix = t['name'].split('.')[0] + '.'
        children = [c for c in tasks if c['type'] == 'sub' and c['name'].startswith(prefix)]
        tw = sum(c['weight'] for c in children)
        t['progress'] = (
            sum(c['progress'] * c['weight'] for c in children) / tw if tw else 0
        )


# ── Build display list (reversed: phase 1 on top) ──
display = tasks[::-1]


# ── Drawing ──
LEFT_MARGIN = 420
RIGHT_MARGIN = 20
TOP_MARGIN = 100
BOTTOM_MARGIN = 60
ROW_H_MAIN = 36
ROW_H_SUB = 28
GAP = 3
CHART_W = TOTAL_DAYS * MONTH_LEN + LEFT_MARGIN + RIGHT_MARGIN

# Calculate total height
total_rows = len(display)
chart_h = TOP_MARGIN + total_rows * (ROW_H_MAIN + GAP) + BOTTOM_MARGIN

# Adjust: sub rows are shorter
y_positions = []
cur_y = TOP_MARGIN
for t in display:
    h = ROW_H_MAIN if t['type'] == 'main' else ROW_H_SUB
    y_positions.append(cur_y)
    cur_y += h + GAP
chart_h = cur_y + BOTTOM_MARGIN

img = Image.new('RGB', (CHART_W, chart_h), '#FAFAFA')
draw = ImageDraw.Draw(img)

# ── Title ──
title_f = fnt(28, bold=True)
title = 'جدول زمانی'
bbox = draw.textbbox((0, 0), title, font=title_f)
tw = bbox[2] - bbox[0]
draw.text(((CHART_W - tw) // 2, 25), title, fill='#1a237e', font=title_f)

# ── Month column lines + headers ──
hdr_f = fnt(13, bold=True)
for i in range(12):
    x = LEFT_MARGIN + i * 30 * MONTH_LEN
    # Grid line
    draw.line([(x, TOP_MARGIN - 10), (x, chart_h - BOTTOM_MARGIN + 10)], fill='#D0D0D0', width=1)
    # Month label (centered in month)
    cx = x + 15 * MONTH_LEN
    label = MONTH_NAMES[i]
    bbox = draw.textbbox((0, 0), label, font=hdr_f)
    lw = bbox[2] - bbox[0]
    draw.text((cx - lw // 2, TOP_MARGIN - 30), label, fill='#333', font=hdr_f)

# ── Tasks ──
for idx, task in enumerate(display):
    y = y_positions[idx]
    start_px = LEFT_MARGIN + task['start'] * MONTH_LEN
    end_px = LEFT_MARGIN + task['end'] * MONTH_LEN
    bar_w = end_px - start_px
    phase_num = task['name'].split('.')[0]
    color = PHASE_COLORS.get(phase_num, '#888')

    if task['type'] == 'main':
        h = ROW_H_MAIN
        # Solid bar
        draw.rounded_rectangle([start_px, y, end_px, y + h], radius=5, fill=color, outline='#222', width=1)
        # Progress overlay (darker)
        pw = int(bar_w * task['progress'] / 100)
        if pw > 0:
            draw.rounded_rectangle([start_px, y, start_px + pw, y + h], radius=5, fill=color, outline='#222', width=1)
        # Progress text
        pct = f"{task['progress']:.0f}%"
        pct_f = fnt(13, bold=True)
        bbox = draw.textbbox((0, 0), pct, font=pct_f)
        pctw = bbox[2] - bbox[0]
        draw.text((start_px + bar_w // 2 - pctw // 2, y + h // 2 - 8), pct, fill='#FFF', font=pct_f)

        # Y-label: ◆ main task name
        label = '◆ ' + task['name']
        lbl_f = fnt(13, bold=True)
        bbox = draw.textbbox((0, 0), label, font=lbl_f)
        lw = bbox[2] - bbox[0]
        draw.text((LEFT_MARGIN - lw - 10, y + h // 2 - 10), label, fill='#222', font=lbl_f)
    else:
        h = ROW_H_SUB
        # Background (light)
        draw.rounded_rectangle([start_px, y, end_px, y + h], radius=4,
                               fill=color + '30', outline='#999', width=1)
        # Progress fill
        pw = int(bar_w * task['progress'] / 100)
        if pw > 0:
            draw.rounded_rectangle([start_px, y, start_px + pw, y + h], radius=4,
                                   fill=color + 'CC', outline='#666', width=1)
        # Progress text
        if task['progress'] > 0:
            pct = f"{task['progress']}%"
            pct_f = fnt(11)
            bbox = draw.textbbox((0, 0), pct, font=pct_f)
            pctw = bbox[2] - bbox[0]
            draw.text((start_px + bar_w // 2 - pctw // 2, y + h // 2 - 7), pct, fill='#222', font=pct_f)

        # Y-label: └─ sub task name (indented)
        label = '     └─ ' + task['name']
        lbl_f = fnt(11)
        bbox = draw.textbbox((0, 0), label, font=lbl_f)
        lw = bbox[2] - bbox[0]
        draw.text((LEFT_MARGIN - lw - 10, y + h // 2 - 8), label, fill='#444', font=lbl_f)


# ── Legend ──
legend_y = chart_h - 50
legend_f = fnt(13)
items = [
    ('فاز ۱: مطالعه و تحلیل', '#1976D2'),
    ('فاز ۲: طراحی', '#F57C00'),
    ('فاز ۳: پیاده سازی و ارزیابی', '#388E3C'),
    ('فاز ۴: نگارش و دفاع', '#D32F2F'),
    ('بخش باقی مانده', '#CCCCCC'),
]
# Calc total width
total_lw = 0
for txt, _ in items:
    bbox = draw.textbbox((0, 0), txt, font=legend_f)
    total_lw += (bbox[2] - bbox[0]) + 50
total_lw += 25 * (len(items) - 1)
lx = (CHART_W - total_lw) // 2
for txt, clr in items:
    draw.rounded_rectangle([lx, legend_y, lx + 16, legend_y + 16], radius=3, fill=clr)
    draw.text((lx + 22, legend_y - 2), txt, fill='#333', font=legend_f)
    bbox = draw.textbbox((0, 0), txt, font=legend_f)
    lx += (bbox[2] - bbox[0]) + 50 + 25

# ── Save ──
out_dir = '/home/sam/Desktop/masters-academic-projects/gantt-chart'
img.save(os.path.join(out_dir, 'gantt_full.png'), quality=200)
print(f'Saved: gantt_full.png ({CHART_W}x{chart_h})')
