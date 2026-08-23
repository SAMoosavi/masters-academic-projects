---
tags: [literature, PF-CLAS, CLAS, VANET]
paper: zhengSecurityEnhancedPairingFreeCertificateless2023
year: 2023
---

# A Security-Enhanced Pairing-Free Certificateless Aggregate Signature for Vehicular Ad-Hoc Networks (Zheng et al. 2023, IEEE Systems Journal)

## خلاصه (Summary)

مقاله یک طرح **Certificateless Aggregate Signature (CLAS)** مبتنی بر منحنی بیضوی (ECC) و بدون **bilinear pairing** را برای VANET ها پیشنهاد می‌کند. مشکل اصلی: اکثر طرح‌های CLAS موجود یا دارای آسیب‌پذیری امنیتی جدی هستند یا هزینه محاسباتی سنگینی دارند. نویسندگان ابتدا طرح Han et al. [5] را بررسی کرده و با ارائه یک مثال حمله مشخص نشان می‌دهند که یک گره مخرب می‌تواند با تعامل با KGC، کلید اصلی استاد (master private key) را بازسازی کند. سپس طرح بهبودیافته‌ای ارائه می‌کنند که این نقص را برطرف کرده و امنیت آن را در **random oracle model (ROM)** به‌صورت **existentially unforgeable against adaptive chosen message attacks (EUF-CMA)** اثبات می‌کنند. ارزیابی عملکرد روی کتابخانه MIRACL نشان می‌دهد طرح نسبت به طرح‌های مقایسه‌شده کارایی محاسباتی بهتری دارد و برای محیط‌های محدود-منبع VANET مناسب است.

## ایده اصلی و طرح (Core idea & scheme)

- **هدف**: تأیید صحت و یکپارچگی پیام‌ها در VANET با هزینه ارتباطی و محاسباتی پایین، ضمن حفظ حریم خصوصی رانندگان (privacy-preserving).
- **انگیزه**: استفاده از خود امضای دیجیتال در VANET به‌دلیل حجم بالای پیام‌ها عملی نیست؛ PKI مشکل مدیریت گواهی و IBC مشکل **key escrow** دارد؛ CLC (Al-Riyami et al., 2003) با تولید کلید خصوصی از دو بخش مستقل، هر دو مشکل را حل می‌کند.
- **سیستم**: شامل KGC، **trusted authority (TA)**، **application backend (AB)**، **road-side unit (RSU)** و **on-board unit (OBU)**؛ دو نوع ارتباط V2V و V2I.
- **روش کار**:
  - بر پایه یک گروه چرخشی G روی منحنی بیضوی (بدون pairing) ساخته شده تا از عملیات پرهزینه مانند **map-to-point hash** و **bilinear pairing** اجتناب شود.
  - **Conditional anonymity**: هر خودرو با **pseudonym identity (PID)** ارتباط برقرار می‌کند؛ تنها TA با master private key می‌تواند هویت واقعی (RID) را بازیابی کند.
  - امضای فردی: یک امضاگر چند hash و ضرب نقطه انجام می‌دهد؛ امضای تجمیعی با ترکیب امضاهای n کاربر تولید و در یک مرحله **aggregate verification** بررسی می‌شود (برای n کاربر: 3n ضرب نقطه و 3n جمع نقطه در تجمیع).
  - هر پیام شامل timestamp برای جلوگیری از replay است.

## امنیت (Security)

- **اثبات رسمی**: در random oracle model، بر فرض دشواری **ECDLP (Elliptic Curve Discrete Logarithm Problem)**، طرح در برابر دو نوع حریف **Type I** و **Type II** به‌صورت EUF-CMA امن است (Theorems 1 و 2). در اثبات، استراتژی **forking lemma** (Pointcheval–Stern) به‌کار رفته و حل نمونه ECDLP استخراج می‌شود.
- **نقص طرح قبلی**: در Han et al. یک گره مخرب می‌تواند master private key را از طریق تعامل با KGC به‌دست آورد؛ طرح جدید این نقص را برطرف می‌کند.
- **حملات مقاومت‌شده** (analisi امنیتی غیررسمی):
  - mutual authentication (تأیید متقابل) از طریق معادله تأیید `sP = U + Σ(Ri + h1i·Kpub)h2i + Σ Xi·h3i`
  - conditional anonymity و unlinkability (به‌دلیل به‌روزرسانی دوره‌ای pseudonym)
  - message integrity (بر پایه hash توابع مقاوم برخورد)
  - man-in-the-middle، replay (با timestamp)، denial of service (رد گره‌های نامعتبر + ردیابی TA)، impersonation و signature forgery

