# یادداشت استخراج منبع: farsimadanReviewSecurityChallenges2025

> قرارداد مکان‌یابی: «ص. 310xx» شماره صفحهٔ مجله است (ص. PDF = شمارهٔ مجله − 31068). بخش‌ها با شماره‌گذاری خود مقاله آمده‌اند (مثلاً §III.C.4). نقل‌قول‌ها عیناً از متن PDF هستند.
> هشدار: جدول‌های 1–9 در PDF به‌صورت تصویر/متن غیرقابل‌استخراج‌اند؛ جدول 3 و 10 و شکل 3 با رندر تصویری خوانده شدند (شکل 3 با وضوح پایین — برچسب‌های ریز آن «نیازمند بازبینی چشمی» است). محتوای جدول‌های 4–9 بررسی نشد.

## 1. مشخصات و دسترسی

- **ارجاع کامل:** E. Farsimadan, L. Moradi, and F. Palmieri, "A Review on Security Challenges in V2X Communications Technology for VANETs," *IEEE Access*, vol. 13, pp. 31069–31094, 2025, doi: 10.1109/ACCESS.2025.3541035.
- **تاریخ‌ها (ص. 31069، سرصفحه):** Received 17 January 2025, accepted 6 February 2025, published 11 February 2025, current version 20 February 2025.
- **وابستگی:** Department of Computer Science, University of Salerno, Italy. مجوز CC BY 4.0 (دسترسی آزاد).
- **سطح دسترسی:** متن کامل (PDF محلی در `/home/sam/Zotero/storage/J6SW94JL/`، 26 صفحه، با `pdftotext` استخراج شد).
- **نوع منبع:** مقالهٔ مروری (survey) — دادهٔ تجربی یا ارزیابی اصیل ندارد؛ تمام ادعاهای فنی آن به منابع ثانویه [n] ارجاع دارند.
- **بررسی متادیتای bib (`report.bib` خط 20–32):**
  - نویسندگان، سال (2025)، مجله، جلد 13، صفحات 31069–31094، ISSN، DOI: **همه درست** (تطابق با سرصفحهٔ ص. 31069 و شمارهٔ آخرین صفحه 31094).
  - فیلد `number`/issue وجود ندارد — برای IEEE Access معمول است؛ مشکلی نیست.
  - خطایی یافت نشد.

## 2. خلاصهٔ ساختاریافته

- **مسئله:** ارتباطات V2X (V2V، V2I، V2N، V2P) برای ایمنی و مدیریت ترافیک حیاتی‌اند، اما گردآوری و توزیع گستردهٔ داده نگرانی‌های امنیتی و حریم خصوصی ایجاد می‌کند؛ مهاجم می‌تواند کنترل خودرو را به‌دست گیرد (ص. 31070، §I.A).
- **روش:** مرور نظام‌مند مطالعات «ده سال اخیر» (ص. 31069، چکیده؛ ص. 31090، §VI). ساختار: §II ویژگی‌ها و کاربردها، §III چالش‌ها/الزامات/طبقه‌بندی حملات، §IV طبقه‌بندی راهکارها، §V مسائل باز و جهت‌های آینده (ص. 31073).
- **ارزیابی:** ندارد (مروری). مقایسه با مرورهای پیشین در جدول 1 (ص. 31072).
- **نتایج کلیدی:**
  - چهار دستهٔ نگرانی امنیتی خودرویی: تهدیدهای غیرقابل‌پیش‌بینی، اتصال محدود (به‌روزرسانی OTA)، توان محاسباتی محدود، خطر جانی برای سرنشینان (ص. 31070–31071، §I.A.1–4).
  - چالش‌های امنیتی در هشت حوزه: زیرساخت، پایگاه‌داده، RKE، DSRC/WAVE، سلولی، ZigBee، Wi-Fi/WiMAX، UWB (§III.A، جدول 3).
  - هفت الزام امنیتی (§III.B، شکل 3).
  - طبقه‌بندی پنج‌گانهٔ حملات (§III.C، جداول 4–9).
  - طبقه‌بندی پنج‌گانهٔ راهکارها: رمزنگاری و بلاکچین، یادگیری ماشین/عمیق، رفتار/اعتماد/حریم، هویت، 5G/6G (§IV، جدول 10).
  - هفت مسئلهٔ باز (§V.A، ص. 31088–31089).
- **محدودیت‌ها (برداشت ناقد، نه ادعای مقاله):** مرور روایی است، روش جست‌وجو/معیار ورود گزارش نشده (فقط «ده سال اخیر»)؛ اعداد کمی تقریباً نمی‌دهد؛ بخش AI صرفاً توصیف یک‌خطی از هر مقاله است بدون معیارهای دقت؛ ارجاع‌دهی گاه ناهماهنگ است (مثلاً [84] و [114] در جدول 10 زیر «Reinforcement Learning» آمده‌اند اما در متن یکی تحلیل ترافیک زنده و دیگری یادگیری فدرال است).

## 3. استخراج محتوا برای بسط متن

### 3.1. مقدمه (report.tex خط 165–167) — انگیزه و آمار

- **آمار WHO** (ص. 31070، §I.A): "New data from the World Health Organization reveals that 1.19 million people die yearly in vehicle crashes [7] which result in the leading cause of death for children and young adults."
  - منبع اولیه [7]: World Health Org. (2023). Road Traffic Injuries, https://www.who.int/news-room/fact-sheets/detail/road-traffic-injuries (ص. 31090، فهرست مراجع).
  - **بازهٔ «5 تا 29 سال» در این مقاله نیامده است**؛ فقط "children and young adults". برای عدد 5–29 باید مستقیماً به fact sheet سازمان جهانی بهداشت ارجاع داد (در این یادداشت تأیید نشد).
