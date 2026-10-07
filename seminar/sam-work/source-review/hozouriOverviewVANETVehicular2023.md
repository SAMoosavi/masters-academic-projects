# یادداشت استخراج منبع: `hozouriOverviewVANETVehicular2023`

> مکان‌یاب‌ها: «ص» = شماره صفحه PDF (۲۰ صفحه؛ نسخه v1 arXiv)، «§» = شماره بخش مقاله. همه نقل‌قول‌های انگلیسی عیناً از متن PDF (استخراج با `pdftotext` و تطبیق با رندر صفحات ۶، ۱۰، ۱۱، ۱۲، ۱۷).

---

## ۱. مشخصات و دسترسی

- **ارجاع کامل:** A. Hozouri, A. Mirzaei, S. RazaghZadeh, and D. Yousefi, "An overview of VANET vehicular networks," arXiv preprint arXiv:2309.06555 [cs.NI], Sep. 2023. doi: 10.48550/arXiv.2309.06555
- **سطح دسترسی:** **متن کامل** (PDF محلی: `/home/sam/Zotero/storage/VY5HMTVW/Hozouri et al. - 2023 - An overview of VANET vehicular networks.pdf`، ۲۰ صفحه). صفحه چکیده arXiv نیز بررسی شد: «Submitted on 12 Sep 2023»، تنها نسخه v1.
- **وابستگی سازمانی نویسندگان (ص ۱):** دانشگاه آزاد اسلامی واحد اردبیل (سه نویسنده؛ نویسنده اول دانشجوی کارشناسی ارشد) و مؤسسه آموزش عالی مقدس اردبیلی (Yousefi).
- **بررسی مدخل bib** (`report.bib` خطوط ۹۲–۱۰۴):

| فیلد | مقدار bib | وضعیت |
|---|---|---|
| author | Hozouri, Mirzaei, RazaghZadeh, Yousefi | ✅ مطابق ص ۱ و arXiv |
| title | An Overview of {VANET} Vehicular Networks | ✅ |
| date | 2023-09-12 | ✅ (تاریخ ارسال arXiv) |
| eprint / eprintclass | 2309.06555 / cs.NI | ✅ |
| doi | 10.48550/arXiv.2309.06555 | ✅ (DOI صادرشده توسط arXiv/DataCite) |
| pubstate | prepublished | ✅ — نسخه داوری‌شده/منتشرشده‌ای یافت نشد (جست‌وجوی جامع انجام نشد) |
| version | — | ⚪ اختیاری؛ در صورت تمایل `version = {1}` |

خطای متادیتایی دیده نشد.

---

## ۲. خلاصه ساختاریافته

- **دامنه:** مقاله مروری-مقدماتی درباره VANET: مفهوم، اجزا، انواع ارتباط، ویژگی‌های متمایز، رده‌بندی شبکه‌های ad-hoc، استانداردهای دسترسی بی‌سیم، کاربردها، چالش‌ها، و پیوند با SDN، هوش مصنوعی و بلاکچین (چکیده ص ۱؛ §1.C ص ۳).
- **ساختار (ص ۳):** §1 مقدمه؛ §2 مفهوم VANET (اجزا، اجزای خودروی هوشمند، ارتباطات، ویژگی‌های متمایز)؛ §3 رده‌بندی MANET؛ §4 استانداردهای دسترسی بی‌سیم؛ §5 کاربردها و سرویس‌ها؛ §6 چالش‌ها؛ §7 پیوند با SDN/AI/Blockchain؛ §8 مسائل آینده؛ §9 نتیجه. (مقاله خود می‌گوید «eight primary sections» اما ۹ بخش فهرست می‌کند.)
- **محتوای کلیدی:** تعریف VANET به‌عنوان زیرمجموعه MANET؛ OBU/RSU؛ ۸ نوع ارتباط (V2V, V2I/V2R, I2I, V2P, V2B, V2C, V2U, V2S)؛ ۱۲ ویژگی متمایز؛ رده‌بندی سه‌شاخه‌ای چالش‌ها (کاربرد، شبکه داده، مدیریت منابع)؛ معماری SDN-VANET؛ انواع بلاکچین و نمونه‌های صنعتی.
- **محدودیت‌ها (مهم برای نویسنده):**
  1. **پیش‌چاپ arXiv، بدون داوری همتا.**
  2. **منبع ثانویه:** بخش عمده §2.2 تا §6 با ارجاع به [3] = Hussein et al., "A comprehensive survey on vehicular networking: Communications, applications, challenges, and upcoming research directions," *IEEE Access*, vol. 10, pp. 86127–86180, 2022 نوشته شده (ص ۱۹)؛ §7.1 از [9] Al-Heety et al. (*IEEE Access*, 2020) و §7.3 از [10] Hammoud et al. آمار ۹۲٪ از [1] Sharma & Kaushik (*Veh. Commun.*, 2019) نقل شده. **توصیه: برای ادعاهای اصلی، منبع اولیه داوری‌شده (به‌ویژه Hussein et al. 2022) نیز بررسی و ارجاع شود.**
  3. **خوداستنادی گسترده و نامرتبط:** مراجع [11]–[27] (ص ۱۹–۲۰) عمدتاً آثار Mirzaei درباره HetNet/NOMA/WSN‌اند که به ادعاهای VANET ربطی ندارند (مثلاً [14],[15] مقالات WSN سال ۲۰۱۰ برای «اجزای خودروی هوشمند» در ص ۴).
  4. **خطاهای ویرایشی/فنی:** "Vehicle-to-Urone (V2U)" (منظور drone؛ ص ۶)، "Control Screen" و "data screen/sheet" به‌جای control/data plane (ص ۱۳)، در جدول ۱ "LTE = Infotainment as a Service"، "IP = Internal Protocol"، "RAN = Rainforest Action Network" (ص ۳–۴)، و «RSA and ECDSA» به‌عنوان «energy-saving strategies» (ص ۷) — فنی نادرست.
  5. هیچ داده تجربی، شبیه‌سازی یا مقایسه کمّی ندارد؛ اعداد محدود به: ۵۰٪/۶۶٪، ۹۲٪، «less than 1 meter»، ۸۵۰–۹۵۰ nm، «5 and 30 meters»، «seven DSRC channels».

