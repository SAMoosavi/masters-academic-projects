# یادداشت استخراج منبع: `IOTATANGLE20`

> قرارداد مکان‌یابی: «ص.» یعنی شمارهٔ صفحهٔ مجله (۱۵ تا ۲۶). PDF محلی ۱۳ صفحه است: صفحهٔ ۱ برگهٔ جلد T&F است و صفحهٔ مجلهٔ N برابر صفحهٔ N−13 در PDF است. متن کامل با `pdftotext -layout` خوانده شد.
> هیچ‌کدام از معادله‌ها/شکل‌ها به‌صورت متن استخراج نشدند (تصویرند)؛ هرجا شکلی آمده، محتوای آن فقط از روی کپشن و متن پیرامون توصیف شده است.

## ۱. مشخصات و دسترسی

**ارجاع کامل (طبق برگهٔ «To cite this article»، PDF ص.۱):**
Fartitchou, M., Boussouf, J., El Makkaoui, K., Maleh, Y., & El Allali, Z. (2023). IOTA TANGLE 2.0: AN OVERVIEW. *EDPACS (The EDP Audit, Control, and Security Newsletter)*, 68(5), 15–26. https://doi.org/10.1080/07366981.2023.2293322 — انتشار آنلاین: 15 Dec 2023.

- **سطح دسترسی:** متن کامل (PDF ناشر در `/home/sam/Zotero/storage/ZES7V6G2/IOTA TANGLE 2.0 AN OVERVIEW.pdf`). خوانایی: کامل، به‌جز معادلهٔ منحنی و شکل‌ها (تصویری).
- **نوع منبع:** مقالهٔ مروری کوتاه در یک خبرنامهٔ حرفه‌ای (newsletter)، نه مجلهٔ داوری‌شدهٔ پژوهشی برجسته. حدود ۶ صفحه محتوای فنی + ۴ صفحه نمونه‌کد Python. بیشتر ادعاها از منابع ثانویه (Conti et al. 2022؛ IOTA Foundation 2021؛ Drasutis 2021) نقل شده‌اند → در گزارش برای ادعاهای فنی دقیق، بهتر است در کنار منبع اولیه بیاید.

**بررسی مدخل bib (`report.bib` خط ۱۰۸–۱۲۴):**

| فیلد | وضعیت | نکته |
|---|---|---|
| author | ✅ درست | هر پنج نویسنده با ترتیب درست |
| journal / journaltitle | ⚠️ تکراری و ناهمسان | `journal={Edpacs}` و `journaltitle={EDPACS}` هر دو آمده‌اند؛ biber از `journaltitle` استفاده می‌کند. یکی را حذف کنید و `EDPACS` را نگه دارید. |
| volume/number/pages | ✅ | 68 / 5 / 15--26 |
| year | ✅ | 2023 |
| **doi** | ❌ **مفقود** | `doi = {10.1080/07366981.2023.2293322}` را اضافه کنید. |
| url | ⚠️ | به صفحهٔ `doi/abs/` اشاره دارد؛ با افزودن doi کافی است. |
| urldate | ⚠️ | `2026-06-03` ثبت شده؛ اگر واقعاً همان تاریخ دسترسی است مشکلی نیست. |
| abstract | ⚠️ ناقص | با `...` بریده شده؛ بی‌اثر در خروجی، ولی ناقص. |
| key | ⚠️ گمراه‌کننده | کلید `IOTATANGLE20` قالب نویسنده‌سال ندارد (زیانی ندارد). |
| file | ⚠️ | مسیر `snap/zotero-snap` با مسیر واقعی فعلی (`~/Zotero/storage`) فرق دارد؛ برای build بی‌اثر. |

## ۲. خلاصهٔ ساختاریافته