- آمار تکمیلی همان پاراگراف (ص. 31070): "More than 50% fatalities involve vulnerable road users, including pedestrians, cyclists, and motorcyclists."
- هدف سازمان ملل (ص. 31070): "The United Nations Decade of Action for Road Safety 2021–2030 indicates among its main objectives the reduction of road traffic deaths and injuries by at least 50% by 2030 [7]."
- کاربردهای V2X برای ایمنی (ص. 31070): forward collision warning, do-not-pass warning, queue warning, curve speed warning, optimal speed advice, parking discovery؛ و موارد جدید: محافظت از کاربران آسیب‌پذیر جاده، آگاهی موقعیتی در تغییر لاین/ادغام، هماهنگ‌سازی سرعت، رانندگی خودران، platooning.
- **ریشهٔ آسیب‌پذیری** (ص. 31077، §III.B): "Given the intrinsic broadcast character of wireless systems, which are susceptible to a wide range of network attacks, security is critical..." و "information sent between V2X objects can be replayed, forged, or eavesdropped on by an attacker" و مهاجم می‌تواند "mimic a legal V2X object, such as an automobile, RSU, etc., to transmit incorrect data".
- پیامد (ص. 31070): "An attacker may use the system's vulnerability to obtain access to and subsequently control vehicles, potentially resulting in hazardous driving circumstances and life-threatening accidents."

### 3.2. چهار نگرانی امنیتی پایه (قابل افزودن به «محدودیت‌ها و چالش‌ها»)  (ص. 31070–31071، §I.A.1–4)

1. **Unpredictable threats:** نقاط نفوذ = remote communication technology، vehicle database، roadside infrastructure، vehicle parts؛ خودروسازان نمی‌توانند پیش‌بینی کنند هکرها کجا حمله می‌کنند چون روش‌ها مدام نو می‌شوند.
2. **Limited connectivity:** بیشتر خودروها به‌روزرسانی over-the-air را به‌موقع دریافت نمی‌کنند؛ "Over-the-air updates are increasingly standardized, but disconnected cars are still vulnerable due to incomplete or missing updates."
3. **Limited computational performance:** توان محاسباتی خودرو کمتر از رایانه/تبلت/گوشی است؛ عمر طولانی خودرو یعنی سخت‌افزار به‌روز نمی‌شود؛ "Some vehicular security solutions cannot be executed due to the high overhead associated with their limited computational capacity and performance."
   - ⚠ این با گزارهٔ report.tex خط 214 («منابع محاسباتی نامحدود») در تنش است؛ در عین حال خود مقاله در §II.A (ص. 31074) «no power limits» و «extensive computational processing» را ویژگی V2X می‌شمارد. پیشنهاد: در متن تمایز «بدون محدودیت انرژی» از «توان محاسباتی محدود نسبت به سربار رمزنگاری» صریح شود.
4. **Significant risks to safety:** "Vehicle faults ... can occur even when only a tiny number of sensors have been compromised, or a small number of illegitimate messages have been delivered."

### 3.3. ویژگی‌ها و معماری V2X (تقویت فصل «VANET چیست؟»)

- دو زیرشبکه (ص. 31073–31074، §II.A): **Intra-vehicle** (حسگرها با Ethernet، ZigBee، WiFi یا Bluetooth) و **Inter-vehicle** با چهار واحد: OBU، RSU، Road users (موتورسوار، دوچرخه‌سوار، عابر، اسکیت‌سوار)، Central/cloud server.
- معماری با TA (ص. 31069): "Together with OBUs and RSUs, a trusted authority component is also needed in the VANET architectures, providing centralized network management and supervision [5]."
- ویژگی‌ها (ص. 31074، §II.A): تراکم زیاد خودرو → سلول‌های کوچک؛ پیام‌های V2X "tiny in size and frequently exchanged" به‌صورت رویدادمحور یا دوره‌ای؛ نیاز به قابلیت اطمینان بسیار بالا و تأخیر end-to-end بسیار کم؛ جمع‌بندی: "high mobility, dynamic network topology, variable network density, no power limits, critical nature and extensive scalability of the network, extensive computational processing, and vehicle driver protection requirements."
- کاربردها (ص. 31074، §II.B، جدول 2): متن می‌گوید «سه دسته» ولی چهار مورد برمی‌شمارد: (i) safety-support، (ii) traffic management and road efficiency، (iii) information, comfort, infotainment، (iv) autonomous driving and intelligent traffic systems. (ناسازگاری درونی مقاله؛ در نقل «چهار دسته» بنویسید.)

### 3.4. فناوری‌های ارتباطی و «استانداردسازی» (report.tex خط 264–270)

مقاله بخش مستقلی با عنوان «چالش استانداردسازی» یا «نبود استاندارد یکپارچه» ندارد. مطالب مرتبط موجود:
- **DSRC/WAVE** (ص. 31076): "DSRC is a set of standards that facilitate the transmission of messages with relatively secure and high-speed communications, low latency..." ؛ "The IEEE 802.11p standard, on which WAVE communications are based, guarantees that high-priority communications will not experience delays of more than tens of milliseconds [53]." آسیب‌پذیری WSA (WAVE service advertisement) [54].
- **ناکافی‌بودن DSRC و شبکهٔ ناهمگن** (ص. 31076): به ادعای [52] DSRC پیاده‌سازی کافی V2X نیست؛ پیشنهاد "Heterogeneous Network (Het-Net), which makes use of DSRC, LTE, and Wi-Fi."
- **سلولی** (ص. 31076): "The bandwidth of DSRC is so limited that it cannot handle upcoming V2X communications [11]"؛ جایگزین‌ها: LTE-V، C-V2X، 5G-NR.
- **5G** (ص. 31087): "Nowadays, the link-layer protocol utilized in V2X communication is 802.11p ... as the demands for ultra-low latency and high reliability have increased, the traditional security management models have been unable to meet these requirements without incurring significant operating costs and overhead [16]." مؤلفه‌های امنیتی جدید 5G/6G: AUSF، SCMF، ARPF، PCF، SEAF؛ 5G PPP.
- **چندمستأجری و تعامل‌پذیری** (ص. 31089، §V.A آخرین بند): ذی‌نفعان متعدد (network operators, road authorities, OEMs, municipalities, service providers)؛ "distributed ledger technologies like blockchain may be used to provide reliable interoperability between the multiple participants ... However, this may introduce additional time complexity."
- مرورهای پیشین: [20] "concentrates on the standardization methods used for communication technologies" و [22] مشخصات ETSI ITS را از نظر امنیت/حریم بررسی می‌کند (ص. 31071، §I.B).
- → پیشنهاد: بند استانداردسازی را بر اساس «تنوع فناوری‌ها (DSRC/802.11p، LTE-V/C-V2X، 5G-NR) و نیاز به Het-Net» و «تعامل‌پذیری میان ذی‌نفعان چندگانه» بازنویسی کنید؛ بندهای «استاندارد مشترک تبادل پیام و تصدیق هویت» و «چالش‌های بین‌المللی» از این منبع پشتیبانی نمی‌شوند.

