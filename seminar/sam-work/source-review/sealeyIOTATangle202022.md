# یادداشت استخراج منبع: `sealeyIOTATangle202022`

> قرارداد مکان‌یابی (locator): `p.N` = صفحه N از ۸ صفحه PDF (صفحات مقاله ۰۱–۰۸)؛ `§` = بخش مقاله؛ `col L/R` = ستون چپ/راست. متن از PDF محلی با `pdftotext -layout` استخراج شده است. نقل‌قول‌ها عیناً انگلیسی‌اند.

---

## ۱. مشخصات و دسترسی

- **ارجاع کامل (IEEE):** N. Sealey, A. Aijaz, and B. Holden, "IOTA Tangle 2.0: Toward a Scalable, Decentralized, Smart, and Autonomous IoT Ecosystem," in *2022 International Conference on Smart Applications, Communications and Networking (SmartNets)*, Nov. 2022, pp. 1–8, doi: 10.1109/SmartNets55823.2022.9994016.
- **وابستگی نویسندگان:** Bristol Research and Innovation Laboratory, Toshiba Europe Ltd., Bristol, UK (p.1).
- **دسترسی:** متن کامل (PDF ناشر IEEE Xplore، دسترسی دانشگاهی) در `/home/sam/Zotero/storage/BPU8VDV7/`. خوانایی: کامل؛ همهٔ ۸ صفحه، جداول I و II و متن شکل‌ها قابل استخراج بود.
- **بررسی متادیتای bib (`report.bib` خط ۲۶۲–۲۷۴):** عنوان، نویسندگان، booktitle، DOI و صفحات (01–08) با سرصفحه PDF مطابقت دارد (`DOI: 10.1109/SMARTNETS55823.2022.9994016`, p.1). تاریخ `2022-11` در PDF نیامده و فقط از IEEE Xplore قابل تأیید است (غیرقابل‌تأیید از PDF، احتمالاً درست). نیازی به اصلاح نیست.
- **نوع منبع:** مقاله مروری/فنی کنفرانسی (technical overview) + شبیه‌سازی محدود FPC با شبیه‌ساز IOTA Foundation. بیشتر ادعاهای عملکردی به بلاگ‌ها/وب‌سایت IOTA Foundation ارجاع داده شده‌اند (مراجع [4]، [5]، [10]، [12]–[15]) — منبع ثانویه، نه ارزیابی مستقل.

## ۲. خلاصه ساختاریافته

- **مسئله:** IOTA اولیه (legacy) برای اجماع به یک «coordinator» متمرکز (راه‌حل bootstrap) متکی بود که غیرمتمرکزسازی و مقیاس‌پذیری را محدود می‌کرد؛ نبود قرارداد هوشمند و دارایی دیجیتال نیز مانع پذیرش صنعتی بود (Abstract؛ p.1 §I col R).
- **هدف:** مرور فنی ویژگی‌های کلیدی IOTA 2.0 و ارتباط آن‌ها با اکوسیستم IoT، به‌همراه بینش عملکردی و جهت‌های پژوهشی آینده (Abstract).
- **روش:** تقسیم IOTA 2.0 به ماژول‌ها (§II.A–H)، تحلیل مزایا برای IoT (§III.A–F)، شبیه‌سازی FPC با `fpc-sim` (§II.B، Fig. 3–4).
- **یافته‌های اصلی:** حذف coordinator و جایگزینی با FPC؛ سیستم شهرت Mana علیه Sybil/Eclipse؛ PoW تطبیقی؛ دفتر UTXO؛ انتخاب نوک RURTS با پیچیدگی O(n)؛ قرارداد هوشمند ISCP (لایه ۲، off-chain، کمیته‌ای، با پشتیبانی EVM)؛ دارایی دیجیتال بدون کارمزد؛ کاهش اندازه تراکنش از ~1700 به 100 بایت؛ شبکه Nectar تا 1000 TPS با زمان تأیید 10–12 ثانیه.
- **جهت‌های آینده:** On-Tangle FPC (مبتنی بر approval weight)، oracleها، sharding (§IV).
- **محدودیت‌ها (از نگاه خواننده):** هیچ اشاره‌ای به VANET/خودرو یا Ed25519 ندارد؛ ارقام عملکرد Nectar از منابع IOTA Foundation نقل شده؛ ماژول‌ها «under continuous review and development» توصیف شده‌اند (p.2 col R)، پس جزئیات ممکن است در نسخه‌های بعدی تغییر کرده باشد.

