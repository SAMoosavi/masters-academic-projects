# یادداشت استخراج محتوا — `luConnectedVehiclesSolutions2014`

## ۱. مشخصات و دسترسی

- **ارجاع کامل:** N. Lu, N. Cheng, N. Zhang, X. Shen, and J. W. Mark, "Connected Vehicles: Solutions and Challenges," *IEEE Internet of Things Journal*, vol. 1, no. 4, pp. 289–299, Aug. 2014, doi: 10.1109/JIOT.2014.2327587.
- **سطح دسترسی:** **متن کامل** (۱۱ صفحه، نسخه‌ی نهایی منتشرشده IEEE با شماره‌صفحات ۲۸۹–۲۹۹).
  - منبع: صفحه‌ی شخصی نویسنده‌ی اول `https://faculty.tru.ca/nlu/cvsac.pdf` (گواهی TLS سرور مشکل دارد؛ با `curl -k` دریافت شد). نسخه‌ی آرشیوی: `web.archive.org/web/20240422010352/https://faculty.tru.ca/nlu/cvsac.pdf`. نسخه‌ی ResearchGate هم وجود دارد ولی دسترسی خودکار 403 داد.
  - OpenAlex/Semantic Scholar مقاله را `closed` گزارش می‌کنند؛ یعنی نسخه‌ی بالا نسخه‌ی خودآرشیوی نویسنده است.
  - محدودیت استخراج: جدول‌های I تا IV و شکل‌ها به صورت تصویر هستند و متنشان استخراج نشد (محتوای سلول‌ها تأیید نشده). در ص. ۲۸۹، ستون راست، یک کلمه (احتمالاً نماد CO₂) در جمله‌ی «... and [?] produced during congestion was 56 billion pounds» در متن استخراج‌شده غایب است → **نامطمئن**.
- **بررسی متادیتای bib (`report.bib`, خط ۱۴۴):** عنوان، نویسندگان (۵ نفر، به همان ترتیب)، `date = 2014-08`، vol. 1، no. 4، pages 289–299، ISSN 2327-4662، DOI — **همه با سرصفحه‌ی PDF مطابق‌اند** (ص. ۲۸۹: «IEEE INTERNET OF THINGS JOURNAL, VOL. 1, NO. 4, AUGUST 2014»؛ «Digital Object Identifier 10.1109/JIOT.2014.2327587»). تاریخ انتشار آنلاین: «Date of publication May 30, 2014; date of current version August 01, 2014». مشکلی دیده نشد.

## ۲. خلاصه ساختاریافته

- **نوع:** مقاله‌ی مروری (survey) درباره‌ی فناوری‌های بی‌سیم برای اتصال خودرو به همه‌چیز (V2X)؛ **نه** مقاله‌ی امنیتی. امنیت فقط یک‌بار و گذرا در بحث شبکه‌ی درون‌خودرویی آمده است (ص. ۲۹۱، §II-A، چالش ۴).
- **چارچوب مقاله:** خودروی متصل = خودرویی که با محیط داخلی و خارجی ارتباط دارد، از طریق چهار نوع اتصال: V2S (حسگر درون‌خودرو)، V2V، V2R (زیرساخت جاده‌ای) و V2I (**اینترنت**، نه زیرساخت) — ص. ۲۸۹، §I؛ شکل ۱.
- **ساختار:** §II اتصال درون‌خودرویی (Bluetooth، ZigBee، RFID، UWB، mmWave 60 GHz)؛ §III اتصال بین‌خودرویی (DSRC/WAVE، دسترسی پویا به طیف/TV white space)؛ §IV اتصال به اینترنت (راهکارهای صنعتی brought-in/built-in، drive-thru Internet با WiFi، راهکارهای کم‌هزینه)؛ §V اتصال به زیرساخت جاده‌ای (DSRC، VLC)؛ §VI جمع‌بندی و مسائل باز.
- **پیام اصلی:** «The biggest challenge for efficient and robust wireless connections is to combat the harsh communication environment inside and/or outside the vehicle.» (ص. ۲۹۶، §VI).

## ۳. استخراج محتوا برای بسط متن

### ۳.۱ تعریف خودروی متصل / VANET (گزارش: §«تعریف و مفهوم»، خط ۱۸۰–۱۹۱)