---

## ۳. استخراج محتوا برای بسط متن

### ۳.۱ مقدمه و اهمیت (report §مقدمه خطوط ۱۶۳، ۱۶۵؛ §اهمیت خطوط ۲۰۶–۲۱۱)

- **شهرنشینی:** «More than 50% of the world's population currently lives in cities ... this proportion will represent almost 66% of the global population.» (ص ۱، §1؛ بدون ارجاع در منبع)
- **خطای انسانی (نقل کامل):** «In terms of road safety, 92% of accidents are frequently attributed to errors in human judgment (such as driver inattention, insufficient supervision, and distraction) and human decision-making errors (such as driving too fast, reacting slowly, safety distance, and misjudging) [1].» (ص ۱، §1) ⚠️ عدد «92%» است نه «بیش از ۹۲٪»، و منبع آن را به [1] Sharma & Kaushik 2019 نسبت می‌دهد.
- **ناکافی‌بودن ایمنی غیرفعال:** با وجود ABS، کمربند، کیسه هوا و دوربین عقب، هنوز «numerous people lose their lives in traffic accidents every year» (ص ۱، §1، [2]).
- **هدف VANET:** «designed to offer low-latency infotainment services and safety-related alerts to both drivers and driverless vehicles» (ص ۱). سرویس‌ها: «traffic control, entertainment, safety applications, driving assistance, collision avoidance, and safety services»؛ انتقال اطلاعات حیاتی ایمنی «the highest priority» دارد (ص ۱–۲).
- **مزیت کلی:** «VANET enhances the driving experience while lowering accidents and congestion» (ص ۵، §2.2). VANET می‌تواند «news, games, and Internet access» را نیز به اشتراک بگذارد (ص ۵).
- **VANET Cloud:** «each vehicle is a potent node that, when grouped together as a cluster, can function as a vast farm of moving supercomputers» ← شبکه نوین «VANET Cloud» (ص ۲، §1). مفید برای بحث منابع محاسباتی/VCC.
- **انگیزه:** گسترش VANET برای سرویس‌های ITS نیازمند بهبود «data delivery latency, steady network performance, stability, scalability, and flexibility» و همکاری با شبکه سلولی و WSN (ص ۲، §1.A).

### ۳.۲ تعریف (report §تعریف خط ۱۸۲)

- **تعریف اصلی:** «A subclass of mobile ad hoc networks (MANET), known as a vehicular ad hoc network (VANET), facilitates communication between nearby vehicles and between vehicles and infrastructure.» (ص ۴، §2.1)
- **تمایز با دیگر شبکه‌های ad-hoc:** در مقایسه با MANET، FANET و WSN، VANET دارای «high vehicle mobility, dependence on transportation infrastructure, dynamic network switching, and sporadic network connectivity» است (ص ۲، §1).
- **رده‌بندی خانواده MANET (§3، ص ۹، شکل ۳):** WSN، RANET، FANET، TANET، SANET (و VANET). نکات مقایسه‌ای: گره‌های WSN ایستا و «power supply» چالش اصلی آن‌هاست؛ FANET نیازمند اتصال دست‌کم یک UAV به ماهواره/GBS؛ RANET ربات‌ها با «limited mobility» و «limited energy capacity»؛ SANET با تأخیر انتشار، قطع مکرر و چگالی پایین (ص ۹). ← برای پاراگراف «VANET در برابر شبکه حسگر» مفید.
- **همگرایی با شبکه‌های دیگر:** سلولی، ماهواره‌ای، WSN، رادیوی شناختی و «most recently UAV networks» (ص ۲).

### ۳.۳ اجزا (report §ارکان خطوط ۱۹۸–۱۹۹)