## ۳. استخراج محتوا برای بسط متن

### ۳.۱ بخش «مفهوم IOTA Tangle» (report.tex خط ۴۸۴–۴۹۵)

- **DLT و مزایای آن برای IoT:** چهار ویژگی کلیدی DLT برای IoT: «decentralization, immutability, auditability, and cryptographic security» (p.1 §I col L). غیرمتمرکزسازی نیاز به «validation or control by an authorized and trusted central third party» را حذف می‌کند و هزینهٔ نگه‌داری سرور مرکزی را کاهش می‌دهد (همان).
- **نقد بلاکچین برای IoT:** «associated fees and energy concerns of the mining process as well as limited transaction throughput make many blockchain solutions unsuitable for IoT applications» (p.1 §I col R).
- **مزیت DAG:** DAG تراکنش‌ها را مستقیم در دفتر ذخیره می‌کند نه درون بلوک؛ «The DAG structure allows asynchronous parallel attachment of transactions therefore facilitating a larger throughput» (p.1 col R). DLTهای DAG ماینینگ ندارند → تراکنش بدون کارمزد و امکان دستگاه‌های سبک‌تر به‌دلیل تقاضای انرژی کمتر (همان).
- **تعریف IOTA Tangle:** «IOTA Tangle is a DAG-based DLT, specifically targeting IoT networks and devices» (p.1 col R). گره‌ها با ارتباط P2P پیام‌ها را منتشر، تأیید و وضعیت دفتر را حفظ می‌کنند؛ هر گره «its own local view of the ledger» دارد (همان).
- **سازوکار تأیید:** «When issuing each new message (tip), network nodes must first approve two previous messages» (p.1 col R). پیام‌ها پس از رسیدن به سطح پذیرفته‌شدهٔ اجماع تأییدشده تلقی می‌شوند.
- **مقیاس‌پذیری معکوس:** «As the number of transactions per second (TPS) increases, the confirmation time decreases due to the requirement of each node having to approve two messages when issuing one» (p.1 col R). ← این همان پشتوانهٔ ادعای «با افزایش تراکنش‌ها، تأییدها سریع‌تر» است.
- **نکته:** در IOTA 2.0 تعداد تأییدها از ۲ «up to a maximum of eight» متغیر شده است (p.5 §II.C col L) — اگر متن «دو تراکنش قبلی» را مطلق بیان کند، برای نسخه 2.0 دقیق نیست.
- **امنیت کوانتومی (حاشیه‌ای):** طرح‌های امضای یک‌بارمصرف «quantum-secure» هستند، در حالی که RSA یا رمزنگاری منحنی بیضوی در برابر کامپیوتر کوانتومی آسیب‌پذیرند (p.1 §I col L). مقاله صراحتاً طرح امضای IOTA را نام نمی‌برد.
- **شکل:** Fig. 1 (p.2): «1a shows the Tangle topology; 1b shows the blockchain topology.» — می‌تواند به‌عنوان منبع دوم برای شکل `fig:iota_vs_bc` ارجاع شود.

### ۳.۲ بخش «ویژگی‌های کلیدی IOTA Tangle V2.0» (خط ۴۹۷–۵۰۷)

**الف) تاریخچه و حذف coordinator**
- IOTA در ۲۰۱۶ راه‌اندازی شد اما «relied on a bootstrap solution called the coordinator»؛ coordinator «a non-ideal element of centralization» افزود و «also limits scalability of the protocol» (p.1 col R). برنامهٔ حذف آن «coordicide» نام دارد [3].
- «In 2021 IOTA's first fully decentralized network was released on their development network» (p.1–2)؛ پیاده‌سازی کاری با نام **Nectar** فعال است و مهاجرت به mainnet «planned» بوده (p.2 col L).
- **ادعای عملکرد:** «The Nectar network can support up to 1000 TPS with confirmation times on average between 10 and 12 seconds» (p.2 col L). (ارجاع ضمنی به منابع IOTA Foundation؛ ارزیابی مستقل نیست.)
- نتیجه‌گیری: حذف coordinator «achieves a greater degree of scalability ... as well as other benefits of full decentralization such as removing the single point of failure and a necessary trust in a central authority» (p.8 §V col L).