### 3.5. چالش‌های امنیتی به تفکیک حوزه (§III.A، جدول 3، ص. 31074–31077)

| حوزه | تهدیدها | راهکارها (با مرجع ثانویه) | مکان |
|---|---|---|---|
| زیرساخت (V2I) | DDoS ("transferring redundant information by an attacker to a roadside unit system that prevents it from well-functioning")، malware، impersonation (جعل OBU/RSU)، eavesdropping | CVGuard [35]؛ تشخیص DDoS مبتنی بر SDN [36]؛ FPAP [37]؛ تصدیق سبک V2I با کلید گروهی از TA [34]؛ کلید خصوصی پویا دونیمه [38]؛ network slicing/isolation [39]–[41] | ص. 31074 |
| پایگاه‌داده (ابری/درون‌خودرو) | DoS، replay، hacking، session key disclosure، masquerade [44] | تصدیق پیش از ارتباط [44]؛ رمزنگاری سلسله‌مراتبی پایگاه‌داده [43]؛ حذف داده هنگام نفوذ [45] | ص. 31075 |
| RKE | eavesdropping، jamming، MitM، brute force، replay؛ آسیب‌پذیری Hitag2 | Secret Unknown Cipher [50]؛ گیرندهٔ مقاوم [46]؛ گذار به AES [49] | ص. 31075 |
| DSRC/WAVE | packet manipulation، replay، حمله به WSA | IEEE 802.11p + VLC [55]؛ Het-Net [52] | ص. 31076 |
| سلولی | نبود حفاظت رمزنگاری سیگنالینگ LTE، eavesdropping، jamming، femtocell/ایستگاه بی‌مجوز | SDN/NFV [62]؛ مدیریت کلید سبک [63] | ص. 31076 |
| ZigBee | افشای پیکربندی، سیستم‌های رمزنشده، replay | IDS، کلید شبکه پیش از نصب، timestamp [67]؛ چرخش device ID [68] | ص. 31076 |
| Wi-Fi/WiMAX | هک Tesla Model S (رمز SSID به‌صورت plain text) [69]؛ jamming؛ Evil Twin؛ DoS روی WPA | ترکیب تصادفی رمزشده [70]؛ دروازهٔ جداگانه برای کشف Evil Twin [71] | ص. 31076–31077 |
| UWB | eavesdropping در سکوهای کم‌توان؛ پهنای باند "more than 7 GHz" | time hopping به‌جای رمزنگاری [77] | ص. 31077 |

- دسته‌بندی داده‌های VANET (ص. 31075): به نقل از [43]: vehicle-centric، user-centric، location-centric؛ به نقل از [42]: GPS data، autonomous driving data، vehicle mobile network data، sensing data.

### 3.6. الزامات امنیتی (report.tex خط 306–313) — §III.B، ص. 31077–31078، شکل 3

مقاله **هفت** الزام دارد: "the V2X communication networks should meet the primary security requirements of availability, confidentiality, authenticity, integrity, authorization, and privacy" + Trust به‌عنوان معیار تکمیلی.
- **Availability:** "communications among V2X objects are analyzed and made available to their intended receivers in a well-timed way. Thus, it necessarily needs the use of lightweight and low-cost cryptography techniques." دسترسی حتی "during DoS attacks".
- **Data Confidentiality:** رمزنگاری داده؛ اما "because the information transferred in V2X is generally public, confidentiality may not be the highest priority, except for information about the privacy of vehicles' occupants." (نکتهٔ ظریف قابل استفاده در متن.)
- **Authentication:** "allows valid objects in V2X to be distinguished from malicious entities"؛ دو زیرنوع: message authentication (اصالت و عدم دستکاری بسته) و user/source authentication (اعتبار موجودیت).
- **Data Integrity:** "validated in a timely way to identify any data manipulation, alteration, or deletion during transmission."
- **Authorization and Access Control:** دسترسی عناصر مجاز به خدمات مطابق "a predefined series of policies and rules". ← **در report.tex جا افتاده است.**
- **Privacy, Anonymity, Untraceability** (ص. 31078): "anonymity is regarded as a subclass of privacy"؛ "RSUs can trace a vehicle's position ... during the authentication process"؛ "Untraceability implies that a vehicle's activities cannot be tracked, while unlinkability indicates that an unauthorized party should be unable to associate a vehicle's identity with that of its driver or owner." (پیوند مستقیم با فصل شبه‌نام/SSI گزارش.)
- **Trust:** "Trust can be defined as an entity's confidence in another entity that is a component of the vehicular network. Trust computation is an extra security criterion..."
- شکل 3 (خوانش با وضوح پایین — بازبینی شود): برای هر الزام، پارادایم ارتباطی و پیامدها: Availability→V2X (Safety, Financial, Operational)؛ Confidentiality→V2I (Privacy, Financial)؛ Authentication→V2X (Privacy, Operational)؛ Integrity→V2X (Safety, Financial, Operational)؛ Authorization→V2V, V2I (Safety, Financial, Operational)؛ Privacy→V2N, V2V, V2P (Safety, Financial, Privacy)؛ Trust→V2V (Privacy, Safety).