- **تعریف دقیق:** «Connected vehicles refer to the wireless connectivity-enabled vehicles that can communicate with their internal and external environments, i.e., supporting the interactions of vehicle-to-sensor on-board (V2S), vehicle-to-vehicle (V2V), vehicle-to-road infrastructure (V2R), and vehicle-to-Internet (V2I), as shown in Fig. 1.» — ص. ۲۸۹، §I، ستون راست.
- **کارکرد:** این تعاملات «establishing a multiple levels of data pipeline to in-vehicle information systems, enhance the situational awareness of vehicles and provide motorist/passengers with an information-rich travel environment.» — ص. ۲۸۹، §I.
- **رابطه با IoV و ITS:** «connected vehicles are considered as the building blocks of the emerging Internet of Vehicles (IoV), a dynamic mobile communication system that features gathering, sharing, processing, computing, and secure release of information and enables the evolution to next generation intelligent transportation systems (ITSs) [11].» — ص. ۲۸۹، §I.
- **تعریف VANET در این مقاله (ضمنی):** از طریق V2V، اطلاعات تولیدشده توسط رایانه‌ی خودرو، سیستم کنترل، حسگرها یا سرنشینان «can be effectively disseminated among vehicles in proximity, or to vehicles multiple hops away in a vehicular ad hoc network (VANET). Without the assistance of any built infrastructure, ...» — ص. ۲۹۲، §III. (مقاله VANET را زیرمجموعه‌ی MANET **نمی‌نامد**؛ آن ادعا باید به منبع دیگری ارجاع شود.)
- **انگیزه‌ها — دو نیروی محرک** (ص. ۲۸۹، §I):
  1. نیاز به بهبود کارایی و ایمنی حمل‌ونقل: شهرنشینی → ازدحام. «the cost of extra travel time and fuel due to congestion in 498 U.S. urban areas was already USD 121 billion in 2011, and [CO₂?] produced during congestion was 56 billion pounds, compared to USD 24 billion and 10 billion pounds in 1982, respectively [2].» (منبع ثانویه: TTI 2012 Urban Mobility Report؛ کلمه‌ی داخل کروشه نامطمئن).
  2. تقاضای روزافزون داده‌ی موبایل کاربران در جاده: «People in their own cars expect to have the same connectivity as they have at home and at work.»
- **پیش‌بینی خدمات اینترنتی:** «the percentage of Internet-integrated vehicle services will jump from 10% today to 90% by 2020 [8].» — ص. ۲۸۹ (پیش‌بینی ۲۰۱۴؛ تاریخ‌گذشته).
- **مقررات:** کمیسیون اروپا سیستم اجباری «eCall» را از ۲۰۱۵ پیشنهاد داد (تماس خودکار اضطراری هنگام تصادف) [9]؛ NHTSA وزارت حمل‌ونقل آمریکا اعلام کرد گام‌هایی برای ارتباط بین خودروهای سبک برمی‌دارد [10] — ص. ۲۸۹.
- **رقم بازار (بررسی ویژه):** متن دقیق: «The market of connected vehicles is booming, and according to a recent business report, the global market is expected to reach USD 131.9 billion by 2019 [1].» — ص. ۲۸۹، §I، ستون چپ. منبع اصلی [1]: Transparency Market Research, "Connected car market—Global industry analysis, size, share, growth, trends and forecast, 2013–2019," 2013. → رقم و سال **دقیقاً درست** است، اما (الف) منبع اولیه گزارش تجاری است نه خود Lu et al.، (ب) پیش‌بینی‌ای برای ۷ سال پیش است. برای گزارش ۲۰۲۶ باید به‌صورت تاریخی بیان شود.

### ۳.۲ انواع ارتباطات V2X (گزارش: خط ۱۹۰، شکل fig:vanet_arch)

**هشدار اصطلاحی مهم:** در این مقاله **V2I = vehicle-to-Internet** و ارتباط با زیرساخت جاده‌ای **V2R** نامیده شده؛ گزارش V2I را «خودرو به زیرساخت» تعریف کرده است. اگر به Lu ارجاع می‌دهید، این تفاوت را صریحاً ذکر کنید. مقاله V2P، V2C، VTU و V2N را **پوشش نمی‌دهد**.

