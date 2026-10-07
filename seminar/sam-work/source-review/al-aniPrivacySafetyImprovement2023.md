# یادداشت منبع: al-aniPrivacySafetyImprovement2023

## ۱. مشخصات و دسترسی

- **ارجاع کامل:** R. Al-ani, T. Baker, B. Zhou, and Q. Shi, "Privacy and safety improvement of VANET data via a safety-related privacy scheme," *International Journal of Information Security*, vol. 22, no. 4, pp. 763–783, Aug. 2023. DOI: 10.1007/s10207-023-00662-6
- **سطح دسترسی:** متن کامل — نسخه‌ی **Author Accepted Manuscript (AM)** و نه Version of Record. فایل محلی: `/home/sam/Zotero/storage/ZV2VYZIX/Al-ani et al. - 2023 - ….pdf` (۱۷ صفحه‌ی متن + مراجع). سرصفحه‌ی PDF: "This version of the article has been accepted for publication … but is not the Version of Record".
- **نکته‌ی مهم درباره‌ی مکان‌یاب‌ها:** همه‌ی شماره‌صفحه‌ها در این یادداشت با شکل `AM p.N` همان شماره‌ی چاپ‌شده در پایین صفحات AM هستند (۱ تا ۱۷)، **نه** صفحات ۷۶۳–۷۸۳ مجله. شماره‌ی شکل‌ها، جدول‌ها، معادله‌ها و بخش‌ها در هر دو نسخه باید یکی باشد (در VoR بررسی نشده است).
- **بررسی فراداده‌ی bib (با Crossref مقایسه شد):** نویسندگان (Al-ani, Baker, Zhou, Shi) ✔، مجله ✔، volume 22 ✔، number 4 ✔، pages 763–783 ✔، DOI ✔. `date = 2023-08-01`: انتشار چاپی در Crossref «2023-08» است ✔ (انتشار آنلاین 2023-02-06). خطا یا فیلد ضروری گم‌شده‌ای یافت نشد.

## ۲. خلاصه‌ی ساختاریافته

- **مسئله:** پیام‌های beacon (BM) در کاربردهای ایمنی VANET موقعیت، سرعت و جهت خودرو را به‌صورت plaintext و با نرخ 1–10 Hz منتشر می‌کنند و شنودگر می‌تواند با پیوند دادن BMهای پیاپی خودرو را ردیابی کند (AM p.1). طرح‌های تغییر شبه‌نام مبتنی بر silent period (دوره‌ی سکوت) حریم خصوصی را بهتر می‌کنند ولی در این دوره خودرو وضعیتش را منتشر نمی‌کند و «a potential accident cannot be prevented during this period» (AM p.2). تعادل بهینه‌ی privacy–safety هنوز چالش باز است (AM p.2).
- **روش/معماری:** طرح SRPS (Safety-related Privacy Scheme) با دو الگوریتم: **SRPS-Active** (Algorithm 1) و **SRPS-Silent** (Algorithm 2) (AM p.8–10، §IV). هر خودرو یک Multi-Target Tracker (MTT) دارد (Kalman filter + gating + NNPDA data association + track maintenance) تا وضعیت همسایگان را حتی در سکوت پیش‌بینی کند (AM p.7، §III.C). خودروی ساکت اگر تصادفی را برای گام بعد پیش‌بینی کند از سکوت خارج می‌شود؛ خودروی فعال اگر وضعیتش با همسایه‌ای قابل اختلاط (mix-context) باشد بدون ورود به سکوت شبه‌نام عوض می‌کند (AM p.7–8).
- **مدل ارزیابی:** OMNeT++ 5.0 + SUMO 0.25.0 + Veins 4.4 + PREXT (اتصال با TraCI) (AM p.10، §V.A). نقشه‌ی 3.8 km × 2.8 km از Liverpool/UK (OSM). نرخ ورود خودرو: یک خودرو در 1 s، 0.5 s و 0.3 s؛ هر آزمون 360 s؛ میانگین سه پایگاه سفر تصادفی؛ نرخ beacon برابر 10 Hz (AM p.10, 12–13، Table 3). مقایسه با پنج طرح PPC، RSP، CSP، SLOW، CAPS (AM p.11). پارامترهای SRPS: MinPL=60 s، MaxPL=120 s، MinSP=0 s، MaxSP=13 s، شعاع همسایگی 50 m (Table 2، AM p.13).
- **نتایج کلیدی (مقادیر از روی برچسب نمودارها خوانده شد):**
  - Traceability (Fig. 10، AM p.15): SRPS = 40% / 31% / 20% در v/s، v/0.5s، v/0.3s؛ CAPS = 71% / 63% / 52%؛ PPC تا 94%؛ CSP ≈ 5–7%. متن: SRPS «reduces the traceability percentage nearly by 30%» نسبت به CAPS (AM p.14).
  - SBMs/s (Fig. 12، AM p.15): SRPS = 9.81 / 9.87 / 9.92؛ CAPS = 9.41 / 9.38 / 9.33؛ SLOW = 6.40 / 6.47 / 6.19؛ RSP = 7.65 / 7.29 / 7.22؛ PPC = 10.00؛ CSP = 9.82.
  - Confusion% (Fig. 15، AM p.17): SRPS = 69% / 77% / 84%؛ CAPS = 26% / 38% / 41%؛ CSP = 100%؛ PPC حداکثر 10%. متن: «We enhance the confusion level significantly by more than 39%» (AM p.16).
  - تصادف‌های پیش‌بینی‌شده/اجتناب‌شده (PAA) در SRPS (Fig. 14، AM p.16): 43 / 68 / 93.
  - ChPseud/s (Fig. 9، AM p.14): SRPS = 0.62 / 0.66 / 0.73؛ PPC بالاترین (0.74).
  - رتبه‌بندی کلی (Table 4، AM p.17؛ 1 = بهترین، 6 = بدترین): SRPS — Privacy 3، Safety 2، Overheads 2.