**ب) Fast Probabilistic Consensus (FPC)** (p.3 §II.B)
- تعریف: «a probabilistic leaderless binary voting protocol called fast probabilistic consensus (FPC)».
- کارکرد: رفع تعارض‌هایی مانند double spend. هر گره نظر خود را با پرس‌وجو از زیرمجموعه‌ای با اندازه ثابت از گره‌ها و انتخاب نظر اکثریت به‌روز می‌کند؛ این در چند «round» تکرار می‌شود تا نظر ثابت شود یا به حداکثر دور برسد.
- مقاومت: نظرها با Mana گره وزن‌دهی می‌شوند و از آستانه‌های تصادفی برای جلوگیری از وضعیت‌های meta-stable استفاده می‌شود؛ آستانه‌ها مشترک بین گره‌ها و تولیدشده توسط ماژول **dRNG** (decentralized random number generator) هستند.
- **شبیه‌سازی (Fig. 3–4, p.4):** پارامترها N (تعداد گره)، k (quorum size، تعداد همسایه‌های پرس‌وجوشده در هر دور)، q (نسبت گره‌های متخاصم).
  - با افزایش N (k=11, q=0.1) نرخ توافق و میانگین دور خاتمه «effectively unchanged» می‌ماند → مقیاس‌پذیری (Fig. 3a/4a؛ محور N تا 10000).
  - k کوچک حمله را پنهان می‌کند (نرخ توافق ظاهراً بالا)؛ k برابر اندازهٔ شبکه بهترین نرخ توافق را می‌دهد اما «at the cost of a very high communication overhead» (p.4 col L).
  - مقاومت در برابر گره‌های متخاصم «up to the unrealistic point where half of the network is maliciously controlled» (Fig. 3c/4c, p.4 col L).
- مزایا برای IoT: «FPC is energy-efficient and lightweight, doesn't require staking, and is highly scalable» (p.6 §III.A)؛ اما سربار ارتباطی پرس‌وجوهای مستقیم «can be of concern for some IoT implementations» (همان).

**ج) Approval Weight / On-Tangle FPC (OTFPC)** (p.7 §IV.A) — توجه: در مقاله **جهت پژوهشی آینده** است نه ویژگی مستقر.
- ترکیب عناصر FPC با «a virtual voting protocol that considers approval weight (AW)».
- تعریف AW (نقل از [15]): «the percent of the active consensus mana of nodes who directly or indirectly reference it».
- رفع double spend: وقتی یکی از تراکنش‌های متعارض به آستانهٔ AW برسد، شاخه‌اش نهایی می‌شود؛ فقط payload پیام double-spend رد می‌شود تا پیام‌های بعدی غیرمتعارض orphan نشوند.
- ارجاع یک گره به پیام = رأی مثبت؛ «This removes the need for P2P communication between nodes during consensus, reducing the communication overhead» و زمان تأیید نیز کاهش می‌یابد.
- اصطلاح «OTV» در مقاله نیامده؛ اصطلاح مقاله «OTFPC» است.

**د) Mana** (p.5 §II.D)
- «Mana can be seen as a new reputation system for nodes with the primary objective of securing the network against Sybil and Eclipse attacks».
- دو نوع: **access mana** (با «pledge» در تراکنش ارزشی به یک node ID) و **consensus mana** (برای مشارکت در FPC)؛ مجموع = total mana. Mana با زمان «decays». کسب Mana: پردازش تراکنش ارزشی، نگه‌داری توکن (موجودی بیشتر → Mana بیشتر)، یا اجاره از گره پرMana.
- چهار کاربرد: (۱) congestion control — داده‌ای که هر گره می‌افزاید متناسب با سهم access mana فعال است؛ (۲) احتمال پرس‌وجوشدن در FPC و (۳) انتخاب در dRNG متناسب با consensus mana؛ (۴) وزن نظر در FPC.
- Eclipse: گره‌های پرنفوذ محافظت می‌شوند چون در autopeering با گره‌های دارای Mana مشابه جفت می‌شوند.
- مزیت IoT: تهدید کنترل شبکه با هویت‌های متعدد «nullified» می‌شود (p.6 §III.C).

