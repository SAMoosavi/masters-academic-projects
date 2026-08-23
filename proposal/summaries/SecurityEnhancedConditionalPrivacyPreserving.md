---
tags: [literature, CLAS, VANET]
paper: SecurityEnhancedConditionalPrivacyPreserving
year: 2023
---

# A Security-Enhanced Conditional Privacy-Preserving Certificateless Aggregate Signature Scheme for VANETs (IEEE 2023)

**نویسندگان:** Zhiyu Xu, Liangliang Wang, Yiyuan Luo, Yu Long, Kai Zhang, Hailun Yan, Kefei Chen — IEEE Internet of Things Journal (جلد ۱۱، شماره ۸، ۱۵ آوریل ۲۰۲۴؛ دریافت ۶ سپتامبر ۲۰۲۳، پذیرش ۲۰ نوامبر ۲۰۲۳، انتشار ۱ دسامبر ۲۰۲۳). DOI: 10.1109/JIOT.2023.3337136

> **منبع استخراج:** این خلاصه بر اساس متنِ condense‌شده مقاله (چکیده، مقدمه، تحلیل هزینه و نتیجه‌گیری) نوشته شده است؛ جزئیات دقیق الگوریتم‌های Attack و Setup/Extract پشت paywall است و هر جا مطلبی استنتاجی است، صریحاً علامت گذاری شده است.

## خلاصه (Summary)

مقاله یک طرح **امضای تجمعی بدون گواهی (CLAS / Certificateless Aggregate Signature)** با **حفاظت حریم خصوصی شرطی (conditional privacy-preserving)** برای VANET ارائه می‌دهد. کار اصلی مقاله دوگانه است: (۱) با ارائه یک **الگوریتم حمله مشخص (attack algorithm)** نشان می‌دهد که طرح CPP-CLAS اخیر چن و چن (Chen & Chen, 2022) [19] در برابر **حمله جایگزینی کلید عمومی (public key replacement attack)** توسط **مهاجم خارجی (external adversary)** آسیب‌پذیر است؛ (۲) یک طرح CLAS تقویت‌شده امنیتی پیشنهاد می‌کند که این نقص را ترمیم می‌کند. علاوه بر این، یک **الگوریتم کارآمد شناسایی امضای نامعتبر (invalid signature identification)** ارائه می‌شود که پس از شکست verification تجمعی، امضاهای آلوده/جعلی داخل aggregate را به‌سرعت پیدا می‌کند — این بخش مستقیماً به ایده «کشف متقلب/cheater detection» مرتبط است.

## ایده اصلی و طرح (Core idea & scheme)

- **Pairing-free با ECC:** بر خلاف طرح‌های مبتنی بر bilinear pairing (مثل Kumar et al. [12])، طرح پیشنهادی بدون عملیات pairing و صرفاً با **ضرب نقطه روی منحنی بیضوی (point multiplication)** کار می‌کند — تنها یک عملیات Tecc-mul برای تولید امضا.
- **ساختار بدون گواهی (Certificateless):** نیمه-TA (semi-TA) و کاربر هر دو در تولید کلید خصوصی دخیل‌اند؛ مشکل **key escrow** سیستم‌های ID-based حذف می‌شود (کلید کاملاً در دست یک مرجع سوم نیست).
- **Conditional privacy:** خودروها با **pseudonym (PIDi = {AIDi,3, ΔTi})** ارتباط برقرار می‌کنند تا ردگیری نشوند، اما یک مرجع مورد اعتماد می‌تواند هویت واقعی خودروی بدخواه را فاش کند.
- **Aggregation:** n امضا از n خودروی مختلف روی پیام‌های مختلف به یک امضای کوتاه تجمعی تبدیل می‌شود و RSU آن را به‌صورت تجمعی تأیید می‌کند (batch verification).
- **شکل امضای فردی:** `Si = ki + h2i·xi + h3i·di` و `σi = {Ki, Si}`؛ پیام ارسالی خودرو `(PIDi, ti, PKi, mi, σi)` است (نقطه روی G و اسکالر روی Zq*).
- **پس‌زمینه سیستمی:** معماری سه‌جزئی TA / RSU / OBU با پروتکل DSRC؛ V2V و V2I با سرعت ۶–۲۷ Mb/s و برد تا ۱ کیلومتر.
- **انگیزه اصلی:** شکستن طرح چن و چن [19] (پس‌زمینه: آن طرح نیز pairing-free بود) — یعنی مقاله یک حمله cryptanalysis + یک طرح جایگزین با ترمیم امنیتی ارائه می‌دهد.

## امنیت (Security)

