# یادداشت استخراج محتوا — `rahmawatiagustinaSystematicLiteratureReview2025`

> راهنمای مکان‌یابی: `p.884xx` شماره صفحه مجله است (صفحه ۱ فایل PDF = p.88421). «§» یعنی بخش مقاله. نقل‌قول‌ها عین متن انگلیسی هستند. متن از PDF محلی با `pdftotext` استخراج شد و جدول‌های تصویری (۴، ۹، ۱۰ و ۱۱) با رندر صفحه بازخوانی شدند.

---

## ۱. مشخصات و دسترسی

- **ارجاع کامل:** E. Rahmawati Agustina, K. Ramli, A. Rahman Hakim, R. Harwahyu, "A Systematic Literature Review on Privacy Preservation in VANETs: Trends, Challenges, and Future Directions," *IEEE Access*, vol. 13, pp. 88421–88444, 2025, doi: 10.1109/ACCESS.2025.3570491.
- **تاریخ‌ها (p.88421):** "Received 21 April 2025, accepted 10 May 2025, date of publication 15 May 2025, date of current version 27 May 2025."
- **وابستگی سازمانی:** Universitas Indonesia و Politeknik Siber dan Sandi Negara.
- **دسترسی:** متن کامل از طریق PDF محلی (`/home/sam/Zotero/storage/EPACVW8V/`) در دسترس است. مقاله Open Access است با مجوز CC BY-NC-ND 4.0 (p.88421).
- **بررسی bib (`report.bib`، خط ۲۲۸):** عنوان، نویسندگان، volume 13، صفحات 88421–88444، DOI و ISSN با PDF مطابقت دارند ✔. فیلد `file` به مسیر `~/snap/zotero-snap/...` اشاره می‌کند که با مسیر فعلی فرق دارد. این مسیر روی کامپایل تأثیری ندارد.
- **روش‌شناسی:** این مقاله از روش **Kitchenham** پیروی می‌کند، **نه PRISMA**. پس در متن گزارش نباید آن را «مرور PRISMA» نامید. نقل از §II, p.88423: "we adopted Kitchenham's guidelines [11]". همین روش در abstract هم ذکر شده است: "via the Kitchenham method".
- **افشای استفاده از AI در خود مقاله (p.88440):** "AI-based generative techniques were used for editing the text."

---

## ۲. خلاصه ساختاریافته

### روش (§II, pp.88423–88425)
- **پرسش‌های پژوهش (RQ):**
  - RQ1: روندهای مدل سیستم VANET
  - RQ2: روند پیاده‌سازی چرخه حیات شبه‌نام
  - RQ3: انواع تحلیل حریم خصوصی
  - RQ4: چالش‌ها و جهت‌های آینده
- **پایگاه‌ها:** Scopus، IEEE Xplore و ScienceDirect. کلیدواژه‌ها: ‘‘privacy-preserving’’ AND ‘‘VANET’’. رشته‌های جست‌وجو در Table 2 آمده‌اند (Table 2 تصویری است و بازخوانی نشد).
- **معیار ورود:** مقاله‌های داوری‌شده ژورنالی "published within the last six years". بازه نمودار Figure 4 سال‌های 2019 تا 2024 است.
- **معیار خروج:** مقاله‌های کنفرانسی، فصل کتاب، گزارش فنی و مانند آن، و مقاله‌هایی که متن کاملشان در دسترس نبود (p.88424).
- **ارزیابی کیفیت:** یک پرسش دودویی (AQ1) درباره اینکه آیا مقاله شبه‌نام را به‌روشنی تعریف کرده و فرایند تولید آن را شرح داده است. پاسخ «بله» امتیاز 1 و پاسخ «خیر» امتیاز 0 داشت و مقاله‌های با امتیاز 0 کنار گذاشته شدند (pp.88424–88425).
- **قیف انتخاب (p.88425):** 594 مقاله اولیه → حذف 64 مورد تکراری → "517 unique papers" → اعمال معیارهای ورود و خروج: 166 → ارزیابی کیفیت: **113 مطالعه اولیه (PR)**.
  - ⚠ **ناسازگاری حسابی در منبع:** 594 − 64 = 530، نه 517. اگر در گزارش به این قیف ارجاع می‌دهید، فقط اعداد 594 و 113 را نقل کنید یا به این ناسازگاری اشاره کنید.

