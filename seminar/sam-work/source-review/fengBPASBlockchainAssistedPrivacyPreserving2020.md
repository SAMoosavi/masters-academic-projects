# یادداشت استخراج محتوا — `fengBPASBlockchainAssistedPrivacyPreserving2020` (BPAS)

> **هشدار سطح دسترسی:** متن کامل این مقاله در دسترس نبود. همه‌ی مطالب زیر فقط از **چکیده**، **پاراگراف اول مقدمه** (پیش‌نمایش رایگان IEEE Xplore)، **فهرست بخش‌های I تا V** و **کلیدواژه‌های** مدخل bib استخراج شده‌اند. هیچ جزئیاتی درباره‌ی الگوریتم‌ها، مدل تهدید، ارزیابی یا اعداد عملکرد در دسترس نبوده و هیچ‌کدام هم در این یادداشت ساخته نشده است.

## ۱. مشخصات و دسترسی

**ارجاع کامل (IEEE):**
Q. Feng, D. He, S. Zeadally, and K. Liang, "BPAS: Blockchain-Assisted Privacy-Preserving Authentication System for Vehicular Ad Hoc Networks," *IEEE Transactions on Industrial Informatics*, vol. 16, no. 6, pp. 4146–4155, Jun. 2020, doi: 10.1109/TII.2019.2948053.

**وابستگی سازمانی نویسندگان** (طبق OpenAlex): Qi Feng — Wuhan University و Peng Cheng Laboratory؛ Debiao He — Wuhan University؛ Sherali Zeadally — University of Kentucky؛ Kaitai Liang — University of Surrey.

**سطح دسترسی: فقط چکیده و بخشی از مقدمه.**
- فایل محلی `/home/sam/Zotero/storage/SEXJXE4I/8873608.html` صفحه‌ی ذخیره‌شده‌ی IEEE Xplore است و فقط این‌ها را دارد: چکیده، مشخصات انتشار، فهرست بخش‌ها (I. Introduction، II. Related Works، III. Problem Formulation، IV. Building Blocks، V. Design of BPAS و بقیه زیر «Show Full Outline» پنهان است) و پاراگراف اول بخش I، که بعد از آن پیام «Sign in to Continue Reading» آمده است.
- جست‌وجوی متن آزاد بی‌نتیجه بود. OpenAlex خروجی `is_oa: False, oa_status: closed, any_repository_has_fulltext: False` داد و Unpaywall هم `is_oa: False` با `oa_locations: []`. Semantic Scholar API درخواست را رد کرد (Forbidden). مخازن TU Delft و UKnowledge پشت Cloudflare بودند. جست‌وجوی Bing و Google Scholar نتیجه‌ی قابل استفاده‌ای نداشت. ResearchGate هم چیزی برنگرداند.
- **پیشنهاد:** اگر دسترسی دانشگاهی به IEEE Xplore دارید، PDF را بگیرید تا بخش‌های III تا VI (مدل تهدید، طراحی و ارزیابی روی Hyperledger Fabric) استخراج شوند.

**بررسی متادیتای bib** (مقایسه با صفحه‌ی IEEE و OpenAlex):

| فیلد | مقدار bib | وضعیت |
|---|---|---|
| author | Feng, Qi; He, Debiao; Zeadally, Sherali; Liang, Kaitai | ✔ درست |
| title | BPAS: Blockchain-Assisted Privacy-Preserving Authentication System for Vehicular Ad Hoc Networks | ✔ درست |
| date | 2020-06 | ✔ درست (Issue 6, June 2020). انتشار آنلاین: 17 October 2019 |
| journaltitle | IEEE Transactions on Industrial Informatics | ✔ |
| volume / number | 16 / 6 | ✔ |
| pages | 4146--4155 | ✔ |
| doi | 10.1109/TII.2019.2948053 | ✔ |
| issn | 1941-0050 | ✔ (ISSN الکترونیکی) |
| file | `/home/sam/snap/zotero-snap/common/Zotero/storage/...` | ⚠ مسیر با مسیر واقعی فایل (`/home/sam/Zotero/storage/...`) فرق دارد. روی کامپایل اثری ندارد |
| publisher | — | فیلد اختیاری و موجود نیست (IEEE). برای سبک IEEE لازم نیست |

خطای جدی در متادیتا دیده نشد.

## ۲. خلاصه ساختاریافته (فقط بر پایه‌ی چکیده)

