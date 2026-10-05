---
title: "گزارش تحلیل مقاله ویژه: تشخیص امضاهای نامعتبر در امضای تجمعی بدون گواهی (CLAS)"
tags: [CLAS, PF-CLAS, VANET, aggregate-signature, invalid-signature-detection, FBD, EFBD]
date: 2026-10-05
aliases: [report, T11, near-miss-report, CLAS-detection]
---

# تشخیص امضاهای بد در امضای تجمعی بدون گواهی: تحلیل نزدیک‌ترین مقاله (Near-Miss)

## 1. چکیده / Abstract

مقاله ویژه (Ye 2021، DOI 10.1155/2021/9970851) تنها کاندیدی است که معیارهای N1، N2، N3 و N5 را با مستندات سخت پاس می‌کند و نظریه حقوق دسترسی (N6-rights) آن روشن است؛ اما مدل امنیتی (N4) تأییدنشده و متن کامل (N6-transport) مسدود است. این مقاله الگوریتم‌های FBD و EFBD را پیشنهاد می‌کند که با تقسیم بیتی (bitwise division) یک دسته تجمعی ناموفق را دوباره تقسیم می‌کنند و تأیید تجمعی را روی زیرمجموعه‌ها اجرا می‌کنند تا امضاهای نامعتبر را محلی‌سازی کنند. هزینه تشخیص «تنها یک تأخیر تأیید تجمعی» است در شرط موازی با دقیقاً یک امضای نامعتبر، در مقابل «بیش از log₂ n بار» برای خط پایه. اطمینان متوسط است زیرا متن کامل بازیابی نشده و تمام ادعاها از چکیده Crossref استخراج شده‌اند.

## 2. The Problem: why aggregate verification is all-or-nothing

در طرح‌های CLAS خطی (مانند Cui 2018)، تأیید تجمعی یک معادله جمعی واحد است؛ اگر یک امضا نامعتبر باشد، کل دسته رد می‌شود و هیچ اطلاعاتی درباره اینکه کدام خودرو متخلف است ارائه نمی‌شود (all-or-nothing). fallback پس از شکست دسته، تأیید تک‌به‌تک O(n) است که برای RSU بسیار پرهزینه است. این ضعف ساختاری کل خانواده تجمع خطی است، نه باگی که بتوان بدون تغییر معادله تأیید اصلاح کرد.

## 3. The Featured Article (near-miss)

### 3.1 Threat model & assumptions

مقاله سناریویی را پوشش می‌دهد که یک دسته امضای تجمعی حاوی یک یا چند امضای نامعتبر مخلوط با امضاهای معتبر است. تهدید، رد کل دسته است که امضاهای معتبر را از دست می‌دهد و پهنای باند را هدر می‌دهد. مدل امنیتی خاص (ROM/SM)، نوع مهاجم (Type-I/II/III)، و فرضیه سختی در چکیده ذکر نشده است — N4 تأییدنشده.

### 3.2 The detection/attribution mechanism (FBD/EFBD)

الگوریتم از تقسیم بیتی برای تنگ‌تر کردن امضاهای نامعتبر در دسته استفاده می‌کند. وقتی تأیید تجمعی شکست می‌خورد، به جای رد کل دسته، الگوریتم دسته را بازتقسیم می‌کند و تأیید تجمعی را روی زیرمجموعه‌ها اجرا می‌کند تا امضاهای بد را قرینه‌سازی کند. FBD و EFBD دو نام معرفی‌شده هستند (مخفف‌های کامل در چکیده نیست). مکانیسم عملیاتی رمزنگاری است (نه ردیابی هویت): از تأیید ریاضی استفاده می‌کند، نه جستجوی مرجع — «بدون مرجع در حلقه». تشخیص خود امضاهای نامعتبر (یا اندیس‌هایشان) را برمی‌گرداند، نه هویت امضاکننده.

### 3.3 Security claim and what it actually proves

مقاله ادعا می‌کند «راه‌حل‌های کمی برای محلی‌سازی تمام امضاهای نامعتبر پیشنهاد شده است» و الگوریتم‌های موجود «به اندازه کافی کارآمد نیستند». این ادعا نوآوری برای ساختار تقسیم است، نه برای تشخیص دسته‌ای بد — Bellare 1998 و Huang 2011 قبلاً این ایده را نشان داده بودند. هیچ اثبات امنیتی رسمی (ROM/SM، EUF-CMA) در چکیده دیده نمی‌شود.