### طبقه‌بندی (Taxonomy)
1. **مدل‌های سیستم VANET (Table 4, p.88427):**

   | مدل | تعداد از 113 | درصد |
   |---|---|---|
   | Standard | 80 | ≈71% |
   | Blockchain-based | 15 | 13% |
   | Cloud-based | 6 | 5.3% |
   | Fog-based | 5 | 4.4% |
   | Hybrid | 5 | — |
   | Miscellaneous (IoT 1، SDVN 1) | 2 | — |

2. **مراحل چرخه حیات (Table 9):** issuance، usage، changing، resolution، revocation.
3. **تحلیل حریم خصوصی:** formal و informal (Table 12 و Table 13).

### یافته‌های کمّی

| یافته | عدد | محل در منبع |
|---|---|---|
| مدل استاندارد | "approximately 71% (80 of 113)" | §III-A-1, p.88426 |
| چرخه حیات کامل (هر پنج مرحله) | **14 مقاله از 113 = 12%** | Table 9 p.88435؛ §IV p.88437؛ Abstract؛ §V |
| Usage | 113/113: "All the reviewed studies used pseudonyms" | p.88436 |
| Changing | "In 21% of the research papers" (24/113) | p.88436 |
| Resolution | "A total of 83% … addressed resolution" (94/113) | p.88436 |
| Revocation | 43% (49/113). متن منبع به اشتباه می‌گوید "addressed resolution" | p.88437 |
| تولیدکننده شبه‌نام | Vehicle/OBU 37% (42/113)، TA 27% (30/113)، ترکیب دو نهاد 23% | p.88434؛ Table 10 |
| روش تولید شبه‌نام | "approximately 73%, implement hash functions" | pp.88434–88435 |
| ورودی تولید شبه‌نام | "nearly 90% … original vehicle's ID as a key input" | p.88436 |
| تحلیل حریم خصوصی | 73% هر دو نوع؛ 7% فقط formal؛ 16% فقط informal؛ 2 مطالعه هیچ تحلیلی نداشتند | p.88437؛ Abstract |
| ابزار تحلیل حریم خصوصی رسمی | ProVerif فقط در PR03 و PR16 | p.88437 |

- اعداد Table 9 را بازشماری کردم. جمع ردیف‌ها 14+7+35+3+38+16 = 113 است. Changing برابر 14+7+3 = 24 و Resolution برابر 14+7+35+38 = 94 است. Revocation برابر 14+35 = 49 است که با 43% می‌خواند. پس عبارت "resolution" در §III-B-5 خطای نگارشی است و منظور revocation بوده است.
- ⚠ **ناسازگاری داخلی مهم درباره عدد ۱۲٪:** مقدمه (p.88422) می‌گوید "all five steps were implemented in only **14%** of existing studies". اما Abstract، §IV (p.88437)، §V و Table 9 همگی **12%** را تأیید می‌کنند (14/113 = 12.4%). به احتمال زیاد عدد «14» در مقدمه همان تعداد مقاله‌ها بوده که به اشتباه به‌جای درصد نوشته شده است. **عدد درست برای گزارش 12% است.**

### محدودیت‌ها (برداشت تحلیلی من، نه ادعای نویسندگان)
- فقط مقاله‌های ژورنالی وارد شده‌اند و مقاله‌های کنفرانسی عمداً حذف شده‌اند.
- فقط سه پایگاه داده جست‌وجو شده و کلیدواژه‌ها محدود بوده‌اند.
- ارزیابی کیفیت تنها با یک پرسش دودویی انجام شده است.
- دو ناسازگاری عددی در خود منبع وجود دارد: 14% در برابر 12%، و قیف 594 → 517.
- نویسندگان بخش جداگانه‌ای با عنوان «محدودیت‌ها» ندارند.

---

## ۳. استخراج محتوا برای بسط متن

