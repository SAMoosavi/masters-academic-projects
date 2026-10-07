# یادداشت منبع: `xuInternetVehiclesBig2018`

> روش: متن کامل PDF محلی (۱۷ صفحه، صفحات مجله 19–35) با `pdftotext -layout` استخراج و خوانده شد. لوکیتورها به شکل «p.N، بخش/پاراگراف» و شماره صفحه مطابق صفحه‌بندی مجله‌اند. نقل‌قول‌ها عیناً به انگلیسی آمده‌اند.

---

## ۱. مشخصات و دسترسی

- **ارجاع کامل:** W. Xu, H. Zhou, N. Cheng, F. Lyu, W. Shi, J. Chen, X. (Sherman) Shen, "Internet of Vehicles in Big Data Era," *IEEE/CAA Journal of Automatica Sinica*, vol. 5, no. 1, pp. 19–35, Jan. 2018. DOI: 10.1109/JAS.2017.7510736
- **نوع:** مقاله مروری (survey)؛ دریافت Oct 10, 2017، پذیرش Nov 17, 2017 (p.19، پانویس).
- **دسترسی:** متن کامل — `/home/sam/Zotero/storage/7BJMSUEU/Xu et al. - 2018 - Internet of vehicles in big data era.pdf`.
- **بررسی متادیتای bib:** عنوان، نویسندگان (۷ نفر، به همان ترتیب)، تاریخ 2018-01، مجله، vol 5، no 1، pages 19–35، DOI همه با صفحه اول PDF مطابق‌اند. ✅ نکته جزئی: در abstract داخل bib «which are referred to» آمده ولی در PDF «which is referred to» است (بی‌اهمیت؛ abstract در خروجی چاپ نمی‌شود).

## ۲. خلاصه ساختاریافته

- **مسئله:** رشد خودروهای متصل و حسگرها، حجم و تنوع داده خودرویی را به سطح «Big Data» رسانده و VANET سنتی را به چالش کشیده است (p.19، ستون ۲).
- **ادعای محوری:** رابطه IoV و کلان‌داده «دوسویه» است: (۱) IoV باید اکتساب، انتقال، ذخیره‌سازی و پردازش کلان‌داده را پشتیبانی کند؛ (۲) IoV از کاوش کلان‌داده سود می‌برد (p.19، پاراگراف آخر؛ Fig. 1, p.20).
- **ساختار:** بخش II — پشتیبانی IoV از کلان‌داده (اکتساب، انتقال: الزامات/چالش‌ها/MAC/مسیریابی/گسترش هوایی، ذخیره‌سازی، محاسبات)؛ بخش III — IoV مبتنی بر کلان‌داده (مشخصه‌سازی و ارزیابی کارایی، طراحی پروتکل، خودروی خودران)؛ بخش IV — مسائل نوظهور؛ بخش V — جمع‌بندی (p.20).
- **نتیجه:** «on one hand IoV can support the big data acquisition, transmission, storage and computing, and on the other hand the big data can enhance IoV in terms of network characterization, performance analysis and protocol design» (p.30، Conclusion).
- **محدودیت برای این گزارش:** مقاله درباره امنیت/حریم خصوصی تقریباً چیزی ندارد (فقط یک جمله ارجاعی، p.29؛ و یک جمله درباره تشخیص منبع مخرب، p.30). مقاله شبکه‌محور/داده‌محور است، نه امنیت‌محور.

## ۳. استخراج محتوا برای بسط متن

### ۳.۱ برای «تعریف و مفهوم» (report.tex خط 182) و تمایز IoV/VANET

