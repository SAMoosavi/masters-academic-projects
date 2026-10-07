# یادداشت استخراج منبع: `feraudoDIVADIDbasedReputation2024` (DIVA)

## ۱. مشخصات و دسترسی

- **ارجاع کامل:** A. Feraudo, N. Romandini, C. Mazzocca, R. Montanari, P. Bellavista, "DIVA: A DID-based reputation system for secure transmission in VANETs using IOTA," *Computer Networks*, vol. 244, Art. no. 110332, 2024. DOI: 10.1016/j.comnet.2024.110332
- **سطح دسترسی:** متن کامل (۱۲ صفحه)، PDF محلی `/home/sam/Zotero/storage/TMU6XJ2R/Feraudo et al. - 2024 - DIVA ....pdf`؛ با `pdftotext -layout` استخراج شد. مقاله Open Access با مجوز CC BY است (ص. ۱، پانویس).
- **تاریخچه:** "Received 19 September 2023; ... Accepted 12 March 2024; Available online 16 March 2024" (ص. ۱).
- **بررسی متادیتای bib** (`report.bib` خط ۵۴–۶۹):
  - نویسندگان، عنوان، مجله، volume=244، pages=110332، ISSN 1389-1286 و DOI همه **درست** هستند.
  - `date = 2024-05-01` تاریخ شماره‌ی مجله است. نسخه‌ی آنلاین تاریخ 16 March 2024 دارد. برای IEEE، year=2024 کافی است و **خطایی نیست**.
  - نکته: سربرگ PDF مقاله را "Review article" برچسب زده است (ص. ۱)، اما محتوا یک مقاله‌ی پژوهشی اصیل است (طرح، پیاده‌سازی و ارزیابی). نوع `@article` درست است. فقط نباید آن را در متن «مقاله‌ی مروری» نامید.
  - فیلد `file` به مسیر snap zotero (`/home/sam/snap/zotero-snap/...`) اشاره می‌کند. این برای build مهم نیست.

## ۲. خلاصه ساختاریافته

- **مسئله:** ارتباطات V2V سازوکار امنیتی کارا برای تضمین اعتمادپذیری منبع پیام ندارند. بیشتر طرح‌های شهرت (reputation) به درستیِ محتوای پیام‌های استاندارد ETSI توجه نمی‌کنند. همچنین امتیاز را روی خودرو محاسبه می‌کنند و این کار تأخیر ایجاد می‌کند. شبه‌نام‌های موقت و تغییر سریع توپولوژی هم تعریف امتیاز شهرت را دشوار می‌کند (ص. ۱–۲، §1).
- **روش و معماری:** هر خودرو یک DID دارد که Trusted Authority (TA) آن را روی دفتر کل ثبت می‌کند و برای آن VC صادر می‌کند. خودرو به هر پیام یک VP پیوست می‌کند. امتیاز شهرت روی IOTA Tangle نگهداری می‌شود که یک دفتر کل DAG و **permissioned** است و روی چند edge node (که با هسته‌ی 5G به هم وصل‌اند) توزیع شده است. محاسبه‌ی شهرت روی edge node انجام می‌شود، نه روی خودرو. الگوریتم پیام‌های DENM (ایمنی) را با داده‌ی RSU و با CAMهای (غیرایمنی) همان فرستنده مقایسه می‌کند و با رویدادهای مشابه هم می‌سنجد (§3، §4).
- **ارزیابی:** محیط OMNeT++ + Artery + SUMO + Simu5G با ۵ edge node. سناریوی تقاطع Ingolstadt Nord آلمان (منطقه‌ی مه‌آلود و توقف اضطراری). دیتاست CAM/DENM سازگار با ETSI ساخته و منتشر شد. داده‌ی مخرب با تزریق نویز نرمال به فیلدهای زمان و مکان ساخته شد. نسبت منابع مخرب ۲۰، ۳۰ و ۴۰ درصد بود. پیاده‌سازی با Python روی VM با 16 CPU و 32 GB RAM انجام شد (§5، §5.2).
- **نتایج کلیدی:**
  - با آستانه‌ی mode، TPR کل 99.93% و TNR کل 78.14% بود. با mean، TPR کل 99.80% و TNR 100% بود، اما TPR رویداد collisionRisk فقط 61.70% شد (Table 4، ۲۰٪ مخرب، α=β=0.5).
  - با mean و β>0.3، دقت «around 94% with 30% of malicious sources» و «89% with 40%» بود (§5.3.2، Fig. 4b,c). با β پایین حدود ۲۰٪ پیام‌ها اشتباه شناسایی شدند.
  - با mode، سیستم محافظه‌کارانه رفتار می‌کند. حدود ۴۰٪ کل پیام‌ها دور ریخته شدند و این عدد با بیشترین نسبت مخرب به حدود ۵۰٪ رسید (Fig. 5c).
  - تأخیر انتشار شهرت «a few microseconds» بود (§5.3.2، ص. ۹).
  - بازه‌ی پیشنهادی β برابر 0.4 تا 0.6 است (ص. ۹).