- **V2S (درون‌خودرو):** پیش‌بینی تا ۲۰۰ حسگر در هر خودرو تا ۲۰۲۰ [14]؛ کابل‌کشی تا «up to 50 kg» به وزن خودرو می‌افزاید [12]؛ راه‌حل‌های سیمی: CAN، FlexRay، TTEthernet — ص. ۲۹۰، §II.
  - ویژگی‌ها: حسگرها ثابت (توپولوژی ثابت)، یک‌گامی به ECU (توپولوژی ستاره)، بدون محدودیت انرژی برای حسگرهای متصل به برق خودرو — ص. ۲۹۰، §II-A.
  - چالش‌ها: محیط پراکندگی شدید و غالباً NLOS؛ نیاز به تأخیر کم و قابلیت اطمینان بالا؛ تداخل خودروهای مجاور در شهر متراکم؛ «Security is critical to protect the in-vehicle network and control system from malicious attacks [20].» — ص. ۲۹۰–۲۹۱، §II-A.
  - فناوری‌ها (ص. ۲۹۱–۲۹۲، §II-B): Bluetooth (IEEE 802.15.1، 2.4 GHz، تا 3 Mb/s، حداکثر ۸ دستگاه فعال)؛ ZigBee (IEEE 802.15.4، 250 kb/s در 2.4 GHz)؛ RFID غیرفعال؛ UWB (3.1–10.6 GHz، پهنای 7.5 GHz، تا 480 Mb/s، استاندارد ECMA-368)؛ mmWave (57–64 GHz، multi-Gb/s، IEEE 802.15.3c و 802.11ad).
- **V2V:** کاربردهای ایمنی فعال (تشخیص برخورد، هشدار تغییر لاین، ادغام همکارانه) و سرگرمی (بازی تعاملی، اشتراک فایل) «without the assistance of any built infrastructure» — ص. ۲۹۲، §III.
  - **DSRC/WAVE:** FCC «75 MHz bandwidth at 5.9 GHz»، تقسیم به هفت کانال برای خدمات ایمنی و غیرایمنی؛ IEEE 802.11p برای PHY/MAC و خانواده‌ی IEEE 1609 برای لایه‌های بالاتر — ص. ۲۹۲–۲۹۳، §III-B. PHY: OFDM مشابه 802.11a/g، «3–27 Mb/s on a 10 MHz channel» — ص. ۲۹۳.
  - **DSA:** TV white space «between 54 and 698 MHz» به‌عنوان مکمل DSRC؛ IEEE 802.11af و 802.22 — ص. ۲۹۳، §III-C.
- **V2I (اینترنت):** سلولی (3G، 4G-LTE) و WiFi؛ صنعتی: brought-in (MirrorLink، CarPlay، GM OnStar) و built-in (BMW ConnectedDrive، Audi connect، LTE connected car) — ص. ۲۹۴، §IV-A. Drive-thru Internet: برد ۵۰۰–۶۰۰ m ≈ زمان اتصال ۱۸–۲۱ s در ۱۲۰ km/h [92] — ص. ۲۹۵، §IV-B.
- **V2R (زیرساخت جاده‌ای):** «critical to avoid or mitigate the effects of road accidents, and to enable the efficient management of ITSs»؛ DSRC/WAVE فناوری کلیدی برای چراغ راهنمایی، تابلوها و حسگرهای کنار جاده؛ RSU می‌تواند تأمین‌کننده‌ی محتوای تجاری باشد و «RSU does not necessarily serve as Internet gateway»؛ VLC (IEEE 802.15.7، تا 96 Mb/s) مکمل DSRC در سناریوهای LOS — ص. ۲۹۶، §V.

### ۳.۳ اهمیت (گزارش: §«اهمیت»، خط ۲۰۳–۲۱۲)

کاربردهای خودروی متصل (ص. ۲۸۹، §I): «road safety (e.g., collision detection, lane change warning, and cooperative merging), smart and green transportation (e.g., traffic signal control, intelligent traffic scheduling, and fleet management), location-dependent services (e.g., point of interest and route optimization), and in-vehicle Internet access.» این جمله می‌تواند پشتیبان مستقیم بندهای «ایمنی ترافیک»، «بهینه‌سازی ترافیک» و «سرویس‌های اطلاعاتی» باشد. مقاله درباره‌ی **خودروهای خودران** فقط «advanced sensors for autonomous control» (ص. ۲۹۰) را ذکر می‌کند — پشتیبان بند خودران نیست.

### ۳.۴ ویژگی‌های متمایز VANET (گزارش: خط ۲۱۴–۲۲۵)

ص. ۲۹۲، §III-A، در مقایسه با «typical low-velocity nomadic mobile communication systems»:
1. «The network topology changes frequently and very fast due to high vehicle mobility and different movement trajectory of each vehicle.»
2. «Due to the high dynamics of network topology and limited range of V2V communication, frequent network partitioning can occur, resulting in data flow disconnections.»
3. «Surrounding obstacles (e.g., buildings and trucks) can lead to an intermittent link to a mobile vehicle.»