- **OBU:** «Roadside units (RSUs) and intelligent vehicles with on-board units (OBUs) make up a VANET's fundamental building blocks. OBUs are hardware elements that are put in every vehicle and allow communication with RSUs and other OBUs. Each car has an OBU installed that receives messages from a source (a vehicle or sensor), verifies them, and then broadcasts them to other vehicles via the DSRC system» (ص ۴، §2.1).
- تعریف دوم OBU در فهرست اجزای خودروی هوشمند: «regulates vehicle connection with RSU, SMBS, and other cars through DSRC/LTE-V» (ص ۵، §2.1.1 بند ۸). (SMBS در متن تعریف نشده.)
- **RSU:** منبع تعریف مستقل ندارد؛ فقط: «roadside fixed units (RSUs)» که OBU از طریق V2I/V2R یا V2V با آن تعامل می‌کند (ص ۲)؛ «stationary (like RSUs)» (ص ۷)؛ RSU اطلاعات خودروهای حاضر در محدوده پوشش را جمع‌آوری و برای تحلیل به ابر/SDN می‌فرستد (ص ۸، بند ۹)؛ در SDN، RSU جزء ثابت صفحه داده و نگه‌دارنده جدول جریان OF است (ص ۱۳–۱۴، §7.1.2).
- **TA:** در این منبع نیامده (report آن را به منبع دیگری ارجاع داده — درست است).
- **اجزای خودروی هوشمند (ص ۴–۵، §2.1.1، شکل ۱):** CPU؛ فرستنده‌گیرنده بی‌سیم (V2V/V2I)؛ گیرنده GPS («accuracy of less than 1 meter by integrating with communication devices»)؛ حسگرها (مثلاً اولتراسونیک)؛ رابط I/O؛ رادار (بلندبرد/کوتاه‌برد، در adaptive cruise control)؛ LIDAR («infrared light pulses with a wavelength of 850 to 950 nm»)؛ OBU؛ LCS (دوربین محلی پایش راننده). ⚠️ ادعای دقت زیر ۱ متر GPS (ص ۵) با «5 and 30 meters» در ص ۸ ظاهراً ناسازگار است (اولی با «integrating with communication devices»)؛ در صورت استفاده با احتیاط.

### ۳.۴ انواع ارتباط V2X (report خط ۱۹۱ — بدون ارجاع به hozouri)

فهرست منبع (ص ۶، §2.2، شکل ۲؛ به نقل از [3]):
1. **V2V** — «Without the need of infrastructure ... directly between the vehicles. Sharing safety-related information is the major purpose».
2. **V2I/V2R** — با RSU یا ایستگاه پایه سلولی؛ برای «share announcements and give access to the Internet».
3. **I2I** — تبادل داده ترافیکی بین زیرساخت‌ها.
4. **V2P** — با دستگاه‌های قابل‌حمل.
5. **V2B** — با موانع کنار جاده (vehicle-to-barrier).
6. **V2C** — اتصال RSU و سرور ابری برای «data processing, decision-making, and transportation forecasting».
7. **V2U** («Vehicle-to-Urone» — غلط تایپی drone) — پیوند زمین به هوا با پهپاد.
8. **V2S** — با حسگرهای تعبیه‌شده.

⚠️ report از V2N و «VTU» نام می‌برد؛ **V2N در این منبع نیست** و منبع برای پهپاد «V2U» به کار می‌برد. I2I، V2B، V2S در منبع هست ولی در report نه.
- **QoS:** «non-safety applications require high-throughput networks, safety-related services must be accessible with low latency and good dependability» (ص ۷).

### ۳.۵ ویژگی‌های متمایز (report خطوط ۲۱۶–۲۲۴) — §2.3، ص ۷–۸ (۱۲ ویژگی)

1. **Mobility variation** — گره‌های ایستا (RSU)، کندرو (ترافیک/تقاطع)، تندرو (بزرگراه) (ص ۷).
2. **Limitation of motion** — حرکت محدود به زیرساخت جاده؛ توزیع جاده‌ها از شهری به شهر دیگر متفاوت (ص ۷).
3. **Frequent network fragmentation** — کاهش چگالی گره‌ها شبکه را تکه‌تکه کرده و بر «packet delivery» اثر می‌گذارد؛ سرعت بالا توپولوژی را پویاتر و شبکه را چندبخشی می‌کند (ص ۷).
4. **Heterogeneity** — ناهمگونی گره‌ها (ایستا/متحرک) و سرویس‌ها (ایمنی/سرگرمی) (ص ۷).
5. **Scalability** — «the VANET network's geographic scope is virtually limitless»؛ استفاده از UAV برای رله/ذخیره داده راهکاری تازه است (ص ۷).
6. **Unlimited power and computing resources (نقل کامل):** «The communication between nodes in the VANET network is not restricted by power or storage. VANET eliminates power and processing resource issues by embedding OBUs in vehicles that operate on continuous and unlimited energy sources from vehicle batteries. The use of different energy-saving strategies, including RSA and ECDSA approaches, is supported [3].» (ص ۷) ← عنوان منبع واقعاً «Unlimited» است. اما: (الف) منبع در این‌جا مقایسه با WSN **نمی‌کند** (مقایسه از §3 ص ۹ قابل استنتاج است)؛ (ب) جمله RSA/ECDSA فنی نادرست است و نباید نقل شود؛ (ج) منبع در ص ۲ هم می‌گوید خودروها «high computation, storage, sensor, and networking capabilities» دارند. از نظر علمی، «فراوان/نسبتاً نامحدود» دقیق‌تر از «نامحدود» است.
7. **Spectrum Scarcity:** «Wireless technology standards for automobile networks include wireless access in vehicle environments (WAVE) and dedicated short-range communications (DSRC). In large-scale dense vehicular networks, reliability and scalability problems with DSRC-based VANETs have been observed ... Each vehicle periodically uses seven DSRC channels for data exchange.» ← رقابت بر سر کانال منجر به «network congestion, increased packet delay, and decreased throughput» (ص ۷–۸). ⚠️ منبع باند فرکانسی (۵.۹ GHz)، پهنای باند یا IEEE 1609 را ذکر **نمی‌کند** — این جزئیات را از منبع دیگری بگیرید.
8. **Environmental Effects:** «Buildings, cars, trees, and other objects can interfere ... multipath propagation, channel fading, and signal shadowing»؛ به‌علاوه اثر اقلیم (ص ۸).
9. **Accuracy of information:** «the GPS signal's accuracy is typically between 5 and 30 meters under ideal conditions» در کلان‌شهر متراکم؛ اثرات تروپوسفر/یونسفر؛ داده RSU ممکن است به‌دلیل تحرک نادقیق شود (ص ۸).
10. **Fault Tolerance** — ارتباط بلادرنگ نیاز اصلی سرویس‌های ایمنی است؛ هر خطا به تأخیر و حادثه می‌انجامد (ص ۸).
11. **Data Security** — یکپارچگی بسته‌ها، رمزنگاری، احراز اصالت فرستنده، non-repudiation؛ مدیریت کلید به‌دلیل تغییر توپولوژی «extremely difficult»؛ ابطال کلید (revocation) فهرستی طولانی ایجاد می‌کند (ص ۸). ← بسیار مفید برای پیوند به بخش امنیت/احراز هویت/CRL در report.
12. **Data privacy** — کاربران نمی‌خواهند اطلاعات خودرو/مقصدشان به اشتراک گذاشته شود؛ نیاز به تعادل میان منافع عمومی و حریم خصوصی (ص ۸).