- **مسئله:** VANETها خدمات بلادرنگی مانند «intelligent routing, weather monitoring, emergency call» ارائه می‌دهند. اما «the accuracy and credibility of the transmitted messages among the VANETs are of paramount importance as life may depend on it» (چکیده). پس احراز هویت پیام/خودرو باید همراه با حفظ حریم خصوصی انجام شود.
- **روش/معماری:** چارچوبی به نام BPAS که «provides authentication automatically in VANETs and preserves vehicle privacy at the same time» (چکیده). کلیدواژه‌ها به نقش blockchain و smart contract و public key اشاره دارند (bib `keywords`)، ولی چگونگی استفاده از قرارداد هوشمند **نامعلوم** است (متن کامل در دسترس نیست).
- **ویژگی‌های اعلام‌شده** (چکیده):
  1. «highly efficient and scalable»؛
  2. «does not require any online registration centre (except for system initialization and vehicle registration)»؛
  3. «allows conditional tracing and dynamic revocation of misbehaving vehicles».
- **ارزیابی:** «an in-depth security analysis and a comprehensive performance evaluation (which is based on the Hyperledger Fabric platform)» (چکیده). پیکربندی آزمایش، معیارها و اعداد **در دسترس نیست**.
- **نتیجه:** «our framework is an efficient solution for the development of a decentralized authentication system in VANETs» (چکیده). این ادعای خود نویسندگان است و هیچ عددی در چکیده نیامده.
- **محدودیت‌ها:** در چکیده بیان نشده‌اند. از عبارت چکیده می‌شود نتیجه گرفت که سیستم هنوز در مرحله‌ی راه‌اندازی و ثبت خودرو به یک registration centre (یعنی نهادی متمرکز و مورد اعتماد) نیاز دارد. این **استنتاج** است، نه ادعای مقاله.

## ۳. استخراج محتوا برای بسط متن

### ۳.۱ بخش «مقدمه» (report.tex خط 169) — انگیزه‌ی استفاده از بلاکچین
- اهمیت صحت پیام: «the accuracy and credibility of the transmitted messages among the VANETs are of paramount importance as life may depend on it» (چکیده). از این جمله می‌توان برای توجیه نیاز به احراز هویت استفاده کرد.
- بلاکچین در BPAS ابزاری برای «a decentralized authentication system in VANETs» است (چکیده، جمله‌ی آخر). پس پشتیبانی این مقاله از جمله‌ی «بلاکچین برای اعتماد و امنیت» به حوزه‌ی **احراز هویت غیرمتمرکز همراه با حفظ حریم خصوصی** محدود است.

### ۳.۲ بخش «مفهوم VANET / معماری» (اگر در گزارش هست) — از پاراگراف اول مقدمه
همه‌ی موارد زیر از Sec. I، پاراگراف 1 آمده‌اند:
- تعریف: «VANETs are formed when the principle of mobile ad hoc networks (MANETs) is applied to the domain of vehicles.»
- کاربرد: اطلاعات بلادرنگ «(such as traffic information, weather condition, and road status)» به خودروها یا مراکز کنترل ترافیک کمک می‌کند «take timely actions (e.g., collision avoidance, intelligent routing, or traffic lighting)».
- اجزا و حالت‌های ارتباطی: خودروهای مجهز به «on-board units (OBUs)» از راه «vehicle-to-vehicle (V2V)» با هم و از راه «vehicle-to-infrastructure (V2I)» با «road side unit (RSU)» ارتباط می‌گیرند. Fig. 1 همین حالت‌های ارتباطی را در VANET سنتی نشان می‌دهد (فقط کپشن یا اشاره دیده شد، خود شکل را ندیدیم).
- پروتکل: هر دو حالت از «dedicated short-range communication (DSRC)» پیروی می‌کنند که تبادل داده در برد کوتاه را حتی در سرعت بالا ممکن می‌کند. ⚠ متن مقاله این برد را «generally within a few meters» نوشته است. این عبارت از نظر فنی دقیق نیست، چون برد DSRC معمولاً صدها متر است. **این عدد را از این منبع نقل نکنید.**

### ۳.۳ بخش «مزایای بلاکچین» (خط 405)
- چکیده هیچ‌یک از پنج ویژگی فهرست‌شده را (غیرمتمرکزسازی، تغییرناپذیری، ردیابی، شفافیت، قرارداد هوشمند) به‌صورت یک ویژگی عمومی بلاکچین بیان **نمی‌کند**.
- تنها پشتوانه‌های موجود: واژه‌ی «decentralized» (چکیده) و کلیدواژه‌ی «smart contract» (bib keywords). بقیه‌ی موارد را باید به منابع دیگر (Raza 2024 و SBTMS) ارجاع داد، یا بعد از دسترسی به متن کامل (احتمالاً Sec. IV «Building Blocks») بررسی کرد.