### ۳.۱ مرجع قابل اعتماد (TA) — گزارش خط ۲۰۰
- **تعریف (§III-A, p.88426):** "The TA is a central authority responsible for the management and security of communications within VANETs. It ensures that only authorized entities participate in the network by issuing security credentials such digital certificates and pseudonyms to vehicles."
- **سه نهاد مدل پایه (p.88426):** "three entities: the vehicle/on-board unit (OBU), the roadside unit (RSU) and the trusted authority (TA)". این سه نهاد در Figure 5 نمایش داده شده‌اند.
  - تعریف OBU و RSU هم در همین صفحه آمده است. برای مثال، RSU این‌گونه تعریف شده: "fixed infrastructure units installed at key locations such as intersections or along highways to facilitate V2I communication".
- **مزیت TA (p.88426):** چارچوب امنیتی متمرکز، که در آن "the TA serves as the guarantor of privacy and credential management". TA از پلیس در ردیابی خودروهای مخرب پشتیبانی می‌کند.
- **ضعف‌های TA (p.88426):**
  - نقطه شکست واحد (SPoF): "the unavailability of the TA affects all entities".
  - چون TA هویت همه نهادها را می‌داند، "it becomes a prime target for privacy breaches". به همین دلیل "A compromised TA could therefore result in widespread privacy violations".
- **راه‌حل‌ها (pp.88426–88427):**
  - تقسیم TA به **TRA** (trace authority) و **KGC** (key generation center). این راه‌حل در PR30، PR53، PR37، PR67 و PR93 آمده و در Figure 6 نمایش داده شده است.
  - KGC مسئول "generation of cryptographic keys and security parameters" است. TRA مسئول "generating pseudoidentities and tracking rogue vehicles" است.
  - نهادهای مستقل دیگر: CtA، RTA، RTMC، CA و RoTA.
  - نهادهای کمکی: SP، AS، CV، LI و TMC (Figure 7).
  - تقویت OBU با biometrics، TPD و PUF.
- **نقش TRA در چرخه حیات (p.88428):** TRA در هر دو مرحله issuance و resolution نقش دارد و این‌طور توازن برقرار می‌کند: "balance between privacy protection and accountability".
- **چالش IV-A (pp.88437–88438):** SPoF در مدل استاندارد را می‌توان این‌گونه برطرف کرد: "distributing the critical functions of the TA to other trusted entities" یا به کمک blockchain و fog/edge.

### ۳.۲ شبه‌نام — گزارش خط ۵۷۳
- **تعریف (§I, p.88422):** "pseudonyms, which serve as temporary identifiers that hide the true identities of vehicles and allow their participation in VANETs."
- **تعریف تکمیلی (§III-B, p.88434):** "temporary identifiers that allow vehicles to communicate anonymously while ensuring secure and authenticated interactions."
- **گمنامی (p.88422، به نقل از Pfitzmann & Hansen [2]):** "anonymity, which refers to the inability to be uniquely identified within a group".
- ⚠ صفت «غیرقابل پیوند» (unlinkable) **در تعریف منبع نیامده است**. منبع از «موقت» و «پنهان‌کننده هویت واقعی» حرف می‌زند. unlinkability فقط به‌عنوان ویژگی‌ای که با ProVerif تحلیل می‌شود (p.88437) و هدف مرحله changing ذکر شده است.
- **انگیزه (p.88421):** "The continuous sharing of data throughout the network allows attackers to profile vehicles, thereby jeopardizing the privacy of their owners."
- **پیش‌بینی‌پذیری (§IV-D, pp.88438–88440):**
  - مشکل: ورودی ثابت (هویت واقعی + timestamp + عدد تصادفی) پیوند دادن شبه‌نام‌ها را آسان می‌کند، "especially if the pseudonym change interval is predictable".
  - پیشنهاد: افزودن ورودی‌های پویا، مانند "road conditions, vehicle routes, and geographical locations".
  - هشدار: "balancing unpredictability with traceability".

