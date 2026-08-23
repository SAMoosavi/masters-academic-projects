---
tags: [literature, CLAS, VANET, survey]
paper: ComprehensiveSurveyCertificateless
year: 2021
---

# A Comprehensive Survey on Certificateless Aggregate Signature in Vehicular Ad Hoc Networks (IETE Technical Review)

نویسندگان: Eko Fajar Cahyadi و Min-Shiang Hwang
منبع: IETE Technical Review, 2022, Vol. 39, No. 6, pp. 1265–1276 (DOI: 10.1080/02564602.2021.2017800)

## خلاصه (Summary) — scope

این مقاله یک **survey** جامع دربارهٔ طرح‌های **Certificateless Aggregate Signature (CLAS)** در **Vehicular Ad Hoc Networks (VANETs)** است. نخستین مقالهٔ مرتبط با CLAS در VANETs در سال 2015 منتشر شده و این survey تقریباً تمام آن‌ها را بررسی می‌کند. نویسندگان ویژگی‌های اصلی، سهم (contributions)، **security** و **performance efficiency** هر طرح را به‌عنوان state-of-the-art بررسی کرده‌اند و در پایان نتیجه‌گیری و **open issues** را ارائه می‌دهند. هدف، بهبود امنیت و حریم خصوصی فرآیند انتشار پیام (message dissemination) در محیط جاده است.

## ایده اصلی و طرح (Core idea) — CLAS concepts

- **مؤلفه‌های VANET** (شکل 1): سه مؤلفهٔ اصلی —
  1. **Trusted Authority (TA)**: مرکز مدیریت امنیت و اعتماد؛ وظیفهٔ ثبت‌نام RSU و OBU، تولید پارامترها و **revoke** گره‌هایی که سیگنال‌های متقلبانه (fraudulent signals) یا رفتار خصمانه ارسال می‌کنند.
  2. **Roadside Unit (RSU)**: زیرساخت ثابت تحت کنترل کامل TA در کنار جاده (مثلاً تقاطع‌ها)؛ ظرفیت ذخیره‌سازی محدود و نقش واسط بین TA و OBUها.
  3. **Onboard Unit (OBU)**: فرستنده‌گیرندهٔ داخل خودرو که اطلاعاتی مانند موقعیت، سرعت و جهت را به‌صورت دوره‌ای (هر 100–300 میلی‌ثانیه) از طریق **V2V** و **V2I** پخش می‌کند (پروتکل **DSRC**).
- **دسته‌بندی طرح‌های احراز هویت حافظ حریم خصوصی** (به نقل از Lu et al.): پنج دسته —
  1. **PKI-based** (نیازمند مدیریت certificate که زمان verification را افزایش می‌دهد)
  2. **Symmetric cryptography-based**
  3. **Identity (ID)-based**
  4. **CLS/CLAS-based**
  5. **Group signature-based**
- **مفهوم CLAS**: ترکیب دو ایده —
  1. **Certificateless Public Key Cryptography (CL-PKC)**: (پیشنهاد Al-Riyami & Paterson) تا حد امکان از مدیریت certificate اجتناب می‌کند و در عین حال مشکل key escrow طرح‌های ID-based را ندارد.
  2. **Aggregate signature**: چند امضا از کاربران مختلف برای پیام‌های متفاوت را در یک امضای واحد تجمیع می‌کند (شکل 2). این کار هم طول امضا و هم هزینهٔ ذخیره‌سازی را کاهش می‌دهد و **verification efficiency** را بهبود می‌بخشد.
- **Pairing در برابر Pairing-free**: دو رویکرد اصلی در طرح‌ها دیده می‌شود —
  - طرح‌های مبتنی بر **bilinear pairing** (که هزینهٔ محاسباتی بالایی دارند) مانند Horng et al. (2015).
  - طرح‌های **بدون pairing** (pairing-free) برای کاهش overhead؛ مانند Cui et al. (2018) و Kamil & Ogundoyin (2019).