### ۳.۶ استانداردهای دسترسی بی‌سیم (برای بسط بخش شبکه‌سازی) — §4، ص ۱۰، شکل ۴

- «In the beginning, VANETs mostly relied on DSRC ... as a result of the standard's limited capacity and the significant likelihood of traffic jams and extended delays» پژوهشگران به فناوری‌های دیگر روی آوردند: 4G/LTE، Wi-Fi، Bluetooth؛ کوتاه‌برد ایستا (Zigbee, Bluetooth, Wi-Fi)؛ فوق‌مطمئن کم‌تأخیر (5G, mmWave, VLC)؛ ماهواره؛ رادیوی شناختی (ص ۱۰).
- شکل ۴: DSRC، 5G، WiMAX، 4G/LTE، Satellite، mmWave، Zigbee، Wi-Fi، Bluetooth، VLC.
- **IEEE 802.11p** فقط یک‌بار: «For V2V and V2R/R2V communication in vehicle networks, IEEE 802.11p is employed.» (ص ۱۳، §7.1.2). **WAVE** فقط یک‌بار (ص ۷).
- **C-V2X** فقط در شکل ۶ (ص ۱۲) و نتیجه‌گیری (ص ۱۸) به‌عنوان «difficulties of C-V2X» — بدون توضیح.

### ۳.۷ کاربردها (report خطوط ۲۰۸، ۲۱۰) — §5، ص ۱۰–۱۲، شکل ۵

- چهار دسته: ایمنی، سرگرمی-اطلاعات (infotainment)، بهبود ترافیک، پایش سیستم رانندگی (ص ۱۰).
- **ایمنی (§5.1، ص ۱۰–۱۱):** «The main functions of VANETs are safety-related applications»؛ سه زیرگروه: driver assistance، safety information delivery، driver alert. پیام‌های هشدار می‌توانند شامل «traffic light status and timing, traffic volume, road priority, and the present weather conditions» باشند. شکل ۵ فهرست می‌کند: change line، Emergency brake، Avoid collisions، Speed limit information، Work area warnings، Notification after the accident، Warning of closed roads، Intersection collision warning، Emergency routing of vehicles، Dissemination of SOS messages، Pedestrian crossing warning و غیره.
- **سرگرمی-اطلاعات (§5.2، ص ۱۱):** VoIP، بازی آنلاین، اشتراک ویدئو؛ «can handle delays and may demand high bandwidth»؛ سه زیرگروه: urban announcement، e-commerce، entertainment؛ خودروی متصل به اینترنت می‌تواند اینترنت را از طریق VANET به دیگران بدهد. شکل ۵: Internet access، Web browsing، VoD، Tourist places information و…
- **بهبود ترافیک (§5.3، ص ۱۱–۱۲):** مدیریت تقاطع، مدیریت ازدحام، وضعیت جاده، اطلاعات حمل‌ونقل. شکل ۵: Road congestion warning، Electronic collection of tolls، Automatic update of maps، Traffic light timing و…
- **پایش رانندگی (§5.4، ص ۱۲):** health care، رفتار فیزیولوژیک راننده، حرکت خودرو، مکانیک خودرو. شکل ۵: Fatigue monitoring، Supervision of drunkenness، Vehicle tracking و…

### ۳.۸ چالش‌ها (report خطوط ۲۳۳–۲۴۹) — §6، ص ۱۲–۱۳، شکل ۶