### ۳.۳ چرخه حیات شبه‌نام — گزارش خطوط ۵۷۷–۵۸۷
- **پنج مرحله (p.88422، Figure 1):** "issuance, usage, changing, resolution, and revocation". توضیح کوتاه هر مرحله در همان صفحه:
  - Issuance: "Vehicles are assigned cryptographically secure pseudonyms through issuance"
  - Usage: "anonymous but verified communication is enabled through usage"
  - Changing: "Changing strategies change pseudonyms on a regular basis to avoid tracking"
  - Resolution: "Resolution enables authorized entities to identify a pseudonym's true identity in security incident scenarios"
  - Revocation: "revocation reduces risks and unwanted access by blocking compromised vehicles from connecting to the network"
- **Issuance (pp.88434–88436):**
  - تولید شبه‌نام یا توسط یک نهاد انجام می‌شود یا با همکاری چند نهاد.
  - در حالت همکاری، رایج‌ترین ترکیب‌ها vehicle+TA (46%) و vehicle+TRA (35%) هستند.
  - هش رایج‌ترین روش است (≈73%) به دلیل "low computational overhead". روش‌های دیگر encryption و digital signature هستند.
  - برخی طرح‌ها از validity timestamp استفاده می‌کنند تا تغییر شبه‌نام روان‌تر انجام شود.
- **Usage (p.88436):** شبه‌نام در ارتباط V2V و V2I به کار می‌رود، برای "sharing traffic information, transmitting safety warnings, and engaging in cooperative driving tasks".
- **Changing (p.88436):**
  - هدف این مرحله "prevent long-term tracking" است.
  - ETSI TR 103 415 شش راهبرد را برشمرده است: "fixed parameter, randomness, silent period, vehicle-centric, density-based, and mix zone".
  - توزیع راهبردها در 24 مقاله (Table 11):

    | راهبرد | تعداد از 24 |
    |---|---|
    | vehicle-centric | 8 |
    | fixed parameter | 7 |
    | randomness | 1 |
    | vehicle-centric + randomness | 2 |
    | vehicle-centric + fixed | 1 |
    | others | 5 |

  - در Table 11 هیچ مقاله‌ای ذیل silent period، density-based یا mix zone فهرست نشده است. اینکه آیا این موارد ذیل «others» قرار گرفته‌اند، **مشخص نیست**.
  - مقدمه هشدار می‌دهد که راهبرد fixed-time که چگالی ترافیک را نادیده می‌گیرد به linkability attack می‌انجامد (p.88422).
- **Resolution (p.88436):**
  - این مرحله را "authorized entities, such as law enforcement agencies" انجام می‌دهند، "which utilize cryptographic information securely maintained by the TA or TRA".
  - TA یا TRA در نقش "mediator" عمل می‌کند تا اطلاعات فقط به نهادهای مجاز افشا شود.
- **Revocation (pp.88436–88437):** "authorized entities, such as the TA, which issues a revocation notice on the basis of validated evidence of the vehicle's misconduct".
- **پیامد ناقص بودن چرخه (p.88422 و §IV-B, p.88438):**
  - بیشتر طرح‌ها "focused solely on issuance and usage".
  - نبود resolution باعث "privacy authority problem" می‌شود.
  - نبود revocation خطر Sybil attack و دسترسی غیرمجاز را بالا می‌برد.
  - نقل از p.88422: "Without complete implementation, vehicles are vulnerable to linkability attacks, Sybil attacks, and illegal access".
- **فناوری‌ها در برابر مرحله changing (Figures 8 تا 10):**
  - blockchain، cloud و fog در چهار مرحله دیگر نقش دارند، اما **در مرحله changing نقشی ندارند**.
  - دلیل برای blockchain (p.88430): "immutability, high latency, linkability risks, and limitations in off-chain mechanisms".
  - دلیل برای cloud (p.88432): latency، اتصال ناپایدار و ریسک تمرکز.
  - در fog، تغییر شبه‌نام را خود خودرو انجام می‌دهد (PR43).

### ۳.۴ طبقه‌بندی طرح‌های حریم خصوصی
- **Blockchain (pp.88428–88430):**
  - 14 نقش کلیدی (KR1 تا KR14) برشمرده شده است، از جمله Decentralization، Immutability، Trust management، Conditional privacy and traceability (KR5)، Batch pseudonym revocation (KR10) و Revocation transparency (KR12).
  - چالش‌ها: "computational overhead during the consensus process, which may not be suitable for resource-constrained devices such as OBUs" و latency ناشی از اجماع.