## ارزیابی (Evaluation)

- پیاده‌سازی روی MIRACL، لینوکس، سخت‌افزار Intel Core i7-6700 @ 3.40 GHz با 8 GB RAM؛ امنیت هم‌ارز RSA-1024 (q به طول 40 B).
- **Single sign**: ~0.979 ms → حدود 82.1% سریع‌تر از Kumar et al. و 89.1% سریع‌تر از Wu et al. (به‌دلیل حذف pairing)؛ حدود 49.8% سریع‌تر از Gayathri et al. و Liu et al.
- **Single verify**: ~3.903 ms → حدود 67.2% و 69.7% سریع‌تر از [6] و [7]؛ حدود 19.8% سریع‌تر از [8].
- **در برابر Han et al.**: کمی کندتر (Sign ~0.8% و Verify ~50.2%) اما نقص امنیتی آن را برطرف کرده و سطح امنیت بالاتری می‌دهد — مصالحه‌ای بین امنیت و کارایی.
- نتیجه: هزینه محاسباتی و پهنای باند ارتباطی پایین‌تر نسبت به طرح‌های رقیب؛ مناسب سناریوی VANET با منابع محدود.

## نکات برای طرح امضای جدید (Takeaways for a new fast+secure+cheater-detecting scheme)

- **بدون pairing**: حذف bilinear pairing و map-to-point hash بزرگ‌ترین عامل کاهش هزینه است؛ یک طرح جدید سریع باید pairing-free و بر پایه ECC ساده باشد.
- **ثبات امنیتی**: امنیت به‌تنهایی کافی نیست — نقص طرح قبلی (بازیابی master key توسط گره مخرب) فقط با مثال حمله مشخص و اثبات EUF-CMA در ROM رفع شد. یک طرح جدید باید formal security proof با Type I/II adversaries و فرض ECDLP داشته باشد و حتماً cryptanalysis بر روی نسخه ساده‌شده انجام شود.
- **تجمیع برای مقیاس**: هزینه تجمیع و تأیید تجمیعی خطی در n است (3n ضرب نقطه) و هزینه ارتباطی پیام‌ها را به‌شدت کاهش می‌دهد؛ این الگو (aggregate verification در یک مرحله) برای VANET ضروری است.
- **زیرساخت حریم خصوصی**: conditional anonymity با pseudonym متغیر (به‌روزرسانی دوره‌ای PID) + ردیابی فقط توسط TA الگوی استانداردی است که باید حفظ شود.
- **برای detection جعل/cheating**: تجمیع امضای بسیاری از گره‌ها در یک بسته، تشخیص اینکه کدام گره امضای نامعتبر ارسال کرده را دشوار می‌کند. این مقاله روی این موضوع کار نکرده؛ یک طرح جدید باید مکانیزمی برای pinpoint کردن signer خطاکار در batch اضافه کند (مثلاً با تقسیم گروه‌بندی شده یا درخت تأیید) بدون از دست دادن مزیت تجمیع — این یک شکاف/افزایش واضح نسبت به کار Zheng et al. است.
- **نکته عمل‌گرایانه**: هزینه‌های واقعی با کتابخانه MIRACL و مشخصات دقیق سخت‌افزار گزارش شده‌اند؛ یک طرح جدید باید همین استاندارد گزارش‌دهی (مقایسه ms واقعی در مقابل [5]–[9]) را دنبال کند تا ادعای کارایی قابل اعتماد باشد.