- **رده‌بندی سه‌شاخه‌ای (شکل ۶، ص ۱۲، از [3]):**
  - چالش‌های کاربردها: ایمنی، مدیریت ترافیک، غیرایمنی.
  - چالش‌های شبکه داده: Data routing، Data security، «data recognition» (در شکل؛ متن نتیجه ص ۱۸ آن را «data dissemination» می‌نامد).
  - چالش‌های مدیریت منابع: Radio resource allocation، VANET infrastructure deployment، C-V2X.
- **§6.2 شبکه داده (ص ۱۲–۱۳):** «Inter-vehicular communication (IVC) is the foundation of VANET communication ... The three key components of data routing, data security, and message propagation are the fundamental issues». ⚠️ منبع درباره **مسیریابی** جز همین جمله توضیحی نمی‌دهد. **تکه‌تکه شدن، کمبود طیف و اثرات محیطی** در منبع زیر «ویژگی‌ها» (§2.3) آمده‌اند، نه زیر §6؛ چیدمان report بازآرایی نویسنده است (قابل دفاع با جمله «این ویژگی‌ها چالش‌های شبکه‌سازی ایجاد می‌کنند»).
- **§6.3 مدیریت منابع (ص ۱۳):** «Many resources, such as bandwidth channels and RSUs, are shared by shared vehicles in a VANET infrastructure. The deployment of VANET is faced with several challenges as a result of this sharing».
- **§6.4 تخصیص منابع رادیویی (ص ۱۳):** «Techniques for medium access control (MAC) are essential for guaranteeing that all vehicles have fair channel access while reducing data packet loss»؛ عوامل: «high dynamics, intermittent connectivity, diverse QoS needs, and security difficulties».
- **هزینه استقرار:** منبع فقط برچسب «VANET infrastructure deployment challenges» دارد (شکل ۶، ص ۱۸)؛ از **هزینه/سرمایه‌گذاری** چیزی نمی‌گوید.

### ۳.۹ SDN (برای بسط احتمالی) — §7.1، ص ۱۳–۱۴، شکل ۷ و ۸

- جداسازی صفحه کنترل از صفحه داده (ص ۱۳)؛ کنترلر داده خودروها (موقعیت، سرعت، اتصال) را جمع و بر اساس GPS تصمیم مسیریابی می‌گیرد (ص ۱۳).
- صفحه داده: خودروها و RSUهای دارای سوئیچ OpenFlow؛ خودروها اجزای بنیادین، RSUها اجزای ثابت (ص ۱۳).
- سوئیچ OF = flow table + secure channel + OF protocol (ص ۱۴، شکل ۷)؛ OpenFlow شناخته‌شده‌ترین Southbound Interface (ص ۱۴).

### ۳.۱۰ بلاکچین (report خطوط ۳۴۱، ۴۱۷–۴۲۴) — §7.3، ص ۱۶–۱۷

- **تعریف:** «blockchain is a decentralized, distributed digital ledger that was created as the underlying network architecture for the well-known, safe cryptosystem "Bitcoin"» (ص ۱۶). «Without any centralized control, Blockchain runs on a totally distributed peer-to-peer architecture» ← «high levels of data accessibility, security, privacy, and trust»؛ هر گره «a complete copy of the database» دارد؛ گره‌ها پیش از به‌روزرسانی باید بر تراکنش‌های جدید توافق کنند (ص ۱۶).
- **Blockchain 2.0 و قرارداد هوشمند:** «A smart contract is a piece of self-executing code that begins to run whenever its predefined conditions have been satisfied, without the need for any outside authority» (ص ۱۶).
- **انواع (ص ۱۶):** Public (Bitcoin، Ethereum؛ مشارکت ناشناس)؛ Private (مجوزدار، با مرجع متمرکز)؛ Consortium (ترکیبی، مدیریت توسط گروهی از نهادهای مجاز؛ Corda، Quorum).
- **نمونه‌های صنعتی (ص ۱۶):** «General Motors and BMW are investigating a blockchain-based system to share data about self-driving cars»؛ «Volkswagen ... is developing a tracking system that uses blockchain technology to stop dealers from inflating the cost of their vehicles by tricking odometers».
- **راهبردها (ص ۱۶):** *Increasing security* — تعیین «veracity of broadcast messages» و طرح‌های احراز هویت؛ *Privacy* — «the majority of blockchain solutions demand public key encryption»، بیشتر ارتباطات رمزنگاری می‌شوند. (منبع فقط همین **دو** راهبرد را نام می‌برد.)
- **بلاکچین + AI (ص ۱۷):** AI در برابر حملات سایبری آسیب‌پذیر است؛ ترکیب با بلاکچین IoV را «decentralized, intelligent, and secure» می‌کند، اما بلاکچین بار محاسباتی را افزایش می‌دهد ← نیاز به معماری‌ای که «blends artificial intelligence and blockchain and makes use of automotive edge computing» (ص ۱۷). ← پیوند منطقی مفید به محدودیت مقیاس‌پذیری بلاکچین و معرفی IOTA در report.
- ⚠️ منبع درباره **هش بلوک قبلی، لایه‌ها، مدیریت اعتماد (trust value)، مدیریت هویت/کلید/گواهی** چیزی نمی‌گوید.