- **Cloud (pp.88430–88432):**
  - 14 کارکرد (KF1 تا KF14).
  - مزیت‌ها: پردازش متمرکز و مقیاس‌پذیری ذخیره‌سازی.
  - چالش‌ها: latency بالا، SPoF و نگرانی‌های حریم خصوصی.
- **Fog (pp.88432–88433):**
  - 10 وظیفه (PT1 تا PT10). نمونه‌ها:
    - PT5 "Reducing dependency on TAs"
    - PT10: برای لغو، TA "release only two hash seeds to invalidate all unexpired pseudonyms of a problematic vehicle"
  - چالش‌ها: سازگاری و همگام‌سازی داده بین fog nodeها.
- **Hybrid (p.88433):** "leverages the scalability of cloud computing, the low latency of fog computing, and the decentralized trust of the blockchain". چالش این مدل پیچیدگی، هزینه و interoperability است.
- **SDVN و IoT (pp.88433–88434):** controller attacks و ناهمگونی دستگاه‌ها.

### ۳.۵ حریم خصوصی مشروط (Conditional privacy)
- منبع تعریف رسمی جداگانه‌ای برای این اصطلاح ندارد. نزدیک‌ترین توصیف‌ها:
  - KR5 (p.88429): "vehicles are verified without revealing their true identities to unauthorized entities, thus allowing authorities to track and identify harmful cars as needed. This balance protects privacy while ensuring accountability"
  - PT9 (p.88433): "Fog nodes help maintain the anonymity of vehicles by allowing them to communicate without revealing their real identities"
- در بخش resolution (p.88436) هم "This careful balance between privacy and accountability is paramount" آمده است. این همان مضمون حریم خصوصی مشروط است. اتصال این دو مفهوم برداشت من است، نه واژه منبع.

### ۳.۶ جهت‌های آینده (§IV, pp.88437–88440؛ §V) — گزارش خط ۷۷۹
- **IV-A، معماری ترکیبی:** "Future studies should investigate hybrid system architectures that integrate traditional models with contemporary technologies, including blockchain and cloud-based solutions." در جمله قبل، "blockchain and fog/edge computing" برای توزیع وظایف TA آمده است.
- **IV-B، چرخه کامل:** "Researchers should prioritize the development of a complete pseudonym life cycle while ensuring that performance is not compromised and that communication latency is minimized."
- **IV-C، کوانتوم:** "future studies may consider anticipating the threat of quantum computing … the current use of hash functions may not be suitable for long-term use." این مطلب **فقط در بافت روش تولید شبه‌نام** آمده و فقط یک جمله است.
- **IV-D:** پیش‌بینی‌پذیری شبه‌نام (بند ۳.۲).
- **IV-E:** تنوع راهبردهای changing و نبود یک راه‌حل عمومی. پیشنهاد منبع: "adapted or adaptable methods".
- **IV-F، تحلیل رسمی حریم خصوصی:**
  - "Current privacy analyses … predominantly rely on informal evaluation methods"
  - "Few studies have conducted formal analyses using tools designed to analyze privacy"
  - "researchers should also focus on implementing formal analysis for privacy-preserving schemes"
  - ⚠ در IV-F عبارت "predominantly rely on informal" آمده، در حالی که §III-C می‌گوید 73% مقاله‌ها هر دو نوع تحلیل را انجام داده‌اند. این دو گزاره در خود منبع کمی ناهمخوان‌اند. احتمالاً منظور نویسندگان این است که تحلیل‌های formal بیشتر روی امنیت تمرکز دارند تا حریم خصوصی.
  - ابزارهایی مانند ROM، ECDLP، ECDH، BAN logic، AVISPA و SPAN برای تحلیل formal حریم خصوصی طراحی نشده‌اند (p.88437).

---

## ۴. بررسی ادعاهای فعلی