- **محدودیت‌ها (اعلام‌شده یا قابل‌استنتاج):**
  - شعاع ثابت 50 m فقط برای جاده‌های شهری با سرعت حداکثر 64 km/h انتخاب شده؛ تنظیم پویا بر اساس تراکم کار آینده است (AM p.12, 17).
  - اگر همسایه شبه‌نامش را عوض نکند، خودرو همچنان با اطلاعات مکانی-زمانی قابل پیوند است و این «out-of-the-scope of our scheme» است (AM p.9).
  - SRPS در privacy رتبه‌ی 3 دارد (CSP و SLOW بهترند) (Table 4).
  - [استنتاج من، نه ادعای مقاله:] ارزیابی فقط شبیه‌سازی روی یک نقشه‌ی شهری است که عمداً برای افزایش احتمال mix-context انتخاب شده (AM p.10)؛ PAA تعداد «expected accidents (i.e. if vehicles stay silent)» است، نه تصادف واقعاً شبیه‌سازی‌شده (AM p.12، Eq. 4). مدل مهاجم فقط global passive است.

## ۳. استخراج محتوا برای بسط متن

### ۳.۱ بخش «حل مشکل شبه‌نام در شبکه اقتضایی خودرویی» (report.tex خط 686–688) — مقدمه‌ی چالش شبه‌نام

- **چرا شبه‌نام لازم است:** ارتباط کاملاً ناشناس پذیرفتنی نیست چون کاربردهای ایمنی «life-critical» هستند و accountability لازم است؛ بنابراین «a pseudonym has been used instead of a real identity to balance security and privacy» و شبه‌نام باید توسط طرف مورد اعتمادی صادر شود که بتواند در صورت اختلاف آن را resolve کند (AM p.1، §I).
- **چرا شبه‌نام ایستا کافی نیست:** خودرو با اطلاعات spatio-temporal در BMها قابل ردیابی است؛ پس هر خودرو مجموعه‌ای از شبه‌نام‌ها دارد و هرکدام فقط برای مدت محدودی استفاده می‌شود (AM p.1). شبه‌نام ایستا با «long-term linkability» (مثلاً شناسایی خانه یا محل کار راننده) هویت را لو می‌دهد (AM p.4، §II.D).
- **چرا تغییر ساده‌ی شبه‌نام هم کافی نیست:** «An adversary can utilize multi-target tracking techniques to establish a link between BMs sent using different pseudonyms» (AM p.2). دو حمله (Fig. 1، AM p.4):
  - **syntactic attack:** خودرو تنها خودرویی است که در بازه‌ی Δt شبه‌نامش را از B1 به B2 عوض کرده؛
  - **semantic attack:** مسیر خودرو با مسیر همسایگان فرق دارد و مهاجم با روش ردیابی B1 را به B2 پیوند می‌دهد.
  - نتیجه: «pseudonyms should only be changed in unobserved situations» (AM p.2, 4).