### 3.7. طبقه‌بندی حملات (الگوی تهدید، report.tex خط 277–302) — §III.C، ص. 31078–31082

طبقه‌بندی پنج‌گانه به نقل از [20], [81]: "attacks on infrastructure, attacks on hardware and software, attacks on privacy, data trust attacks, and attacks based on behavioral patterns". شکل 4 (ص. 31079): راست — هک RSU برای ارسال اطلاعات نادرست یا تحمیل رویدادی مثل ترمز شدید؛ چپ — خودروی مهاجم با BSM جعلی تصادف ایجاد می‌کند.

1. **حملات بر زیرساخت** (ص. 31079، جدول 4):
   - *Session hijacking:* تصدیق در شروع نشست انجام می‌شود و مهاجم بعداً نشست را تصاحب می‌کند. دفاع: PKI و TA — RSU هویت خودرو را نزد TA بررسی و سپس کلید را به اشتراک می‌گذارد.
   - *DDoS:* یک هماهنگ‌کننده که تعداد زیادی bot را کنترل می‌کند؛ "flood the system with hostile or at least undesired packets"؛ دفاع: تصدیق قوی و امضای دیجیتال در سطح گره.
   - *Unauthorized access:* دفاع رایج = شبه‌نام: "each vehicle node contains multiple key pairs ... The vehicle node can't be linked to the pseudonyms, but the relevant authority does have access to them. Vehicles are expected to get an updated pseudonym via RSUs when the previous pseudonym expires" [82]. (منبع خوب برای فصل شبه‌نام.)
   - *Hardware tampering:* توسط افراد مخرب هنگام سرویس سالانه؛ دفاع TPM [83].
   - *Masquerade:* استفاده از هویت مجاز، ساخت Blackhole یا جعل خودروی امدادی؛ دفاع: non-repudiation.
2. **حملات بر نرم‌افزار و سخت‌افزار** (ص. 31080، جدول 5):
   - *DoS:* مثال flooding کانال کنترل؛ دفاع: امضای دیجیتال، Tesla++ ("symmetric encryption with delayed key disclosures")، کلیدهای کوتاه‌عمر با تابع هش [85].
   - *Spoofing and forgery:* ارائهٔ اطلاعات موقعیت نادرست؛ دفاع: امضای پیام هشدار، VPKI، ارتباط گروهی، checksum غیررمزنگاری، plausibility check [86]؛ رادار درون‌خودرو یا گواهی‌های رمزنگاری [86], [87].
   - *MiM:* مهاجم بین فرستنده و گیرنده؛ "severely affects vehicular systems' authenticity, non-repudiation, and integrity"؛ دفاع: تصدیق قوی [88]، تصدیق همکارانهٔ دسته‌ای امضاها [89].
   - *Brute force:* به‌دلیل اتصال کوتاه دشوار است ولی ممکن؛ دفاع: کلید و رمزنگاری قوی [90].
3. **حملات بر حریم خصوصی** (ص. 31080–31081، جدول 6): *Identity revealing* (دفاع: تصدیق حافظ حریم)؛ *Location tracking* ("tracks the position of a vehicle as well as the route passed by the vehicle in a period"؛ دفاع: کلیدهای موقت و ناشناس).
4. **حملات بر اعتماد داده** (ص. 31081، جدول 7): "more common in V2I communications"؛ انواع: message tampering، masquerading، hidden vehicle، replay، illusion.
   - *Message tampering:* "alteration, deletion, modification, and construction of already-existing data"؛ دفاع: data correlation و challenge-response [93] (طرح امضای گروهی).
   - *Hidden vehicle:* هشدار موقعیت جعلی / GPS spoofing [81]؛ دفاع: مدیریت اعتماد [94].
   - *Illusion:* تولید اطلاعات نادرست با اتصال مشروع — تشخیص دشوار؛ دفاع: سیستم موقعیت با امضا، differential tracking [95].
5. **حملات مبتنی بر الگوی رفتاری** (ص. 31081–31082):
   - *Selfish* (جدول 8): message spoofing، traffic analysis (منفعل؛ دفاع: کلیدهای ناشناس پویا، شبه‌نام، امضای گروهی [93], [96])، **eavesdropping** (منفعل)، repudiation (سخت‌افزار مورداعتماد [98]).
   - *Malicious* (جدول 9): DoS، message replay (timestamp، شمارهٔ ترتیب امضاشده [86])، **Sybil** ("creates many vehicles on the roadway with similar Identifiers"؛ دفاع [99]: بررسی موقعیت منطقی، گواهی، طول عمر پیام و گزارش به CA)، malicious code، blackhole (IDS ترکیبی، مسیریابی امن).

⚠ تفاوت با report.tex: گزارش eavesdropping را در «زیرساخت»، و جعل و سیبل را در «اعتماد داده» آورده؛ در طبقه‌بندی این مقاله eavesdropping = selfish، spoofing/forgery = نرم‌افزار/سخت‌افزار، Sybil = malicious. (فهرست زیرساختی گزارش — DoS/impersonation/eavesdropping — درواقع از §III.A.1 ص. 31074 آمده است، نه از §III.C.1.) دو دستهٔ «نرم‌افزار/سخت‌افزار» و «الگوی رفتاری» در گزارش غایب‌اند.

### 3.8. راهکارهای رمزنگاری و بلاکچین (تقویت فصل بلاکچین) — §IV.A، ص. 31083–31084