| خط | ادعا | داوری | محل در منبع | اصلاح پیشنهادی |
|---|---|---|---|---|
| 200 | TA «مرجع مرکزی مسئول مدیریت امنیت و صدور اعتبارنامه‌ها» | پشتیبانی‌شده | §III-A, p.88426 | بهتر است دقیق‌تر شود: «…مسئول مدیریت و امنیت ارتباطات و صدور اعتبارنامه‌هایی مانند گواهی دیجیتال و شبه‌نام». جمله‌ای درباره SPoF و هدف حمله بودن TA هم اضافه شود (p.88426). |
| 573 | شبه‌نام «شناسه موقت و **غیرقابل پیوند**» به‌جای هویت واقعی | جزئی | §I, p.88422؛ §III-B, p.88434 | منبع فقط «temporary identifiers that hide the true identities» می‌گوید. «غیرقابل پیوند» را حذف کنید، یا آن را هدف مرحله تغییر شبه‌نام بنامید، یا به `luPseudonymChangingSocial2012` نسبت دهید (آن منبع بررسی نشد). |
| 573 | شبه‌نام امکان مشارکت بدون افشای هویت را می‌دهد | پشتیبانی‌شده | p.88422 ("allow their participation in VANETs") | — |
| 577–585 | پنج مرحله: صدور، استفاده، تغییر، حل، لغو | پشتیبانی‌شده | p.88422، Figure 1 | ترتیب و نام‌ها درست‌اند. «حل» را می‌توان «تفکیک/بازگشایی هویت» (resolution) هم نامید. |
| 580 | صدور = «نام‌های مستعار رمزنگاری‌شده ایمن» | پشتیبانی‌شده | p.88422 ("cryptographically secure pseudonyms") | بهتر است «اختصاص شبه‌نام‌های امن از نظر رمزنگاری» نوشته شود. |
| 581 | استفاده در V2V و V2I | پشتیبانی‌شده | p.88436 | — |
| 582 | تغییر دوره‌ای برای جلوگیری از ردیابی | پشتیبانی‌شده | p.88422؛ p.88436 | — |
| 583 | حل = شناسایی هویت واقعی توسط مراجع قانونی | پشتیبانی‌شده | p.88422؛ p.88436 ("law enforcement agencies … TA or TRA") | می‌توان افزود که این کار با اطلاعات نگه‌داری‌شده نزد TA یا TRA انجام می‌شود. |
| 584 | لغو = مسدود کردن خودروهای مخرب | پشتیبانی‌شده | p.88422 ("blocking compromised vehicles") | — |
| 587 | «فقط ۱۲ درصد از طرح‌ها تمام مراحل… را پیاده‌سازی کرده‌اند» | پشتیبانی‌شده (با یک قید) | Abstract؛ Table 9 (14/113)؛ §IV p.88437؛ §V | «از ۱۱۳ مطالعه اولیه بررسی‌شده (۲۰۱۹–۲۰۲۴)، تنها ۱۴ مطالعه (حدود ۱۲٪)…». ⚠ مقدمه منبع به اشتباه 14% گفته است. «طرح‌ها» را به «مطالعات بررسی‌شده در این مرور» محدود کنید. |
| 688 | شبه‌نام «یکی از مهمترین چالش‌ها» در حریم خصوصی VANET | جزئی | p.88421 (حریم خصوصی داده "one of the most important challenges")؛ p.88422 (شبه‌نام "one way" برای گمنامی) | منبع شبه‌نام را راهکار می‌داند، نه چالش. پیشنهاد: «مدیریت شبه‌نام و پیاده‌سازی کامل چرخه حیات آن یکی از چالش‌های اصلی است» (§IV-B). |
| 779 | آینده: چرخه کامل شبه‌نام | پشتیبانی‌شده | §IV-B, p.88438 | — |
| 779 | آینده: معماری ترکیبی «بلاکچین + ابر + لبه» | جزئی | §IV-A, pp.88437–88438؛ §III-A-5 | منبع "blockchain and cloud-based solutions" را برای hybrid آورده است و fog/edge را برای توزیع وظایف TA. مدل hybrid در منبع «cloud + fog + blockchain» است. پیشنهاد: «ابر + مه/لبه + بلاکچین». |
| 779 | آینده: «آمادگی رمزنگاری کوانتومی» | جزئی | §IV-C, p.88438 | منبع فقط یک جمله دارد، آن هم درباره انتخاب روش تولید شبه‌نام و ناکافی بودن احتمالی هش در بلندمدت. پیشنهاد: «در نظر گرفتن تهدید رایانش کوانتومی در روش‌های تولید شبه‌نام». |
| 779 | آینده: «تحلیل رسمی حریم خصوصی» | پشتیبانی‌شده | §IV-F, p.88440 | می‌توان به ProVerif اشاره کرد و نوشت که فقط ۲ مطالعه از آن استفاده کرده‌اند (p.88437). |
| 605 (بدون ارجاع به این منبع) | نقطه شکست واحد در سیستم‌های متمرکز | این منبع آن را پشتیبانی می‌کند | p.88426؛ §IV-A | در صورت نیاز می‌توان این منبع را برای این خط هم cite کرد. |

