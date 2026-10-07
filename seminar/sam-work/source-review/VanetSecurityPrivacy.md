# یادداشت استخراج منبع: `VanetSecurityPrivacy`

> منبع خوانده‌شده: PDF محلی `/home/sam/Zotero/storage/BRXJWD2B/Vanet Security and Privacy – an Overview  EIRP Proceedings.pdf` (۱۰ صفحه، متن قابل استخراج با `pdftotext`، خوانایی: کامل) + صفحهٔ فرود `/home/sam/Zotero/storage/IJ5HYVRB/497.html`.
> قالب لوکیتور: `p.<شمارهٔ صفحهٔ چاپی>, §<بخش>`. شماره صفحات چاپی مقاله 414 تا 423 است.

---

## ۱. مشخصات و دسترسی

**استناد کامل (اصلاح‌شده):**
Syla, V., Lala, A., & Biberaj, A. (2024). Vanet Security and Privacy – an Overview. *European Integration – Realities and Perspectives. Proceedings (EIRP Proceedings)*, 19(1), 414–423. Section: "The New Paradigm of FinTech and CyberSecurity". ISSN 2067-9211. URL: https://www.dp.univ-danubius.ro/index.php/EIRP/article/view/497 (Published 2024-07-31 طبق صفحهٔ HTML).

- وابستگی نویسندگان: Polytechnic University of Tirana, Albania (p.414, پانویس‌ها).
- DOI: در PDF و HTML یافت نشد → **غیرقابل‌تأیید / احتمالاً ندارد**.
- دسترسی: متن کامل، Open Access. **ناسازگاری مجوز:** PDF می‌گوید "Creative Commons Attribution-NonCommercial (CC BY NC)" (p.414) ولی صفحهٔ HTML می‌گوید "Creative Commons Attribution 4.0 International License". برای استفاده از شکل/متن، فرض محافظه‌کارانه CC BY-NC است.
- نوع منبع: مقالهٔ مروری کوتاه در مجموعه‌مقالات کنفرانس (نه ژورنال داوری‌شدهٔ سطح بالا)؛ هیچ آزمایش، داده یا شکل/جدولی ندارد. ادعاهایش عمدتاً بازگویی منابع ثانویه است.

### بررسی متادیتای bib — **خطای جدی**

ورودی فعلی در `report.bib` (خطوط 312–322) **دو مقالهٔ متفاوت را با هم قاطی کرده است**:
- نویسندگان/مجله/سال/جلد (`Mansour, Salama, Mohamed, Hammad`; IJNSA; vol 10; 2018) متعلق به مقالهٔ دیگری با عنوان مشابه است: *Mansour et al. (March 2018). VANET security and privacy – an overview. IJNSA, 10(2)* — که خودِ این مقاله آن را در مراجع آورده است (p.423، فهرست مراجع؛ و در متن p.415: "(Mansour, et. al, 2018)").
- ولی `url` و `file` به مقالهٔ EIRP 2024 از Syla و همکاران اشاره می‌کنند — همان فایلی که خوانده شد.

باید تصمیم گرفت کدام مقاله مدنظر است. اگر منظور همین فایل (EIRP) است، ورودی پیشنهادی:

```bibtex
@inproceedings{VanetSecurityPrivacy,
  title     = {Vanet Security and Privacy -- an Overview},
  author    = {Syla, Veranda and Lala, Algenti and Biberaj, Aleksand{\"e}r},
  booktitle = {European Integration -- Realities and Perspectives. Proceedings (EIRP Proceedings)},
  volume    = {19},
  number    = {1},
  pages     = {414--423},
  year      = {2024},
  issn      = {2067-9211},
  publisher = {Danubius University Press},
  url       = {https://www.dp.univ-danubius.ro/index.php/EIRP/article/view/497},
  urldate   = {2026-06-09}
}
```
(`publisher` از پاورقی سایت "Danubius University Press" برداشته شده؛ اگر قالب IEEE در biber با `@inproceedings` مشکل داشت، `@article` با `journaltitle` همین booktitle هم قابل قبول است.)

اگر منظور مقالهٔ Mansour و همکاران (IJNSA 2018) است، آن مقاله **در این بررسی خوانده نشده** و `url`/`file` باید عوض شود؛ ادعاهای جدول بخش ۴ فقط برای Syla et al. 2024 معتبرند.