- **دو رویکرد اصلی برای «موقعیت مشاهده‌نشده»:**
  1. **Mix-zone:** تغییر شبه‌نام در نواحی از پیش تعیین‌شده (تقاطع‌ها، social spots، پمپ‌بنزین)؛ نیاز به زیرساخت برای اعلام مرز ناحیه؛ پرهزینه و «impractical» (AM p.2, 4)؛ آسیب‌پذیر در برابر timing and transition attacks (مهاجم با پایش نقاط ورود/خروج و زمان ماندن، شبه‌نام قدیم و جدید را پیوند می‌دهد) (AM p.5، §II.E). ← این نکته به زیربخش PCS (خط 690–698) هم مستقیماً مربوط است: PCS نوعی mix-zone در social spots است (مقاله social spots را با ارجاع [51, 55, 56] ذیل mix-zone می‌آورد، AM p.4).
  2. **Silent period:** خودرو بدون زیرساخت، خودش تصمیم می‌گیرد مدتی BM نفرستد و سپس با شبه‌نام جدید ادامه دهد؛ تصمیم یا بر اساس زمان یا بر اساس context (AM p.4). بیشتر پژوهشگران و استانداردها silent period را ترجیح داده‌اند چون زیرساخت نمی‌خواهد (AM p.4).
- **هزینه‌ی تغییر بیشتر شبه‌نام و سکوت طولانی‌تر بر ایمنی** (AM p.4): (الف) افزایش security overhead و در نتیجه از دست رفتن پیام‌ها (هنگام شبه‌نام جدید یا همسایه‌ی جدید باید گواهی پیوست و تأیید شود)؛ (ب) «An accident could have happened during silent periods as a vehicle stops sharing its positions».
- **سه‌گانه‌ی privacy / security / safety:** «it is still a scientific challenge to design a pseudonym scheme that effectively addresses the three key issues: privacy, security, and safety» (AM p.4).

### ۳.۲ زیربخش SRPS (خط 700–709) — بسط کامل

**الف) انگیزه و جایگاه در ادبیات (AM p.5، §II.E):**
- طرح‌های مرور شده: periodical update با دوره‌ی ثابت (قابل پیش‌بینی برای مهاجم) یا تصادفی (کاهش تغییر همزمان)؛ cooperative change؛ mix-zone (Beresford & Stajano)؛ random silent period (Sampigethaya et al.) — مشکل: اگر فقط یک خودرو در جاده باشد، با وجود سکوت قابل شناسایی است؛ سکوت همکارانه (Tomandl et al.، Li et al.).
- SLOW: خودرو فقط وقتی سرعتش زیر آستانه است ساکت می‌شود (احتمال تصادف کمتر) (AM p.5)؛ در پیاده‌سازی آستانه 30 km/h (AM p.11) و در Table 2 برابر 8 m/s.
- CAPS (Emara et al.): خودروها همکارانه وارد سکوت می‌شوند و وقتی context آن‌ها احتمالاً با خودروی ساکت دیگری mix شود یا در موقعیت غیرمنتظره باشند، از سکوت خارج می‌شوند؛ از MTT برای پیش‌بینی وضعیت خودروی ساکت استفاده می‌کند (AM p.5).
- شکاف: «Few schemes … have considered the impact on safety applications; even though, they have not addressed the potential accidents during silent periods which motivated this work» (AM p.2).