---

## ۵. اصطلاحات

| English | فارسی |
|---|---|
| Trusted Authority (TA) | مرجع قابل اعتماد |
| Trace Authority (TRA) | مرجع ردیابی |
| Key Generation Center (KGC) | مرکز تولید کلید |
| Pseudonym / Pseudo-identity | شبه‌نام / شبه‌هویت |
| Pseudonym life cycle | چرخه حیات شبه‌نام |
| Issuance / Usage / Changing / Resolution / Revocation | صدور / استفاده / تغییر / تفکیک (بازگشایی) هویت / لغو |
| Anonymity | گمنامی |
| Unlinkability / Linkability attack | پیوندناپذیری / حمله پیوند |
| Conditional privacy and traceability | حریم خصوصی مشروط و ردیابی‌پذیری |
| Accountability | پاسخ‌گویی |
| Single point of failure (SPoF) | نقطه شکست واحد |
| Mix zone / Silent period | ناحیه آمیزش / دوره سکوت |
| Vehicle-centric / Density-based / Fixed parameter | خودرومحور / مبتنی بر چگالی / پارامتر ثابت |
| Tamper-proof device (TPD) | دستگاه مقاوم در برابر دست‌کاری |
| Physical unclonable function (PUF) | تابع غیرقابل همسان‌سازی فیزیکی |
| Formal / Informal analysis | تحلیل رسمی / غیررسمی |
| Random oracle model (ROM) | مدل اوراکل تصادفی |
| Primary research (PR) | مطالعه اولیه |
| Fog node | گره مه |

---

## ۶. شکل‌ها و جداول قابل استفاده

- **Figure 1 (p.88422): چرخه حیات شبه‌نام با پنج مرحله.** گزینه اول برای بخش چرخه حیات در گزارش. می‌توان آن را با ذکر منبع بازترسیم کرد. مجوز CC BY-NC-ND تغییر تصویر اصلی را محدود می‌کند، پس بازترسیم با ارجاع امن‌تر است.
- **Figure 5 و Figure 6 (pp.88426–88427):** مدل استاندارد VANET (OBU/RSU/TA) و مدل تقسیم TA به TRA و KGC. مناسب برای بخش «ارکان اصلی».
- **Figure 3:** فرایند مرور بر اساس Kitchenham.
- **Figure 8 تا Figure 10:** نگاشت نقش‌های blockchain، cloud و fog به مراحل چرخه حیات. نکته کلیدی این شکل‌ها: هیچ‌کدام در مرحله changing نقشی ندارند.
- **Table 9 (p.88435):** پوشش مراحل چرخه حیات. می‌توان از آن جدولی خلاصه ساخت:

  | مرحله | پوشش |
  |---|---|
  | issuance و usage | 100% |
  | changing | 21% |
  | resolution | 83% |
  | revocation | 43% |
  | چرخه کامل | 12% |

- **Table 11:** راهبردهای تغییر شبه‌نام (ETSI TR 103 415).
- **Table 4:** توزیع مدل‌های سیستم (جدول آن در بخش ۲ آمده است).