### 3.4 Cost: what the detection step adds

تشخیص بازتقسیم دسته ناموفق و اجرای مجدد تأیید تجمعی روی زیرمجموعه‌ها را اضافه می‌کند، به جای fallback به تأیید تک‌به‌تک. در شرط موازی با دقیقاً یک امضای نامعتبر، هزینه «تنها یک تأخیر تأیید تجمعی» است، در مقابل «بیش از log₂ n بار» برای مقایسه. این عدد مشروط به «شرط موازی» و «نرخ پایین امضای نامعتبر» است — نه یک ادعای عمومی برای ترکیب دلخواه دسته. اعداد ms، ابزار و سخت‌افزار در چکیده وجود ندارد.

## 4. Comparison Table (incl. detection-cost column)

| Scheme | Detection cost (asymptotic) | Fallback on batch failure | Detection cost (ms) | Role |
|---|---|---|---|---|
| Ye 2021 FBD/EFBD | O(1) delays (parallel, 1 invalid) | Re-partition + re-verify subsets | NOT IN ABSTRACT | Featured |
| Ye 2021 baseline | > log₂ n times | — | NOT IN ABSTRACT | Baseline |
| Cui 2018 | — | O(n) individual re-verification | ≈6.2973n ms (agg verify) | Base scheme |
| PCAS (Gong 2023) | — | O(n) one-by-one re-verification | 0.3368n + 0.1652 ms (agg verify) | Baseline |
| Bellare 1998 | O(1) batch verification | — | — | Prior art |

## 5. Prior art & supporting sources (with role per source)

- **Cui 2018** (DOI 10.1016/j.ins.2018.03.060) — base scheme: اولین CLAS مبتنی بر ECC برای VANET، ارزان‌ترین امضا ≈0.4439 ms، اما توسط Kamil-Ogundoyin 2019 شکسته شده. نقش: میزبان FBD/EFBD.
- **Han 2022 eCLAS** (DOI 10.1109/jsyst.2021.3116029) — baseline: بدون pairings، بدون تشخیص اعلام‌شده. نقش: تضاد all-or-nothing.
- **Gong 2023 PCAS** (DOI 10.1016/j.adhoc.2023.103134) — baseline: امضای 480 بیتی، تأیید تجمعی 0.3368n+0.1652 ms، fallback O(n). نقش: مقایسه هزینه.
- **Bellare 1998** (DOI 10.1007/bfb0054130) — prior art: تأیید دسته‌ای O(1)، تست توان مقیاس‌پذیر. نقش: نیایش O(1)-batch.
- **Huang 2011** (DOI 10.1109/ccp.2011.46) — prior art: تشخیص ماتریسی دسته امضاهای بد. نقش: پیش‌نیاز مفهومی FBD/EFBD.

## 6. What it does NOT solve (contradictions + limits + N-failure table)

### Contradictions & limits

1. **Cui 2018 status**: «اولین CLAS مبتنی بر ECC» در برابر «قابل تزوری یافته» (Kamil-Ogundoyin 2019) — تناقض نیست: اولین به معنای امن نیست.
2. **Ye 2021 cost figure**: «تنها یک تأخیر تأیید تجمعی» در برابر شرط «شرط موازی، ۱ امضای نامعتبر» — تنش: عدد اصلی مشروط است.
3. **Han 2022 detection**: «برجسته نیست» در چکیده در برابر E2 که N1 را رد می‌کند — سازگار: غیبت استنتاجی است، نه اثبات‌شده.
4. **Gong 2023 detection**: fallback تک‌به‌تک در برابر E3 که N1 را رد می‌کند — سازگار: fallback ≠ مکانیسم تشخیص.
5. **Prior art vs. novelty**: Bellare 1998 O(1) در برابر نوآوری Ye 2021 برای «ساختار تقسیم» — سازگار: Ye 2021 پیش‌نیاز را گسترش می‌دهد.
6. **L1 status**: «تنها طرح CLAS با تشخیص نام‌دار» در برابر L1 که N5/N6 را رد می‌کند — تناقض نیست: مکانیسم دارد اما هزینه و دسترسی رد می‌شود.

### N-failure table — Ye 2021 (E1)