**هـ) Adaptive PoW** (p.2 §II.A)
- PoW در IOTA برای کنترل نرخ (ضد spam/DoS) است نه ماینینگ. legacy: دشواری ثابت (MWM). IOTA 2.0: دشواری بر اساس نرخ پیام گره در بازهٔ زمانی تنظیم می‌شود؛ هرچه پیام بیشتر، معما سخت‌تر «until it becomes computationally impossible»؛ برای گره‌های صادق دشواری کم می‌ماند. مفید برای دستگاه‌های IoT محدود (p.6 §III.A).

**و) Tip selection (RURTS)** (p.4–5 §II.C؛ p.6 §III.B)
- با FPC، انتخاب نوک دیگر نقشی حیاتی در اجماع ندارد و فقط رشد پایدار و امن Tangle را تضمین می‌کند.
- RURTS = restricted uniform random tip selection؛ تعداد تأییدها ۲ تا ۸ (بیشتر هنگام ازدحام برای جلوگیری از پهن‌شدن Tangle با spam).
- پیچیدگی از O(n²) در MCMC به O(n) در RURTS؛ کاهش چشمگیر پیام‌های orphan و نیاز به reattachment (p.6 §III.B).

**ز) UTXO ledger** (p.5 §II.E): موجودی‌ها به خروجی تراکنش‌ها گره خورده‌اند نه آدرس‌ها؛ امکان اعتبارسنجی بلادرنگ payload؛ آدرس‌ها «can now be reused ... without a loss in security»؛ double spend با «reality based ledger state» مدیریت می‌شود.

**ح) Message layout** (p.5 §II.F): واحد داده «messages» (به‌جای transactions) با سه بخش header، payload، signature. header: نسخه، والدها، timestamp، node ID صادرکننده، PoW nonce. payload: داده، تراکنش ارزشی یا custom. امضای گرهٔ صادرکننده کل پیام را امضا می‌کند «making the entire message unalterable». **نوع الگوریتم امضا ذکر نشده است.**

**ط) ISCP — قراردادهای هوشمند** (p.5 §II.G؛ p.6 §III.E؛ Table II p.7)
- «IOTA smart chain protocol (ISCP) implements smart contract functionality to the new decentralized network».
- off-chain: اجرا روی زنجیره‌های فرعی متصل به Tangle اصلی، نگه‌داری توسط زیرمجموعه‌ای از گره‌ها به نام **committee** که اجماع و اجرای قراردادها را انجام داده و با تراکنش‌های امضاشده Tangle اصلی را به‌روز می‌کند.
- هزینهٔ تراکنش «very low and can be more easily forecast»؛ امنیت متغیر و با افزایش اندازهٔ کمیته افزایش می‌یابد.
- پشتیبانی از **EVM** → اجرای قراردادهای Solidity.
- مالک می‌تواند پاداش متغیر برای کمیته تعیین کند؛ «Fees are again flexible and dependant on the chain, contract and its owner» (p.5 col R). ← یعنی قرارداد هوشمند الزاماً «بدون کارمزد» نیست.

**ی) دارایی دیجیتال** (p.5–6 §II.H؛ p.6 §III.F): دارایی‌های امن‌شده توسط Tangle اصلی بدون کارمزد؛ «free digital twinning or tokenization of any system or asset»؛ NFT برای اثبات احراز اصالت و مالکیت دستگاه‌های IoT؛ چشم‌انداز «machine economy».

**ک) اندازه تراکنش:** legacy «fixed at around 1.7 kb» در برابر atomic «as small as 100 bytes» (p.6 §III.D؛ Table I).

### ۳.۳ بخش «معماری IOTA Tangle V2.0» (خط ۵۳۰–۵۳۸؛ فعلاً فقط `IOTATANGLE20` ارجاع شده)