- **تعریف VANET سنتی:** «Traditional VANETs consider the vehicle as a network node to transmit or relay the data traffic among vehicles and infrastructures through the Vehicle-to-Vehicle (V2V) communication and Vehicle-to-Infrastructure (V2I) communication» (p.19، Introduction، پاراگراف ۲).
- **کاربرد V2V/V2I:** «the V2V communication can enable vehicles to share information directly with their neighbors for safety message dissemination, while the V2I communication can be used to collect the information from infrastructure facilities» (p.19، ستون ۲، پاراگراف ۱).
- **گذار VANET → IoV (تعریف کلیدی):** خودروها اکنون «are not only a moving network node, but also a computer and storage center with intelligent process capability, which evolve the traditional VANETs to IoV, by connecting large-scale intelligent vehicles with advanced telematics» (p.19، ستون ۲).
- از چکیده: «By significantly expanding the network scale and conducting both real-time and long-term information processing, the traditional VANETs are evolving to the Internet of Vehicles (IoV)» (p.19، Abstract).
- **محورهای تمایز (قابل تبدیل به یک پاراگراف):** (الف) مقیاس شبکه بزرگ‌تر؛ (ب) پردازش هم بلادرنگ و هم بلندمدت؛ (ج) خودرو به‌عنوان مرکز محاسبه/ذخیره، نه فقط گره رله؛ (د) دسترسی‌های رادیویی ناهمگون (Abstract: «heterogeneous radio access technologies»).
- **فناوری‌های دسترسی:** شبکه‌های سلولی برای پوشش وسیع؛ small cells برای کاهش هزینه و افزایش اتصال؛ در آمریکای شمالی نصب DSRC OBU مبتنی بر IEEE 802.11p روی خودروهای عرضه‌شده «mandatory» ذکر شده (p.19، ستون ۲). ⚠️ این ادعای «اجباری بودن» در مقاله با ارجاع به استاندارد [6] آمده و از نظر تاریخی محل تردید است؛ اگر استفاده شد، با احتیاط نقل شود.
- **ارتباط با ویژگی‌های متمایز (خط 220 گزارش، «منابع محاسباتی نامحدود»):** Xu فقط می‌گوید «vehicles now are equipped with powerful processing unit and large storage devices» (p.19). «نامحدود» در این منبع نیست.

### ۳.۲ برای «اهمیت VANET» (خطوط 209 و 211)

**بهینه‌سازی ترافیک — آنچه منبع واقعاً می‌گوید:**
- V2X برای ارتباط خودرو و زیرساخت ITS «to predict the traffic condition and calculate the optimal navigation route [14]» (p.20، ستون ۲).
- کاربردهای «travel comfort» (تحمل‌پذیر به تأخیر) «can help improve driving experience and road efficiency» با انتشار اعلان‌ها مانند «traffic signal status, traffic condition of the road ahead, the information of available parking lots nearby» (p.22، II-B-1).
- کلان‌داده برای پیش‌بینی «traffic flow, short-term route...» (p.28، III-B-1) — توجه: این پیش‌بینی برای بهینه‌سازی **انتقال داده** است، نه مدیریت ترافیک جاده.
- خدمات: «the traffic condition that is oriented from the vehicle mobility data can be shared via IoV and then infer the best route and provide real time navigation for vehicles» (p.30، IV-B).
- پهپادها برای پایش ترافیک: «drones can integrate with traffic surveillance system to monitor vehicle traffic dynamically» (p.22، II-A-2).
- ❌ «مدیریت هوشمند تقاطع‌ها» در این منبع **یافت نشد** (کلمه intersection فقط در عنوان مرجع [73] آمده).

**خودروهای خودران (بخش III-C, pp.28–29):**
- «The IoV big data is a key enabling technology of the revolutionary autonomous vehicles» (p.28، III-C، جمله اول).
- همگرایی داده: داده حسگرهای داخلی (camera, radar, Lidar, GPS) + «information shared from other connected vehicles, e.g., road condition, traffic information» (p.28).
- حجم: «It is predicted that the self-driving vehicle can generate over 1 Tera Bytes data per hour [139]» (p.28).
- کاربردها: ادراک محیط (environment perception) با بینایی ماشین و DNN؛ نقشه HD («about several Giga Bytes per kilometer»، p.29)؛ مکان‌یابی دقیق با LiDAR + HD map که از روش‌های GPS-IMU-odometry «by over an order of magnitude» بهتر است (p.29).
- چالش‌ها (p.29، پاراگراف آخر): نیاز به «extremely large storage and high computing capability»؛ تجهیزات گران (Nvidia DRIVE PX)؛ برون‌سپاری به ابر نیازمند «massive connections, very high data rates and low latency»؛ مسائل اخلاقی؛ و «The IoV data security and privacy issues can also be a big concern for autonomous vehicles» — **تنها جمله امنیتی مرتبط**؛ پل خوبی به فصل امنیت گزارش.
- Platooning: انتقال پیام کنترلی بین پلاتون‌ها با V2V (p.20)؛ کنترل آرایش خودروها (platooning, clustering) (p.27).