- **دامنه:** مروری بر پروتکل IOTA 2.0 در بستر IoT: معماری لایه‌ای، طرح امضا (Ed25519 در برابر W-OTS)، چرخهٔ اجماع (congestion control، Mana، FPC، tip selection، approval weight، finality، ledger state)، قراردادهای هوشمند ISCP، و نمونه‌کدهای Python (ص.۱۶، «This work aims to provide an overview…»).
- **محتوای کلیدی:**
  - تاریخچه: IOTA 1.0 (2015)، 1.5 (2017)، 2.0 (2020) (ص.۱۶).
  - حذف coordinator متمرکز در 2.0 (ص.۱۶).
  - جدول ۱: مقایسهٔ کمّی Ed25519 و W-OTS روی Raspberry Pi 1 (ص.۱۸).
  - توصیف ۷ مؤلفهٔ اجماع (ص.۱۹–۲۱).
  - ISCP: اجرای off-chain روی زنجیره‌های فرعی با committee، سازگار با EVM/Solidity (ص.۲۱–۲۲).
- **محدودیت‌ها (ارزیابی من):**
  1. **تناقض درونی دربارهٔ اجماع:** در فهرست ویژگی‌ها (ص.۱۶) آمده «decentralized consensus mechanism called Curl-P»، اما در ص.۱۹–۲۰ و نتیجه‌گیری (ص.۲۵) اجماع FPC معرفی می‌شود. Curl-P در واقع تابع درهم‌ساز IOTA 1.0 است، نه سازوکار اجماع (این آخری دانش عمومی من است، در این منبع نیامده — در صورت استفاده با منبع دیگر تأیید شود). **از جملهٔ Curl-P نقل نکنید.**
  2. هیچ عدد TPS، تأخیر یا انرژی برای خود IOTA داده نشده؛ «high scalability» و «lower energy consumption» کیفی‌اند.
  3. «no fees» با بخش ISCP در تنش است: صاحب قرارداد پاداش متغیر می‌دهد و «The fees for the contract depend on…» (ص.۲۲).
  4. IOTA 2.0 در زمان نگارش «still under development» است (ص.۲۵) — یعنی در گزارش نباید آن را شبکهٔ عملیاتیِ مستقر توصیف کرد.
  5. نمونه‌کدها (seed با 81-trytes، `local pow`) به کتابخانهٔ کلاینتِ نسل‌های پیشین مربوط‌اند و با توصیف 2.0 کاملاً همخوان نیستند (ص.۲۲–۲۳).
  6. هیچ بحث امنیتی صوری/ارزیابی حمله‌ای نیست؛ امنیت فقط در قالب Mana/dRNG/Ed25519 توصیف شده.
  7. هیچ اشاره‌ای به VANET یا خودرو نیست؛ دامنه فقط IoT است (کاربردها: IoT، supply chain، micropayments — ص.۲۵).

## ۳. استخراج محتوا برای بسط متن

### ۳.۱ برای بخش «مقدمه» (report.tex خط ۱۶۹) و «محدودیت‌های بلاکچین» (خط ۴۴۵–۴۵۲)

- **چالش‌های بلاکچین برای IoT** (ص.۱۵–۱۶): «These challenges include scalability constraints, energy consumption, transaction fees, a limited number of transactions per second, and the need for standards for BC-based IoT security solutions».
- **سه چالش اصلی که IOTA برای آن طراحی شد** (ص.۱۶): «These challenges include scalability, cost, and latency (Conti et al., 2022)». → پشتوانهٔ بند «تأخیر بالا».
- **ارقام TPS** (ص.۱۶): «the number of TPS is 7 for BC Bitcoin and 15 for BC Ethereum». (منبعِ این ارقام در خود مقاله ذکر نشده.)
- **رشد IoT برای انگیزه‌دهی** (ص.۱۵): «expected to reach 29.42 billion by 2030, up from 15.14 billion in 2023 (Vailshery, 2022)».
- **تعریف بلاکچین** (ص.۱۵): «a transparent, immutable, and decentralized ledger technology».
- ⚠️ «محدودیت ذخیره‌سازی» و نام‌بردن از «اثبات کار» در این منبع نیست.

### ۳.۲ برای «مفهوم IOTA Tangle» (خط ۴۸۶)