این مقاله منبع مستقل و قابل ارجاع برای مدل سه‌لایه است (p.2 §II col R؛ Fig. 2a):
- **Network layer:** «handles the Tangle node functionality that works with bytes, and therefore encompasses all the P2P (inter-node) exchanges».
- **Communication layer:** «handles IOTA messages. This includes the required tip selection approvals, rate control mechanisms, as well as handling the Tangle ledger itself».
- **Application layer:** «deals with executing message payloads. For example, for a value transaction it executes the required consensus, fund transfers, and reputation (mana) transfer».
- Fig. 2b: نمودار جریان سطح بالای پروتکل.
→ پیشنهاد: افزودن `sealeyIOTATangle202022` به `\cite` خط ۵۳۲ و استفاده از جملات بالا برای بسط هر لایه (مثلاً قرار دادن Adaptive PoW و RURTS در لایه ارتباطات، و FPC/Mana در لایه کاربردی).

### ۳.۴ بخش «چگونگی رفع مشکلات» (خط ۵۰۹–۵۲۸)

مقاله پشتوانه‌های زیر را برای جدول مقایسه می‌دهد:
- ساختار: DAG در برابر زنجیره بلوک (p.1؛ Fig. 1).
- کارمزد: «feeless transactions» (Abstract؛ p.1).
- TPS: «higher achievable transactions per second» (Abstract)؛ عدد مشخص: Nectar «up to 1000 TPS» (p.2). **عدد «۷–۱۵ TPS» برای بلاکچین در این مقاله وجود ندارد.**
- انرژی: «lower energy consumption» (Abstract)؛ «reduced energy demand» (p.1).
- ماینر: «DAG-based DLTs also do not use mining» (p.1 col R).
- غیرمتمرکزسازی/Sybil/اندازه تراکنش/finality: Table I (p.2) — می‌تواند به‌عنوان سطرهای اضافهٔ جدول (legacy IOTA در برابر IOTA 2.0) یا جدول جداگانه استفاده شود.

### ۳.۵ بخش «کاربرد در VANET/IoT» (خط ۵۴۰–۵۴۹)

- **این مقاله هیچ اشاره‌ای به VANET، خودرو یا حمل‌ونقل ندارد** (جست‌وجوی «vehic»/«VANET» در متن: صفر نتیجه). فقط کاربردهای عمومی IoT را پوشش می‌دهد؛ برای جملهٔ کاربرد خودرویی نباید به این منبع ارجاع داد، مگر با عبارت «در حوزهٔ IoT به‌طور کلی».
- کاربردهای IoT قابل استفاده (با احتیاط و به‌عنوان تعمیم):
  - دستگاه‌های سبک: PoW تطبیقی و پیام‌های ۱۰۰ بایتی «much more suitable for lightweight IoT devices and reduces communication overhead» (p.6 §III.D).
  - قرارداد هوشمند بدون کارمزد/micro-transaction برای شبکه‌های IoT که «not resource rich enough to participate in Ethereum smart contracts» (p.6 §III.E).
  - Oracles: بارگذاری داده مستقیم از منبع (مثلاً حسگرهای IoT) بدون واسطه، افزایش اعتماد به داده؛ ODN و «truth finding algorithm» (p.7 §IV.B). ← قابل ربط به گزارش‌دهی دادهٔ حسگر خودرو، اما ربط باید از سوی نویسنده و بدون نسبت‌دادن به این مقاله باشد.
  - Sharding مجوزدار روی Tangle عمومی برای مزایای حریم خصوصی «permissioned setup» (p.8 §IV.C).
  - Digital twin و machine economy (p.6 §III.F).

## ۴. بررسی ادعاهای فعلی