---

## ۲. خلاصه ساختاریافته

- **هدف:** مروری بر چالش‌های امنیت و حریم خصوصی در VANET، الزامات امنیتی، انواع حملات و راهکارهای مقابله (Abstract, p.414).
- **ساختار:** §1 مقدمه، §2 کارهای مرتبط، §3 الزامات امنیت و حریم خصوصی (هفت الزام)، §4 انواع حملات (پنج حمله)، §5 نتیجه‌گیری، §6 کارهای آینده (p.415, §1 آخر پاراگراف).
- **الزامات (§3):** Authentication & Authorization؛ Confidentiality؛ Integrity؛ Non-Repudiation؛ Availability؛ Anonymity & Privacy؛ Scalability (p.416–419).
- **حملات (§4):** Eavesdropping؛ Spoofing؛ DoS؛ Sybil؛ Man-in-the-Middle (p.419–421).
- **پیام اصلی:** تعادل میان امنیت (پاسخ‌گویی/مسئولیت راننده) و حریم خصوصی (گمنامی) محور بحث است (Abstract, p.414؛ §5, p.421).
- **کارهای آینده:** رمزنگاری مقاوم در برابر تحرک بالا، AI/ML برای تشخیص ناهنجاری، بلاکچین برای مدیریت امنیت غیرمتمرکز، چارچوب امنیتی یکپارچه برای ITS (§6, p.422).
- **محدودیت:** بدون روش‌شناسی مرور (نه سیستماتیک)، بدون داده یا ارزیابی، بدون طبقه‌بندی حملات بر اساس هدف (زیرساخت/حریم/داده). چند ارجاع درون‌متنی ناقص است (مثلاً "(Abdelkader, 2017)" در p.418 در حالی که مرجع "Abdelgader" است).

---

## ۳. استخراج محتوا برای بسط متن

### ۳.۱ مقدمه (report.tex خط ۱۶۵–۱۶۷)

- کاربردهای VANET: "VANETs, comprising vehicles connected by wireless networks, facilitate a multitude of applications ranging from traffic management to emergency response and multimedia transmissions" (p.414, §1؛ به نقل از Khan et al., 2021).
- اتصال و اشتراک داده چالش امنیت و حریم خصوصی می‌آورد؛ تهدیدها می‌توانند "personal privacy, data integrity, and the overall reliability of transportation systems" را به خطر اندازند (p.414–415, §1).
- پیامد: "could range from minor disruptions to catastrophic incidents affecting life and property" (p.415, §1).
- آمار WHO: "the number of annual road traffic deaths has fallen slightly to 1.19 million (World Health Organization, 2023)" و "Road traffic injuries remain the leading killer of children and young people aged 5-29 years" (p.415, §1). ← این مقاله منبع جایگزین/مکمل برای ادعای خط ۱۶۵ گزارش است (منبع اولیهٔ صحیح: WHO Global Status Report on Road Safety 2023).
- دوگانهٔ پاسخ‌گویی/حریم: VANET نیازمند "liability and accountability of drivers involved in accidents, traffic violations..." است، در حالی که سرویس‌های مکان‌محور به موقعیت دقیق کاربر نیاز دارند؛ این "raises significant privacy issues" و حریم خصوصی برای "protect user data from profiling and tracking" لازم است (p.415, §1؛ به نقل از Mansour et al., 2018).
- **توجه:** «ماهیت بی‌سیم و باز» به این عبارت در مقاله نیامده؛ مقاله از "unique characteristics of VANETs, such as dynamic topology and resource constraints" سخن می‌گوید (Abstract, p.414).

### ۳.۲ الگوی تهدید (خط ۲۷۹)