### ۳.۱۱ آینده (اختیاری) — §8، ص ۱۷، شکل ۹
موضوعات: Trust-based VANET، 6G based V2X، Edge-based VANET computing، Federated learning (FLVN)، V2X با VLC، Green vehicle networks، quantum computing، Heterogeneous IoV، Real-time big data management و…

---

## ۴. بررسی ادعاهای فعلی

| خط report.tex | ادعا (خلاصه) | حکم | مکان‌یاب شاهد | اصلاح پیشنهادی |
|---|---|---|---|---|
| ۱۶۳ | VANET از مهم‌ترین فناوری‌های ITS؛ نقش در ایمنی، کاهش تصادف، بهره‌وری | پشتیبانی‌شده | چکیده ص ۱؛ ص ۵ §2.2؛ ص ۱۷ §9 | — |
| ۱۶۵ | «بیش از ۹۲ درصد تصادفات به خطای انسانی نسبت داده می‌شود» | جزئی | ص ۱ §1 («92% of accidents are frequently attributed to errors in human judgment ... [1]») | «بیش از» حذف → «حدود ۹۲ درصد»؛ ذکر دو نوع خطا (قضاوت و تصمیم‌گیری)؛ منبع ثانویه است — [1] Sharma & Kaushik 2019 (doi:10.1016/j.vehcom.2019.100182) را نیز بررسی و ارجاع دهید |
| ۱۸۲ | VANET زیرمجموعه MANET، تسهیل ارتباط خودروهای نزدیک و خودرو-زیرساخت | پشتیبانی‌شده | ص ۴ §2.1 (نقل در ۳.۲) | «شبکه‌های خودمختار متحرک» → «شبکه‌های اقتضایی سیار» (ad hoc ≠ autonomous) |
| ۱۹۸ | OBU سخت‌افزار نصب‌شده در هر خودرو، ارتباط با RSU و OBUهای دیگر | پشتیبانی‌شده | ص ۴ §2.1 | می‌توان افزود: پیام را دریافت، اعتبارسنجی و از طریق DSRC پخش می‌کند |
| ۱۹۹ | RSU واحد ثابت کنار جاده، برقراری ارتباط خودرو با زیرساخت | جزئی | ص ۲ («roadside fixed units»)؛ ص ۶ (V2I/V2R)؛ ص ۸ بند ۹؛ ص ۱۳ §7.1.2 | ادعا درست ولی منبع تعریف صریح ندارد؛ یا منبع تعریف‌کننده دیگری بیفزایید یا نقش‌های RSU در منبع را ذکر کنید (دسترسی اینترنت، جمع‌آوری داده خودروها و ارسال به ابر/SDN) |
| ۲۰۸ | ایمنی: هشدار تصادف جلو، هشدار تغییر لاین، هشدار شرایط جاده | جزئی | ص ۱۰–۱۱ §5.1؛ شکل ۵ ص ۱۱ («change line», «Avoid collisions», «Intersection collision warning», «Warning of closed roads») | «هشدار تصادف جلو» (forward collision warning) عیناً در منبع نیست؛ از موارد شکل ۵ استفاده کنید: اجتناب از تصادف، هشدار برخورد در تقاطع، ترمز اضطراری، هشدار جاده بسته، هشدار عبور عابر |
| ۲۱۰ | اطلاعات ناوبری، آب‌وهوا، سرگرمی | جزئی | §5.2 ص ۱۱ (سرگرمی/اینترنت)؛ ص ۱۱ (آب‌وهوا در پیام‌های هشدار ایمنی)؛ شکل ۵ («Automatic update of maps») | آب‌وهوا در منبع جزو پیام‌های هشدار ایمنی است؛ «سرویس‌های اطلاعاتی-سرگرمی (infotainment)» با نمونه‌های منبع: دسترسی اینترنت، VoIP، VoD، بازی آنلاین، اطلاعات گردشگری |
| ۲۱۹ | تحرک بالا | پشتیبانی‌شده | ص ۲ («high vehicle mobility»)؛ ص ۷ بند ۱ | ویژگی «تنوع تحرک» منبع (ایستا/کندرو/تندرو) و «محدودیت حرکت به جاده» را بیفزایید |
| ۲۲۰ | تغییرات مکرر توپولوژی | پشتیبانی‌شده | ص ۷ بند ۳ و بالای §2.3 | — |
| ۲۲۱ | «منابع محاسباتی نامحدود: برخلاف شبکه‌های حسگر، خودروها محدودیت انرژی ندارند» | جزئی | ص ۷ بند ۶ («Unlimited power and computing resources ... unlimited energy sources from vehicle batteries»)؛ مقایسه WSN از ص ۹ §3 | عنوان در منبع هست، اما: (۱) «توان و منابع پردازشی فراوان/نسبتاً نامحدود» دقیق‌تر است؛ (۲) مقایسه با WSN را به §3 نسبت دهید؛ (۳) جمله RSA/ECDSA منبع را نقل نکنید |
| ۲۲۲ | تأخیر کم | جزئی | ص ۷ (QoS: «safety-related services must be accessible with low latency»)؛ ص ۸ بند ۱۰ | منبع آن را «ویژگی» نمی‌نامد بلکه نیاز QoS و «Fault Tolerance»؛ بازنویسی به «نیاز به ارتباط بلادرنگ و کم‌تأخیر» |
| ۲۲۳ | امنیت داده: رمزنگاری و محافظت از تغییر | پشتیبانی‌شده | ص ۸ بند ۱۱ | بیفزایید: احراز اصالت فرستنده، non-repudiation، دشواری مدیریت و ابطال کلید. ویژگی‌های جاافتاده منبع: ناهمگونی، مقیاس‌پذیری، کمبود طیف، اثرات محیطی، دقت اطلاعات، تحمل خطا، حریم خصوصی |
| ۲۳۳ | (سرعنوان) چالش‌های شبکه‌سازی ← hozouri | جزئی | §6.2 ص ۱۲–۱۳؛ §2.3 ص ۷–۸ | سه مورد از چهار مورد زیر در منبع «ویژگی»اند نه «چالش شبکه‌سازی»؛ بنویسید «ویژگی‌های ذاتی VANET به چالش‌های شبکه‌سازی منجر می‌شوند» |
| ۲۳۶ | تکه‌تکه شدن مکرر شبکه بر اثر تراکم و تحرک | پشتیبانی‌شده | ص ۷ بند ۳ | دقیق‌تر: «کاهش چگالی» گره‌ها و سرعت بالا باعث تکه‌تکه شدن می‌شود |
| ۲۳۷ | مشکلات مسیریابی | جزئی | ص ۱۲–۱۳ §6.2؛ شکل ۶ | منبع فقط نام می‌برد، توضیحی ندارد؛ برای بسط به منبع دیگری نیاز است |
| ۲۳۸ | «کمبود طیف: استاندارد خودرو به شبکه و ابر (DSRC) مشکلات قابلیت اطمینان و مقیاس‌پذیری دارد» | جزئی (ترجمه نادرست) | ص ۷ بند ۷؛ جدول ۱ ص ۳ («DSRC Dedicated Short Range Communication») | ⚠️ DSRC = **Dedicated Short-Range Communications** = «ارتباطات اختصاصی کوتاه‌برد»؛ «خودرو به شبکه و ابر» کاملاً نادرست. اصلاح: «در شبکه‌های متراکم و بزرگ، VANETهای مبتنی بر DSRC/WAVE به‌دلیل کمبود کانال‌های فرکانسی (هر خودرو به‌طور دوره‌ای از هفت کانال DSRC استفاده می‌کند) دچار ازدحام، افزایش تأخیر و کاهش گذردهی می‌شوند» |
| ۲۳۹ | اثرات محیطی: ساختمان، خودرو، درخت | پشتیبانی‌شده | ص ۸ بند ۸ | اصطلاحات multipath، fading، shadowing را بیفزایید |
| ۲۴۷ | منابع مشترک: کانال‌های پهنای باند و RSU | پشتیبانی‌شده | ص ۱۳ §6.3 | — |
| ۲۴۸ | تخصیص منابع رادیویی؛ MAC برای دسترسی عادلانه | پشتیبانی‌شده | ص ۱۳ §6.4 | «کاهش اتلاف بسته» و عوامل دشوارکننده را بیفزایید |
| ۲۴۹ | هزینه استقرار، نیاز به سرمایه‌گذاری قابل‌توجه | غیرقابل‌تأیید (از این منبع) | فقط برچسب «VANET infrastructure deployment challenges» شکل ۶ ص ۱۲، ص ۱۸ | به «چالش‌های استقرار زیرساخت» تغییر دهید یا ادعای هزینه را به منبع دیگر (احتمالاً niSecuringFogComputing2018 — بررسی نشد) ارجاع دهید |
| ۳۴۱ | بلاکچین دفتر کل دیجیتال غیرمتمرکز و توزیع‌شده، ثبت ایمن و شفاف تراکنش‌ها | پشتیبانی‌شده | ص ۱۶ §7.3 | — |
| ۴۲۰ | افزایش امنیت: تعیین صحت پیام‌های پخش‌شده | پشتیبانی‌شده | ص ۱۶ («veracity of broadcast messages») | — |
| ۴۲۱ | حریم خصوصی: رمزنگاری کلید عمومی | پشتیبانی‌شده | ص ۱۶ («demand public key encryption») | — |
| ۴۲۲ | مدیریت اعتماد: ذخیره مقادیر اعتماد در بلاکچین | پشتیبانی‌نشده (از این منبع) | در §7.3 نیامده | فقط به raza ارجاع دهید (در این یادداشت بررسی نشد) |
| ۴۲۳ | مدیریت هویت: مدیریت غیرمتمرکز کلید و گواهی | پشتیبانی‌نشده (از این منبع) | در §7.3 نیامده (مدیریت کلید فقط به‌عنوان چالش در ص ۸ بند ۱۱) | فقط به raza/منبع دیگر ارجاع دهید |
| ۴۲۴ | ردیابی خودرو: جلوگیری از دستکاری کیلومترشمار | پشتیبانی‌شده | ص ۱۶ (Volkswagen، «tricking odometers») | نام Volkswagen و هدف (جلوگیری از گران‌فروشی توسط فروشندگان) را ذکر کنید |
| ۱۹۱ (بدون ارجاع hozouri) | انواع V2X شامل V2N و VTU | جزئی (اطلاعاتی) | ص ۶ §2.2 | V2N در hozouri نیست؛ پهپاد = «V2U» در منبع؛ در صورت ارجاع به hozouri، I2I، V2B، V2S را بیفزایید |