| خط | ادعا | حکم | مکان‌یاب | اصلاح پیشنهادی |
|---|---|---|---|---|
| 499 | IOTA 2.0 «هماهنگ‌کننده متمرکز را حذف کرده» | پشتیبانی‌شده | Abstract؛ p.1 §I؛ p.8 §V | — |
| 499 | «معرفی پروتکل‌های جدید اجماع» | پشتیبانی‌شده | p.3 §II.B (FPC)؛ p.7 §IV.A (OTFPC) | تصریح شود OTFPC در زمان مقاله «در حال توسعه» بوده |
| 499 | «به مقیاس‌پذیری و غیرمتمرکزسازی واقعی **دست یافته است**» | جزئی | p.2 col L («Development work continues»)؛ Table I | لحن ملایم‌تر: «با هدف دستیابی به ... طراحی شده و نسخهٔ Nectar روی devnet تا ۱۰۰۰ TPS را پشتیبانی می‌کند» |
| 502 | «با افزایش تراکنش‌ها ... تأییدها سریع‌تر» | پشتیبانی‌شده | p.1 §I col R | «شبکه قوی‌تر می‌شود» صریحاً در مقاله نیست؛ Table I: «increased TPS with increased network size» |
| 503 | «بدون کارمزد» | پشتیبانی‌شده (برای تراکنش‌های پایه) | Abstract؛ p.6 §II.H | برای قراردادهای هوشمند ISCP کارمزد انعطاف‌پذیر است (p.5 §II.G) |
| 504 | «اجماع غیرمتمرکز با FPC» | پشتیبانی‌شده | p.3 §II.B؛ Table I | — |
| 505 | «قرارداد هوشمند از طریق ISCP» | پشتیبانی‌شده | p.5 §II.G | — |
| 506 | «امضای Ed25519» | پشتیبانی‌نشده (در این منبع) | — (کلمهٔ Ed25519 در متن نیست) | یا فقط به `IOTATANGLE20` (در صورت تأیید) ارجاع شود یا حذف؛ مقاله فقط می‌گوید پیام توسط گرهٔ صادرکننده امضا می‌شود (p.5 §II.F) |
| 511–528 | جدول: DAG، بدون کارمزد، انرژی پایین، بدون ماینر | پشتیبانی‌شده (این کلید در `\cite` نیست) | p.1 §I | افزودن `sealeyIOTATangle202022` به `\cite` خط ۵۱۱ |
| 523 | TPS بلاکچین «۷–۱۵» | غیرقابل‌تأیید (در این منبع) | — | به منبع دیگری ارجاع شود |
| 523 | TPS تنگل «بالا و مقیاس‌پذیر» | پشتیبانی‌شده | Abstract؛ p.2 col L (1000 TPS)؛ Table I | می‌توان عدد را افزود: «تا ۱۰۰۰ TPS در شبکهٔ Nectar» |
| 532–538 | معماری سه‌لایه (شبکه/ارتباطات/کاربردی) | پشتیبانی‌شده (این کلید در `\cite` نیست) | p.2 §II col R؛ Fig. 2a | افزودن کلید؛ «انتخاب نکات» → «انتخاب نوک (tip selection)»؛ «بارهای پیام» → «payload پیام» |
| 486 | «هر تراکنش جدید به دو تراکنش قبلی ارجاع می‌دهد» | جزئی (درست برای legacy) | p.1 col R؛ p.5 §II.C | در IOTA 2.0: بین ۲ تا ۸ والد |
| 542–548 | کاربردهای VANET (شهرت، تأیید سریع، Ed25519) | غیرقابل‌تأیید (این کلید ارجاع نشده و منبع VANET ندارد) | — | این منبع را برای این بخش استفاده نکنید |

## ۵. اصطلاحات