- **محدودیت‌ها** (برخی را نویسندگان گفته‌اند و برخی برداشت من است):
  - (نویسندگان) Coordinator در IOTA موقت است (§2.3.1).
  - (نویسندگان) جایی که RSU حسگر ندارد، فرض اکثریت خودروهای سالم لازم است (§3.1).
  - (نویسندگان) فرض شده که دو edge node هم‌زمان شهرت یک خودرو را به‌روز نمی‌کنند (§4.3.3).
  - (نویسندگان) τcam=600 s مخصوص همین سناریو است (§5.2.1).
  - (برداشت من، [غیرصریح در مقاله]) TA و RSU معتبر فرض شده‌اند، پس اعتماد هنوز تا حدی متمرکز است. ارزیابی فقط روی یک سناریو و فقط روی DENM انجام شده است. تأخیر فقط برای ارتباط یک‌به‌یک اندازه‌گیری شده است. ابطال یا ردیابی هویت واقعی هم بررسی نشده است.
  - **ناسازگاری درونی مقاله در عدد دقت:** مقدمه می‌گوید «approximately 90% across various scenarios» (ص. ۲)، اما نتیجه‌گیری می‌گوید «around 99% when specific thresholds are employed» (§8، ص. ۱۱).

## ۳. استخراج محتوا برای بسط متن

### ۳.۱ مقدمه / انگیزه (report.tex خط ۱۷۱)
- انواع پیام ETSI: «ETSI defines message structures for both periodically exchanged messages (non-safety messages) and messages exchanged in exceptional situations (safety messages)» (ص. ۱، §1).
- تهدیدها: مهاجم می‌تواند پیام جعلی یا گمراه‌کننده بسازد که به تصادف یا مسیریابی غلط خودروها منجر شود. شنود بسته هم نمونه‌ای از حمله‌ی غیرفعال است (ص. ۱، §1).
- نقد طرح‌های شهرت پیشین: (۱) به درستیِ محتوای پیام‌های استاندارد بی‌توجه‌اند. (۲) امتیاز را روی خودرو محاسبه می‌کنند و «non-negligible delays» ایجاد می‌کنند. (۳) شبه‌نام‌های موقت و تغییر توپولوژی تعریف امتیاز و گردآوری اطلاعات را دشوار می‌کنند. (۴) محاسبه و انتشار امتیاز زمان‌بر است (ص. ۲، §1).
- سه مشارکت مقاله: طرح شهرت مبتنی بر DID و سازگار با ETSI، نخستین دیتاست گسترده‌ی سازگار با ETSI، و پیاده‌سازی و ارزیابی در سناریوی 5G (ص. ۲).

### ۳.۲ پیش‌زمینه‌ی VANET و فناوری‌های ارتباطی
- خودروها OBU دارند و RSUها در کنار جاده دسترسی به سرویس را فراهم می‌کنند (§2.1، ص. ۲).
- قابلیت اطمینان تحویل پیام در IEEE 802.11bd (مبتنی بر 802.11ac و با LDPC و Midamble) در برابر 802.11p «about 88% vs 75%» است (§2.1، ص. ۲).
- استاندارد WAVE در آمریکا و ITS-G5 در اروپا. پیام BSM در WAVE هم‌ارز CAM در ITS-G5 است. پروتکل GeoNetworking مسیریابی جغرافیایی انجام می‌دهد (§2.1، ص. ۲–۳).
- C-V2X در 3GPP: Release 14 (LTE-V2X) فقط broadcast داشت. Release 16 (NR-V2X) unicast و groupcast را اضافه کرد. رابط PC5 برای V2V مستقیم و Uu برای ارتباط سلولی است (§2.1، ص. ۳).
- CAM شامل «status and attribute information, like vehicle position, speed, and activated systems» است و به‌صورت دوره‌ای ارسال می‌شود. DENM در موقعیت‌های استثنایی ارسال می‌شود و شامل منبع رویداد، توصیف وضعیت، زمان تشخیص و مکان رویداد است (§4.2، ص. ۵).
- CAM با Single-Hop Broadcasting منتشر می‌شود. DENM با GeoBroadcasting منتشر می‌شود، یعنی hop-by-hop تا ناحیه‌ی مقصد و سپس rebroadcast درون آن ناحیه (§4.2، ص. ۵).