**ب) مدل سیستم و فرض‌ها (AM p.5–6، §III.A):**
- OBU در هر خودرو؛ BM شامل position، speed، heading با 1–10 Hz در برد 300 m از طریق DSRC.
- RSUها در کنار جاده؛ ارتباط RSU–RSU و RSU–authority سیمی؛ V2V و V2R بی‌سیم (Fig. 2).
- PKI: کلید عمومیِ گواهی‌شده‌ی بدون اطلاعات هویتی به‌عنوان شبه‌نام، ذخیره در TPD؛ جداسازی نقش مراجع (صدور LTP، صدور STP، مرکز resolution و revocation).
- **مدل مهاجم:** «We assume a global passive adversary model … which aims to breach the privacy of vehicles by eavesdropping and monitoring all the broadcasted messages»؛ مثال: service provider نامطمئن (AM p.6).

**ج) مدل مدیریت شبه‌نام (AM p.6–7، §III.B، Fig. 3) — گام‌به‌گام:**
1. دو مرجع مورد اعتماد: LTIA (Long-Term Issuing Authority) و STIA (Short-Term Issuing Authority)، هرکدام با زوج کلید.
2. خودرو با ارائه‌ی مدارک از LTIA یک LTP می‌گیرد؛ LTP هویت ایستای خودروست و فقط با تغییر مالک عوض می‌شود؛ با کلید خصوصی LTIA امضا می‌شود.
3. خودرو با کلید خصوصی متناظر LTP درخواست STP را امضا می‌کند (مستقیم یا با کمک RSU)؛ STIA اعتبار LTP را با کلید عمومی LTIA و اصالت درخواست را با کلید عمومی داخل گواهی بررسی می‌کند و STP صادر می‌کند.
4. STP برای احراز اصالت پیام‌های ایمنی: ابتدا timestamp اضافه می‌شود و سپس با کلید خصوصی STP فعلی امضا می‌شود؛ timestamp برای جلوگیری از replay (مثال: بازپخش پیام خودروی امدادی).
5. هر STP حداقل عمر (برای short-term linkability) و حداکثر عمر (برای جلوگیری از long-term linkability) دارد.
6. LTP و STPها در TPD نگهداری می‌شوند.
- مراجع صادرکننده پایگاه داده‌ای از پیوند real identity ↔ LTP و LTP ↔ STP برای accountability نگه می‌دارند (AM p.6).

**د) ردیاب خودرو (Vehicle Tracker، VTr از Karim/Emara et al.) — چهار مرحله (AM p.7، §III.C):**
1. **State estimation:** Kalman filter با ترکیب اندازه‌گیری‌های نادقیق حسگر و تخمین مدل سینماتیکی، بهترین تخمین position/speed/direction را می‌دهد.
2. **Gating:** حذف انتساب‌های نامحتمل پیش از association.
3. **Data association:** پیوند پیام‌های یک خودرو با شبه‌نام‌های مختلف از طریق ماتریس احتمال انتساب؛ روش NNPDA (Nearest Neighbour Probabilistic Data Association) که محاسبه‌ی بلادرنگ را حتی با تعداد زیاد خودرو ممکن می‌کند.
4. **Track maintenance:** حذف خودروهای خارج از برد و ادامه‌ی ردیابی همسایگان حتی اگر ساکت باشند.
- نکته‌ی مفهومی برای متن: همان ابزاری که مهاجم برای پیوند شبه‌نام‌ها به کار می‌برد (MTT)، در SRPS به‌صورت دفاعی در خود خودرو اجرا می‌شود تا سطح سردرگمی مهاجم را بسنجد و تصادف را پیش‌بینی کند (AM p.6–7).
- تشخیص خودروی ساکت: وقتی دو پیام پیاپی از همسایه دریافت نشود (یک پیام گم‌شده ممکن است ناشی از overhead باشد) (AM p.9).

**هـ) اهداف SRPS (AM p.7–8، §IV، Fig. 4):**
1. کاهش تصادف در دوره‌ی سکوت: هر خودرو (ساکت/فعال) در هر گام موقعیت بعدی خود و همسایگان را با Kalman پیش‌بینی می‌کند؛ «if a silent vehicle predicted any accident in the next time step, it exits the silent period and starts sharing its state» (AM p.7).
2. کاهش نیاز به شبه‌نام (کمتر هدر دادن شبه‌نام در موقعیت مشاهده‌شده).
3. کاهش دوره‌های سکوت: خودرو می‌تواند «successfully change its pseudonym without entering a silent period» اگر موقعیتش احتمالاً با دیگران mix شود (AM p.7–8).
4. افزایش احتمال mix-context: خودروها همکارانه ساکت می‌شوند و **بلافاصله** دنبال mix-context می‌گردند؛ در مقابل CAPS بعد از 3 s شروع به جستجو می‌کند، در حالی که خودرو در 3 s تا 60 m جابه‌جا می‌شود و فرصت mix کمتر است (AM p.8).