ویژگی‌های مساعد: «1) the vehicle mobility is map-restricted and can be predicted in a certain time interval to a certain degree; 2) there is no power constraint on communications and each vehicle can have relatively powerful processing capability; and 3) with the aid of global positioning system (GPS), vehicles can locate themselves with an error up to a few meters.» — ص. ۲۹۲.

→ پشتیبان بندهای «تحرک بالا» و «تغییرات مکرر توپولوژی»؛ بند «منابع محاسباتی **نامحدود**» را **اصلاح** می‌کند (منبع می‌گوید «relatively powerful»، نه نامحدود). مقاله ویژگی «امنیت داده‌ها» یا «رمزنگاری» را برای VANET ذکر نمی‌کند.

### ۳.۵ چالش‌ها (گزارش: §«محدودیت‌ها و چالش‌ها»، خط ۲۲۹–۲۷۳)

- **کانال/محیط (تأثیرات محیطی):** «In urban scenarios, the line-of-sight (LOS) path of V2V communication is often blocked by buildings at intersections. While on a highway, the trucks on a communication path may introduce significant signal attenuation and packet loss [54].» محوشدگی چندمسیری، سایه‌افکنی و اثر داپلر → اتلاف شدید؛ تداخل متقابل در تراکم بالا [55]؛ «there is a lack of unified channel model that can be applied for all scenarios (e.g., urban, rural, and highway)» — ص. ۲۹۲، §III-A.
- **تکه‌تکه شدن شبکه:** بند ۲ بالا (ص. ۲۹۲).
- **محدودیت‌های PHY در DSRC:** (۱) ارتباط مطمئن تضمین نشده به‌ویژه با مسدود شدن LOS یا delay spread زیاد؛ (۲) تداخل بین کانال‌های مجاور؛ (۳) پدیده‌ی gray-zone (نرخ اتلاف متناوب) — ص. ۲۹۳، §III-B-1.
- **MAC/تخصیص منابع رادیویی:** «based on the legacy IEEE 802.11 distributed coordination function (DCF), the current version of DSRC MAC is contention-based and thereby does not support efficient and reliable broadcast services»؛ علت: «high collision probability of the broadcasted packets»؛ RTS/CTS و ACK برای broadcast اجرا نمی‌شوند؛ پیشنهادهای مبتنی بر TDMA [66]–[69] — ص. ۲۹۳، §III-B-2.
- **کمبود طیف:** «In spite of the DSRC spectrum, V2V communications still face the problem of spectrum scarcity» به دو دلیل: (۱) کاربردهای سرگرمی مانند ویدئوی باکیفیت، (۲) تراکم بالای خودرو در شهر [71], [72]؛ مطالعه‌ی عددی [73] محدودیت طیف اختصاصی را گزارش کرده — ص. ۲۹۳، §III-C.
- **هزینه‌ی استقرار:** سلولی دارای CAPEX و OPEX بالا؛ WiFi کنار جاده اتصال متناوب؛ «the deployment and operation cost of the wireless network infrastructure is a dominant factor in bringing Internet on wheels into reality» — ص. ۲۹۵–۲۹۶، §IV-C. زیرساخت سلولی موجود «might not be able to support a huge number of connected vehicles» (پشتیبان جزئی مقیاس‌پذیری).
- **استانداردسازی/ناهمگونی:** «multiple radio interfaces have to be implemented, such as DSRC/WAVE, WiFi, and 3G/4G-LTE interfaces, which may incur a high cost ... A unified solution to provide V2X connectivity with low cost might be required.» — ص. ۲۹۶، §VI-1.
- **سایر مسائل باز (ص. ۲۹۶–۲۹۷، §VI):** V2S تا رسیدن به عملکرد سیمی کاملاً پذیرفته نمی‌شود؛ اطلاعات بیش از حد به راننده بار کاری را افزایش داده و ایمنی را کاهش می‌دهد [111], [112].

## ۴. بررسی ادعاهای فعلی