- رمزنگاری عمدتاً در برابر تهدید **خارجی**: "such solutions are focused on defending against external threats made by unauthorized entities." در مقابل، به نقل از [154] (ص. 31088): "proactive security countermeasures such as cryptography techniques are susceptible to internal attacks (for example, position falsification and false warning generation attacks) performed by authenticated vehicles." — استدلال خوب برای ضرورت مدیریت اعتماد/شهرت.
- [110] بلاکچین برای V2V: beacon موقعیت → "position certificate"؛ دو فاز broadcasting (پیام رویداد شامل نوع رویداد، trust level، proof of location، pseudo-ID) و mining (همسایگان سطح اعتماد فرستنده را با قواعد تأیید پیام تعیین می‌کنند).
- [112]: روش‌های دفاعی سنتی "weak and unsuccessful primarily due to their centralized nature, in which cloud servers act as a bottleneck."
- [113]: "the vehicles' trust values are stored in a blockchain and shared among RSUs."
- [104]: تبادل کلید مبتنی بر بلاکچین بین مدیران امنیت؛ [109]: شبه‌نام + امضای مبتنی بر هویت.
- محدودیت (ص. 31089): بلاکچین برای تعامل‌پذیری "may introduce additional time complexity" → نیاز به تسریع رمزنگاری و مقیاس‌پذیری دفترکل توزیع‌شده (پیوند با انگیزهٔ IOTA Tangle در گزارش).

### 3.9. نقش هوش مصنوعی و یادگیری ماشین (report.tex خط 320–331) — §IV.B، ص. 31084–31085؛ جدول 10

**قاب کلی:**
- "Nowadays, there is a growing interest in applying ML techniques to vehicular network security to obtain better, faster, and more accurate attack detections and predictions." (ص. 31084)
- **سه روش کلاسیک کشف ناهنجاری در جریان داده** (ص. 31084): "1) rule-based learning, which validates each assessment based on existing knowledge, 2) cross-checking the metrics (for example, speed and Location) among various data streams from sensors, or 3) observing the data stream across a sliding window of time in order to spot abnormal trends." مشکل: "Due to the volume and variety of information, it is frequently challenging to construct handwritten rules".
- **جایگزینی IDS قاعده‌محور با ML/DL** (ص. 31084): DL پیش‌خور و بازگشتی برای تشخیص نفوذ [117] (DNN برای شبکهٔ درون‌خودرو)، [118] (LSTM برای ناهنجاری داده‌های شبکهٔ کنترل خودرو). مزایا: (الف) یک روش تشخیص برای سامانه‌های مختلف؛ (ب) "An ML-based detection system is data-driven, which means that it creates rules based on the data"؛ (ج) ساده‌تر شدن توسعهٔ نرم‌افزار امنیتی برای هر زیرسامانه.
- **CNN/LSTM — تشخیص مقاوم** (ص. 31084–31085): "Deep learning models comprising convolutional neural networks (CNN) and long short-term memory (LSTM) layers can be applied to sophisticated architectures that conduct robust detection by utilizing data from various temporally and geographically distinct data streams."
- مرور جامع MDS مبتنی بر ML: [159] (Boualouache & Engel, IEEE COMST 2023) (ص. 31084).

**طبقه‌بندی جدول 10 (ص. 31084):** Supervised Learning [117]–[126]؛ Unsupervised Learning [127]–[130]؛ Reinforcement Learning [84], [93], [114], [131]–[133]. (توجه: انتساب [84] و [114] به RL در جدول با شرح متن هم‌خوان نیست.)

**کارهای مشخص (ص. 31085 مگر خلاف آن ذکر شود):**
| کار | شرح در مقاله | مرجع اصلی |
|---|---|---|
| [119] | "a data-centric method for detecting misbehavior for the internet of vehicles" | Sharma & Liu, IEEE IoT J. 2021 |
| [127] | "an unsupervised model for detecting radio frequency jamming in V2X communications" | Karagiannis & Argyriou, Veh. Commun. 2018 |
| [128] | ML برای تشخیص چهار نوع حمله به cruise control: Velocity, Acceleration, Position, Velocity-Position | Jagielski et al., ACM WiSec 2018 |
| [129] | "a data-driven strategy for detecting DoS and three different kinds of in-vehicle network attacks"؛ "unsupervised learning is used to extract relevant features from information correlated with the controller area network (CAN) bus" | D'Angelo, Castiglione, Palmieri, IEEE IoT J. 2021 (هم‌نویسنده با منبع حاضر) |
| [84] | "detecting vulnerabilities by examining live network traffic packets" | Sherazi et al. 2019 (عنوان: DDoS attack detection ... IoV) |
| [114] | "the provider's concern about privacy and propose a blockchain-based federated learning model for secure information transmission" | Lu et al., IEEE TVT 2020 (asynchronous FL) |
| [120] | collaborative learning — خودروها تجربه را به اشتراک می‌گذارند برای بهبود تشخیص خودروی مخرب؛ "Cooperation between automobiles also raises privacy concerns." | Zhang & Zhu, arXiv 2020 (differentially private collaborative IDS) |
| [160] | "data-oriented trust mechanism" — خودرو از مدل ارزیابی اعتماد، مقدار اعتماد رویدادهایی چون speed regulation و path selection را می‌پرسد | Guo et al., TROVE, IEEE IoT J. 2020 (RL) |
| [121] | "a trust computation technique based on fuzzy logic to access the accuracy and integrity of event messages and their transmitters" (منطق فازی + مدل ML) | Soleymani et al., Symmetry 2020 |
| [131] | "a Q-learning approach to evaluate the trustworthiness of automated driving vehicles and identify invaders according to the calculated level of confidence"؛ دو روش ارزیابی direct و indirect | Xing, Su, Wang, INFOCOM WKSHPS 2019 |
| GAN | "Generative systems, like Generative Adversarial Networks (GANs), can be employed to create statistically identical invasion signals" برای ارزیابی سامانه‌های تشخیص | بدون مرجع مشخص |
| [132] | "physical authentication system based on RL to safeguard against unidentified spoofing attacks" | Lu et al., IEEE TVT 2020 |
| [133] | RL در شبکه‌های خودرویی نرم‌افزارمحور برای "the most secure communication link policy under the effect of malicious vehicles" | Zhang et al. (Deep RL + trust) |
| [122] | CNN برای segmentation بلادرنگ صحنهٔ رانندگی — سازوکار fallback در برابر GPS spoofing | Chen et al., DSNet 2020 |
| [123], [124] | پیش‌بینی مسیر/سرعت خودروهای اطراف: ML احتمالاتی [123]؛ RNN/LSTM [124] | |
| [125] | پیش‌بینی جریان ترافیک با DL در vehicular cloud | Lv et al., IEEE T-ITS 2015 |
| [130] | شناسایی راننده از رویدادهای شتاب/ترمز با "multi-class linear discriminant analysis classifier" | Fung et al. 2017 |
| [126] | مقایسهٔ ده مدل ML برای شناسایی رانندهٔ واقعی با حداقل ویژگی (friction torque, intake air pressure) | Martinelli et al., VTC 2020 |