- **پیدایش و ساختار** (ص.۱۶): «In 2015, IOTA cryptocurrency was designed to cater to the needs of IoT networks and applications. The IOTA Tangle is based on a directed acyclic graph (DAG) structure, which has high scalability, no-fee transactions, achievable higher transactions per second, and energy saving».
- **قالب پیام در 2.0** (ص.۱۹–۲۰): «Messages must reference 2 to 8 others, forming a dynamic DAG called the Tangle. They consist of a header, payload, and signature». پیام هم داده و هم تراکنش حمل می‌کند؛ با امضای Ed25519 خاتمه می‌یابد.
  - ⚠️ **تناقض با جملهٔ خط ۴۸۶:** گزارش می‌گوید «هر تراکنش جدید به دو تراکنش قبلی ارجاع می‌دهد» (به Silvano ارجاع شده). این برای IOTA 1.x درست است؛ طبق این منبع در IOTA 2.0 هر پیام به **۲ تا ۸** پیام قبلی ارجاع می‌دهد. پیشنهاد: «در نسخه‌های اولیه به دو تراکنش و در IOTA 2.0 به دو تا هشت پیام قبلی» با هر دو ارجاع.
- **تکامل نسخه‌ها** (ص.۱۶): 1.0 در 2015، 1.5 در 2017، 2.0 در 2020. اجماع 1.0 و 1.5 «relied on a centralized coordinator solution for transaction validation and security».

### ۳.۳ برای «ویژگی‌های کلیدی IOTA Tangle V2.0» (خط ۴۹۹–۵۰۶)

- **فهرست ویژگی‌ها در منبع** (ص.۱۶) — پنج مورد: High scalability، Efficiency، Decentralized consensus، Smart contracts، **Interoperability** («interoperable with other BCs, which makes it possible to transfer value between different networks»). گزارش Interoperability را ندارد و به‌جای آن Ed25519 آورده (که در ص.۱۷ آمده، نه در فهرست).
- **مقیاس‌پذیری** (ص.۱۶): «As IOTA transactions increase, the network becomes more robust and leads to faster confirmations».
- **کارایی** (ص.۱۶): «IOTA 2.0 is very efficient, with no fees and no need for miners».
- **حذف coordinator** (ص.۱۶): «IOTA 2.0 removed this centralized coordinator and replaced it with a decentralized CM that allows nodes in the network to collectively validate transactions and achieve consensus without relying on a single entity». چکیده (ص.۱۵): «IOTA 2.0, designed in 2020, is the first fully decentralized network that supports smart contracts» (ادعای «first» ادعای خود نویسندگان است؛ در گزارش با احتیاط نقل شود).
  - → جملهٔ خط ۴۹۹ که فقط به `sealeyIOTATangle202022` ارجاع داده، از این منبع هم پشتیبانی می‌شود.

### ۳.۴ طرح امضا (برای بند Ed25519، خط ۵۰۶ و ۵۴۸)

- **گذار** (ص.۱۶): «IOTA 1.0 signs transactions using the Winternitz One-Time signature (W-OTS). To improve the security and robustness … IOTA 1.5 and 2.0 switched to the Ed25519 signature scheme».
- **تعریف** (ص.۱۷): «Ed25519 is a variant of the EdDSA scheme designed on the twisted Edwards curve to offer good performance and robust security properties».
- **پارامترها** (ص.۱۸): p = 2^255 − 19؛ d = −121665/121666 (علامت منفی در استخراج متن گم شده — از روی استاندارد Ed25519؛ با PDF چک شود)؛ cofactor = 8؛ مرتبهٔ q = 2^252 + 27742317777372353535851937790883648493.
- **الگوریتم‌ها** (ص.۱۸–۱۹، Algorithms 1–3): تولید کلید (k تصادفی ۲۵۶بیتی، h=SHA512(k)، X=xG)؛ امضا (r=SHA512(y‖m) mod q، R=rG، S=(r+SHA512(R‖X‖m)·x) mod q)؛ تأیید (8SG =? 8R + zX).
- **پیاده‌سازی نویسندگان** روی Raspberry Pi 1 (ARM 1 core 700 MHz، RAM 512 MB) با No Adjacent Form، extended Euclid، روش Shamir و inverted coordinates (ص.۱۷–۱۸).
- **جدول ۱ (ص.۱۸)** — اعداد عیناً:

| Feature | Ed25519 | W-OTS |
|---|---|---|
| Key size | 32 bytes | 256 bytes |
| Signature size | 64 bytes | 1300–3900 bytes |
| Key generation time | 0.138 s | 0.696 s |
| Signing time | 0.149 s | 0.371 s |
| Verification time | 0.207 s | 0.258 s |
| Security level | 128 bits | 112 bits |

  → شاهد کمّی خوب برای «کارآمد و ایمن» در خط ۵۰۶. توجه: زمان‌ها روی سخت‌افزار بسیار ضعیف و با پیاده‌سازی Python هستند؛ نماینده‌ی کارایی Ed25519 در OBU خودرو نیستند.
- ⚠️ خط ۵۴۸ «امنیت سخت‌افزاری» با Ed25519 — Ed25519 طرح امضای نرم‌افزاری است؛ این منبع هیچ ادعای «سخت‌افزاری» ندارد (این خط به این منبع ارجاع نداده؛ صرفاً تذکر).

### ۳.۵ اجماع غیرمتمرکز — چرخهٔ پروتکل (برای بسط بند FPC، خط ۵۰۴؛ پیشنهاد زیربخش جدید)

**چرخهٔ کلی** (ص.۱۹، شکل ۲): پیام‌ها از طریق الگوریتم **congestion control** («crucial in access management») وارد شبکه می‌شوند ← گره‌ها با **FPC** برای حل تعارض و تعیین شاخه‌های مردود رأی می‌دهند ← رأی‌گیری با **mana** در برابر مهاجم محافظت می‌شود ← پس از رد شاخه‌های نادرست، **tip**ها از شاخه‌های درست انتخاب می‌شوند ← با تجمع پیام، **approval weight** شاخه رشد می‌کند ← با رسیدن به وزن کافی، تراکنش‌ها **finalize** و در ledger ثبت می‌شوند و mana برای تعیین رأی‌دهندگان دور بعد به‌روزرسانی می‌شود.

مؤلفه‌ها (همه ص.۱۹–۲۱):

1. **New Message Layout** (ص.۱۹–۲۰): ارجاع به ۲ تا ۸ پیام؛ header + payload + signature؛ امضای Ed25519.
2. **Mana (Sybil Protection)** (ص.۲۰): «In IOTA 2.0, this protection is called "mana."» توسط دارندگان توکن در تراکنش‌های ارزشی به یک node ID تخصیص می‌یابد؛ مقدارش وابسته به مقدار iota تراکنش؛ در ledger ثبت می‌شود؛ دو نقش: **consensus mana** (مشارکت در اجماع) و **access mana** (دسترسی به شبکه). در ص.۱۷ نیز mana «reputation» نامیده شده («reputation (mana) transfer») — پیوند مفهومی جالب با بخش شهرت گزارش.
3. **FPC** (ص.۲۰): «a leaderless consensus protocol where nodes interact with a limited number of others in each round to gather opinions». consensus mana وزن بیشتری به مشارکت‌کنندگان معتمد می‌دهد؛ از **random thresholds** و کمیتهٔ **dRNG** (انتخاب‌شده بر اساس mana، تولید مشترک کلید خصوصی برای اعداد تصادفی، افشا با **beacon messages**) استفاده می‌کند.
4. **Tip Selection** (ص.۲۰): پس از FPC، شاخه‌های حاوی تراکنش‌های disliked رد می‌شوند؛ گره‌ها **به‌طور تصادفی** tip را از شاخه‌های باقی‌مانده انتخاب و بین ۲ تا ۸ پیام را تأیید می‌کنند؛ «This approval mechanism represents a belief in the Tangle … the trust and confidence in the validity of the approved message and its entire history».
5. **Approval Weight** (ص.۲۰): «A branch's approval weight corresponds to the total consensus mana held by nodes that have messaged on that branch». برای تازه‌واردها راهی برای فهم نتیجهٔ رأی‌گیری‌های FPC گذشته است.
6. **Finalization** (ص.۲۰): FPC «has a potential for manipulation»؛ ماژول finality با سطوح اعتماد گره‌های صادق، برگشت‌ناپذیری را می‌سنجد؛ «Messages become confirmed when they exceed a threshold, typically 70%, within 10 seconds». ← **عدد کلیدی برای ادعای «تأیید سریع» (خط ۵۴۷)** — ولی در این منبع، بدون آزمایش و بدون ارجاع مستقل.
7. **Ledger State** (ص.۲۰–۲۱): مدل **UTXO** برای اعتبارسنجی بلادرنگ؛ «reality-based ledger state» برای مقابله با double-spending با بازنمایی ادراک‌های مختلف از وضعیت دفتر.