### ۳.۳ DID و VC (بخش هویت خودمختار، خطوط ۶۲۰–۶۹۰)
- ساختار DID: «A DID consists of three parts: a Uniform Resource Identifier (URI), a specific DID method identifier, and a method-specific DID identifier» (§2.2، ص. ۳).
- DID Document یک سند JSON-LD است که کلید عمومی، service endpoint، پارامترهای احراز هویت، timestamp و metadata را در خود دارد. مالکیت با کلید خصوصی اثبات می‌شود. DID Document معمولاً در یک verifiable data registry روی DLT منتشر می‌شود (§2.2، ص. ۳).
- «DIDs eliminate the need for identity providers and centralized authorities» (§2.2، ص. ۳). **توجه:** خود DIVA همچنان از TA استفاده می‌کند (§3.1).
- نقش‌های VC: holder، issuer، verifier و verifiable data registry. در زمینه‌ی خودرویی issuer می‌تواند وزارت حمل‌ونقل یا DMV باشد و verifier مثلاً RSU است (§2.2، ص. ۳). این مثال‌های خودرویی برای بسط بخش «اعتبارنامه‌های تأییدپذیر» (خط ۶۴۸) مفیدند.
- اجزای VC: URI موضوع، URI صادرکننده، شناسه‌ی یکتای credential، شرایط انقضا و امضای رمزنگاری. VP روش امضا و ارائه‌ی VC توسط holder برای اثبات مالکیت است (§2.2، ص. ۳).
- **مطلبی که در این منبع نیست:** Anywise، Pairwise و N-wise DID در DIVA نیامده‌اند. این مفاهیم را باید از منبع دیگری (مثلاً mazzocca2025survey) آورد.

### ۳.۴ DLT و IOTA Tangle (بخش IOTA، خط ۵۴۲)
- DLT داده را روی چند گره تکثیر می‌کند و ساختار append-only دارد. چون شبکه‌ی P2P است، «a single point of failure» را حذف می‌کند (§2.3، ص. ۳).
- blockchain با DAG مقایسه شده است: blockchain بلوک‌ها را با hash pointer به هم زنجیر می‌کند، اما DAG گراف جهت‌دار بی‌دور است (§2.3، ص. ۳).
- دفتر کل permissionless یا permissioned است. DIVA از «a permissioned DAG-based ledger, wherein only a restricted set of nodes is authorized to both publish and read transactions» استفاده می‌کند (§2.3، ص. ۳). این نکته مهم است: Tangle در DIVA عمومی نیست.
- IOTA: «Transactions are validated by the nodes they are connected to, allowing for fast performance without the need for middlemen such as miners or validators» (§2.3.1، ص. ۳).
- تراکنش zero-value: «do not require validation by network participants since they do not involve any transfer of value ... without the risk of double spending» (§2.3.1، ص. ۳).
- client تراکنش را ارسال می‌کند و node آن را تأیید و به Tangle متصل می‌کند. Coordinator «milestone»های امضاشده تولید می‌کند و یک تراکنش وقتی تأییدشده است که مستقیم یا غیرمستقیم به یک milestone ارجاع داده شود. Coordinator موقت است. Permanode کل تاریخچه را نگه می‌دارد چون گره‌های محدود عمل pruning انجام می‌دهند (§2.3.1، ص. ۳).
- در DIVA، DLT برای نگهداری DID Document و شهرت خودروها به کار می‌رود (§2.3، ص. ۳).
- امتیاز نهایی «is stored in the Tangle through a zero-value transaction» (§4.3.3، ص. ۷).
- **Ed25519 در این مقاله نیامده است.** DIVA فقط می‌گوید تولید کلید «based on Elliptic Curve Cryptography (ECC)» است (§6.2، ص. ۱۰).