**و) Algorithm 1 — SRPS-Active (AM p.8–9):**
- ورودی: Status، RBMs، VS، EVS، MinPL، MaxPL، PL.
- تا PL ≤ MinPL: انتشار VS با شبه‌نام فعلی (گام‌های 2–5). MinPL پیشنهادی 60 s برای پایداری ارتباط (Table 1).
- وقتی MinPL ≤ PL ≤ MaxPL، سه شرط به ترتیب:
  1. **وضعیت غیرمنتظره:** اگر فاصله‌ی EVS (پیش‌بینی گام قبل) و VS واقعی برای سردرگمی مهاجم کافی باشد ← تغییر شبه‌نام و انتشار (مثلاً خودرو قصد مستقیم رفتن داشته ولی به دلیل هشدار تصادف/ترافیک می‌پیچد یا می‌ایستد) (گام 7–11).
  2. **mix-context با همسایه:** Kalman update/predict برای EVS و ERBMs همه‌ی همسایگان (ساکت و فعال)؛ اگر EVS ≈ یکی از ERBMs ← انتشار وضعیت فعلی و تغییر شبه‌نام برای وضعیت بعدی (گام 13–23).
  3. **تغییر وضعیت:** اگر همسایه‌ای ساکت باشد (MTs = MissedTracks، mN > 0) ← ورود همکارانه به سکوت و فراخوانی SRPS-Silent (گام 25–30).
- در غیر این صورت ادامه‌ی انتشار با همان شبه‌نام؛ اگر PL ≥ MaxPL ← سکوت اجباری برای جلوگیری از long-term linkability (گام 35–38).

**ز) Algorithm 2 — SRPS-Silent (AM p.9–10):**
- ورودی: Status، RBMs، VS، EVS، MaxSP، SP.
- خودروی ساکت **بلافاصله** دنبال فرصت ازسرگیری می‌گردد:
  1. **Unexpected state:** اگر EVS ≠ VS ← Active، تغییر شبه‌نام، PL := 0 (گام 3–7).
  2. **Mixed-context / Predicted-accident:** پیش‌بینی EVS و ERBMs؛ اگر EVS ≈ ERBM ← PAA := PAA + 1، تغییر شبه‌نام، بازگشت به Active (گام 9–19). نکته‌ی کلیدی: «when the context of two vehicles is probably to be mixed, it means they probably will be in the same position or near to each other, which could cause an accident if the vehicle continues ceasing its state» (AM p.10) — یعنی **همان شرط هم فرصت حریم خصوصی است و هم هشدار ایمنی**.
  3. اگر SP از MaxSP بگذرد ← خروج اجباری از سکوت (گام 20–24). [توجه: در شبه‌کد گام 20 نوشته شده `PL >= MaxSP` که احتمالاً خطای تایپی به‌جای `SP` است؛ متن توضیحی SP را می‌گوید (AM p.10).]
  4. وگرنه ادامه‌ی سکوت (Ceasing)، SP := SP + BR.

**ح) معیارهای ارزیابی (AM p.11–12، §V.B):**
- Security overhead: ChPseud/s (Eq. 1) = nPseud / (nVch × vL).
- Privacy: Trac% (Eq. 2) — درصد خودروهایی که برای ≥ 90% عمرشان به‌طور پیوسته قابل ردیابی‌اند (خودروهایی که هرگز شبه‌نام عوض نکرده‌اند حذف می‌شوند).
- Safety: SBMs/s (Eq. 3) و PAA (Eq. 4).
- Efficiency: Conf% (Eq. 5) و nVtrac (تعداد خودروهایی که با وجود تغییر شبه‌نام قابل ردیابی ماندند، «wasted pseudonyms»). [در متن به «Equation (9)» برای nVtrac ارجاع شده که در AM وجود ندارد — ناسازگاری داخلی مقاله.]