| خط | ادعا | حکم | locator | اصلاح پیشنهادی |
|---|---|---|---|---|
| 182 | خودروهای متصل با امکان ارتباط با محیط داخلی و خارجی، بخشی جدایی‌ناپذیر از زندگی مدرن شده‌اند | جزئی | ص. ۲۸۹، §I: «As an indispensable part of modern life, motor vehicles...»؛ «communicate with their internal and external environments» | منبع «motor vehicles» (نه خودروی متصل) را جزء جدایی‌ناپذیر زندگی می‌داند؛ بنویسید «خودروها بخش جدایی‌ناپذیر زندگی مدرن‌اند و تجهیز آن‌ها به ارتباط بی‌سیم با محیط داخلی و خارجی، مرز بعدی تحول خودرو تلقی می‌شود». |
| 182 | پیش‌بینی می‌شود بازار جهانی خودروهای متصل تا ۲۰۱۹ به ۱۳۱.۹ میلیارد دلار برسد | پشتیبانی‌شده (رقم) / تاریخ‌گذشته | ص. ۲۸۹، §I: «the global market is expected to reach USD 131.9 billion by 2019 [1]» | زمان فعل را تاریخی کنید: «در سال ۲۰۱۴ پیش‌بینی شده بود که ... تا ۲۰۱۹ به ۱۳۱.۹ میلیارد دلار برسد [Lu؛ به نقل از Transparency Market Research]». برای وضعیت بازار در ۲۰۲۶ منبع جدید لازم است (در این مقاله نیست). |
| 182 | VANET زیرمجموعه‌ی MANET است (ارجاع به hozouri) | — (به این منبع ارجاع نشده) | Lu این را نمی‌گوید | ارجاع فعلی را نگه دارید؛ Lu را برای آن به کار نبرید. |
| 190 | V2I = خودرو به زیرساخت | تعارض اصطلاحی (اگر به Lu ارجاع شود) | ص. ۲۸۹: «vehicle-to-road infrastructure (V2R), and vehicle-to-Internet (V2I)» | در صورت ارجاع به Lu، تفاوت نام‌گذاری را در پانویس بیاورید. V2P/V2C/VTU/V2N در Lu نیست. |
| 208–210 | ایمنی ترافیک، بهینه‌سازی ترافیک، سرویس‌های اطلاعاتی (ارجاع به hozouri/xu) | پشتیبانی‌شده (Lu به‌عنوان ارجاع تکمیلی) | ص. ۲۸۹، §I، فهرست کاربردها | می‌توان Lu را به‌عنوان ارجاع دوم افزود. |
| 220–221 | تحرک بالا؛ تغییرات مکرر توپولوژی | پشتیبانی‌شده (Lu به‌عنوان ارجاع تکمیلی) | ص. ۲۹۲، §III-A، بند ۱ | — |
| 222 | منابع محاسباتی **نامحدود**؛ خودروها محدودیت انرژی ندارند | جزئی | ص. ۲۹۲: «no power constraint on communications and each vehicle can have relatively powerful processing capability» | «نامحدود» → «نسبتاً قوی / بدون محدودیت جدی انرژی». |
| 223–224 | تأخیر کم؛ امنیت داده‌ها به‌عنوان ویژگی متمایز | پشتیبانی‌نشده توسط Lu | Lu نیاز تأخیر کم را برای پیام‌های ایمنی می‌گوید (ص. ۲۹۳: «requires low latency and high reliability») اما آن را «ویژگی» شبکه نمی‌داند؛ رمزنگاری را ذکر نمی‌کند | این‌ها «الزام» هستند نه «ویژگی»؛ در بازنویسی جابه‌جا کنید. |
| 236 | تکه‌تکه شدن مکرر شبکه | پشتیبانی‌شده (Lu تکمیلی) | ص. ۲۹۲، §III-A، بند ۲ | — |
| 238 | کمبود طیف؛ footnote «DSRC = استاندارد خودرو به شبکه و ابر» | جزئی + خطای واقعی | ص. ۲۹۲: «Dedicated short-range communications (DSRC)»؛ ص. ۲۹۳: «spectrum scarcity» | پانویس را به «Dedicated Short-Range Communications» (ارتباطات اختصاصی کوتاه‌برد) اصلاح کنید. Lu علل کمبود طیف را سرگرمی پرحجم و تراکم شهری می‌داند؛ مشکلات قابلیت اطمینان در Lu به PHY/MAC مربوط است (ص. ۲۹۳). |
| 239 | تأثیرات محیطی (ساختمان، خودرو، درخت) | جزئی | ص. ۲۹۲: ساختمان‌ها و کامیون‌ها | Lu «درخت» را ذکر نمی‌کند. |
| 247 | تخصیص منابع رادیویی / MAC | پشتیبانی‌شده (Lu تکمیلی) | ص. ۲۹۳، §III-B-2 | می‌توان مشکل broadcast در DCF را با Lu بسط داد. |
| 248 | هزینه استقرار | پشتیبانی‌شده (Lu تکمیلی) | ص. ۲۹۵–۲۹۶، §IV-C | — |
| 266 | تنوع فناوری‌ها (DSRC, LTE, 5G) و نیاز به سازگاری | جزئی | ص. ۲۹۶، §VI-1 (DSRC/WAVE، WiFi، 3G/4G-LTE) | Lu به 5G اشاره نمی‌کند. |