**مفاهیم برای پاراگراف‌نویسی:**
- **Situational awareness** (ص. 31085): "Comprehension, perception, and projection of an environment's dynamics"؛ در امنیت خودرویی = راهبرد امنیتی در vehicular cloud که معماری و کانال‌ها را می‌شناسد؛ "much more challenging and complicated than intrusion detection" چون باید در محیط متغیر با داده‌های ناپایدار پیش‌بینی کند.
- **Fallback mechanism** (ص. 31085): "even the finest defensive strategies are susceptible to failure"؛ مثال: GPS spoofing موفق که خودرو را به سمت لبهٔ جاده هدایت می‌کند → خودرو باید بخش‌های امن/خطرناک جاده را تشخیص دهد (CNN segmentation).
- **احراز هویت راننده با ML** برای مقاومت در برابر سرقت با پنهان‌ماندن هویت واقعی (ص. 31085).
- **منطق فازی — گام‌ها** (ص. 31086، §IV.C): "the fuzzy sets, requirements, and criteria are established first. After that, the initialization of the input variables' values is done. Finally, the fuzzy system characterizes the output data and assesses the results by employing the fuzzy rules." کاربرد: تشخیص packet-dropping [147].
- **محدودیت یادگیری فدرال** (ص. 31089، §V.A): "While FL-based strategies are making improvements toward privacy-preserving V2X systems, they continue to depend on a server-client structure, which leaves them susceptible to various malicious activities. Furthermore, adversarial strategies and data poisoning may affect locally trained ML-based models." جهت آینده (ص. 31090): "designing robust and privacy-preserving FL-based models".
- **محدودیت داده و شبیه‌سازی** (ص. 31089): اکثر روش‌ها با شبیه‌سازی ارزیابی می‌شوند؛ شبیه‌سازها ضعیف‌اند؛ "most researchers do not make the used datasets in their evaluations publicly available" → نیاز به دیتاست‌های باز برای پژوهش یادگیری‌محور.
- ⚠ مقاله هیچ عدد دقت/F1 برای روش‌های ML گزارش نمی‌کند — در متن گزارش عدد کارایی به این منبع نسبت ندهید.

### 3.10. اعتماد، شهرت و حریم (پیوند با فصل‌های شهرت/شبه‌نام) — §IV.C–D، ص. 31085–31087

- Weighted-sum: "the most frequently used strategy for trust management"؛ با رفتار مخرب، اعتماد تا صفر کاهش می‌یابد (ص. 31086).
- گره‌های مخرب پیشرفته "hide themselves by intermittently changing between malicious and normal behaviors" (ص. 31086) — حملهٔ on-off.
- سازوکار پاداش (credit) و Payment Punishment System [140] (ص. 31086).
- تعریف سه‌گانه (ص. 31086): "Privacy implies that only authorized individuals within VANETs can possess the authority to access and control vehicle data, including actual identification and location information. In VANETs, trust management refers to the mechanisms by which a vehicle assesses the trustworthiness of other vehicles and the communications it receives."
- طرح‌های PPTM [143]، BTMPP [144] (bloom filter-based private set intersection)، PPRM [145]، PPRU [146] (ECC + Paillier، CSP «honest but curious») (ص. 31086–31087).
- هویت (ص. 31087): Group ID به‌جای هویت واقعی [150]؛ [91] شبه‌نام + threshold signature برای بازیابی هویت خودروی مخرب + threshold authentication؛ تشخیص سیبل با geographic proximity [148].

### 3.11. مسائل باز (برای فصل جمع‌بندی/چالش‌ها) — §V.A، ص. 31088–31089

- RSUها در بیشتر سازوکارهای متمرکز "completely trusted units" فرض می‌شوند، ولی همیشه در دسترس نیستند و خودشان آسیب‌پذیرند.
- RSU و سرورهای MEC به‌دلیل هزینهٔ نصب و بهره‌برداری پراکنده‌اند.
- "a single RSU is capable of efficiently spreading a Certificate Revocation List (CRL) in an urban area" اما قابلیت اطمینان و ازدحام حل‌نشده است.
- هزینهٔ فناوری V2X قیمت خودرو را بالا می‌برد.
- چندمستأجری 5G/6G و نقش بلاکچین برای تعامل‌پذیری (بالاتر، §3.4).

## 4. بررسی ادعاهای فعلی report.tex