- **مدل امنیتی:** مدل امنیتی چن و چن [19] به‌کار رفته؛ بر اساس همین مدل الگوریتم حمله برای نشان دادن عدم مقاومت طرح [19] در برابر **public key replacement attack از مهاجم خارجی** طراحی شده است.
- **حمله شناسایی‌شده:** جایگزینی کلید عمومی (public key replacement) و **جعل امضا (signature forgery)** توسط مهاجمان خارجی؛ همچنین آلوده‌سازی امضای تجمعی (polluting aggregate) برای از کار انداختن batch verification.
- **اثبات امنیت:** طرح در برابر **EUF-CMA (existential unforgeability under adaptive chosen message attacks)** در **مدل Random Oracle (ROM)** اثبات شده است.
- **فرض سختی:** مبتنی بر **ECDLP (Elliptic Curve Discrete Logarithm Problem)**.
- **الزامات VANET:** بر اساس تحلیل، طرح نیازمندی‌های پایه امنیت/حریم خصوصی VANET را تأمین می‌کند (تأیید یکپارچگی، عدم انکار nonrepudiation، unlinkability/ناشناس‌بودن، ردگیری‌پذیری مشروط).
- **Revocation (بخش الحاقی):** طرح به‌صورت افزونه برای **revocability** تعمیم می‌شود: کلید توافقی (key agreement) و احراز هویت متقابل (mutual authentication) خودرو–RSU، کلید revoke `zi` رمزنگاری‌شده برای خودرو، و امضای نهایی `Si = ki + h2i·xi + h3i·di + h4i·zi`؛ خودروی revoked نتواند zi بگیرد و دیگر نتواند پیام معتبر امضا کند.

## ارزیابی (Evaluation)

- **هزینه محاسباتی (با Tecc-mul ≈ 0.3218 ms):**
  - Signature generation: **۱ ضرب نقطه ≈ 0.3218 ms** (در مقابل ≈ 2.8788 ms طرح Kumar et al. [12]).
  - Single signature verification: **۴ ضرب + ۴ جمع ≈ 1.2968 ms** (در مقابل ≈ 22.6244 ms طرح [12] که ۴ pairing دارد).
  - Aggregate verification: **(2n+2) ضرب + (2n+2) جمع ≈ 0.6484n + 0.6484 ms** (در مقابل ≈ 2.1866n + 20.4378 ms طرح [12]).
- **هزینه ارتباطی:** هر پیام خودرو **148 بایت** (`2|G| + 3|Zq*| + 2|t|` با `|G|=40B`, `|Zq*|=20B`, `|t|=4B`) در مقابل 724 بایت طرح Wang et al. [15]؛ هزینه ارتباط و طول امضای تجمعی از **هر شش طرح مرجع [11], [12], [13], [14], [15], [18]** کمتر است.
- **مقایسه‌ها:** ارقام/جداول مقایسه بر اساس پارامترهای یکسان (اندازه p و p̂ به‌ترتیب ۲۰ و ۶۴ بایت) و جداول TABLE III–V + شکل‌های ۳–۶ (runtime، computation cost، aggregate verification delay، communication cost، signature length)؛ ادعای بهبود هم در محاسبات هم در ارتباطات.
- **محدودیت:** داده‌های خام جداول و زمان‌بندی‌های سخت‌افزار آزمایش در متن موجود نیست — صرفاً فرمول‌های هزینه که بالا آمده.

## نکات برای طرح امضای جدید (Takeaways for a new fast+secure+cheater-detecting scheme)

- **الگوی «cryptanalysis → طرح ترمیمی» را تکرار کن:** بهترین راه اثبات ارزش طرح جدید، اول شکستن طرح رقیب با یک الگوریتم حمله مشخص و سپس ارائه ترمیم است؛ این ساختار مقاله به‌طور طبیعی جای بحث «امنیت در مقابل حریف مشخص» را باز می‌کند.
- **Pairing-free + ECC پایه سرعت است:** تولید امضا با **یک ضرب نقطه** و verification تجمعی با فرمول خطی `O(n)` بدون pairing معیار خوبی برای «سریع» بودن است.
- **الگوی امضای فردی ساده:** `Si = ki + Σ h·sk` روی یک scalar (نه چند امضای سنگین) — بعداً می‌توان امضای نهایی را به این ساختار افزود. (الگوی منعطف برای افزودن terms)
- **Invalid signature identification یک تمایز واقعی است:** پس از شکست verification تجمعی، الگوریتم جستجوی امضای نامعتبر داشته باش تا RSU امضاهای آلوده را حذف کند و بقیه را بپذیرد — این همان «cheater detection» در سطح امضای تجمعی است و در بسیاری از طرح‌های CLAS (مثل eCLAS) غایب است.
- **Conditional privacy با pseudonym + قابلیت افشای هویت توسط TA:** حفظ unlinkability در عین امکان ردگیری مشروط — برای طرح جدید الزامی است.
- **بخش الحاقی revocation (mutual auth + key agreement + کلید zi) را در طراحی از ابتدا لحاظ کن** تا بعداً به‌سختی اضافه نشود؛ ارزان‌ترین راه، گنجاندن یک term امضایی `h·z` مانند همین مقاله است.
- **چهارچوب اثباتی قابل‌انتظار:** EUF-CMA در ROM تحت ECDLP + تحلیل الزامات VANET؛ برای پذیرش در ژورنال‌های معتبر همین استاندارد کافی است.
- **نقاط ضعفِ قابلِ پرهیز (برای تمایز):** proof فقط در **ROM** است و نه standard model (طرح Wang et al. [15] استاندارد مدل است)؛ پیشنهاد این است که طرح جدید یا اثبات استاندارد مدل بدهد یا در سرعت/حجم ارتباط برتری کمی قطعی داشته باشد.