**دسته‌بندی کاربردها (برای پاراگراف مقدمه اهمیت):** «Two major categories of applications are extensively researched in IoV, namely, road safety and travel comfort» (p.22، II-B-1). پیام ایمنی: موقعیت، سرعت، جهت، شتاب، راهنما؛ اندازه «normally 200−500 bytes» با قیود سخت تأخیر و قابلیت اطمینان (p.22).

### ۳.۳ برای «چالش‌های مقیاس‌پذیری» (خطوط 254–260)

**اعداد کلیدی (عیناً):**
- «it is predicted that one fifth vehicles on road will have Internet connection and the global vehicular traffic is expected to reach 300 000 Exabyte by the year of 2020 [1]» (p.19، Introduction، جمله اول). منبع [1] گزارش Business Insider 2016 است (ثانویه/غیرعلمی).
- **عدد «هزاران گیگابایت در روز»:** «It is predicted that there will be more than 200 sensors on future vehicles in 2020 [7], and around 4000 GB data will be generated every day [10]» (p.20، II-A). منبع [10] یک بلاگ (driverlessguru، درباره Intel) است. متن صریحاً «per vehicle» نمی‌گوید، ولی سیاق جمله (حسگرهای خودرو) آن را القا می‌کند. → عدد دقیق: **حدود 4000 GB در روز** (پیش‌بینی).
- خودروی خودران: «over 1 Tera Bytes data per hour» (p.28).
- Table I (p.21): پهنای باند حسگرها — Lidar «∼10−70 MBps»، Camera «∼20−40 MBps»، Radar/Sonar «∼10−100 KBps»، GPS «∼50 KBps».

**ریشه چالش:**
- «This exponential growth of generated vehicular data, together with the increasing data demands from in-vehicle users, has led to a tremendous amount of data in VANETs [7]» (p.19).
- تنوع داده از منابع پراکنده جغرافیایی با QoS سخت: «restricted service delay, extremely high delivery rate, massive connections» → «both the data type and data amount are greatly expanded, and thus pose challenges in traditional VANETs [8]» (p.19).

**چالش‌های انتقال کلان‌داده نسبت به MANET عادی (p.22، II-B-2) — هر کدام یک جمله پروزی:**
1. کانال بی‌سیم خشن (ساختمان، تونل، پل، محوشدگی چندمسیره).
2. کمبود طیف: FCC فقط «75 MHz licensed spectrum for DSRC» اختصاص داده که «insufficient to support the IoV transmission under high-density condition for media-rich applications».
3. تحرک بالا: قطع مکرر اتصال با RSU، تغییر شدید توپولوژی، سربار دسترسی به اینترنت به‌خاطر handover.
4. چگالی متغیر خودرو: از ترافیک سنگین تا جاده خلوت؛ پروتکل باید تطبیق یابد.
5. نبود هماهنگ‌کننده سراسری: «It is difficult to deploy central coordinator for IoV since IoV comprises of heterogeneous access network and expands to wide areas» → پروتکل‌ها باید توزیع‌شده باشند (p.23).
- MAC: 802.11p در چگالی بالا «serious issues with unbounded delay and channel congestion» (p.23). Flooding → «broadcast storm» (p.23).
- مقیاس‌پذیری صریح: «Since IoV network is highly dynamic, the network protocol should be scalable to the network size and changing topology» (p.30، IV-A-2).
- افزونگی داده: «The big data in IoV can be of great redundancy» → نیاز به حذف افزونگی برای کاهش سربار انتقال، ذخیره و پردازش (p.30، IV-A-1).

**پردازش و ذخیره (برای بولت سوم):**
- ذخیره سریع/متوسط/کند بر اساس تأخیر؛ کاربردهای حساس (ایمنی، رانندگی خودکار) باید از ذخیره سریع استفاده کنند (p.26).
- NVIDIA DRIVE PX «can be scaled to support 24 trillion deep learning operations in one second» (p.26). خودروها «networked computing centers» (p.26).
- محاسبات تعاونی بین خودروها، ابر خودرویی (پارکینگ فرودگاه به‌عنوان دیتاسنتر) (pp.26–27).