- مقاله «مدل تهدید» صوری (توانایی مهاجم، داخلی/خارجی، فعال/غیرفعال) **ندارد**.
- جملهٔ «تعادل بین کاهش مؤثر تهدیدات و حداقل تأثیر بر عملکرد» در این مقاله به‌صورت توصیف کار Raya & Hubaux (2007) آمده است: "Their work is foundational in setting the direction for subsequent research on VANET security, aiming to balance effective threat mitigation with minimal impact on system performance and user convenience." (p.415–416, §2). ← منبع اولیه `SecuringVehicularAd` (Raya & Hubaux 2007) است؛ این مقاله فقط منبع ثانویه است.
- از همان پاراگراف: Raya & Hubaux "provides a comprehensive threat analysis and proposes a security architecture tailored to VANETs" و بر "dual need to establish driver liability in incidents while protecting individual privacy" تأکید دارند (p.415, §2).
- Lin et al. (2008, IEEE Commun. Mag.) بر "certificate revocation processes and achieving conditional privacy preservation" در WAVE تمرکز دارند (p.416, §2). **توجه:** این Lin 2008 است، نه GSIS 2007 (`linGSISSecurePrivacyPreserving2007`).
- Mintemur & Sen (2017) چهار حمله "blackhole, dropping, flooding, and bogus information" را روی AODV و GPSR شبیه‌سازی کردند (p.416, §2) ← مادهٔ خوب برای جملهٔ «حملات لایهٔ مسیریابی».
- Al-Qutayri et al. (2010): مقایسهٔ public key، symmetric key و IBC و نتیجه‌گیری "IBC is the most viable option" (p.415, §2).

### ۳.۳ حملات بر زیرساخت (خطوط ۲۸۱–۲۸۷)

**DoS (§4.3, p.420):**
- تعریف: "These attacks aim to disrupt the network by overwhelming it with traffic, which can degrade performance or completely shut down communication channels."
- با "a flood of unnecessary requests" شبکه را از کار می‌اندازد و ارتباطات مشروع را مانع می‌شود؛ می‌تواند "potentially leading to hazardous situations on the roads" (به نقل از Krishna et al., 2022).
- مقابله: "rate limiting and anomaly detection"، "network segmentation" برای محدودکردن گسترش، "redundant communication paths and diversified network access technologies".
- **توجه:** مقاله به‌طور خاص از «اشباع RSU» نام نمی‌برد؛ هدف را «شبکه / کانال‌های ارتباطی» می‌گوید.

**Spoofing / Impersonation (§4.2, p.419–420):**
- تعریف: "Attackers impersonate another vehicle or infrastructure component to send false information or commands, leading to potential chaos in traffic management systems." (p.419)
- پیامدها: "incorrect routing information, emergency system alerts, or false traffic updates" (p.420).
- مقابله: پروتکل‌های احراز هویت (Baldini, 2022)، IDS مبتنی بر تحلیل الگوی ارتباط، کلیدهای رمزنگاری "more robust and dynamic" (p.420).
- واژهٔ impersonation در §3.1 هم آمده: احراز هویت "helps mitigate various security threats such as impersonation and man-in-the-middle attacks" (p.416).
- **توجه:** گزارش «تقلید هویت» را زیر زیرساخت و «حملات جعل» را جدا زیر اعتماد داده آورده؛ در مقاله هر دو یک حمله‌اند (Spoofing = جعل هویت برای ارسال اطلاعات نادرست).

**Eavesdropping (§4.1, p.419):**
- تعریف: "These attacks involve unauthorized interception of communications between vehicles, compromising the privacy and confidentiality of the data transmitted."
- داده‌های در معرض خطر: "location details, travel patterns, and personal data of passengers".
- مقابله: رمزنگاری قوی (Obaidat et al., 2020)، "secure key exchange protocols"، "network segmentation" (محدودکردن دامنهٔ جغرافیایی هر ارتباط)، پایش و تشخیص ناهنجاری.
- **توجه:** مقاله شنود را حملهٔ علیه **محرمانگی/حریم خصوصی** می‌داند، نه زیرساخت.

### ۳.۴ حملات بر حریم خصوصی (خطوط ۲۸۹–۲۹۴)

- مقاله بخش جداگانه‌ای برای «افشای هویت» یا «ردیابی موقعیت» به‌عنوان حمله **ندارد**. نزدیک‌ترین محتوا:
  - §3.6 (p.418): هدف حریم خصوصی "to protect personal and location information against tracking and profiling, while still allowing for accountability in the event of disputes or investigations."
  - §1 (p.415): "protect user data from profiling and tracking".
  - §4.1 (p.419): شنود "location details, travel patterns, and personal data" را افشا می‌کند.