| خط | ادعا | حکم | مکان شاهد | اصلاح پیشنهادی |
|---|---|---|---|---|
| 165 | سالانه **بیش از** 1.19 میلیون نفر در تصادفات جان می‌دهند | جزئی | ص. 31070، §I.A | منبع می‌گوید "1.19 million"، نه «بیش از». «حدود ۱.۱۹ میلیون» بنویسید؛ منبع اولیه WHO 2023 [7] را هم ذکر کنید. |
| 165 | مهمترین عامل مرگ کودکان و جوانان **۵ تا ۲۹ ساله** | جزئی | ص. 31070 | منبع فقط "children and young adults" دارد. یا بازهٔ سنی را حذف کنید یا مستقیماً به fact sheet WHO ارجاع دهید (عدد 5–29 در این مقاله نیست). |
| 167 | ماهیت بی‌سیم و باز → آسیب‌پذیری؛ جعل پیام، سیبل، مرد میانی و نقض حریم از مهمترین چالش‌ها | پشتیبانی‌شده | ص. 31077 §III.B؛ ص. 31080 (spoofing/forgery, MiM)؛ ص. 31082 (Sybil)؛ ص. 31080–31081 (privacy) | — |
| 264 | نبود استانداردهای یکپارچه یکی از چالش‌های مهم است | پشتیبانی‌نشده | — (چنین گزاره‌ای در مقاله یافت نشد) | یا منبع دیگری بیاورید یا بازنویسی بر اساس §3.4 این یادداشت. |
| 266 | تنوع فناوری‌ها (DSRC, LTE, 5G) و نیاز به سازگاری | جزئی | ص. 31076 (Het-Net: DSRC, LTE, Wi-Fi؛ LTE-V, C-V2X, 5G-NR)؛ ص. 31087 | «Het-Net مرکب از DSRC، LTE و Wi-Fi» و «ناکافی‌بودن پهنای باند DSRC» را بنویسید. |
| 267 | نیاز به استاندارد مشترک برای تبادل پیام و تصدیق هویت | پشتیبانی‌نشده | — | حذف یا منبع جدید. |
| 268 | چالش‌های بین‌المللی در یکپارچه‌سازی | پشتیبانی‌نشده | — (نزدیک‌ترین: چندمستأجری ص. 31089؛ پروژه‌های EU/ETSI در [22] ص. 31071) | بازنویسی به «تعامل‌پذیری میان ذی‌نفعان متعدد» با ارجاع ص. 31089. |
| 279 | حفظ تعادل بین کاهش مؤثر تهدید و حداقل تأثیر بر عملکرد اهمیت دارد | جزئی | ص. 31070 §I.A.3 (سربار)؛ ص. 31077 (رمزنگاری سبک برای availability)؛ ص. 31087 (سربار مدل‌های سنتی) | ایده با این سه شاهد پشتیبانی می‌شود ولی عبارت مستقیم نیست؛ همین سه شاهد را بنویسید. ضمناً «انجام شد» → «انجام‌شده». |
| 277–302 | ساختار الگوی تهدید: زیرساخت / حریم / اعتماد داده | جزئی | ص. 31079، §III.C | منبع پنج دسته دارد؛ «نرم‌افزار و سخت‌افزار» و «الگوی رفتاری (selfish/malicious)» را بیفزایید. |
| 284 | DoS: اشباع RSU با اطلاعات اضافی | پشتیبانی‌شده (بدون cite در گزارش) | ص. 31074 §III.A.1 (DDoS) | cite بیفزایید؛ در منبع «DDoS» است. |
| 285 | تقلید هویت OBU/RSU | پشتیبانی‌شده (بدون cite) | ص. 31074 | cite بیفزایید. |
| 286 | استراق سمع ذیل «حملات بر زیرساخت» | جزئی | ص. 31074 (ذیل چالش زیرساخت) / ص. 31082 (در طبقه‌بندی = selfish) | ذکر کنید که در طبقه‌بندی حملات، استراق سمع حملهٔ منفعل و از نوع selfish است. |
| 291–292 | افشای هویت؛ ردیابی موقعیت | پشتیبانی‌شده | ص. 31080–31081، §III.C.3 | — |
| 297 | دستکاری پیام (تغییر/حذف/اصلاح) | پشتیبانی‌شده | ص. 31081، §III.C.4 | — |
| 298 | جعل ذیل «اعتماد داده» | جزئی | ص. 31080 (spoofing/forgery ذیل SW/HW)؛ ص. 31081 (illusion ذیل data trust) | یا «illusion attack» بنویسید یا جعل را به دستهٔ نرم‌افزار/سخت‌افزار منتقل کنید. |
| 299 | سیبل ذیل «اعتماد داده» | جزئی | ص. 31082 (ذیل malicious attacks) | انتقال به دستهٔ رفتاری-مخرب. |
| 306–313 | الزامات: دسترسی، محرمانگی، تصدیق، یکپارچگی، حریم، اعتماد | جزئی | ص. 31077–31078 §III.B، شکل 3 | «مجوزدهی و کنترل دسترسی» جا افتاده؛ بندهای «تصدیق» و «حریم» به‌هم‌ریخته‌اند (برچسب «هویت» و «خصوصی» جابه‌جا شده). |
| 322 | AI/ML نقش مهمی در تقویت امنیت دارد | پشتیبانی‌شده | ص. 31084 §IV.B | — |
| 324 | CNN و LSTM برای شناسایی رفتار غیرعادی | پشتیبانی‌شده | ص. 31084–31085 | «تشخیص مقاوم با داده‌های جریان‌های متمایز زمانی و مکانی». |
| 325 | یادگیری بدون نظارت برای حملات پارازیتی | پشتیبانی‌شده | ص. 31085 [127] | «پارازیت فرکانس رادیویی (RF jamming)». |
| 326 | یادگیری بدون نظارت برای حملات بر شبکهٔ داخلی اتومبیل | پشتیبانی‌شده | ص. 31085 [129] | دقیق‌تر: DoS و سه نوع حملهٔ شبکهٔ درون‌خودرو با ویژگی‌های گذرگاه CAN. عنوان «حملات اتومبیل» → «حملات شبکهٔ درون‌خودرویی». |
| 327 | تحلیل ترافیک زنده برای آسیب‌پذیری‌ها | پشتیبانی‌شده | ص. 31085 [84] | — |
| 328 | بلاکچین + یادگیری فدرال برای انتقال امن با حفظ حریم | پشتیبانی‌شده | ص. 31085 [114] | محدودیت FL (ص. 31089) را هم بیفزایید. |
| 329 | منطق فازی برای محاسبهٔ اعتماد، دقت و یکپارچگی پیام رویداد | پشتیبانی‌شده | ص. 31085 [121] | — |
| 330 | یادگیری تقویتی برای ارزیابی «قابلیت اطمینان» خودروهای خودران | جزئی | ص. 31085 [131] | «قابلیت اطمینان» → «اعتمادپذیری (trustworthiness)» و افزودن «شناسایی نفوذگران با Q-learning». |