- **زیرمجموعه‌ها/تنوع طرح‌ها** (از فهرست مراجع): full aggregation (Zhong et al. 2019)، online/offline CLAS (Li et al. 2019)، blockchain-based (Ali et al. 2019؛ Ren et al. 2021)، طراحی برای IoV (Zhao et al. 2019؛ Mei et al. 2021)، smart grid (Vallent et al. 2021)، secure routing (Xu et al. 2020)، anonymous authentication + aggregate signature (Ye et al. 2021)، و THumbur et al. (2021, IEEE IoT Journal).

## امنیت (Security)

- **نوع حملات / ضعف‌ها**: بخش قابل توجهی از ادبیات، **cryptanalysis** و شکستن طرح‌های قبلی است —
  - Li et al. (2016): cryptanalysis و بهبود طرح Horng et al.
  - Kumar & Sharma (2018): حمله بر امنیت طرح CLAS در VANETs.
  - Hu et al. (2019): تحلیل امنیتی طرح CLAS در VANETs.
  - Kamil & Ogundoyin (2020): حمله بر "privacy-preserving authentication scheme with full aggregation".
  - الگوی تکرارشونده: چندین طرح منتشرشده بعداً با cryptanalysis شکسته شده‌اند.
- **الزامات امنیتی**:
  - **Conditional privacy-preserving**: anonymity برای رانندگان، اما با قابلیت ردیابی/بازیابی هویت توسط TA در صورت رفتار بد (مثلاً ارسال پیام جعلی).
  - **Traceability / Revocation**: TA می‌تواند گره‌های متقلب را revoke کند.
  - **Unforgeability**: امنیت مبتنی بر فرضیات سخت ریاضی — در بسیاری از طرح‌ها معادل **CDHP (Computational Diffie-Hellman Problem)** و **ECDLP (Elliptic Curve Discrete Logarithm Problem)** (سطح امنیت 80 بیت).
  - **Authentication**: امضای دیجیتال رایج‌ترین روش برای تضمین صحت (authenticity) پیام‌های مبادله‌شده در VANETs.
- **بافت VANET چرا سخت است**: کانال بی‌سیم باز، تغییر سریع توپولوژی، تحرک بالا، محدودیت‌های زمانی شدید (time-critical) و تعداد بسیار زیاد پیام — همه این‌ها امنیت و حریم خصوصی را به چالش می‌کشند.

## ارزیابی (Evaluation)

- **دو رویکرد برای محاسبهٔ cost** در طرح‌های CLAS-VANET:
  1. **Tate pairing** روی زیرگروه 159 بیتی یک منحنی **MNT** با embed degree 6 در سطح امنیت 80 بیت، روی Intel i7 3.07 GHz:
     - **Pairing Computation (PC)**: 3.21 ms
     - **Scalar Multiplication (SC)**: 0.39 ms
     - **Hash (HC)**: 0.09 ms
  2. **Bilinear pairing** ê: G1 × G1 → G2 روی یک **supersingular elliptic curve** Ep/Fp در سطح امنیت 80 بیت با امنیت معادل **CDHP و ECDLP**.
- نکتهٔ مقایسه: هزینهٔ یک pairing (PC ≈ 3.21 ms) تقریباً **8 برابر** هزینهٔ یک scalar multiplication است؛ همین‌جا انگیزهٔ طرح‌های pairing-free را نشان می‌دهد.
- **ارزیابی communication/storage**: مزیت aggregation کاهش طول امضا، کاهش نیازهای ارتباطی و کاهش ذخیره‌سازی است؛ طرح‌های مختلف از نظر تعداد pairingها و scalar multiplications در تولید امضا و verification مقایسه می‌شوند.
- نویسندگان خود اعتراف می‌کنند که یک **quantitative analysis** کامل (مثلاً نمودار تعداد انتشارات در سال) را به‌عنوان کار آینده مطرح می‌کنند.

## نقاط ضعف و شکاف‌های تحقیق (Weaknesses & research gaps)