### ۳.۵ معماری DIVA (شکل DIVA.jpg، خط ۶۳۹–۶۴۴ و ۷۱۱–۷۲۰)
- **اجزا** (§3.1، ص. ۴، Fig. 1):
  - edge nodeها از طریق هسته‌ی 5G (UPF و I-UPF) به هم وصل‌اند و هر کدام DLT Node، DLT Client و Reputation System دارند. edge node «a small data center located at the network edge» است.
  - هر edge node یک جدول داخلی دارد با دو فیلد: `vehicle_did` از نوع String و `repScore` از نوع Double (Table 2، ص. ۳). این جدول باعث می‌شود edge node بدون پرس‌وجو از ledger به درخواست‌ها پاسخ دهد.
  - TA شامل Identity Provider است، مثلاً وزارت حمل‌ونقل ایتالیا یا مرکز معاینه‌ی مجاز. Identity Provider بررسی می‌کند که خودرو دستکاری فیزیکی نشده باشد و سپس VC صادر می‌کند.
  - RSUها معتبر فرض شده‌اند. برخی حسگر دارند و برخی فقط relay هستند. جایی که حسگر نیست، «the majority of vehicles are benign» فرض می‌شود.
- **فرض ارتباطی:** IEEE 802.11p برای V2V و V2I (§3.1).
- **گردش کار سه‌مرحله‌ای** (§4، Fig. 2): ثبت‌نام، ارتباط V2X و به‌روزرسانی شهرت.
  1. *ثبت‌نام* (§4.1، ص. ۵): TA (مثلاً DMV) بررسی می‌کند که خودرو قانونی، دزدیده‌نشده و دست‌نخورده باشد. خودرو خودش DID را تولید و به TA ارسال می‌کند، پس فقط holder کنترل DID را دارد. TA، DID و DID Document را روی ledger ثبت و VC صادر می‌کند. خودرو از VC یک VP می‌سازد و آن را به هر پیام پیوست می‌کند. «DIDs and VCs are completely anonymous, as they do not contain any sensitive information that can be traced back to the identity of the vehicle or its user».
  2. *ارتباط V2X* (§4.2): پیام‌ها CAM و DENM مطابق ETSI و روی 802.11p هستند.
  3. *به‌روزرسانی شهرت* (§4.3): edge node پیام‌ها را شنود می‌کند، VP را تأیید می‌کند، DENM را ارزیابی می‌کند و شهرت را به‌روز می‌کند.
- **دسترسی به شهرت:** خودرو برای دریافت شهرت‌ها باید VP خود را ارائه دهد (§4.3.3، ص. ۷). به گفته‌ی §1 (ص. ۲)، «A vehicle can obtain the reputation of other participants only if its reputation overcomes a given threshold».