**شمارش:** 25 ادعا — پشتیبانی‌شده 13، جزئی 9، پشتیبانی‌نشده 3، غیرقابل‌تأیید 0.

## 5. اصطلاحات

| English | معادل پیشنهادی |
|---|---|
| Vehicle-to-Everything (V2X) | ارتباط خودرو با همه‌چیز |
| Virtual Traffic Light (VTL) | چراغ راهنمایی مجازی |
| Intra-/Inter-vehicle sub-network | زیرشبکهٔ درون‌خودرویی / میان‌خودرویی |
| Over-the-air (OTA) update | به‌روزرسانی از راه دور (هوایی) |
| Remote Keyless Entry (RKE) | ورود بی‌کلید از راه دور |
| Rolling code | کد غلتان |
| WAVE Service Advertisement (WSA) | اعلان سرویس WAVE |
| Heterogeneous Network (Het-Net) | شبکهٔ ناهمگن |
| Network slicing | برش‌دهی شبکه |
| Session hijacking | ربودن نشست |
| Hardware tampering | دست‌کاری سخت‌افزار |
| Masquerade attack | حملهٔ نقاب‌زنی (جعل هویت) |
| Spoofing / Forgery | جعل / ساختگی‌سازی |
| Illusion attack | حملهٔ توهم |
| Hidden vehicle attack | حملهٔ خودروی پنهان |
| Selfish / Malicious attacks | حملات خودخواهانه / بدخواهانه |
| Repudiation / Non-repudiation | انکار / انکارناپذیری |
| Blackhole attack | حملهٔ سیاه‌چاله |
| Untraceability / Unlinkability | ردیابی‌ناپذیری / پیوندناپذیری |
| Authorization and Access Control | مجوزدهی و کنترل دسترسی |
| Trust computation | محاسبهٔ اعتماد |
| Misbehavior Detection System (MDS) | سامانهٔ تشخیص رفتار نادرست |
| Plausibility check | بررسی معقول‌بودن (باورپذیری) |
| Rule-based intrusion detection | تشخیص نفوذ قاعده‌محور |
| Data-driven | داده‌محور |
| Unsupervised learning | یادگیری بدون نظارت |
| Federated learning (FL) | یادگیری فدرال (یادگیری توزیع‌شدهٔ مشارکتی) |
| Data poisoning | مسموم‌سازی داده |
| Reinforcement learning / Q-learning | یادگیری تقویتی / یادگیری Q |
| Fuzzy logic | منطق فازی |
| Generative Adversarial Network (GAN) | شبکهٔ مولد تخاصمی |
| Situational awareness | آگاهی موقعیتی |
| Fallback mechanism | سازوکار پشتیبان (جایگزین) |
| Controller Area Network (CAN) bus | گذرگاه CAN |
| RF jamming | پارازیت فرکانس رادیویی |
| Certificate Revocation List (CRL) | فهرست ابطال گواهی |
| Multi-tenancy | چندمستأجری |
| Trusted Platform Module (TPM) | ماژول سکوی مورداعتماد |

## 6. شکل‌ها و جداول قابل استفاده

| شماره | ص. | محتوا | پیشنهاد |
|---|---|---|---|
| Figure 1 | 31070 | سناریوهای ارتباطات V2X | جایگزین/مکمل شکل معماری گزارش (با ذکر منبع، CC BY 4.0). |
| Figure 2 | 31073 | سازمان مقاله | کم‌ارزش برای گزارش. |
| Table 1 | 31072 | مقایسهٔ مرورهای پیشین | برای بخش «کارهای مرتبط»، در صورت وجود. |
| Table 2 | 31075 | ویژگی‌های کاربردهای V2X | پشتوانهٔ بخش «اهمیت VANET». |
| Table 3 | 31078 | چالش‌ها و راهکارها در هشت حوزه (زیرساخت، پایگاه‌داده، RKE، DSRC/WAVE، سلولی، ZigBee، Wi-Fi/WiMAX، UWB) | **بسیار مفید** — بازترسیم به‌صورت جدول فارسی (§3.5 این یادداشت). |
| Figure 3 | 31078 | هفت الزام امنیتی + پارادایم ارتباطی + پیامدها (ایمنی/مالی/عملیاتی/حریم) | **بسیار مفید** برای بخش الزامات؛ برچسب‌ها با وضوح بالاتر بازبینی شوند. |
| Figure 4 | 31079 | دو مثال حمله: هک RSU (ترمز شدید)، BSM جعلی | برای بخش الگوی تهدید. |
| Tables 4–9 | 31080–31083 | مقایسهٔ حملات به تفکیک پنج دسته | محتوای داخلی خوانده نشد (تصویر)؛ پیش از استفاده بازبینی شود. |
| Table 10 | 31084 | طبقه‌بندی راهکارها: رمزنگاری/بلاکچین، ML/DL (supervised/unsupervised/RL)، اعتماد، هویت، 5G/6G | **بسیار مفید** — بازترسیم به‌صورت جدول یا نمودار درختی برای بخش راهکارها و AI. |