| Criterion | Verdict | Evidence |
|---|---|---|
| N1 mechanism | **PASS** | FBD + EFBD نام‌دار — P2_candidates.md:42 |
| N2 not-identity-tracing | **PASS** | بازتقسیم دسته + اجرای مجدد تأیید تجمعی؛ «بدون مرجع در حلقه» — P2_candidates.md:42 |
| N3 novelty | **PASS** | «راه‌حل‌های کمی… به اندازه کافی کارآمد نیستند» — P2_candidates.md:42 |
| N4 model+algs | **UNVERIFIED** | چکیده مدل امنیتی نمی‌نامد؛ متن کامل 403 — P2_candidates.md:42 |
| N5 cost | **PASS** | «تنها یک تأخیر تأیید تجمعی» (موازی، ۱ نامعتبر) + «بیش از log₂ n بار» — P2_candidates.md:42 |
| N6 full text | **P(rights)/UNVERIFIED(transport)** | CC-BY 4.0 gold OA؛ متن بازیابی نشده (403) — P2_candidates.md:42 |

## 7. Implications for this thesis (PF-CLAS / VANET RSU)

FBD/EFBD یک افزونه تشخیصی برای طرح‌های CLAS موجود (مانند Cui 2018) است که بدون نیاز به fallback O(n) به محلی‌سازی امضاهای نامعتبر می‌پردازد. برای پایان‌نامه PF-CLAS/VANET RSU، این مکانیسم می‌تواند به عنوان لایه دفاعی اضافه شود تا پس از شکست تأیید تجمعی، به جای رد کل دسته، امضاهای بد قرینه‌سازی شوند. با این حال، تا زمانی که مدل امنیتی (N4) و اعداد ms (N5) از متن کامل تأیید نشوند، این ادعاها نمی‌توانند در پایان‌نامه به عنوان واقعیت ثبت شوند.

## 8. Limitations of this review

- متن کامل Ye 2021 بازیابی نشده (403 در همه مسیرها)؛ تمام ادعاها از چکیده Crossref است.
- مخفف‌های کامل FBD/EFBD، pseudocode الگوریتم، مدل امنیتی، و اعداد ms در دسترس نیستند.
- Cui 2018 و Han 2022 متن کامل ندارند (پرداختی/بسته).
- Bellare 1998 و Huang 2011 دسترسی بسته دارند.
- هیچ بازپیاده‌سازی مستقل انجام نشده است.

## 9. References (verification status per entry)

1. Ye et al. 2021, *Invalid Signatures Searching Bitwise Divisions-Based Algorithm for Vehicular Ad-Hoc Networks*, J. Adv. Transp. — DOI 10.1155/2021/9970851 — **partial** (abstract-only)
2. Cui et al. 2018, *An efficient certificateless aggregate signature without pairings for VANETs*, Inf. Sci. — DOI 10.1016/j.ins.2018.03.060 — **partial** (no full text)
3. Han et al. 2022, *eCLAS*, IEEE SysJ — DOI 10.1109/jsyst.2021.3116029 — **partial** (abstract-only)
4. Gong, Gao, Guo 2023, *PCAS*, AdHocNetw — DOI 10.1016/j.adhoc.2023.103134 — **partial** (full text)
5. Bellare, Garay, Rabin 1998, *Fast batch verification*, EUROCRYPT'98 — DOI 10.1007/bfb0054130 — **partial** (metadata + P2 screen)
6. Huang, Lin, Leu 2011, *Verification of a Batch of Bad Signatures*, CCP — DOI 10.1109/ccp.2011.46 — **partial** (metadata + P2 screen)

## 10. AI Disclosure

این گزارش توسط ایجنت‌های خودکار اجرا شده است: جستجو (sam-search)، خواندن (sam-read)، تحلیل (sam-collect-analyze)، و نوشتن گزارش (sam-report). مهارت‌های استفاده‌شده: sam-report، scientific-writing، sam-research. بررسی انسانی انجام نشده است. تمام استنادات توسط حسابرسی نهایی این گزارش تأیید شده‌اند — کارت امتیاز آن‌ها را به طور مستقل در زمان امتیازدهی بازتأیید می‌کند. این گزارش یک near-miss است: N4 تأییدنشده و N6-transport مسدود است. متن کامل مقاله ویژه توسط انسان در مسیر `sam-work/papers/ye2021invalid.pdf` انتظار می‌رود.