### ۳.۴ بخش «پروتکل‌های امنیتی مبتنی بر بلاکچین → BPAS» (خطوط 726 تا 734): مهم‌ترین بخش برای بسط
نکاتی که می‌شود یک پاراگراف کامل با آن‌ها نوشت (همه از چکیده):
1. **هدف دوگانه:** BPAS احراز هویت را «automatically» انجام می‌دهد و هم‌زمان حریم خصوصی خودرو را حفظ می‌کند («preserves vehicle privacy at the same time»). پس عنوان دقیق‌تر آن «احراز هویت حافظ حریم خصوصی با کمک بلاکچین» است، نه فقط «تصدیق هویت مبتنی بر بلاکچین».
2. **کاهش وابستگی به نهاد متمرکز:** به «online registration centre» نیازی نیست، **مگر** در دو مرحله: «system initialization» و «vehicle registration». پس نقش مرکز ثبت به مراحل آفلاین/اولیه محدود می‌شود و احراز هویت در زمان کار به آن وابسته نیست.
3. **حریم خصوصی شرطی:** «conditional tracing» یعنی هویت واقعی خودرو در حالت عادی پنهان می‌ماند، اما خودروی «misbehaving» را می‌توان ردیابی کرد. اینکه چه نهادی ردیابی را انجام می‌دهد و با چه سازوکاری، **در دسترس نیست**.
4. **ابطال پویا:** «dynamic revocation of misbehaving vehicles». سازوکار ابطال (مثلاً از راه قرارداد هوشمند یا فهرست ابطال روی دفتر کل) **نامعلوم** است.
5. **کارایی و مقیاس‌پذیری:** نویسندگان طرح را «highly efficient and scalable» می‌دانند. این ادعا به **طراحی** BPAS برمی‌گردد، نه به Hyperledger Fabric.
6. **اعتبارسنجی:** «in-depth security analysis» به‌همراه «comprehensive performance evaluation» روی **Hyperledger Fabric**، که یک بلاکچین permissioned است (این توصیف دانش عمومی است و در چکیده نیامده). از چکیده نمی‌توان فهمید Fabric فقط بستر ارزیابی بوده یا بستر پیاده‌سازی نهایی هم هست. پیشنهاد عبارت: «ارزیابی عملکرد بر بستر Hyperledger Fabric».
7. **جایگاه در ادبیات:** IEEE Xplore در بخش «More Like This» دو کار مشابه را پیشنهاد می‌کند: BCPPA (IEEE T-ITS 2021) و یک طرح چنددامنه‌ای در IEEE IoT J. 2022. این فقط پیشنهاد سایت است و نشان نمی‌دهد که این دو کار به BPAS ارجاع داده‌اند. اگر بخواهید برای مقایسه از آن‌ها استفاده کنید، اول جداگانه بررسی‌شان کنید.
8. **تأثیر:** OpenAlex تعداد ارجاعات را 253 گزارش می‌کند (بازیابی‌شده در 2026-10-07). اگر خواستید این عدد را ذکر کنید، تاریخ بازیابی را هم بنویسید.

### ۳.۵ بخش‌هایی که این منبع می‌تواند تقویت کند
- **چالش‌های حریم خصوصی / شبه‌نام:** مفهوم «conditional privacy» (ناشناس‌ماندن همراه با قابلیت ردیابی شرطی) در کنار BAIV (خط 739 به بعد) بیان شود. هر دو طرح این ویژگی را دارند و می‌توان پاراگرافی تطبیقی نوشت. جزئیات BAIV از منبع خودش گرفته شود.
- **محدودیت‌های طرح‌های متمرکز (PKI/TA):** BPAS وابستگی آنلاین به مرکز ثبت را حذف می‌کند. این نکته نقطه‌ی گذار خوبی از «مشکلات مرجع متمرکز» به «راهکارهای بلاکچینی» است.

## ۴. بررسی ادعاهای فعلی