- راهکارها (§3.6, p.418): تغییر شبه‌نام "at strategic locations or time intervals" (Gerlach 2006؛ Freudiger 2007)؛ mix-zones: "areas where vehicles change their pseudonyms in a coordinated manner to break the linkability of consecutive messages"؛ احراز هویت حافظ حریم؛ zero-knowledge proofs (Pravin 2021). ← پل خوب به بخش شبه‌نام و SSI گزارش (خطوط ۵۷۱ به بعد).

### ۳.۵ حملات بر اعتماد داده (خطوط ۲۹۶–۳۰۲)

**دستکاری پیام / MitM (§4.5, p.421):**
- مقاله «message tampering» را جدا نیاورده؛ تغییر پیام زیر MitM است: "Attackers intercept and potentially alter the communication between two parties without their knowledge, which could mislead the recipients or alter the behavior of vehicles."
- مقابله: ترکیب رمزنگاری متقارن و نامتقارن برای "integrity and confidentiality"؛ پایش شبکه و تشخیص ناهنجاری (Krzysztof et al., 2019)؛ بلاکچین: "Blockchain's decentralized nature helps reduce the risk of MitM attacks by eliminating the need for a central authority" و ثبت داده‌ها روی "secure, immutable ledger" (Ahmad et al., 2018).
- مرتبط: الزام Integrity (§3.3, p.417) — "data transmitted between vehicles and infrastructure remains unchanged and trustworthy"؛ ابزار: امضای دیجیتال، توابع هش، SHA.

**Sybil (§4.4, p.420–421):**
- تعریف: "In this attack, a single node illegitimately takes on multiple identities. It can severely disrupt the trust and reputation systems within VANETs by skewing consensus or majority-based decisions." (p.420)
- پیامدها: اختلال در "consensus mechanisms, reputation systems, and routing protocols"، منجر به "false traffic reports, manipulated traffic flows, or even isolating legitimate vehicles from the network" (p.420).
- مقابله: احراز هویت بلادرنگ؛ "trust management systems" بر پایهٔ رفتار و سابقه؛ امضای دیجیتال و CA (Douceur 2002؛ Levine et al. 2006)؛ بلاکچین برای "secure and immutable record-keeping of vehicle identities and their corresponding reputational scores" (Dwivedi et al., 2022) (p.420–421). ← پل مستقیم به فصل بلاکچین و DID گزارش.

### ۳.۶ الزامات امنیتی (خطوط ۳۰۴–۳۱۵)

تعریف یک‌خطی هر الزام (جملهٔ اول هر زیربخش) و ابزارها:

| الزام | تعریف (نقل مستقیم) | ابزار/نکته | لوکیتور |
|---|---|---|---|
| Authentication & Authorization | "Ensuring that communication between vehicles and infrastructure is conducted by verified and trustworthy sources." | گواهی دیجیتال و رمزنگاری نامتقارن؛ authorization = فقط اقدامات مجاز طبق "predefined policies" | p.416, §3.1 |
| Confidentiality | "Protecting sensitive information from unauthorized access to preserve the privacy of drivers and passengers." | رمزنگاری متقارن/نامتقارن، AES؛ داده‌ها: location, routes, personal info | p.417, §3.2 |
| Integrity | "Safeguarding data from alterations during transmission, ensuring the accuracy and reliability of exchanged messages." | امضای دیجیتال، هش، SHA؛ حیاتی برای emergency notifications و cooperative collision avoidance | p.417, §3.3 |
| Non-Repudiation | "Providing proof of communication and data transactions to prevent denial of involvement by the parties." | امضای دیجیتال + PKI، timestamping، secure logging؛ کاربرد حقوقی پس از تصادف | p.417, §3.4 |
| Availability | "Ensuring reliable and continuous service, especially for critical safety applications in vehicular environments." | افزونگی شبکه، پروتکل‌های fault-tolerant، load balancing، IDS | p.417–418, §3.5 |
| Anonymity & Privacy | "Maintaining user anonymity to protect personal and location information against tracking and profiling, while still allowing for accountability..." | تغییر شبه‌نام، mix-zone، ZKP | p.418, §3.6 |
| Scalability | "Addressing the capacity to securely manage a vast number of vehicles moving at high speeds and changing network topologies frequently." | مسیریابی خوشه‌ای، cloud/edge computing | p.418–419, §3.7 |