| English | فارسی پیشنهادی |
|---|---|
| Distributed Ledger Technology (DLT) | فناوری دفتر کل توزیع‌شده |
| Directed Acyclic Graph (DAG) | گراف جهت‌دار بدون دور |
| Coordinator | هماهنگ‌کننده |
| Coordicide | حذف هماهنگ‌کننده (کوردیساید) |
| Tip / Tip selection | نوک / انتخاب نوک |
| Restricted Uniform Random Tip Selection (RURTS) | انتخاب تصادفی یکنواخت محدودشدهٔ نوک |
| Markov Chain Monte Carlo (MCMC) | زنجیره مارکوف مونت‌کارلو |
| Fast Probabilistic Consensus (FPC) | اجماع احتمالاتی سریع |
| Leaderless binary voting | رأی‌گیری دودویی بدون رهبر |
| Quorum size | اندازهٔ حد نصاب |
| Agreement rate / Mean termination round | نرخ توافق / میانگین دور خاتمه |
| Meta-stable state | وضعیت فراپایدار |
| Decentralized Random Number Generator (dRNG) | مولد اعداد تصادفی غیرمتمرکز |
| Approval Weight (AW) | وزن تأیید |
| On-Tangle FPC (OTFPC) / Virtual voting | FPC درون‌تنگلی / رأی‌گیری مجازی |
| Mana (access / consensus) | مانا (دسترسی / اجماع) |
| Pledge | تعهد/اختصاص (مانا) |
| Sybil attack / Eclipse attack | حمله سیبل / حمله کسوف |
| Autopeering | همتایابی خودکار |
| Adaptive Proof-of-Work | اثبات کار تطبیقی |
| Minimum Weight Magnitude (MWM) | حداقل بزرگی وزن |
| Congestion control / Rate control | کنترل ازدحام / کنترل نرخ |
| Unspent Transaction Output (UTXO) | خروجی تراکنش خرج‌نشده |
| Double spend | دوبار خرج‌کردن |
| Orphaned message / Reattachment | پیام یتیم / الحاق مجدد |
| Payload / Header / Nonce | محموله / سرآیند / نانس |
| IOTA Smart Contract Protocol (ISCP) | پروتکل قرارداد هوشمند IOTA |
| Committee | کمیته |
| Off-chain / Layer 2 | خارج از زنجیره / لایه دوم |
| Ethereum Virtual Machine (EVM) | ماشین مجازی اتریوم |
| Digital asset / Digital twin / Tokenization | دارایی دیجیتال / همزاد دیجیتال / توکن‌سازی |
| Oracle / Oracle Distributed Network (ODN) | اوراکل / شبکهٔ توزیع‌شدهٔ اوراکل |
| Sharding (hierarchical / fluid) | قطعه‌بندی (سلسله‌مراتبی / سیال) |
| Machine economy | اقتصاد ماشین |
| Devnet / Mainnet | شبکهٔ توسعه / شبکهٔ اصلی |

## ۶. شکل‌ها و جداول قابل استفاده

- **Table I (p.2): «Key differences between legacy IOTA and IOTA 2.0»** — ۱۰ سطر: smart contracts، digital assets، transaction size (100 vs 1700 bytes)، decentralization، Sybil protection (Mana vs None)، spam prevention، address types (reusable vs one-time)، consensus (FPC vs weighted MCMC + coordinator)، scalability، approvement finality. **پیشنهاد اول:** بازسازی به فارسی به‌عنوان جدول جدید در بخش «ویژگی‌های کلیدی V2.0» با ارجاع به این منبع؛ جایگزین مناسبی برای فهرست بولتی فعلی.
- **Table II (p.7): «Key differences between Ethereum and IOTA smart contract protocols»** — سطرها: transaction fees، network utilization، security، layer (2 off-chain vs 1 on-chain)، speed، scalability. مناسب برای بسط بند ISCP.
- **Fig. 1 (p.2):** توپولوژی Tangle در برابر بلاکچین — پشتوانهٔ شکل موجود `fig:iota_vs_bc`.
- **Fig. 2a/2b (p.3):** مدل لایه‌ای انتزاعی IOTA 2.0 و نمودار جریان پروتکل — پشتوانه/جایگزین برای بخش معماری (نیاز به بازترسیم یا ذکر منبع و مجوز).
- **Fig. 3–4 (p.4):** شبیه‌سازی FPC (نرخ توافق و میانگین دور خاتمه بر حسب N، k، q) — برای یک پاراگراف کمی دربارهٔ مقیاس‌پذیری FPC؛ مقادیر دقیق نقاط از متن قابل خواندن نیست، فقط روندها را نقل کنید.

---
**خودبررسی:** فایل کامل؛ بدون placeholder؛ همهٔ ادعاها مکان‌یاب صفحه/بخش دارند؛ اعداد (1000 TPS، 10–12 s، 100/1700 bytes، 2–8 approvals، O(n²)→O(n)، k=11/q=0.1/N≤10000) عیناً از متن. موارد پیدا‌نشده در منبع: Ed25519، VANET/خودرو، «OTV»، عدد ۷–۱۵ TPS.