| خط report.tex | ادعا | حکم | شاهد | اصلاح پیشنهادی |
|---|---|---|---|---|
| 169 | بلاکچین به‌عنوان راهکاری غیرمتمرکز برای حل مشکلات اعتماد و امنیت در VANET مطرح شده است | جزئی | چکیده: «decentralized authentication system in VANETs» | مشکلی ندارد، ولی بهتر است دقیق‌تر شود: «…از جمله برای احراز هویت غیرمتمرکز و حافظ حریم خصوصی» |
| 405–413 | پنج مزیت بلاکچین (غیرمتمرکزسازی، تغییرناپذیری، ردیابی، شفافیت، قرارداد هوشمند) | غیرقابل‌تأیید (فقط «decentralized» و کلیدواژه‌ی smart contract دیده شد) | چکیده و bib keywords | ارجاع به BPAS را از این فهرست بردارید، یا فقط به «غیرمتمرکزسازی» و «قرارداد هوشمند» محدودش کنید، تا وقتی که متن کامل بررسی شود |
| 726 | عنوان: «سیستم تصدیق هویت مبتنی بر بلاکچین (BPAS)» | جزئی | عنوان مقاله: «Blockchain-Assisted Privacy-Preserving Authentication System» | «سیستم احراز هویت حافظ حریم خصوصی با کمک بلاکچین (BPAS)» |
| 728 | BPAS چارچوبی نوین برای تصدیق هویت غیرمتمرکز در VANET است | پشتیبانی‌شده | چکیده: «a novel framework…»؛ «…decentralized authentication system in VANETs» | جنبه‌ی حفظ حریم خصوصی هم اضافه شود |
| 730 | بدون نیاز به مرکز ثبت آنلاین؛ فقط در مرحله‌ی راه‌اندازی | جزئی (ناقص) | چکیده: «(except for system initialization and vehicle registration)» | «…به‌جز در مراحل راه‌اندازی سیستم و **ثبت‌نام خودرو**» |
| 731 | پیگیری شرطی: امکان شناسایی خودروهای مخرب | پشتیبانی‌شده | چکیده: «conditional tracing … of misbehaving vehicles» | «ردیابی شرطی خودروهای دارای رفتار نادرست» (misbehaving ≠ لزوماً مخرب). اصطلاح «ردیابی» بهتر از «پیگیری» است |
| 732 | لغو پویا: لغو دسترسی خودروهای متخلف | پشتیبانی‌شده | چکیده: «dynamic revocation of misbehaving vehicles» | «ابطال پویا» |
| 733 | پیاده‌سازی بر Hyperledger Fabric: عملکرد بالا و مقیاس‌پذیر | جزئی | چکیده: «performance evaluation (which is based on the Hyperledger Fabric platform)»؛ «This design is highly efficient and scalable» | «ارزیابی عملکرد بر بستر Hyperledger Fabric. به گفته‌ی نویسندگان، طرح کارا و مقیاس‌پذیر است». کارایی و مقیاس‌پذیری به طرح BPAS نسبت داده شود، نه به Fabric |

**جمع‌بندی حکم‌ها (۸ ادعا):** پشتیبانی‌شده ۳، جزئی ۴، غیرقابل‌تأیید ۱، پشتیبانی‌نشده ۰.

## ۵. اصطلاحات

| English | معادل فارسی پیشنهادی |
|---|---|
| Blockchain-Assisted | با کمک بلاکچین / بلاکچین‌یار |
| Privacy-Preserving Authentication | احراز هویت حافظ حریم خصوصی |
| online registration centre | مرکز ثبت برخط |
| system initialization | راه‌اندازی سیستم |
| vehicle registration | ثبت‌نام خودرو |
| conditional tracing | ردیابی شرطی |
| conditional privacy | حریم خصوصی شرطی |
| dynamic revocation | ابطال پویا |
| misbehaving vehicle | خودروی دارای رفتار نادرست / متخلف |
| security analysis | تحلیل امنیتی |
| performance evaluation | ارزیابی عملکرد |
| Hyperledger Fabric | Hyperledger Fabric (ترجمه نشود؛ «بلاکچین مجوزدار» توصیف مناسبی است) |
| smart contract | قرارداد هوشمند |
| on-board unit (OBU) | واحد درون‌خودرویی |
| road side unit (RSU) | واحد کنار جاده‌ای |
| V2V / V2I | ارتباط خودرو با خودرو / خودرو با زیرساخت |
| DSRC | ارتباطات اختصاصی برد کوتاه |

## ۶. شکل‌ها و جداول قابل استفاده

- **Fig. 1** (Sec. I): «a set of complicated communication modes in the traditional VANETs environment»، یعنی حالت‌های V2V/V2I با OBU و RSU. خود تصویر دیده نشد. برای بازترسیم، شکل‌های موجود گزارش (`vanet_arch-*.png`) احتمالاً کافی‌اند.
- شکل‌های معماری BPAS، جداول مقایسه‌ی ویژگی‌ها و نمودارهای ارزیابی Fabric احتمالاً در Sec. V به بعد هستند، ولی **شماره و محتوایشان در دسترس نیست**. بعد از تهیه‌ی متن کامل، این بخش را تکمیل کنید.