### ۳.۴ برای «معماری IoV» (اگر بخشی در گزارش اضافه شود)

- **Fig. 1 (p.20) «IoV big data architecture»** و **Fig. 2 (p.21) «IoV big data overview»**: رابطه دوسویه IoV ↔ Big Data.
- **منابع داده:** خودرو (on-board: سرعت، موتور، ترمز؛ on-road: فاصله بین خودروها، ویدئو، وضعیت چراغ، نقشه)، مسافران (گوشی هوشمند، شبکه اجتماعی خودرویی)، زیرساخت کنارجاده و اینترنت (p.20، II-A)، و سکوهای فضایی/هوایی: ماهواره، HAP («20 km altitude with 20−30 km coverage radius»)، پهپاد (pp.21–22).
- **گسترش هوایی** (p.25): اتصال فراگیر، لینک LoS هوا-زمین، استقرار پویا؛ معماری تعاونی هوایی-زمینی Zhou et al. [72].
- **لایه‌های ذخیره‌سازی:** on-board (OBU، SSD چندترابایتی)، کنارجاده (RSU تجاری Cohda با «10 GigaBytes on-board storage»)، اینترنتی/ابری (p.26).
- **محاسبات:** OBU، RSU (Cohda MK5: ARMv7، Linux 3.10)، ابر خودرویی، edge (pp.26–27).
- **IoV نرم‌افزارمحور:** «software defined IoV [147]» (p.30).

## ۴. بررسی ادعاهای فعلی

| خط | ادعا | حکم | لوکیتور | اصلاح پیشنهادی |
|---|---|---|---|---|
| 182 | در VANET خودروها گره متحرک‌اند و اطلاعات ایمنی و ترافیکی را به اشتراک می‌گذارند | پشتیبانی‌شده | p.19: «consider the vehicle as a network node to transmit or relay the data traffic…»؛ «V2V… for safety message dissemination» | بدون تغییر؛ می‌توان افزود که VANET سنتی در حال گذار به IoV است (p.19). |
| 209 | بهینه‌سازی ترافیک: مدیریت هوشمند تقاطع‌ها، کاهش ازدحام، بهبود جریان | جزئی | p.20 (پیش‌بینی وضعیت ترافیک و مسیر بهینه [14])؛ p.22 («road efficiency»)؛ p.30 (best route, real time navigation) | «مدیریت تقاطع» را حذف کنید (در منبع نیست). پیشنهاد: «پیش‌بینی وضعیت ترافیک، مسیریابی بهینه و ناوبری بلادرنگ و اطلاع‌رسانی وضعیت چراغ و پارکینگ». «کاهش ازدحام» صریح نیست (congestion در منبع به ازدحام کانال اشاره دارد). |
| 211 | خودروهای خودران: پشتیبانی از رانندگی خودکار با تبادل اطلاعات بلادرنگ | پشتیبانی‌شده (با ظرافت) | p.28، III-C: «key enabling technology…»؛ «information shared from other connected vehicles» | منبع این را در قالب **IoV/کلان‌داده** می‌گوید نه VANET؛ بهتر است «کلان‌داده IoV، شامل داده حسگرها و اطلاعات دریافتی از خودروهای دیگر» ذکر شود. |
| 254 | مقیاس‌پذیری یکی از مهم‌ترین چالش‌های VANET است | جزئی | p.19: «pose challenges in traditional VANETs»؛ p.30: «should be scalable to the network size» | منبع «مهم‌ترین» نمی‌گوید؛ پیشنهاد: «رشد حجم و تنوع داده، VANET سنتی را با چالش مواجه کرده و ضرورت مقیاس‌پذیری پروتکل‌ها را برجسته می‌کند». |
| 256 | افزایش خودروهای متصل نیازمند مدیریت حجم عظیم داده است | پشتیبانی‌شده | p.19: «tremendous amount of data in VANETs»؛ «300 000 Exabyte by… 2020» | می‌توان عدد 300 000 اگزابایت تا 2020 (پیش‌بینی، به نقل از Business Insider) را افزود. |
| 257 | حجم داده خودروهای هوشمند به هزاران گیگابایت در روز می‌رسد | جزئی | p.20: «around 4000 GB data will be generated every day [10]» | عدد دقیق را بنویسید: «حدود ۴۰۰۰ گیگابایت در روز (پیش‌بینی)»؛ این یک **پیش‌بینی** با منبع ثانویه (بلاگ Intel) است، نه اندازه‌گیری؛ زمان فعل را آینده/پیش‌بینی کنید. اختیاری: «بیش از ۱ ترابایت در ساعت برای خودروی خودران» (p.28). |
| 258 | پردازش بلادرنگ نیازمند منابع محاسباتی قابل توجه است | جزئی | p.29: «self-driving algorithms need extremely large storage and high computing capability» | در منبع برای خودروی خودران گفته شده؛ قید «به‌ویژه در رانندگی خودکار» اضافه شود. |
| 220 (cite دیگر) | «منابع محاسباتی نامحدود» | خارج از این منبع؛ این منبع آن را تأیید نمی‌کند | p.19: «powerful processing unit and large storage devices» | اگر Xu استفاده شود: «منابع پردازشی و ذخیره‌سازی قدرتمند»، نه «نامحدود». |