### ۳.۶ الگوریتم محاسبه‌ی شهرت (گام‌به‌گام، §4.3.1–4.3.2، Alg. 1–3، ص. ۵–۷)
1. هر DID مقدار r_DID ∈ [0,1] دارد و ابتدا مقدار پیش‌فرض می‌گیرد (ص. ۶؛ §1).
2. پیش‌شرط تازگی و کیفیت: سن پیام باید با τ_eventType (وابسته به نوع رویداد) سازگار باشد و کیفیت اطلاعات از τ_sitQuality بیشتر باشد. فیلد information quality در DENM مقداری بین 0 تا 7 است. پیام‌های کهنه یا کم‌کیفیت کنار گذاشته می‌شوند (ص. ۶).
3. بررسی می‌شود که مکان رویداد در ناحیه‌ی همان edge node باشد (`messageInsideEdgeArea`).
4. اگر پیام با داده‌ی RSU ناسازگار باشد، مقدار rsuScore = ω_rsu × defScore کم می‌شود. اطلاعات RSUهای دارای حسگر «inherently accurate» فرض شده است (ص. ۵).
5. سازگاری با CAM (Alg. 2): CAMهای همان منبع در پنجره‌ی τ_cam گرفته می‌شوند. فاصله‌ی اقلیدسی مکان رویداد DENM تا موقعیت CAMها محاسبه می‌شود و درصد CAMهایی که فاصله‌شان ≤ δ_eventType است به‌دست می‌آید. اگر camCoh < 10 باشد، msgCohScore = ω_msg × defScore کم می‌شود. اگر بین 10 و 30 باشد، تغییری نمی‌کند. اگر بیشتر از 30 باشد، msgCohScore اضافه می‌شود (Alg. 1).
6. شباهت با رویدادهای دیگر (Alg. 3) با رویکرد centroid انجام می‌شود. centroid زمانی و centroid مکانی با میانگین‌گیری تدریجی به‌روز می‌شوند. شرط شباهت |τ_centroid − detTime| ≤ τ_eventType و فاصله ≤ δ_eventType است. **در Alg. 1، اگر len(similarEvents) > 2 باشد امتیاز کم و در غیر این صورت زیاد می‌شود.** این شرط شهودی نیست و در متن توضیح داده نشده است. [برای نقل در گزارش با احتیاط؛ ممکن است خطای چاپی مقاله باشد.]
7. به‌روزرسانی (معادله‌ی 1، ص. ۷): `(r_DID)_t = α·(r_DID)_{t−1} + β·((r_DID)_{t−1} + repScore)` با شرط α+β=1. وزن‌ها (مثل ω_msg) را می‌توان برای هر ناحیه‌ی edge به‌صورت پویا تنظیم کرد.
8. ذخیره (§4.3.3): امتیاز با تراکنش zero-value در Tangle ذخیره می‌شود. برای جلوگیری از تعارض، فرض شده که edge nodeها به‌قدر کافی از هم دورند و زمان جابه‌جایی خودرو بین پوشش دو گره از زمان به‌روزرسانی بیشتر است.
- **نکته برای ادعای «پیام‌های ایمنی و غیرایمنی»:** امتیاز در واقع برای فرستنده‌ی **DENM** محاسبه می‌شود. CAMها فقط مرجع سازگاری هستند (Alg. 2؛ §5.2 «processes every single message characterizing the DEN-based dataset»).

### ۳.۷ الزامات امنیتی و مدل تهدید (بخش حملات و راهکارها)
- شش الزام ارتباطی (§3.2، ص. ۴): Confidentiality، Integrity، Authentication، Privacy («no entity in the VANET can infer the real identity of the user vehicle»)، Traceability و Non-repudiation.
- **تعریف Traceability در DIVA:** متن §3.2 می‌گوید «messages have to be traced back to their origin, enabling accountability and facilitating legal actions». اما در تحلیل (§6.1، ص. ۹) این الزام فقط از راه ارزیابی شهرت و فیلتر کردن خودروهای زیر آستانه برآورده می‌شود. سازوکاری برای افشای هویت واقعی وجود ندارد و طبق §6.1، DIDها «cannot be mapped to the user's identity».
- مدل مهاجم Dolev–Yao: مهاجم هر پیامی را رهگیری می‌کند، با هر موجودیتی ارتباط برقرار می‌کند و می‌تواند گیرنده‌ی هر ارسالی باشد (§3.3، ص. ۴).
- حملات و دفاع‌ها (§3.3 و §6.2، ص. ۴–۵ و ۱۰):
  - *Eavesdropping:* داده‌ی جاده‌ای عمومی است و رمزنگاری آن «pointless» است. داده‌ی حساس با کلید عمومی گیرنده (از DID Document) رمز می‌شود. از سوءاستفاده از VPِ رهگیری‌شده با امضای دیجیتال جلوگیری می‌شود.
  - *Replay:* edge node، timestamp را بررسی می‌کند و فرستنده یک «challenge - a unique random string» در VP قرار می‌دهد.
  - *Forgery:* هر DID به یک زوج کلید ECC متصل است و محاسبه‌ی کلید خصوصی «computationally infeasible» است.
  - *Sybil:* هر خودرو فقط یک DID دارد. مهاجم برای هر هویت باید یک خودرو داشته باشد. حتی در آن صورت هم پنجره‌ی حمله به زمانِ سقوط شهرت به زیر آستانه محدود است.
- *Integrity و non-repudiation:* پیام‌ها با کلید خصوصی امضا می‌شوند و کلید عمومی در DID Document روی Tangle قرار دارد (§6.1).