- ❓ **OTV (On-Tangle Voting)** در این منبع **اصلاً ذکر نشده**؛ کنترل نرخ (rate control) فقط در توصیف لایهٔ ارتباطات و «congestion control» در یک جمله آمده — جزئیات الگوریتمی ندارد.

### ۳.۶ معماری سه‌لایه (خط ۵۳۲–۵۳۷)

شکل ۱ «Layers of the IOTA 2.0 protocol» (ص.۱۷)؛ متن به (Zhang, 2022) ارجاع می‌دهد:
- **Network layer** (ص.۱۷): «focuses on the Tangle node functionality and manages the byte-level operations, including the P2P exchanges between nodes».
- **Communication layer** (ص.۱۷): «responsible for handling IOTA messages. This involves essential tasks such as tip selection approvals, rate control mechanisms, and management of the Tangle ledger».
- **Application layer** (ص.۱۷): «takes charge of executing message payloads. For instance, in the case of a value transaction, it facilitates consensus execution, fund transfers, and reputation (mana) transfer processes».
→ ترجمهٔ گزارش در کل درست است؛ فقط «مدیریت دفتر کل Tangle» در لایهٔ ارتباطات و «انتقال وجه و mana» در لایهٔ کاربرد جا افتاده‌اند. «انتخاب نکات» ترجمهٔ نادرست tip selection است (← «انتخاب نوک/رأس‌های انتهایی»).

### ۳.۷ قراردادهای هوشمند ISCP (خط ۵۰۵)

- (ص.۲۱–۲۲): «The IOTA Smart Contracts Protocol (ISCP) adopts off-chain smart contracts, meaning the execution and security of contracts are not reliant on the entire main network».
- قراردادها روی **subchain**های متصل به Tangle اصلی و توسط زیرمجموعه‌ای از گره‌ها به نام **committee** اجرا می‌شوند؛ committee اجماع می‌کند و با تراکنش‌های امضاشده وضعیت را روی Tangle اصلی ثبت می‌کند (ص.۲۲).
- مزایا (ص.۲۲): هزینهٔ پایین و قابل پیش‌بینی؛ عدم افزودن بار به شبکهٔ اصلی؛ امنیت با افزایش اندازهٔ committee بالا می‌رود؛ پشتیبانی از **EVM** و اجرای مستقیم قراردادهای **Solidity**.
- ⚠️ هزینه (ص.۲۲): «Owners can offer a variable reward to incentivize committee nodes … The fees for the contract depend on factors such as the chain, specific contract details, and the contract owner». → «بدون کارمزد» برای تراکنش‌های لایهٔ پایه است، نه اجرای قرارداد.

### ۳.۸ پیاده‌سازی (اختیاری، احتمالاً خارج از نیاز گزارش)

ص.۲۲–۲۴: نمونه‌های Python (اتصال به گره devnet/mainnet، تولید seed با 81-trytes و mnemonic، تولید آدرس، ارسال/دریافت Data_Message، ارسال توکن، MQTT)؛ مخزن: https://github.com/MedFartitchou/IOTA-Python (ص.۲۶).

## ۴. بررسی ادعاهای فعلی