- **توجه:** مقاله «Trust» را به‌عنوان الزام مستقل **ندارد**؛ اعتماد فقط ضمنی آمده (مثلاً §3.1 "operational integrity and trust"، §3.2 "building trust among users"). در عوض Non-Repudiation و Scalability را دارد که در گزارش نیستند.
- جمع‌بندی مقاله: "Each of these requirements is critical for maintaining a secure and private network within the challenging and dynamic environment of VANETs." (p.419, §3.7 آخر)

---

## ۴. بررسی ادعاهای فعلی

| خط | ادعا | حکم | لوکیتور | اصلاح پیشنهادی |
|---|---|---|---|---|
| 165 | WHO: سالانه بیش از ۱.۱۹ میلیون مرگ؛ عامل اول مرگ ۵–۲۹ ساله | پشتیبانی‌شده (در این منبع؛ اینجا به آن ارجاع نشده) | p.415, §1 | «بیش از» نادرست است؛ متن: "fallen slightly to 1.19 million". بنویسید «حدود ۱٫۱۹ میلیون». بهتر است مستقیم به WHO 2023 ارجاع شود. |
| 167 | ماهیت بی‌سیم و باز ← آسیب‌پذیری | جزئی | Abstract, p.414 | مقاله «dynamic topology and resource constraints» را می‌گوید؛ «بی‌سیم و باز» را به منبع دیگری نسبت دهید یا بازنویسی کنید. |
| 167 | جعل پیام، سیبل، مرد میانی، نقض حریم = مهم‌ترین چالش‌ها | پشتیبانی‌شده | §4.2 p.419–420؛ §4.4 p.420؛ §4.5 p.421؛ Abstract p.414 ("privacy breaches") | مقاله واژهٔ «مهم‌ترین» ندارد؛ «از جمله تهدیدات مطرح» ایمن‌تر است. |
| 279 | تحلیل تهدید ← تعادل بین کاهش تهدید و حداقل تأثیر بر عملکرد | جزئی (ثانویه) | p.415–416, §2 | این جمله توصیف کار Raya & Hubaux 2007 است؛ فقط `SecuringVehicularAd` را بیاورید یا بنویسید «به گزارش Syla و همکاران». |
| 283 | DoS: اشباع RSU با اطلاعات اضافی | جزئی | p.420, §4.3 | مقاله RSU را نام نمی‌برد: «اشباع شبکه/کانال‌ها با سیلی از درخواست‌های غیرضروری». |
| 284 | تقلید هویت: جا زدن به‌جای OBU/RSU | پشتیبانی‌شده (به‌عنوان Spoofing) | p.419, §4.2 | "another vehicle or infrastructure component" ≈ OBU/RSU؛ با «حملات جعل» (خط ۲۹۹) یکی است. |
| 285 | استراق سمع: دسترسی غیرمجاز به اطلاعات خصوصی | پشتیبانی‌شده | p.419, §4.1 | در مقاله حمله به محرمانگی/حریم است، نه زیرساخت؛ جابه‌جایی به «حملات بر حریم خصوصی» را بررسی کنید. |
| 292–293 | افشای هویت، ردیابی موقعیت | جزئی | p.418, §3.6؛ p.415, §1 | در مقاله به‌صورت هدف حریم ("tracking and profiling") آمده، نه بخش حمله. |
| 298 | دستکاری پیام: تغییر/حذف/اصلاح داده | جزئی | p.421, §4.5؛ p.417, §3.3 | «تغییر» پشتیبانی دارد (MitM: "alter")؛ «حذف» در این منبع نیست. |
| 299 | حملات جعل: تولید اطلاعات نادرست | پشتیبانی‌شده | p.419–420, §4.2 | — |
| 300 | سیبل: هویت‌های متعدد توسط یک گره | پشتیبانی‌شده | p.420, §4.4 | — |
| 309 | دسترسی‌پذیری: به‌موقع در دسترس گیرندگان | جزئی | p.417, §3.5 | متن: "reliable and continuous service". ضمناً «دسترس‌پذیری» بهتر از «دسترسی» است. |
| 310 | محرمانگی: رمزنگاری و حفاظت داده | پشتیبانی‌شده | p.417, §3.2 | — |
| 311 | تصدیق: تمایز موجودیت معتبر از مخرب | پشتیبانی‌شده | p.416, §3.1 | جمله در گزارش از نظر نگارش ناقص است ("هویت تمایز..."). |
| 312 | یکپارچگی: داده‌ها باید به‌موقع تأیید شوند | پشتیبانی‌نشده | p.417, §3.3 | تعریف مقاله: محافظت از تغییر در حین انتقال؛ «به‌موقع» ربطی به integrity ندارد. |
| 313 | حریم خصوصی: محافظت از اطلاعات شخصی | پشتیبانی‌شده | p.418, §3.6 | «حریم: خصوصی» جای دونقطه اشتباه است. می‌توان «همراه با پاسخ‌گویی (accountability)» را اضافه کرد. |
| 314 | اعتماد: اطمینان بین موجودیت‌ها | پشتیبانی‌نشده (در این منبع) | — | Trust در این مقاله الزام نیست؛ یا به farsimadan نسبت دهید یا Non-Repudiation (p.417) را اضافه کنید. |
| 312–322 (bib) | نویسندگان Mansour و همکاران، IJNSA 2018 | نادرست | p.414؛ p.423 | به بخش ۱ نگاه کنید: فایل Syla et al. 2024 است. |