### ۳.۸ کارهای مرتبط (برای بخش مقایسه‌ی طرح‌های مبتنی بر بلاکچین و DAG، §7، ص. ۱۰–۱۱)
- BDRA (Li et al. [29]): بلاکچین دولایه با DID. توضیح نداده که درستی پیام‌ها چگونه بررسی می‌شود.
- BRS4VANET (Fernandes et al. [30]): بلاکچین کنسرسیومی و قرارداد هوشمند. RSU شهرت را محاسبه می‌کند و گواهی شبه‌ناشناس زیر آستانه ابطال می‌شود، اما سازوکار ابطال مشخص نشده است.
- BARS (Lu et al. [37]): شبه‌نام مبتنی بر کلید عمومی و شهرت مستقیم و غیرمستقیم. با شهرت صفر، کلید عمومی ابطال می‌شود. بررسی درستی پیام در آن نیامده است.
- Yang et al. [38]: استنتاج بیزی و ساخت بلوک توسط RSUها. شماره‌ی شناسایی خودرو حریم خصوصی را به خطر می‌اندازد.
- Li et al. [39]: DAG پارتیشن‌بندی‌شده با سازگاری محلی. ساختار داده‌ی اضافه سربار ایجاد می‌کند.
- Li et al. [40]: DAG و حریم خصوصی؛ جزئیات شهرت ندارد.
- Du et al. [41]: DAG و کنترل نرخ مبتنی بر شهرت.
- مزیت‌های DAG: «scalability, fast transactions, and low transaction fees» (§7.2، ص. ۱۰).

### ۳.۹ ارزیابی (برای بخش ارزیابی یا جمع‌بندی)
- دیتاست: https://github.com/MMw-Unibo/ETSI-V2V-Dataset. کد: https://github.com/MMw-Unibo/DIVA و Zenodo 10.5281/zenodo.10522096 (پانویس‌های ص. ۷–۸؛ ref [12]).
- فیلدهای DENM: source، situation_eventType، detection_time، eventPos_lat/long/alt. فیلدهای CAM: source، referencePosition*، simulationTime (Table 3).
- روش تزریق نویز: برای هر ستون یک توزیع نرمال با میانگین صفر و انحراف معیار متناسب با همان ستون ساخته می‌شود. هر مقدار مستقل تغییر می‌کند تا داده واقع‌گرایانه بماند (§5.1، ص. ۷).
- آستانه‌ی δ_eventType با mode، median یا mean روی داده‌ی سالم تعیین شد و τ_cam = 600 s بود. β از 0 تا 1 با گام 0.1 تغییر داده شد (§5.2، ص. ۸).

## ۴. بررسی ادعاهای فعلی