| خط report.tex | ادعا | حکم | مکان شاهد | اصلاح پیشنهادی |
|---|---|---|---|---|
| 169 | بلاکچین سنتی مقیاس‌پذیری پایین و مصرف انرژی بالا دارد و IOTA جایگزین مناسب معرفی شده | پشتیبانی‌شده | ص.۱۵–۱۶ («scalability constraints, energy consumption…»؛ «designed to address some of the challenges…») | — (می‌توان «در بستر IoT» افزود) |
| 448 | TPS محدود؛ بیت‌کوین ۷، اتریوم ۱۵ | پشتیبانی‌شده | ص.۱۶ «7 for BC Bitcoin and 15 for BC Ethereum» | منبعِ اولیهٔ ارقام در مقاله نیامده؛ نوشتن «حدود» توصیه می‌شود |
| 449 | مصرف انرژی بالا؛ اثبات کار نیازمند منابع زیاد | جزئی | ص.۱۵–۱۶ فقط «energy consumption» | PoW در این منبع نام برده نشده؛ برای PoW منبع دیگری بیاورید |
| 450 | تأخیر بالا برای کاربردهای بلادرنگ | جزئی | ص.۱۶ «scalability, cost, and latency» | «بلادرنگ» در منبع نیست؛ عبارت را به «تأخیر» محدود کنید |
| 451 | کارمزد برای هر تراکنش | پشتیبانی‌شده | ص.۱۶ «transaction fees» | — |
| 452 | محدودیت ذخیره‌سازی | پشتیبانی‌نشده | — | منبع دیگر یا حذف ارجاع به IOTATANGLE20 برای این بند |
| 486 | IOTA یک DLT مبتنی بر DAG | پشتیبانی‌شده | ص.۱۶ «based on a directed acyclic graph (DAG) structure» | — |
| 486 (جملهٔ دوم، ارجاع Silvano) | هر تراکنش به دو تراکنش قبلی ارجاع می‌دهد | در تناقض با این منبع برای 2.0 | ص.۱۹ «Messages must reference 2 to 8 others» | «در IOTA 1.x دو تراکنش؛ در 2.0 دو تا هشت پیام» |
| 499 | 2.0 با حذف coordinator و پروتکل‌های جدید اجماع به غیرمتمرکزسازی رسیده | پشتیبانی‌شده (این منبع هم) | ص.۱۶ «IOTA 2.0 removed this centralized coordinator…» | IOTATANGLE20 را هم به جملهٔ دوم بیفزایید؛ «مقیاس‌پذیری واقعی» اغراق است |
| 502 | با افزایش تراکنش‌ها شبکه قوی‌تر و تأیید سریع‌تر | پشتیبانی‌شده | ص.۱۶ «the network becomes more robust and leads to faster confirmations» | ادعای کیفی نویسندگان است، بدون داده |
| 503 | تراکنش‌ها بدون هیچ هزینه‌ای | جزئی | ص.۱۶ «no fees»؛ اما ص.۲۲ کارمزد قراردادها | «تراکنش‌های لایهٔ پایه بدون کارمزد؛ اجرای قرارداد در ISCP ممکن است کارمزد داشته باشد» |
| 504 | اجماع با FPC | پشتیبانی‌شده (با تناقض درونی منبع) | ص.۱۹–۲۰، ۲۵؛ ص.۱۶ به اشتباه Curl-P | FPC درست است؛ Curl-P را نقل نکنید |
| 505 | قرارداد هوشمند از طریق ISCP | پشتیبانی‌شده | ص.۲۱–۲۲ | می‌توان off-chain/committee/EVM را افزود |
| 506 | Ed25519 کارآمد و ایمن | پشتیبانی‌شده | ص.۱۷ «good performance and robust security properties»؛ جدول ۱ ص.۱۸ | — |
| 521 | ساختار: زنجیرهٔ بلوک در برابر DAG | پشتیبانی‌شده | ص.۱۶ | — |
| 522 | کارمزد بلاکچین «بالا» | جزئی | ص.۱۵–۱۶ فقط وجود «transaction fees» | «دارد» به‌جای «بالا» |
| 523 | TPS بلاکچین ۷–۱۵، IOTA بالا و مقیاس‌پذیر | پشتیبانی‌شده | ص.۱۶ | IOTA عدد ندارد؛ کیفی بماند |
| 524 | مصرف انرژی بالا / پایین | پشتیبانی‌شده (نسبی) | ص.۱۵ «lower energy consumption» | «کمتر» به‌جای «پایین» |
| 525 | ماینر: نیاز دارد / ندارد | پشتیبانی‌شده (بخش IOTA صریح؛ بخش بلاکچین ضمنی) | ص.۱۶ «no need for miners» | برای بلاکچین‌های PoS «ماینر» دقیق نیست → «بلاکچین‌های PoW» |
| 532–535 | سه لایه؛ لایهٔ شبکه: عملیات سطح بایت و P2P | پشتیبانی‌شده | ص.۱۷، شکل ۱ | — |
| 536 | لایهٔ ارتباطات: پیام‌ها، tip selection، کنترل نرخ | پشتیبانی‌شده (ناقص) | ص.۱۷ | «مدیریت دفتر کل Tangle» را بیفزایید؛ «انتخاب نکات» → «انتخاب نوک‌ها (tip)» |
| 537 | لایهٔ کاربردی: اجرای payload و اجماع | پشتیبانی‌شده (ناقص) | ص.۱۷ | «انتقال وجه و mana» را بیفزایید |