**شمارش (۲۶ ادعا):** پشتیبانی‌شده ۱۲ | جزئی ۱۱ | پشتیبانی‌نشده ۲ | غیرقابل‌تأیید ۱.

---

## ۵. اصطلاحات

| English | معادل پیشنهادی فارسی |
|---|---|
| Vehicular Ad hoc Network (VANET) | شبکه اقتضایی خودرویی |
| Mobile Ad hoc Network (MANET) | شبکه اقتضایی سیار (نه «خودمختار متحرک») |
| On-Board Unit (OBU) | واحد درون‌خودرویی / واحد سوار بر خودرو |
| Road-Side Unit (RSU) | واحد کنارجاده‌ای |
| Dedicated Short-Range Communications (DSRC) | ارتباطات اختصاصی کوتاه‌برد |
| Wireless Access in Vehicular Environments (WAVE) | دسترسی بی‌سیم در محیط‌های خودرویی |
| IEEE 802.11p | استاندارد IEEE 802.11p (بدون ترجمه) |
| Cellular V2X (C-V2X) | V2X مبتنی بر شبکه سلولی |
| Inter-Vehicular Communication (IVC) | ارتباط میان‌خودرویی |
| Infrastructure-to-Infrastructure (I2I) | زیرساخت به زیرساخت |
| Vehicle-to-Barrier (V2B) | خودرو به مانع کنارجاده |
| Vehicle-to-Sensor (V2S) | خودرو به حسگر |
| Network fragmentation | تکه‌تکه شدن (گسستگی) شبکه |
| Spectrum scarcity | کمبود طیف فرکانسی |
| Multipath propagation / fading / shadowing | انتشار چندمسیره / محوشدگی / سایه‌افکنی |
| Medium Access Control (MAC) | کنترل دسترسی به رسانه |
| Fault tolerance | تحمل‌پذیری خطا |
| Non-repudiation | انکارناپذیری |
| Key revocation | ابطال کلید |
| Infotainment | اطلاعات-سرگرمی |
| Software-Defined Networking (SDN) / control plane / data plane | شبکه نرم‌افزارمحور / صفحه کنترل / صفحه داده |
| Southbound Interface | رابط جنوبی |
| Smart contract | قرارداد هوشمند |
| Public / Private / Consortium blockchain | بلاکچین عمومی / خصوصی / کنسرسیومی |
| Vehicular Cloud (VANET Cloud) | ابر خودرویی |