1. **شکستن مکرر طرح‌ها**: بسیاری از طرح‌های CLAS منتشرشده با cryptanalysis شکسته شده‌اند — یعنی اثبات امنیت آن‌ها ناکافی یا ناقص بوده است.
2. **هزینهٔ بالای pairing**: طرح‌های مبتنی بر bilinear pairing از نظر محاسباتی گران هستند و برای محیط time-critical VANET (پیام‌های هر 100–300ms و صدها خودرو) نامناسب‌اند.
3. **پوشش ناقص سناریوها**: برخی طرح‌ها فقط V2I دارند، برخی هوش محاسباتی RSU (with limited storage) را در نظر نمی‌گیرند.
4. **نبود quantitative bibliometric analysis**: نویسندگان پیشنهاد می‌دهند تحلیل کمی منتشر نشده — تعداد انتشارات در سال، تعداد هر ناشر، مقایسهٔ نسبت ژورنال‌ها و کنفرانس‌ها.
5. **open issues کلی**: تعادل بین **privacy (anonymity)** و **traceability/accountability**؛ مقیاس‌پذیری verification با تعداد بالای امضاها؛ ترکیب با فناوری‌های جدید (blockchain در چند مرجع دیده می‌شود) همچنان جای کار دارد.

## نکات برای طرح امضای جدید (Takeaways for a new fast+secure+cheater-detecting scheme)

برای طراحی طرح امضای جدید (سریع + امن + تشخیص‌دهندهٔ متقلب):

1. **سریع (fast)**:
   - از **bilinear pairing اجتناب کنید** (pairing-free)؛ هزینهٔ یک pairing ≈ 3.21ms در برابر ≈ 0.39ms برای scalar multiplication — حذف pairing بزرگ‌ترین برد کارایی است.
   - پیام‌ها باید در بازهٔ زمانی سخت 100–300ms با صدها خودرو پردازش شوند؛ پس هزینهٔ verification (نه فقط تولید امضا) باید O(تعداد امضاها) یا بهتر باشد — **aggregation/batch verification** ضروری است.
   - از ساختارهای امنیتی روی منحنی‌های استاندارد (مثل ECC) با سطح 80 بیت و فرض ECDLP استفاده کنید.
2. **امن (secure)**:
   - طرح باید در برابر همان نوع حملاتی که طرح‌های قبلی را شکستند مقاوم باشد؛ یعنی حداقل موارد زیر باید به‌صورت **provable** اثبات شوند: **unforgeability** (تحت CDHP/ECDLP)، مقاومت در برابر **replacement of public key** (حملهٔ رایج در CL-PKC)، و **collusion attacks** بین متقلبان.
   - الگوی درس‌گرفته از survey: طرح‌های جدید اغلب با cryptanalysis بعدی شکسته می‌شوند — پس اثبات امنیت را با دقت کامل (Reduction به فرض سخت) ارائه دهید، نه صرفاً ادعای امنیت.
3. **ردیابی متقلب / تشخیص cheat (cheater-detecting)**:
   - **Conditional privacy**: هویت راننده ناشناس بماند، اما با کلید/اطلاعات TA قابل ردیابی باشد تا متقلب (مثلاً فرستندهٔ پیام‌های جعلی مثل موقعیت/سرعت اشتباه) قابل شناسایی و **revoke** باشد.
   - سازوکار TA: ثبت‌نام OBU/RSU، نگه‌داری پارامترها و امکان revoke گره‌ها — در طراحی جدید باید مکانیزم ردیابی و revoke به‌صراحت تعریف شود.
4. **در نظر گرفتن محدودیت‌های RSU و OBU**: RSUها ظرفیت ذخیره‌سازی محدودی دارند؛ بار محاسباتی سنگین (aggregation و verification) باید متوازن بین OBU، RSU و TA توزیع شود.

**نتیجهٔ کلی برای پروژهٔ ما**: یک طرح CLAS بدون pairing (برای سرعت) + conditional privacy-preserving با قابلیت traceability و revoke توسط TA (برای امنیت و تشخیص متقلب) + full aggregation برای verification کارآمد، دقیقاً همان ترکیبی است که شکاف‌های این survey را پوشش می‌دهد.