**جمع:** ۲۲ ادعا — پشتیبانی‌شده ۱۵، جزئی ۵، پشتیبانی‌نشده ۱ (خط ۴۵۲)، تناقض ۱ (خط ۴۸۶، جملهٔ ارجاع‌شده به منبع دیگر).

## ۵. اصطلاحات

| English | معادل فارسی پیشنهادی |
|---|---|
| Distributed Ledger Technology (DLT) | فناوری دفتر کل توزیع‌شده |
| Directed Acyclic Graph (DAG) | گراف جهت‌دار بدون دور |
| Coordinator | هماهنگ‌کننده |
| Tip / Tip selection | نوک (رأس تأییدنشده) / انتخاب نوک |
| Message / Payload | پیام / محمولهٔ پیام |
| Fast Probabilistic Consensus (FPC) | اجماع احتمالاتی سریع |
| Leaderless consensus | اجماع بدون رهبر |
| Mana (consensus / access mana) | مانا (مانای اجماع / مانای دسترسی) |
| Sybil protection | محافظت در برابر حملهٔ سیبیل |
| Approval weight | وزن تأیید |
| Finality / Finalization | قطعیت / نهایی‌سازی |
| Congestion control / Rate control | کنترل ازدحام / کنترل نرخ |
| Decentralized Random Number Generator (dRNG) | مولد اعداد تصادفی غیرمتمرکز |
| Beacon message | پیام فانوس (بیکن) |
| UTXO | خروجی تراکنشِ خرج‌نشده |
| Reality-based ledger | دفتر کل مبتنی بر واقعیت‌ها |
| Double-spending | دوبار خرج کردن |
| Smart contract / Off-chain | قرارداد هوشمند / خارج‌زنجیره‌ای |
| Committee / Subchain | کمیته / زنجیرهٔ فرعی |
| Winternitz One-Time Signature (W-OTS) | امضای یک‌بارمصرف وینترنیتز |
| Twisted Edwards curve | منحنی ادواردز پیچیده |
| Interoperability | تعامل‌پذیری |

## ۶. شکل‌ها و جداول قابل استفاده

- **شکل ۱ (ص.۱۷) – Layers of the IOTA 2.0 protocol:** مستقیماً برای زیربخش «معماری IOTA Tangle V2.0» (خط ۵۳۲)؛ می‌توان نسخهٔ بازترسیم‌شدهٔ فارسی با ذکر منبع تهیه کرد. (محتوای دقیق تصویر خوانده نشد.)
- **شکل ۲ (ص.۱۹) – Overview of the consensus applications in IOTA 2.0 protocol:** بهترین گزینه برای زیربخش جدید «چرخهٔ اجماع» (congestion control → FPC → tip selection → approval weight → finality → mana).
- **شکل ۳ (ص.۲۱) – Process of the consensus applications … to create a new bundle:** نسخهٔ جزئی‌تر شکل ۲.
- **جدول ۱ (ص.۱۸) – Ed25519 vs W-OTS:** برای پشتیبانی کمّی از انتخاب Ed25519؛ می‌تواند جدول جدیدی در گزارش شود.
- شکل‌های ۴–۹ (ص.۲۲–۲۴): اسکرین‌شات کد Python — برای گزارش ارزشی ندارند.
- ⚠️ شکل فعلی گزارش `IOTA vs Blockchain.png` (خط ۴۸۹) از این منبع **نیست**؛ منبع آن باید جداگانه مشخص و در کپشن ذکر شود.
