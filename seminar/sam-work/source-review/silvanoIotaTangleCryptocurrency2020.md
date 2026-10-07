# یادداشت منبع: silvanoIotaTangleCryptocurrency2020

## ۱. مشخصات و دسترسی

- **ارجاع کامل:** W. F. Silvano and R. Marcelino, "Iota Tangle: A cryptocurrency to communicate Internet-of-Things data," *Future Generation Computer Systems*, vol. 112, pp. 307–319, Nov. 2020. DOI: 10.1016/j.future.2020.05.047
- **دسترسی:** متن کامل (PDF محلی، ۱۳ صفحه: `/home/sam/Zotero/storage/XNVPQUXG/Silvano and Marcelino - 2020 - ....pdf`). متن با `pdftotext -layout` استخراج شد و قابل‌خواندن بود؛ تنها مشکل: بالانویس‌ها از دست رفته‌اند (رک. «3n» در بخش ۳).
- **تاریخچه:** Received 4 Nov 2019؛ revised 21 May 2020؛ accepted 28 May 2020؛ online 1 June 2020 (p. 307).
- **نوع مقاله:** مرور (بخش اول: مبانی Tangle بر اساس Popov's whitepaper؛ بخش دوم: مرور نظام‌مند ۱۹ مقاله با H5-index ≥ 20 از ۲۰۱۵ تا ۱۵ ژوئیه ۲۰۱۹). مقاله **مدل/آزمایش جدید ارائه نمی‌دهد**؛ بیشتر ادعاها از منابع ثانویه ([1] Popov و غیره) نقل شده‌اند.
- **بررسی bib (report.bib خطوط 294–310):** عنوان، نویسندگان، مجله، volume 112، pages 307–319، ISSN 0167-739X و DOI همه با PDF مطابقت دارند. `date = 2020-11-01` با «vol. 112, Nov. 2020» سازگار است (تاریخ انتشار آنلاین 1 June 2020). ✔ مشکلی یافت نشد.
- **نکتهٔ مهم زمانی:** این مقاله دربارهٔ **IOTA 1.x (با Coordinator)** است؛ به IOTA 2.0، FPC، ISCP یا Ed25519 هیچ اشاره‌ای ندارد. فقط مقالهٔ «The coordicide» (May 2019) را به‌عنوان برنامهٔ آینده ذکر می‌کند (p. 309).

> مکان‌یاب‌ها: `p.` = شمارهٔ صفحهٔ مجله؛ `§` = شمارهٔ بخش مقاله.

## ۲. خلاصهٔ ساختاریافته

- **هدف:** «to identify the potential and challenges that Iota Tangle technology has, as well as provide the background for understanding the ecosystem» (§1, p. 308).
- **مبانی (§2):** Tangle یک DAG بدون بلوک است؛ هر تراکنش جدید دو تراکنش قبلی را تأیید می‌کند؛ انتخاب نوک با MCMC؛ PoW سبک برای هر تراکنش؛ اجماع بر اساس cumulative weight؛ نبود ماینر و کارمزد.
- **پیاده‌سازی (§2.2):** Coordinator و Milestone هر دو دقیقه؛ snapshotting؛ Permanode؛ MAM (سه حالت public/private/restricted، مبتنی بر Merkle Signature Scheme)؛ seed ۸۱ تریتی؛ امضای **Winternitz OTS** و مشکل استفادهٔ مجدد از آدرس.
- **مرور نظام‌مند (§3):** ۱۹ مقاله در پنج حوزه: IoT، M2M، E-health، Automotive (دو مقاله: Bartolomeu et al. [37]، Tesei et al. [38] — IOTA-VPKI)، Smart City، و Others.
- **نتیجه (§4):** IOTA «semi-decentralized, public cryptocurrency» با نرخ تراکنش بالا، بدون کارمزد؛ ضعف‌ها: نبود smart contract، وابستگی به Coordinator، ناسازگاری با LPWAN، عدم امکان استفادهٔ مجدد آدرس (WOTS). بزرگ‌ترین چالش: حذف Coordinator (p. 318).

## ۳. استخراج محتوا برای بسط متن

### ۳.۱. برای مقدمه (report.tex خط 169) — محدودیت بلاکچین و انگیزهٔ IOTA

- **Scalability Trilemma:** «Blockchains have face the challenges of being ''decentralized'', ''secure'' and ''scalable'' at the same time. Blockchain systems can only have, two of the three properties problem is known as the ''Scalability Trilemma''» (§1, p. 307).
- **مشکلات طراحی بلاکچین برای IoT:** «the presence of fees, high processing time, and lack of scalability, do not fit well into a heterogeneous device scenario» (§1, p. 307). در §3.2.1 (p. 311، به نقل از [6],[8]): «lack of scalability, high transaction costs, commit latency, large storage, computationally expensive work proof, and power requirements».
- **انرژی:** «It is a more energy-efficient technology compared to Blockchain, that increases transactions speed and makes possible transactions at no cost» (§2, p. 308). ⚠ عدد کمّی برای انرژی یا TPS در مقاله وجود ندارد.
- **ریزتراکنش:** IOTA برای «microtransaction infrastructure for the IoT universe» طراحی شد (§2, p. 308)؛ «Selling data or resources also requires the possibility of sending very small transactions. Cryptocurrencies using Blockchain are unable to resolve these issues» (§1, p. 308).
- آمار Gartner/Cisco: «by 2020 there will be between 25 and 50 billion internet-connected devices» (§1, p. 307) — نقل ثانویه، بدون مرجع مشخص در متن.

### ۳.۲. برای «مفهوم IOTA Tangle» (خط 486) — ساختار DAG

- **تفاوت با بلاکچین:** بلاکچین «a type of directed acyclic graph (DAG) restricted a connection only a single path (the next Block)»؛ IOTA «one other type of DAG less restricted named the Tangle» (§2, p. 308). ← نکتهٔ جالب برای متن: نویسندگان بلاکچین را نیز حالت خاص و محدودی از DAG می‌دانند.
- **دو تراکنش قبلی (ادعای کلیدی گزارش):** «In the Iota Tangle network there are no blocks, each new transaction references the previous two transactions and is not necessary to obtain immediate consensus» (§2, p. 308). و: «Whenever a participant wants to add a new transaction to Tangle he must approve any two transactions previously attached» (همان).
- **معنای تأیید:** ارجاع به دو تراکنش «works as a statement of ''I certify that these transactions, which have not been proven before, as well as all their predecessors, and their success is tied to my success''» (§2, p. 308، به نقل از [15]).
- **گره = تراکنش:** «The network in the Tangle graph is composed of nodes that are entities that issue and validate transactions in the Tangle, and each node also represent a transaction» (§2.1, p. 308).
- **نبود ماینر:** «Since network users themselves who validate the transactions, no miners necessary … all participants issue and validate transactions and are equally responsible for the consensus. Therefore the cost of a transaction involves only the computational cost of validating two other transactions» (§2, p. 308).

### ۳.۳. سازوکار افزودن تراکنش (برای یک پاراگراف فرایندی)

پنج گام (§2.1, p. 308) — نقل نزدیک به متن:
1. گره دو تراکنش دیگر را برای تأیید انتخاب می‌کند «according to a tip selection algorithm Markov Chain Monte Carlo (MCMC)».
2. گره بررسی می‌کند که دو تراکنش با هم در تعارض نباشند و تراکنش‌های متعارض (double-spending) را رد می‌کند.
3. برای صدور تراکنش معتبر باید نوعی PoW حل شود: «finding a nonce, such that its hash is concatenated with some data from the approved transaction … this computational effort is a much lighter version than the one performed by the Blockchain».
4. تراکنش به شبکه ارسال شده و به یک **tip** (تراکنش تأییدنشده) تبدیل می‌شود.
5. tip منتظر تأیید مستقیم یا غیرمستقیم می‌ماند «until its accumulated weight reaches the predefined threshold».

- **ناهمگامی و تعارض:** «Tangle transactions occur asynchronously, and the nodes usually do not see the set of all transactions» (§2.1, p. 308)؛ مثال Fig. 1: تراکنش p با تأیید m و o، تعارض k و g را آشکار می‌کند.
- **حل تعارض:** «execute the tip selection algorithm many times, identifying which of the two transactions is more likely to be indirectly approved by the chosen tip; it is chosen the branch with higher probability, while the other is abandoned» (§2.1, p. 308).
- **پارامتر α:** وزن انباشته نباید تنها معیار باشد؛ «a factor α that does not allow the largest tip to be always selected» (§2.1, p. 309). در §3.2.6 (p. 316): «a low value implies high randomness; a higher value implies low randomness, which means that the walk will be almost deterministic».
- **مبنای امنیتی MCMC:** «the main Tangle chain has more power of accumulated hashing (more weight) than possible attackers» (§2.1, p. 309).

### ۳.۴. وزن و وزن انباشته (weight / cumulative weight)

- **وزن:** «the weight is proportional to the amount of work invested on validating the transaction; on the current implementation, the weight is proportional to 3n for a n positive integer» (§2.1, p. 309). ⚠ در متن استخراج‌شده «3n» آمده؛ به احتمال زیاد بالانویس از دست رفته و منظور **3^n** است (مطابق whitepaper Popov) — پیش از استفاده با PDF چک شود.
- **وزن انباشته:** «defined as the weight of the transaction plus the sum of the weight of all transactions that directly or indirectly approve it» (§2.1, p. 309).
- **پیامد:** «the chain with more accumulated weight tends to grow, while other branches tend to become isolated» (همان).
- **معادلهٔ (1):** H(t) ≈ 2exp(0.352t/h)، که h میانگین زمان لازم دستگاه برای محاسبات صدور تراکنش است (§2.1, p. 309، از Popov [1]). Fig. 2: «cumulative weight vs. time for the high load regime».
- **دورهٔ سازگاری (adaptation period):** پس از رسیدن به رشد خطی، احتمال رهاشدن تراکنش کم است (p. 309).
- **سطح اطمینان وابسته به کاربرد:** «microtransactions can demand a 50% confidence level, while the exchange of a large number of tokens may require more than 99%» (§2.1, p. 309).
- ⚠ هشدار نویسندگان: دورهٔ سازگاری نظری «is only valid in the absence of the ''Coordinator''» (§4, p. 317).

### ۳.۵. Coordinator و coordicide (برای خط 499 و بحث تمرکز)

- «Iota relies on a Coordinator to provide safety against the risk of dishonest actors» (§2.2.1, p. 309).
- تراکنش تأییدشده باید «referenced (directly or indirectly) by a transaction signed by the Coordinator known as Milestone [21], which is emitted every two minutes; all transactions approved by it are considered as 100% confidence, immediately» (p. 309).
- انتقاد: Coordinator به Iota Foundation اجازه می‌دهد «to choose which transactions get priority, to freeze funds, ignore transactions, and is a central point of attack. If the Coordinator stops working, network confirmations will stop» (p. 309).
- Trilemma در IOTA نیز برقرار است: «Iota increased centralization in favor of scalability and safety with the use of the Coordinator» (p. 309).
- Coordicide (May 2019): وعدهٔ «faster transactions, ordered and reliable timestamps, a new rate control algorithm» (p. 309) — بدون جزئیات FPC.
- نتیجه‌گیری: «Iota is a semi-decentralized, public cryptocurrency» (§4, p. 317)؛ «the biggest challenge is to remove the ''Coordinator'' from the network» (p. 318).

### ۳.۶. امضا: Winternitz OTS (نه Ed25519)

- «The Iota protocol uses Winternitz One-Time Signature (WOTS), a cryptographic Hash-based signatures [29] is quite promising resistant to quantum computers [30] and is faster than elliptic curve cryptography [31]» (§2.2.5, p. 310).
- ضعف: «each time signature is created, it reveals 50% of the private key associated with the address» (p. 310)؛ استفادهٔ مجدد از آدرس ← جعل امضا و سرقت وجوه.
- استفادهٔ مجدد آدرس، تحلیل حریم خصوصی را هم آسان می‌کند (p. 310)؛ راهکارها: mixing service، Sarfraz et al. [16] (mixer غیرمتمرکز)، Shafeeq et al. [29] (Cuckoo filter) (pp. 310–311, 316).
- Seed: «must be randomly generated and consists of 81 trytes»؛ کلید خصوصی = hash(seed ‖ index)؛ کلید عمومی = آدرس = hash(کلید خصوصی) (§2.2.5, p. 310).
- **Ed25519 در این مقاله وجود ندارد** (جست‌وجوی کامل متن). گزارش باید Ed25519 را فقط به منبع IOTA 2.0 (IOTATANGLE20) نسبت دهد.

### ۳.۷. MAM — برای بحث حریم خصوصی/کانال داده (پیشنهاد افزودن به گزارش)

- تعریف: «MAM acts as a data communication protocol, cryptographing, and authenticating data flows; it is a module base on the Iota protocol that provides functions to send and read message flows using Tangle» (§2.2.4, p. 310).
- زنجیره‌ای پیوندی: هر تراکنش n به n+1 اشاره دارد ولی مکان n−1 را نمی‌داند (p. 310).
- مبتنی بر MSS = Merkle Hash Tree + OTS؛ مقاوم در برابر کوانتوم؛ هر برگ آدرس درخت بعدی را دارد (p. 310، Fig. 3).
- **سه حالت:** public (ریشهٔ MSS = آدرس)، private (آدرس = H(root))، restricted (payload علاوه بر آن با کلید رمز می‌شود؛ sideKey) (p. 310).
- تمثیل: «MAM works as a radio station, where only those with the right frequency can hear» (p. 310).
- پیام‌های MAM «typical transactions, with zero value» هستند و به امنیت شبکه کمک می‌کنند (p. 310).
- لغو دسترسی: حالت restricted برای «revoke access at any time» لازم است (p. 310).

### ۳.۸. کاربرد در VANET (خط 542) — §3.2.4 Automotive (p. 315)

- **Bartolomeu et al. [37]:** IOTA «can provide a layer of security and privacy for communication protocols»؛ آزمون زمان attach با یک گره عمومی و یک گره خصوصی (پروژهٔ CarrIota)؛ نتیجه: «Tangle suffers from fewer transaction delays than existing public Blockchains»؛ مراحل «tip selection» و «attach to tangle» بیشترین سهم در زمان را دارند؛ «transaction sending» تا 650 ms؛ «the latency of transactions using Iota is insignificant compared to vehicular applications and that Iota technology can provide privacy to automobile communications» (p. 315). ⚠ این‌ها ادعاهای [37] هستند که این مرور نقل کرده؛ برای استناد قوی به [37] مستقیم ارجاع شود.
- **Tesei et al. [38] — IOTA-VPKI:** بر پایهٔ SECMACE VPKI؛ SECMACE وابسته به CA و «vulnerable to errors or violations of this central authority»؛ بازیگرانی برای «vehicle registration» و صدور «trusted pseudonyms»؛ IOTA محرمانگی ثبت/به‌روزرسانی گواهی را تضمین می‌کند؛ هر خودرو در ثبت‌نام کلیدی برای دسترسی به کانال MAM می‌گیرد؛ «resistant to DDoS attacks» (p. 315). ← بسیار مرتبط با بخش شبه‌نام گزارش.
- تهدیدها: «Sybil or DDoS attacks» (p. 315)؛ نمونه‌های نفوذ: Jeep Cherokee، Tesla Model S، VW Golf GTE / Audi A3، BMW (p. 315).
- حریم خصوصی مکان: «anonymity … is particularly relevant when it comes to the vehicle location» (p. 315).
- ضعف بلاکچین در خودرو: «the existence of miners in the network creates dependencies on these actors, and fluctuating price and fees of a cryptocurrency can lead to unpredictable costs»؛ «Blockchain growth for each node is unreasonable in the domain of the Internet of Things» (p. 315).
- نیاز به زمان تأیید قطعی برای «payment of toll by smart cars, payment of fuel, rate of parking» (§3.2.1, p. 312، از [6]).
- شارژ خودروی برقی (Assante & Crucco [9]): یک تراکنش در ثانیه، توقف شارژ در ثانیهٔ بعد پس از اتمام اعتبار (p. 313) — PoC روی Raspberry Pi و LED.
- Smart city (Ferraro et al. [19]): مثال تقاطع چراغ راهنمایی، «small levels of non-compliance can lead to system instability» (p. 315).

### ۳.۹. محدودیت‌ها (برای بخش انتقادی یا جمع‌بندی)

- زمان‌های اندازه‌گیری‌شده در مقالات مرورشده: 7.81 s تا 55.51 s (Zheng et al. [26], p. 314)؛ MAM: ARMv7 میانگین 18.2881 s، Intel i7-7700HQ میانگین 12.5842 s، پیام 1000 کاراکتری (Brogan et al. [24], p. 314)؛ 17 s برای attach با MAM (Shafeeq et al. [36], p. 314)؛ «from a few seconds to more than 1 min» (p. 315). ← «تأیید سریع/بلادرنگ» باید با احتیاط بیان شود.
- عدم تضمین قطعی double-spending: «not guaranteeing double-spending with 100% certainty but with a certain probability» (§3.2.2, p. 313).
- Table 3 (p. 318): نبود smart contract؛ عدم تمرکززدایی کامل؛ ناسازگاری با LPWAN؛ عدم امکان چند تراکنش با یک آدرس.
- Snapshot تاریخچه را حذف می‌کند؛ «There is often a confusion between Blockchain and Tangle, giving the impression that transaction data is saved permanently» (§4, p. 317).

## ۴. بررسی ادعاهای فعلی

| خط | ادعا | حکم | مکان‌یاب | اصلاح پیشنهادی |
|---|---|---|---|---|
| 169 | بلاکچین سنتی مقیاس‌پذیری پایین و مصرف انرژی بالا دارد و IOTA جایگزین مناسب معرفی شده | پشتیبانی‌شده (کیفی) | §1 p. 307 (Trilemma, fees, lack of scalability)؛ §2 p. 308 «more energy-efficient technology compared to Blockchain» | می‌توان Scalability Trilemma را صریحاً افزود. |
| 486 | IOTA یک DLT مبتنی بر DAG است | پشتیبانی‌شده | Abstract; §2 p. 308 | — |
| 486 | هر تراکنش جدید به دو تراکنش قبلی ارجاع می‌دهد | پشتیبانی‌شده | §2 p. 308 «each new transaction references the previous two transactions» | دقیق‌تر: «دو تراکنش تأییدنشده (tip) را با الگوریتم MCMC انتخاب و تأیید می‌کند» (§2.1 p. 308). |
| 496 (توضیح شکل) | بلاکچین زنجیرهٔ بلوک‌ها، Tangle گراف DAG | پشتیبانی‌شده | §2 p. 308 | می‌توان افزود که بلاکچین خود DAG محدود به یک مسیر است. شکل گزارش از این مقاله نیست. |
| 499–506 | ویژگی‌های V2.0 (FPC، ISCP، Ed25519، حذف Coordinator) | خارج از این منبع (به آن ارجاع نشده) | — | این منبع فقط از برنامهٔ coordicide (p. 309) یاد می‌کند؛ این مقاله را برای V2.0 استناد نکنید. |
| 511 | IOTA مشکلات بلاکچین را رفع می‌کند (cite silvano) | جزئی | §4 p. 317, Table 2 p. 318 | افزودن قید: در این منبع، IOTA «semi-decentralized» و وابسته به Coordinator است (p. 317). |
| جدول، ساختار | زنجیره بلوک vs DAG | پشتیبانی‌شده | §2 p. 308 | — |
| جدول، کارمزد | بلاکچین بالا / IOTA بدون کارمزد | پشتیبانی‌شده (IOTA)؛ «بالا» برای بلاکچین کلی | Abstract «no fees»؛ p. 315 «fluctuating price and fees» | — |
| جدول، TPS | بلاکچین ۷–۱۵؛ IOTA بالا و مقیاس‌پذیر | جزئی | p. 311 «Iota becomes scales as the number of transactions … increases»؛ p. 317 «capable of performing high transaction rates» | عدد ۷–۱۵ در این منبع نیست — منبع دیگری لازم است. قید شود که مقیاس‌پذیری «if the ''Coordinator'' is no longer active» (p. 318). |
| جدول، انرژی | بلاکچین بالا / IOTA پایین | پشتیبانی‌شده (کیفی) | p. 308؛ p. 317 «lower energy consumption … in comparison to other DLTs» | عدد کمّی وجود ندارد. |
| جدول، ماینر | بلاکچین نیاز دارد / IOTA ندارد | پشتیبانی‌شده | p. 308 «no miners necessary» | اما PoW سبک برای هر تراکنش لازم است (p. 308) — ذکر شود. |
| 542–548 | کاربرد در VANET (cite silvano) | جزئی | §3.2.4 p. 315 | مقاله دربارهٔ «ذخیرهٔ امتیاز شهرت» چیزی ندارد (آن را فقط به feraudo نسبت دهید). کاربردهای واقعی این منبع: IOTA-VPKI و شبه‌نام [38]، تأخیر پایین [37]، پرداخت عوارض/پارکینگ/شارژ. |
| 545 | ذخیره‌سازی امتیازات شهرت | پشتیبانی‌نشده توسط این منبع | — | فقط به feraudoDIVADIDbasedReputation2024 ارجاع شود. |
| 546 | تراکنش‌های بدون کارمزد | پشتیبانی‌شده | Abstract; p. 317 | — |
| 547 | تأیید سریع برای کاربردهای بلادرنگ | جزئی | p. 315 (latency «insignificant» طبق [37]) در برابر p. 314–315 (چند ثانیه تا بیش از ۱ دقیقه) | تعدیل: «تأخیر کمتر از بلاکچین‌های عمومی، اما زمان attach از چند ثانیه تا بیش از یک دقیقه گزارش شده است». |
| 506, 548 | امضای Ed25519 / «امنیت سخت‌افزاری» | پشتیبانی‌نشده توسط این منبع (متناقض) | §2.2.5 p. 310؛ §4 p. 317: IOTA از WOTS استفاده می‌کند | در خط 548 ارجاع silvano را برای Ed25519 حذف کنید؛ «امنیت سخت‌افزاری» در هیچ‌کجای مقاله نیست و Ed25519 نیز ربطی به سخت‌افزار ندارد. اگر Ed25519 مدنظر است، فقط به منبع IOTA 2.0 ارجاع شود و قید شود IOTA 1.x از WOTS (هش‌محور، مقاوم کوانتومی، یک‌بارمصرف) استفاده می‌کرد. |

## ۵. اصطلاحات

| English | فارسی |
|---|---|
| Distributed Ledger Technology (DLT) | فناوری دفتر کل توزیع‌شده |
| Directed Acyclic Graph (DAG) | گراف جهت‌دار بدون دور |
| Tangle | تنگل (درهم‌تنیده) |
| tip | نوک (تراکنش تأییدنشده) |
| tip selection algorithm | الگوریتم انتخاب نوک |
| Markov Chain Monte Carlo (MCMC) | زنجیرهٔ مارکوف مونت‌کارلو |
| approve / approval (direct/indirect) | تأیید (مستقیم/غیرمستقیم) |
| weight / accumulated (cumulative) weight | وزن / وزن انباشته |
| adaptation period | دورهٔ سازگاری |
| Proof-of-Work (PoW), nonce | اثبات کار، نانس |
| double-spending | دوبار خرج‌کردن |
| Coordinator / Milestone | هماهنگ‌کننده / نقطهٔ عطف (Milestone) |
| coordicide | حذف هماهنگ‌کننده (coordicide) |
| snapshotting (local/global) | تصویر لحظه‌ای (محلی/سراسری) |
| Permanode / Full node / Light node | گرهٔ دائمی / گرهٔ کامل / گرهٔ سبک |
| Masked Authenticated Messaging (MAM) | پیام‌رسانی احرازشدهٔ پوشیده |
| Merkle Signature Scheme (MSS) / Merkle Hash Tree | طرح امضای مرکل / درخت هش مرکل |
| Winternitz One-Time Signature (WOTS) | امضای یک‌بارمصرف وینترنیتز |
| seed / tryte | بذر / تریت |
| address reuse | استفادهٔ مجدد از آدرس |
| Scalability Trilemma | سه‌گانهٔ مقیاس‌پذیری |
| semi-decentralized | نیمه‌غیرمتمرکز |
| Vehicular Public Key Infrastructure (VPKI) | زیرساخت کلید عمومی خودرویی |
| Machine-to-Machine (M2M) | ماشین به ماشین |

## ۶. شکل‌ها و جداول قابل استفاده

- **Fig. 1 (p. 308):** «Graph illustrating a part of Tangle. (a) State at any time t (b) State t + 1, with a new transaction p» — مناسب برای توضیح افزودن تراکنش و کشف تعارض (k و g). می‌تواند جایگزین/مکمل شکل فعلی `IOTA vs Blockchain.png` شود (با ذکر منبع / بازترسیم).
- **Fig. 2 (p. 309):** «Plot of cumulative weight vs. time for the high load regime [1]» — برای توضیح دورهٔ سازگاری (منبع اصلی: Popov).
- **Fig. 3 (p. 310):** «Example of a Merkle Hash Tree with 4 leaves» — برای MAM/MSS.
- **Fig. 5 (p. 317):** «Possible network architectures to publish sensor data to the tangle» — سه معماری (a/b/c)؛ قابل‌انطباق با OBU/RSU در VANET (تفسیر نگارنده، نه ادعای مقاله).
- **Table 1 (p. 312):** فهرست ۱۹ مقاله؛ دو مورد Automotive (Bartolomeu 2018 [37]؛ Tesei 2018 IOTA-VPKI [38]).
- **Table 2 و Table 3 (p. 318):** جنبه‌های مثبت و منفی IOTA — منبع مناسب برای تکمیل/متوازن‌کردن جدول `tab:iota_vs_bc` گزارش (مثلاً افزودن ردیف‌های «تمرکززدایی: نیمه‌غیرمتمرکز (Coordinator)» و «قرارداد هوشمند: پشتیبانی‌نشده در IOTA 1.x»).