| خط report.tex | ادعا | حکم | شاهد | اصلاح پیشنهادی |
|---|---|---|---|---|
| 171 | SSI، DID و VC راهکار مدیریت هویت و شبه‌نام در VANET‌اند | جزئی | §2.2؛ §4.1؛ §6.1 («DIDs, which act as pseudonyms») | DIVA از DID و VC استفاده می‌کند، اما واژه‌ی SSI در مقاله نیامده است. SSI را به mazzocca2025survey ارجاع دهید و DIVA را نمونه‌ی کاربرد DID+VC بنامید. |
| 542/545 | ذخیره‌سازی امتیازات شهرت در IOTA | پشتیبانی‌شده | §4.3.3، ص. ۷ | قید کنید «با تراکنش zero-value در یک Tangle با دسترسی محدود (permissioned)». |
| 546 | تراکنش بدون کارمزد | جزئی | §2.3.1 (zero-value transactions)؛ §7.2 («low transaction fees» برای DAG به‌طور کلی) | واژه‌ی «fee» برای IOTA در DIVA نیامده است. بنویسید «تراکنش‌های بدون انتقال ارزش (zero-value) که به اعتبارسنجی شرکت‌کنندگان نیاز ندارند». |
| 547 | تأیید سریع برای کاربردهای بلادرنگ | جزئی | §2.3.1 «fast performance»؛ §5.3.2 تأخیر «a few microseconds» | عدد تأخیر را اضافه کنید و قید کنید که برای ۵ edge node و ارتباط یک‌به‌یک در شبیه‌سازی اندازه‌گیری شده است. |
| 548 | امضای Ed25519 | پشتیبانی‌نشده (توسط این منبع) | DIVA فقط ECC را ذکر می‌کند (§6.2) | یا ارجاع را به silvano2020 یا مستندات IOTA محدود کنید، یا بنویسید «رمزنگاری خم بیضوی (ECC)». |
| 640 | زیرنویس: معماری DIVA ... با استفاده از IOTA Tangle | پشتیبانی‌شده | تصویر DIVA.jpg همان Fig. 1 «System Model» است (ص. ۴) | بنویسید «مدل سیستم DIVA (برگرفته از \cite{...}، Fig. 1)». در شکل برچسب «DLT Node» آمده، نه «IOTA». اجزا (TA، edge node، UPF، RSU دارای حسگر) را در متن توضیح دهید. |
| 644 | DID برای شناسایی خودرو، Tangle برای ذخیره‌ی امن شهرت، و محاسبه از پیام‌های ایمنی و غیرایمنی | پشتیبانی‌شده | Abstract؛ §3.1؛ §4.3 | دقیق‌تر بنویسید: امتیاز فرستنده‌ی DENM با مقایسه با داده‌ی RSU، CAMهای همان فرستنده و DENMهای مشابه محاسبه می‌شود و محاسبه روی edge node است. |
| 663 | تصدیق هویت غیرمتمرکز و حذف نیاز به مرجع مرکزی | جزئی | §2.2 (ادعای کلی DID)؛ اما §3.1 و §4.1: DIVA به TA متکی است | بنویسید «کاهش وابستگی به مرجع مرکزی». در DIVA، TA همچنان DID را ثبت و VC را صادر می‌کند. |
| 664 | استفاده از DID به‌عنوان شبه‌نام | پشتیبانی‌شده | §6.1 Privacy | — |
| 665 | قابلیت ردیابی شرطی (شناسایی هویت واقعی در صورت نیاز) | پشتیبانی‌نشده (در تعارض) | §6.1: DIDها «cannot be mapped to the user's identity». Traceability فقط از راه شهرت و فیلتر کردن برآورده می‌شود | این بند را حذف کنید یا به منبع دیگری ارجاع دهید. دست‌کم یادآوری کنید که DIVA ردیابی شرطیِ هویت واقعی ندارد. این یک شکاف پژوهشی است. |
| 666 | ذخیره‌ی غیرمتمرکز امتیازات شهرت | پشتیبانی‌شده | §3.1؛ §4.3.3 | قید کنید که ledger از نوع permissioned است. |
| 674 | رفع نقطه‌ی شکست واحد | جزئی | §2.3 (ویژگی DLT) | TA در DIVA متمرکز است. بنویسید «برای ذخیره‌ی داده‌ی شهرت». |
| 675 | DID به‌عنوان شبه‌نام و افشاگری انتخابی | جزئی | §6.1 بخش شبه‌نام را تأیید می‌کند. selective disclosure در DIVA نیامده است | افشاگری انتخابی را فقط به mazzocca2025survey ارجاع دهید. |
| 676 | حذف نیاز به مدیریت گواهی‌نامه‌های پیچیده | غیرقابل‌تأیید (از این منبع) | در DIVA بحثی درباره‌ی PKI یا گواهی نیست | ارجاع DIVA را از این بند بردارید. |
| 677 | جلوگیری از حمله‌ی تقلید با تصدیق هویت رمزنگارانه | پشتیبانی‌شده | §6.2 Forgery (ECC، کلید خصوصی) | — |
| 678 | حمله‌ی Sybil: یک DID برای هر خودرو | پشتیبانی‌شده | §6.2 Sybil | اضافه کنید که با سقوط شهرت به زیر آستانه، پنجره‌ی حمله محدود می‌شود. |
| 713 | DIVA ترکیب DID و IOTA برای مدیریت شهرت است | پشتیبانی‌شده | Abstract | — |
| 716–718 | DID برای شناسایی؛ ذخیره در Tangle؛ محاسبه از پیام ایمنی و غیرایمنی | پشتیبانی‌شده | Abstract؛ §4.3 | — |
| 719 | شناسایی دقیق مشارکت‌کنندگان مخرب با دقت تقریباً ۹۰٪ | جزئی | ص. ۲: «approximately 90% across various scenarios»؛ §5.3.2: «around 94% with 30% ... 89% with 40%»؛ §8: «around 99% when specific thresholds» | عدد را مشروط بنویسید: «حدود ۹۴٪ با ۳۰٪ منبع مخرب و ۸۹٪ با ۴۰٪ (آستانه‌ی mean، β>0.3)». دقت روی پیام‌های DENM در یک سناریوی شبیه‌سازی‌شده سنجیده شده است. ناسازگاری ۹۰ و ۹۹ درصد را هم در نظر داشته باشید. |