---

## ۶. شکل‌ها و جداول قابل استفاده

| شماره | صفحه | محتوا | ارزش برای report |
|---|---|---|---|
| جدول ۱ | ۳–۴ | فهرست اختصارات | کم؛ دارای خطا (LTE، IP، RAN) — فقط برای بسط DSRC |
| شکل ۱ | ۵ | اجزای خودروی هوشمند | متوسط؛ پشتوانه پاراگراف OBU/حسگرها |
| شکل ۲ | ۶ | ارتباطات پایه VANET (V2V, V2I, V2U, V2P, V2B, V2C, I2I با RSU و Cloud) | **بالا**؛ جایگزین/مکمل شکل `fig:vanet_arch` report (با بازترسیم و ذکر منبع) |
| شکل ۳ | ۹ | رده‌های شبکه MANET | متوسط؛ برای پاراگراف «VANET زیرمجموعه MANET» |
| شکل ۴ | ۱۰ | ۱۰ استاندارد دسترسی بی‌سیم (DSRC, 5G, WiMAX, 4G/LTE, Satellite, mmWave, Zigbee, Wi-Fi, Bluetooth, VLC) | **بالا** برای بخش شبکه‌سازی |
| شکل ۵ | ۱۱ | رده‌بندی چهارگانه کاربردها با فهرست نمونه‌ها | **بالا** برای بخش اهمیت (خطوط ۲۰۶–۲۱۱) |
| شکل ۶ | ۱۲ | رده‌بندی سه‌شاخه‌ای چالش‌ها (کاربرد / شبکه داده / مدیریت منابع) | **بالا**؛ می‌تواند ساختار فصل «محدودیت‌ها و چالش‌ها» را تعیین کند (اصل از Hussein et al. 2022 [3]) |
| شکل ۷ | ۱۴ | سوئیچ OpenFlow در IoV | کم (مگر بخش SDN اضافه شود) |
| شکل ۸ | ۱۵ | اجزای شبکه خودرویی نرم‌افزارمحور | کم (عنوان با جایگاهش در §7.2 ناهمخوان است) |
| شکل ۹ | ۱۷ | ۱۶ موضوع آینده VANET (Trust-based VANET، 6G V2X، FL و…) | متوسط برای بخش «جهت‌های آینده» |

**یادداشت پایانی برای نویسنده:** شکل‌های ۲، ۵ و ۶ ظاهراً از Hussein et al. 2022 اقتباس شده‌اند (شکل ۶ صریحاً «[3]» دارد)؛ برای بازترسیم، منبع اصلی را ذکر کنید.