## ۵. اصطلاحات

| English | فارسی |
|---|---|
| Connected vehicle | خودروی متصل |
| Internet of Vehicles (IoV) | اینترنت خودروها |
| Intelligent Transportation Systems (ITS) | سامانه‌های حمل‌ونقل هوشمند |
| Vehicle-to-Sensor (V2S) | خودرو به حسگر (درون‌خودرویی) |
| Vehicle-to-Road infrastructure (V2R) | خودرو به زیرساخت جاده‌ای |
| Vehicle-to-Internet (V2I, در Lu) | خودرو به اینترنت |
| Intra-vehicle / Inter-vehicle | درون‌خودرویی / بین‌خودرویی |
| Electronic Control Unit (ECU) ـ در متن مقاله «electrical control units» | واحد کنترل الکترونیکی |
| Dedicated Short-Range Communications (DSRC) | ارتباطات اختصاصی کوتاه‌برد |
| Wireless Access in Vehicular Environments (WAVE) | دسترسی بی‌سیم در محیط‌های خودرویی |
| Dynamic Spectrum Access (DSA) | دسترسی پویا به طیف |
| TV white space | فضای سفید تلویزیونی (طیف بلااستفاده‌ی تلویزیون) |
| Spectrum scarcity | کمبود طیف |
| Network partitioning | تکه‌تکه شدن (افراز) شبکه |
| Line-of-sight (LOS) / NLOS | خط دید مستقیم / بدون خط دید |
| Multipath fading, shadowing, Doppler effect | محوشدگی چندمسیری، سایه‌افکنی، اثر داپلر |
| Gray-zone phenomenon | پدیده‌ی ناحیه‌ی خاکستری |
| Distributed Coordination Function (DCF) | تابع هماهنگی توزیع‌شده |
| Drive-thru Internet | اینترنت گذرا (حین عبور از پوشش نقطه‌ی دسترسی) |
| Brought-in / Built-in connectivity | اتصال آورده‌شده (با گوشی کاربر) / اتصال تعبیه‌شده |
| Visible Light Communication (VLC) | ارتباط با نور مرئی |
| CAPEX / OPEX | هزینه‌ی سرمایه‌ای / هزینه‌ی عملیاتی |
| WiFi offloading | تخلیه‌ی ترافیک (سلولی) به WiFi |

## ۶. شکل‌ها و جداول قابل استفاده

- **Fig. 1 — «Overview of connected vehicles»** (ص. ۲۹۰): نمای کلی چهار نوع اتصال V2S/V2V/V2R/V2I. مناسب برای بخش تعریف؛ با ذکر منبع و توجه به نام‌گذاری V2I=Internet. (محتوای تصویری بازبینی نشد، فقط عنوان.)
- **Fig. 2 — «Example of safety applications based on V2V communications»** (ص. ۲۹۳): پیام‌های ایمنی time-driven و event-driven؛ مناسب برای بخش اهمیت/ایمنی.
- **Fig. 3 — «Illustration of drive-thru Internet»** (ص. ۲۹۵): کم‌ربط به موضوع گزارش.
- **Table I — «Summary of features of existing alternatives»** (ص. ۲۹۲)، فناوری‌های V2S. **Table II — «Comparison of DSRC and DSA [70] system parameters»** (ص. ۲۹۴). **Table III — «Summary of industrial solutions»** (ص. ۲۹۵). **Table IV — «Summary of real-world measurement results»** (ص. ۲۹۶). محتوای سلول‌ها تصویری است و استخراج/تأیید نشد؛ اگر از آن‌ها استفاده می‌شود باید از PDF مستقیم خوانده شوند. برای گزارش امنیتی، هیچ‌کدام ضروری نیستند؛ اگر قرار است از جدولی استفاده شود Table II (پارامترهای DSRC) مرتبط‌ترین است.