**شمارش:** ۱۹ ادعا بررسی شد: ۹ پشتیبانی‌شده، ۷ جزئی، ۲ پشتیبانی‌نشده (Ed25519 و ردیابی شرطی) و ۱ غیرقابل‌تأیید (مدیریت گواهی).

## ۵. اصطلاحات

| English | فارسی پیشنهادی |
|---|---|
| Reputation system / score | سامانه‌ی شهرت / امتیاز شهرت |
| Decentralized Identifier (DID) / DID Document | شناسه‌ی غیرمتمرکز / سند شناسه |
| Verifiable Credential / Presentation (VC/VP) | اعتبارنامه‌ی تأییدپذیر / ارائه‌ی تأییدپذیر |
| Trusted Authority (TA) / Identity Provider | مرجع مورد اعتماد / فراهم‌کننده‌ی هویت |
| Verifiable data registry | دفتر ثبت داده‌ی تأییدپذیر |
| Edge node | گره لبه |
| Permissioned / permissionless ledger | دفتر کل مجوزدار / بدون مجوز |
| Directed Acyclic Graph (DAG) | گراف جهت‌دار بی‌دور |
| Zero-value transaction | تراکنش بدون ارزش |
| Milestone / Coordinator / Permanode / pruning | نقطه‌ی عطف / هماهنگ‌کننده / گره دائمی / هرس |
| Cooperative Awareness Message (CAM) | پیام آگاهی همیارانه |
| Decentralized Environmental Notification Message (DENM) | پیام اعلان محیطی غیرمتمرکز |
| Safety / non-safety message | پیام ایمنی / غیرایمنی |
| Single-Hop Broadcasting / GeoBroadcasting | پخش تک‌گامی / پخش جغرافیایی |
| Coherency / outlier detection | سازگاری (هم‌خوانی) / تشخیص داده‌ی پرت |
| Centroid | مرکز ثقل (مرکزوار) |
| Dolev–Yao adversary model | مدل مهاجم دولف–یائو |
| Eavesdropping / Replay / Forgery / Sybil attack | حمله‌ی شنود / بازپخش / جعل / سیبل |
| Non-repudiation / Traceability | انکارناپذیری / ردیابی‌پذیری |
| True/False Positive Rate (TPR/FPR) | نرخ مثبت صحیح / مثبت کاذب |

## ۶. شکل‌ها و جداول قابل استفاده

- **Fig. 1 System Model (ص. ۴):** همان `images/DIVA.jpg` در گزارش است. TA، سه edge node (DLT Node، DLT Client و Reputation System)، هسته‌ی 5G با UPF و I-UPF، RSU دارای حسگر و RSU معمولی را نشان می‌دهد. زیرنویس باید منبع را ذکر کند.
- **Fig. 2 DIVA workflow (ص. ۵):** نمودار ترتیبی ثبت‌نام، ارسال پیام و به‌روزرسانی شهرت پس از دریافت DENM. برای بازترسیم یک نمودار مراحل در بخش DIVA مناسب است.
- **Table 2 (ص. ۳):** فیلدهای جدول داخلی edge node (`vehicle_did` و `repScore`).
- **Algorithm 1–3 (ص. ۶):** محاسبه‌ی امتیاز، سازگاری با CAM و شباهت DENM. می‌توان آن‌ها را به‌صورت شبه‌کد یا فلوچارت فارسی بازنویسی کرد.
- **Eq. (1) (ص. ۷):** قاعده‌ی به‌روزرسانی شهرت با α+β=1.
- **Table 3 (ص. ۸):** ویژگی‌های دیتاست‌های DENM و CAM.
- **Table 4 (ص. ۸):** مقادیر TPR، TNR، FPR و FNR برای سه آستانه‌ی mode، median و mean با ۲۰٪ منبع مخرب. بهترین منبع عددی برای ارزیابی است.
- **Fig. 4 و Fig. 5 (ص. ۹):** عملکرد بر حسب β برای ۲۰، ۳۰ و ۴۰ درصد منبع مخرب با آستانه‌ی mean و mode. مقادیر دقیق از نمودار خوانده نشد؛ فقط اعدادی که در متن آمده‌اند قابل نقل‌اند.