## ۵. اصطلاحات

| English | فارسی |
|---|---|
| Internet of Vehicles (IoV) | اینترنت خودروها |
| Vehicular Ad-hoc Network (VANET) | شبکه اقتضایی خودرویی |
| Big Data | کلان‌داده |
| automotive telematics | تله‌ماتیک خودرویی |
| heterogeneous radio access technologies | فناوری‌های دسترسی رادیویی ناهمگون |
| data acquisition / transmission / storage / computing | اکتساب / انتقال / ذخیره‌سازی / پردازش داده |
| on-board / on-road data | داده درون‌خودرویی / داده جاده‌ای |
| road safety / travel comfort applications | کاربردهای ایمنی جاده / آسایش سفر |
| delay-tolerant application | کاربرد تحمل‌پذیر به تأخیر |
| broadcast storm | طوفان پخش |
| push / pull / hybrid model | مدل ارسالی (push) / درخواستی (pull) / ترکیبی |
| contention-based / contention-free MAC | MAC مبتنی بر رقابت / بدون رقابت |
| topology-based / position-based routing | مسیریابی مبتنی بر توپولوژی / مبتنی بر موقعیت |
| High Altitude Platform (HAP) | سکوی ارتفاع بالا |
| Line-of-Sight (LoS) / Air-to-Ground (A2G) | دید مستقیم / هوا به زمین |
| vehicular cloud computing (VCC) | رایانش ابری خودرویی |
| trace-driven model | مدل مبتنی بر ردپا (داده واقعی) |
| environment perception | ادراک محیط |
| HD map | نقشه با وضوح بالا |
| platooning | کاروان‌سازی (حرکت دسته‌ای) خودروها |
| software defined IoV | اینترنت خودروهای نرم‌افزارمحور |

## ۶. شکل‌ها و جداول قابل استفاده

- **Fig. 1 (p.20) — IoV big data architecture:** مناسب برای بخش معماری/تعریف IoV؛ نشان‌دهنده رابطه دوسویه.
- **Fig. 2 (p.21) — IoV big data overview:** نقشه کلی محتوای مقاله؛ برای پاراگراف جمع‌بندی IoV.
- **Table I (p.21) — IoV sensing & application bandwidth:** بهترین شاهد عددی برای بخش مقیاس‌پذیری (Lidar ∼10−70 MBps، Camera ∼20−40 MBps). می‌توان آن را به فارسی بازسازی و با ارجاع آورد.
- **Fig. 3 (p.22) — IoV big data transmission support:** برای چالش‌های شبکه‌سازی/انتقال.
- **Fig. 4 (p.29) — Overview of IoV big data in autonomous vehicle:** برای بند خودروهای خودران.
- (محتوای تصویری شکل‌ها در استخراج متنی خوانده نشد؛ فقط عنوان‌ها تأیید شده‌اند.)

---
**خوداعتبارسنجی:** فایل کامل، بدون placeholder؛ همه ادعاها لوکیتور صفحه دارند؛ اعداد عیناً با واحد؛ موارد ناموجود در منبع (مدیریت تقاطع، «نامحدود»، «مهم‌ترین چالش») صریحاً علامت خورده‌اند.