**ط) نتایج برای نوشتن پاراگراف مقایسه (AM p.13–17، §VI):**
- **Overhead (Fig. 9):** در SRPS تغییر شبه‌نام با تراکم به‌طور سازگار رشد می‌کند (0.62/s، 0.66/s، 0.73/s)؛ CAPS ناسازگار (0.61، 0.61، 0.65)؛ PPC بیشترین (0.74) چون سکوت ندارد (AM p.13).
- **Privacy (Fig. 10):** traceability با افزایش تراکم کم می‌شود (جز CSP که حدود 5% نوسان دارد). CSP کمترین (همه‌ی خودروها همزمان ساکت)؛ PPC بیشترین (تا 94%)؛ RSP تا 83% [توجه: برچسب نمودار برای RSP در v/s برابر 85% است — ناسازگاری متن و نمودار]. SRPS نسبت به CAPS حدود 30% کاهش، چون جستجوی mix-context از لحظه‌ی شروع سکوت و با همه‌ی خودروها (نه فقط ساکت‌ها) انجام می‌شود (AM p.14). حذف MinSP در CAPS (ACAPS) traceability را تا 12% کم می‌کند (Fig. 11: 71→65، 63→52، 52→40).
- **Safety (Fig. 12):** PPC = 10 پیام در ثانیه (بدون سکوت)؛ SLOW همیشه زیر 6.50 (به‌طور میانگین 3.5 پیام در ثانیه از دست می‌رود)؛ RSP زیر 7.65. SRPS، CSP و CAPS همیشه بالای 9 (مثال مقاله: SBMs/s = 9.82 یعنی سفر 100 ثانیه‌ای 982 پیام می‌فرستد و فقط 18 پیام را حذف می‌کند) (AM p.15). SBMs/s در SRPS نسبت به CAPS به اندازه‌ی 0.40، 0.49 و تا 0.60 افزایش یافته (AM p.15). SRPS «the only privacy scheme that does not reduce sending messages when the number of vehicles increases» (AM p.17).
- **PAA (Fig. 14):** 43، 68، 93 با افزایش تراکم (AM p.16).
- **Efficiency (Fig. 15–16):** CSP confusion 100% و کمترین هدر شبه‌نام (کمتر از 19 خودرو) ولی ایمنی را در سکوت همگانی قربانی می‌کند؛ بیش از 85% خودروها هر دقیقه شبه‌نام عوض می‌کنند؛ «VANET would be disabled when all vehicles enter the silent period at the same time» (AM p.16–17). PPC حداکثر confusion 10% و تا 250 خودرو با شبه‌نام هدررفته. RSP حداکثر 22% و تا 141. SRPS confusion را «by more than 39%» افزایش می‌دهد (AM p.16).
- **جمع‌بندی (Table 4):** SRPS «achieved the best balance between the three key issues of privacy, safety, and efficiency» (AM p.17).

### ۳.۳ بخش‌های دیگر که این منبع می‌تواند تقویت کند