---

## ۵. اصطلاحات

| English | فارسی |
|---|---|
| Vehicular Ad-hoc Network (VANET) | شبکهٔ اقتضایی خودرویی |
| Authentication / Authorization | احراز هویت (تصدیق اصالت) / مجوزدهی |
| Confidentiality | محرمانگی |
| Integrity | یکپارچگی (صحت داده) |
| Non-Repudiation | انکارناپذیری |
| Availability | دسترس‌پذیری |
| Anonymity | گمنامی |
| Accountability / Liability | پاسخ‌گویی / مسئولیت |
| Scalability | مقیاس‌پذیری |
| Eavesdropping | استراق سمع (شنود) |
| Spoofing / Impersonation | جعل هویت / تقلید هویت |
| Denial of Service (DoS) | منع سرویس |
| Sybil attack | حملهٔ سیبل |
| Man-in-the-Middle (MitM) | حملهٔ مرد میانی |
| Tracking / Profiling | ردیابی / نمایه‌سازی |
| Pseudonym / Mix-zone | شبه‌نام / ناحیهٔ اختلاط |
| Linkability | پیوندپذیری |
| Zero-knowledge proof | اثبات دانش صفر |
| Identity-based cryptography (IBC) | رمزنگاری مبتنی بر هویت |
| Conditional privacy preservation | حفظ حریم خصوصی مشروط |
| Certificate revocation | ابطال گواهی |
| Rate limiting | محدودسازی نرخ |
| Network segmentation | بخش‌بندی شبکه |
| Intrusion Detection System (IDS) | سامانهٔ تشخیص نفوذ |
| Trust management / Reputation | مدیریت اعتماد / اعتبار (شهرت) |
| Fault-tolerant / Redundancy | تحمل‌پذیر خطا / افزونگی |
| Timestamping / Secure logging | مهر زمانی / ثبت وقایع امن |

---

## ۶. شکل‌ها و جداول قابل استفاده

- مقاله **هیچ شکل یا جدولی ندارد** (بررسی کل ۱۰ صفحه).
- پیشنهاد (ساختهٔ نویسندهٔ گزارش، با ارجاع): جدولی «حمله ← الزام نقض‌شده ← راهکار» از داده‌های §4:
  - Eavesdropping ← Confidentiality/Privacy ← رمزنگاری، تبادل کلید امن، بخش‌بندی شبکه (p.419)
  - Spoofing ← Authentication ← احراز هویت، IDS، کلیدهای پویا (p.419–420)
  - DoS ← Availability ← rate limiting، تشخیص ناهنجاری، مسیرهای افزونه (p.420)
  - Sybil ← Authentication/Trust ← مدیریت اعتماد، CA و امضا، بلاکچین (p.420–421)
  - MitM ← Integrity/Confidentiality ← رمزنگاری ترکیبی، پایش، بلاکچین (p.421)
  - نگاشت «الزام نقض‌شده» استنباط ماست، نه گفتهٔ صریح مقاله، جز موارد زیر که صریح‌اند: شنود → "privacy and confidentiality" (p.419)؛ MitM → "integrity and confidentiality" (p.421).
- جدول الزامات بخش ۳.۶ همین یادداشت هم آماده است و می‌توان مستقیم به LaTeX تبدیلش کرد.