- **مقدمه/انگیزه‌ی VANET:** پیش‌بینی دو میلیارد خودرو تا 2040؛ طبق WHO سالانه نزدیک 1.35 میلیون کشته و بیش از 20 میلیون مجروح غیرکشنده در تصادفات جاده‌ای (AM p.1 — داده‌های ثانویه با ارجاع [1], [2] مقاله؛ برای استناد دقیق بهتر است منبع اصلی WHO را هم ذکر کنید). گذار VANET به IoV و پردازش در fog/edge (AM p.1).
- **کاربردهای ایمنی** (AM p.3، §II.B): Post-Crash، Lane Change، Forward Collision، Head-on Collision، Intersection Collision Notification — هرکدام با یک جمله تعریف.
- **حسگرهای خودرو** (AM p.2، §II.A): GPS، TPD، EDR، حسگر جلو/عقب، حسگر سرعت، حسگر یخ.
- **الزامات کاربردهای ایمنی** (AM p.3، §II.C): پیام‌های periodic (beacon، 1–10 Hz) و event-driven؛ تک‌گام تا 300 m و گاهی چندگام؛ **short-term linkability** لازم است (مثلاً هشدار تغییر خط نقشه‌ی خودروهای اطراف را از beaconهای پیاپی می‌سازد)؛ قید بلادرنگ: سرعت تا 112 km/h و latency لازم 100 ms – 1000 ms؛ overhead کم؛ طرح توزیع‌شده و غیرهمکارانه؛ هزینه‌ی کم؛ حریم خصوصی (همبستگی قوی خودرو–راننده چون اغلب خودروها را مالک می‌راند).
- **الزامات امنیتی** (AM p.4، §II.D): authentication، integrity، freshness (مثال: بازپخش پیام آمبولانس توسط راننده‌ی طماع برای خلوت کردن مسیر)، accountability/non-repudiation؛ PKI + امضای دیجیتال + timestamp؛ کلید عمومی بدون اطلاعات هویتی = شبه‌نام. ← می‌تواند بخش «الزامات امنیتی» و «PKI» گزارش را تقویت کند.

## ۴. بررسی ادعاهای فعلی

| report.tex خط | ادعا | حکم | مکان‌یاب شاهد | اصلاح پیشنهادی |
|---|---|---|---|---|
| 688 | شبه‌نام یکی از مهم‌ترین چالش‌ها در حفظ حریم خصوصی VANET است | جزئی | AM p.1–2 (§I)، p.4 (§II.D) | مقاله «تغییر شبه‌نام بدون آسیب به ایمنی» را چالش علمی می‌داند، نه خود شبه‌نام. پیشنهاد: «طراحی سازوکار تغییر شبه‌نام که هم‌زمان حریم خصوصی، امنیت و ایمنی را تأمین کند همچنان یک چالش علمی است». |
| 702 | SRPS تعادلی بین حریم خصوصی و ایمنی ایجاد می‌کند | پشتیبانی‌شده | Abstract؛ AM p.17 (Table 4، §VII) | بهتر است «امنیت (overhead)، حریم خصوصی و ایمنی» ذکر شود. |
| 705 | کاهش دوره‌های سکوت: خودرو در صورت پیش‌بینی تصادف از سکوت خارج می‌شود | پشتیبانی‌شده | Abstract؛ AM p.7 (§IV)؛ Algorithm 2 | دو سازوکار را جدا کنید: (۱) خروج از سکوت با پیش‌بینی تصادف یا mix-context؛ (۲) تغییر شبه‌نام خودروی فعال بدون ورود به سکوت. |
| 706 | تغییر هوشمند شبه‌نام با الگوریتم ردیابی چندهدفه | پشتیبانی‌شده | Abstract؛ AM p.7 (§III.C) | دقیق‌تر: MTT (Kalman + NNPDA) برای پیش‌بینی وضعیت خود و همسایگان و یافتن mix-context. |
| 707 | نزدیک به ۱۰ پیام ایمنی در ثانیه | پشتیبانی‌شده | Fig. 12، AM p.15 (9.81 / 9.87 / 9.92 SBMs/s) | عدد دقیق را بیاورید: «۹٫۸۱ تا ۹٫۹۲ پیام در ثانیه از ۱۰ پیام ممکن (نرخ 10 Hz)». |
| 708 | کاهش ردیابی تا ۲۰ درصد در تراکم بالا | جزئی (بد بیان‌شده) | Fig. 10، AM p.15؛ متن AM p.14 | ۲۰٪ **مقدار traceability** در بیشترین تراکم (v/0.3s) است، نه میزان کاهش. اصلاح: «درصد خودروهای قابل ردیابی در بیشترین تراکم به ۲۰٪ می‌رسد (در برابر ۵۲٪ برای CAPS)؛ یعنی حدود ۳۰ واحد درصد کاهش نسبت به CAPS». |

جمع: ۶ ادعا — ۴ پشتیبانی‌شده، ۲ جزئی، ۰ پشتیبانی‌نشده، ۰ غیرقابل‌تأیید.

## ۵. اصطلاحات

| English | معادل فارسی پیشنهادی |
|---|---|
| Safety-related Privacy Scheme (SRPS) | طرح حریم خصوصی مرتبط با ایمنی |
| Beacon Message (BM) | پیام راهنما / پیام beacon |
| silent period | دوره‌ی سکوت |
| pseudonym-changing scheme | طرح تغییر شبه‌نام |
| mix-zone | ناحیه‌ی اختلاط |
| mix-context | زمینه‌ی اختلاط |
| social spot | نقطه‌ی اجتماعی |
| unlinkability / linkability | پیوندناپذیری / پیوندپذیری |
| short-term / long-term linkability | پیوندپذیری کوتاه‌مدت / بلندمدت |
| spatio-temporal information | اطلاعات مکانی-زمانی |
| syntactic attack / semantic attack | حمله‌ی نحوی / حمله‌ی معنایی |
| timing and transition attack | حمله‌ی زمان‌بندی و گذار |
| global passive adversary | مهاجم منفعل سراسری |
| Multi-Target Tracker (MTT) | ردیاب چندهدفه |
| Kalman filter | فیلتر کالمن |
| gating | دروازه‌گذاری (حذف انتساب‌های نامحتمل) |
| data association (NNPDA) | انتساب داده (انتساب احتمالاتی داده‌ی نزدیک‌ترین همسایه) |
| track maintenance | نگهداشت مسیر ردیابی |
| Long-Term / Short-Term Pseudonym (LTP/STP) | شبه‌نام بلندمدت / کوتاه‌مدت |
| LTIA / STIA | مرجع صدور بلندمدت / کوتاه‌مدت |
| Tamper Proof Device (TPD) | دستگاه مقاوم در برابر دست‌کاری |
| traceability | ردیابی‌پذیری |
| confusion level | سطح سردرگمی (مهاجم) |
| Potentially Avoided Accidents (PAA) | تصادف‌های بالقوه اجتناب‌شده |
| security overhead | سربار امنیتی |
| wasted pseudonym | شبه‌نام هدررفته |

## ۶. شکل‌ها و جداول قابل استفاده

| شماره | صفحه (AM) | محتوا | کاربرد پیشنهادی |
|---|---|---|---|
| Fig. 1 | p.4 | حملات پیوند (syntactic و semantic) هنگام تغییر شبه‌نام | بازترسیم برای توضیح چرایی ناکافی بودن تغییر ساده‌ی شبه‌نام |
| Fig. 3 | p.7 | مدل مدیریت شبه‌نام (LTIA، STIA، LTP، STP) | بازترسیم در بخش مدیریت شبه‌نام/PKI |
| Fig. 4 | p.7 | ردپای سه خودرو و چهار موقعیت قابل‌توجه (هم فرصت اختلاط، هم خطر تصادف) | بهترین شکل برای توضیح ایده‌ی محوری SRPS |
| Algorithm 1 و 2 | p.9–10 | شبه‌کد SRPS-Active و SRPS-Silent | تبدیل به فلوچارت دووضعیتی (Active ↔ Silent) |
| Table 2 | p.13 | پارامترهای شش طرح | جدول پارامترهای مقایسه |
| Fig. 10 | p.15 | Traceability% شش طرح در سه تراکم | جدول عددی مقایسه‌ی حریم خصوصی |
| Fig. 12 | p.15 | SBMs/s شش طرح | جدول عددی مقایسه‌ی ایمنی |
| Fig. 15 / Fig. 16 | p.17 | سطح سردرگمی / تعداد خودروهای با شبه‌نام هدررفته | مقایسه‌ی کارایی |
| Table 4 | p.17 | رتبه‌بندی ۱ تا ۶ در Privacy / Safety / Overheads | جدول خلاصه‌ی مقایسه (کوچک و مستقیماً قابل نقل) |

ناسازگاری‌های داخلی مقاله که دیده شد: (۱) RSP «تا 83%» در متن در برابر 85% در Fig. 10؛ (۲) ارجاع به «Equation (9)» که وجود ندارد؛ (۳) `PL >= MaxSP` در گام 20 الگوریتم 2 به‌جای SP؛ (۴) در متن AM p.16 گفته شده «SLOW has the lowest vehicle status updates as shown in Fig. 10» در حالی که این داده در Fig. 12 است.
