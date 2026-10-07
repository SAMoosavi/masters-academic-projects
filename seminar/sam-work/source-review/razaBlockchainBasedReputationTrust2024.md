# یادداشت استخراج منبع: `razaBlockchainBasedReputationTrust2024`

> قرارداد مکان‌یابی: شماره صفحه‌ها شماره صفحه مجله است (صفحه ۱ فایل PDF = p.196887؛ پس صفحه n فایل = 196886+n). «L» یعنی شماره خط در `report.tex`.
> جدول‌ها و شکل‌های مقاله تصویری‌اند؛ محتوای آن‌ها با نگاه مستقیم به صفحه رندرشده خوانده شد (Table 3: p.196891؛ Table 4/5: p.196897؛ Fig. 3: p.196890؛ Fig. 4/5: p.196894).

---

## ۱. مشخصات و دسترسی

- **ارجاع کامل:** A. Raza, E. Badidi, M. Hayajneh, E. Barka, O. El Harrouss, "Blockchain-Based Reputation and Trust Management for Smart Grids, Healthcare, and Transportation: A Review," *IEEE Access*, vol. 12, pp. 196887–196913, 2024. DOI: 10.1109/ACCESS.2024.3521428.
- **تاریخ‌ها (p.196887):** "Received 13 November 2024, accepted 17 December 2024, date of publication 23 December 2024, date of current version 31 December 2024."
- **دسترسی:** متن کامل (PDF ۲۷ صفحه) در `/home/sam/Zotero/storage/Y74U5BHE/`؛ مجوز CC BY 4.0 (p.196887). کل متن و جدول‌های ۲ تا ۵ و شکل‌های ۲ تا ۵ مستقیم خوانده شد؛ جدول‌های ۷ تا ۱۳ (خلاصه مطالعات) فقط عنوانشان بررسی شد.
- **بررسی متادیتای bib:** نویسندگان، عنوان، مجله، جلد ۱۲، صفحات 196887–196913، DOI و سال ۲۰۲۴ همه با PDF مطابقت دارند. ✔ مشکلی دیده نشد. (فیلد `file` به مسیر snap Zotero اشاره می‌کند؛ اثری روی biber ندارد.)
- **نوع منبع:** مرور نظام‌مند (systematic review) — ۵۱ مقاله، ۲۰۱۸ تا ۲۰۲۳، از IEEE Xplore، Google Scholar و Scopus (p.196889–196890). **نکته مهم:** بخش «فناوری بلاکچین» این مقاله عمومی است (نه مخصوص VANET)؛ تنها بخش VII (p.196902–196904) و چند بند از بخش VIII مخصوص حمل‌ونقل/VANET است.

## ۲. خلاصه ساختاریافته

- **هدف:** مرور روش‌های مدیریت اعتماد و شهرت مبتنی بر بلاکچین در سه حوزه شهر هوشمند: شبکه برق هوشمند، سلامت و حمل‌ونقل (abstract، p.196887).
- **روش:** سه مرحله (planning / conducting / reporting؛ Fig. 1, p.196889)؛ ۵ پرسش پژوهشی RQ1–RQ5؛ معیار ورود: ۲۰۱۸–۲۰۲۳، مقاله مجله/کنفرانس، انگلیسی (p.196890). ۷۶٪ مقالات مجله و ۲۴٪ کنفرانس (p.196890). توزیع (Table 2, p.196890): انرژی 33%، سلامت 32%، VANET 35%.
- **محتوا:** بخش III: مبانی بلاکچین، لایه‌ها، انواع، چالش‌ها، کاربردها؛ بخش IV: مدیریت اعتماد، رده‌بندی، رمزنگاری (DH، ECC، کلید عمومی، ZKP)، مکانیزم‌های اجماع (Table 4/5)؛ بخش V–VII: مرور مطالعات سه حوزه؛ بخش VIII: ۹ چالش باز؛ بخش IX: نتیجه‌گیری.
- **یافته اصلی (abstract):** "the existing trust schemes are resource-constrained and encounter scalability limitations, high energy consumption, and incompatibility with existing systems."

## ۳. استخراج محتوا برای بسط متن

### ۳.۱ مرور کلی بلاکچین — تعریف و ساختار (report §«تعریف و مفهوم»، L341)

- **تعریف اصلی (p.196890, §III.A):** "Blockchain is fundamentally a peer-to-peer network that provides secure execution of transactions without the need for a trusted third party [22]."
- **زنجیره بلوک‌ها (p.196890):** "blockchain is a backward-linked list of blocks chained together [23], as illustrated in Figure 2. Each block includes a header, certificates, and its previous block's hash [24]."
- **محتوای سرآیند و گواهی (p.196890–196891):** سرآیند بلوک شامل "the block's ID, the generator's ID, the signature of the block, the hash of the block, and the timestamp"؛ گواهی بلوک شامل "the certificate's ID, node's ID, node's public key, a hash of the certificate, and timestamp". "Every new block contains the previous block's hash, which contains the previous block's hash, and so on."
- **پایه DLT و مقایسه با پایگاه داده (p.196888, §I):** بلاکچین "is built on the idea of Distributed Ledger Technology (DLT) as its foundation"؛ مشابه پایگاه داده سنتی با ویژگی‌های ACID است، اما "The significant difference between the two is the 'consensus' algorithm that decides whether a new block is legitimate to insert or not". سامانه بلاکچینی "combines a P2P network with a shared ledger, cryptography, and a computing platform".
- **سازوکار تراکنش (p.196891):** زنجیره "tamper-resistant" و "replicated all over the blockchain network"؛ گره برای ایجاد تراکنش امضای دیجیتال با رمزنگاری کلید خصوصی به کار می‌برد [27].
- **انواع بلاکچین (p.196891):** (۱) Permissioned/private — فقط اعضای گروه بسته حق «Write» دارند؛ نمونه‌ها: Hyperledger Fabric، GemOS، MultiChain؛ (۲) Permissionless/public — هر تراکنش برای همه گره‌ها قابل دیدن است و هر گره می‌تواند در اجماع شرکت کند؛ (۳) Consortium/hybrid — "semi-private"؛ به گروهی از سازمان‌های تأییدشده داده می‌شود؛ Ethereum از ساخت آن پشتیبانی می‌کند.
- **مقایسه سه نوع (Table 3, p.196891):** دسترسی: Public=Anyone، Consortium=Multiple selected organizations، Private=Single organization؛ تمرکززدایی: Decentralized / Partially decentralized / Centralized؛ تغییرناپذیری: Immutable / Partially immutable / Alterable؛ شفافیت: Transparent / Partially transparent / Opaque؛ سرعت اجرا: Slow / Lighter and faster / Lighter and faster؛ مقیاس‌پذیری: Poor / Good / Superior؛ اجماع: PoW or PoS / PBFT, PoET, PoA / Ripple؛ نمونه‌ها: Bitcoin, Ethereum, Litecoin… / Hyperledger, Ripple, R3 / Multichain, Blockstack….
- **تاریخچه و نسل‌ها (p.196891–196892):** بلاکچین نخست "as Bitcoin's distributed ledger to alleviate the double-spending problem" پیشنهاد شد؛ سه نسل: Blockchain 1.0 (ارز دیجیتال)، 2.0 (مالی دیجیتال)، 3.0 (جامعه دیجیتال) [50].
- **ویژگی‌های امنیتی ذاتی (p.196892, §III.C):** "consistency, tamper-resistance, pseudonymity, resistance to several attacks, double-spending problems, and forking."

### ۳.۲ لایه‌های بلاکچین (L345–353)

- **ادعای منبع (p.196891):** "Blockchain comprises six layers [25], [26] as shown in Figure 3." (منبع اولیه لایه‌ها ارجاع [25] Zhang et al. ACM CSUR 2019 و [26] Sullivan 2021 است؛ این مرور منبع دست‌دوم است.)
- **محتوای Fig. 3 (p.196890) از پایین به بالا:**
  - Data Layer: "Data blocks, chain structure, hash functions, timestamp, Merkle tree, digital signature"
  - Network Layer: "P2P network, transmission protocols, verification mechanism"
  - Consensus Layer: "PoW, PoS, DPoS, PBFT"
  - Incentive Layer: "Currency issue and distribution mechanisms"
  - Contract Layer: "Script code, smart contracts, algorithms & mechanism"
  - Application Layer: "Programmable Finance, programmable currency, programmable society"
- پیشنهاد: توضیح هر لایه در گزارش با همین اقلام بسط داده شود (مثلاً لایه داده را با درخت Merkle و مهر زمانی؛ لایه انگیزش را «صدور و توزیع ارز» به جای «پاداش‌ها» توصیف کنید). متن مقاله توضیح بیشتری برای هر لایه نمی‌دهد.

### ۳.۳ مکانیزم‌های اجماع (L367–383)

- **تعریف (p.196895, §IV.B):** "A consensus algorithm is a solution designed to address the 'Byzantine Generals' problem.'" الگوریتم کارا "is resistant to attacks, fault-tolerant, performant, and accessible to all network participants."
- **دسته‌بندی (p.196895, Fig. 6):** proof-based در برابر voting-based. proof-based: گره‌ای که "conducts adequate verification is granted the privilege of adding a new block … and is rewarded"؛ voting-based: "based on Byzantine fault-tolerance and have solid mathematical proofs".
- **توضیحات متنی (p.196895–196896):**
  - **DPoS:** "consumes less energy and leads to faster transactions than PoW and PoS. It implements a one vote per share mechanism"؛ اما "limits decentralization".
  - **PoS:** "aims to stake peers' economic share in the network"؛ اعتبارسنج "in a pseudo-random fashion" انتخاب می‌شود؛ "block finality in PoS-enabled blockchains is faster than in PoW-enabled blockchains."
  - **PoW:** پیشنهاد Dwork و Naor برای مقابله با spam؛ "the first blockchain consensus protocol"؛ "requires high computational power, lacks scalability, and poses long latency for transaction confirmation".
  - **PBFT:** "first introduced in 1999 to reduce the complexity of the original Byzantine fault tolerance algorithm from exponential to polynomial [96]. It is the most widely used consensus algorithm"؛ اما "inappropriate for use in SCM, energy trading, etc."
  - همچنین PoA (ترکیب PoS+PoW)، PoAu (Proof of Authority؛ گرایش به تمرکز)، PoET (Intel، 2016)، Ripple (UNL)، و پروتکل‌های جایگزین dPoW، PoE، Casper، PoC، TCON، PoEC، PoM.
- **Table 4 (proof-based, p.196897) — ردیف‌های مرتبط با جدول گزارش:**

  | ویژگی | DPoS | PoS | PoW |
  |---|---|---|---|
  | Energy Cost | Very Low | Low | High |
  | Scalability | High | Medium | Low |
  | Processing Speed (TPS) | High | Medium | Low |
  | Decentralization | Semi-centralized | Semi-centralized | High |
  | Security | Low | Low | High |
  | Adversary Tolerance | <51% validators | <51% stake | <25% computing power |
  | Limitations | Moderate centralization, prone to attacks | large-stake validators → centralization, less secure than PoW, lack of consensus finality | Energy-intensive, high computational cost, vulnerable to forks and 51% attacks |

- **Table 5 (voting-based, p.196897) — PBFT:** DLT Type: Permissioned؛ Decentralization: Low؛ TPS: High؛ **Energy Cost: Low/ Medium**؛ Security: High؛ **Scalability: High**؛ Consistency: No Fork؛ Adversary Tolerance: "Less than or equal to 33% faulty replicas"؛ Limitations: "Inefficient for large networks, prone to DoS and Sybil attacks"؛ Application: Hyperledger, military, law enforcement.
  - ⚠ تناقض درونی منبع: Table 5 مقیاس‌پذیری PBFT را High می‌دهد ولی در همان ردیف محدودیت می‌گوید "Inefficient for large networks". در متن گزارش بهتر است به این نکته اشاره شود.
- **کاربرد در VANET (بخش VII):** ترکیب‌های PoW+PoS (Wang et al. [169]؛ Yang et al. [8]؛ Zhang et al. [173])، PBFT برای انتخاب RSU رهبر (Kudva et al. [170])، PoW+BFT (Liu et al. [172])، PBFT+PoS برای بهبود مقیاس‌پذیری در 6G (Wang et al. [175]) و Proof of Trust (Singh et al. [182]) برای "resource-constrained VANET environments" (p.196902–196904).
- **انتخاب اجماع (p.196906–196907, §VIII.3):** "the choice of a consensus algorithm depends on the specific application requirements to provide security, scalability, and energy efficiency."

### ۳.۴ چالش‌های بلاکچین (L387–396)

- **فهرست اصلی (p.196891, §III.A):** "Primarily, blockchain faces the challenges of trust management and data sharing [33]." سپس نُه بند: Design Complexity؛ Governance and Regulations؛ Privacy and Security؛ Interoperability؛ Fork Problem؛ Scalability؛ Storage Capacity؛ Computational Complexity؛ Energy Consumption. (در منبع فقط عنوان آمده و توضیحی ندارند.)
- **چالش‌های باز بخش VIII (p.196905–196907)** — نُه بند با توضیح:
  1. **Privacy:** بلاکچین "does not include confidentiality among its primary objectives"؛ خطر از دست رفتن کلید خصوصی؛ double expenditure یا transaction reversal.
  2. **Security:** "Wallet security attacks and 51% attacks are the most recognized blockchain security threats [27]"؛ تعریف حمله ۵۱٪: "a group of malicious miners takes over 50% of a network's mining hash rate"؛ سایر: long-range، DDoS، P + epsilon، Sybil، balance، BGP hijacking؛ "Trust models are not robust enough to deal with … malicious recommendations."
  3. **Consensus Protocol:** الگوریتم‌های سنتی "requiring high computing power, slow consensus formation, and low data throughput".
  4. **Adaptability and Interoperability:** گذار از متمرکز به غیرمتمرکز "requires much technical effort"؛ "One pressing challenge is integrating a trust management system within existing systems"؛ محدودیت منابع گره‌های لبه.
  5. **Trusted Third Party:** حتی مدل‌های مدعی غیرمتمرکز "still need a trusted third party or a certification authority most of the time".
  6. **System Overheads:** هزینه منابع و پیچیدگی محاسباتی.
  7. **Latency and Throughput (VANET-محور):** پروتکل‌های سنتی مانند PoW "computationally intensive and slow, leading to high latency, which is unsuitable for dynamic networks like VANETs"؛ "Ethereum and Hyperledger have limited Transactions per Second (TPS) capability".
  8. **Data Immutability and Legal Ownership (VANET-محور):** داده نادرست وارده "adversely affects the VANET operations and leads to error propagation".
  9. **Governance Issues (VANET-محور):** "achieving consensus among vehicle owners and government agencies for regulatory oversight and coordination is hard."
- **چالش‌های IoV (p.196904–196905):** "The most common trust management issues in IoV are inefficiency, low latency, heterogeneous trust evaluation, and aggregations to the high dynamic nodes [175]". (عبارت "low latency" عیناً در منبع است؛ احتمالاً منظور نیاز به تأخیر کم است.) همچنین نیاز به پیوند تراکنش با هویت معلوم ← نگرانی حریم خصوصی؛ هدف حملات DDoS.

### ۳.۵ بلاکچین به‌عنوان راه‌حل برای VANET — مزایا و کاربردها (L169، L405–425)

- **مزایای صریح (Conclusion, p.196907):**
  1. "Decentralization is achieved by eliminating a single point of failure, which enhances security and resilience."
  2. "The immutability of blockchain transactions ensures that data cannot be altered or tampered with, providing an additional layer of trust."
  3. "The traceability of blockchain transactions prevents malicious use of data."
  (این سه بند تقریباً کلمه‌به‌کلمه با L408–410 گزارش منطبق است؛ توجه: این مزایا برای «شهر هوشمند» بیان شده، نه صرفاً VANET.)
- **شفافیت و ردیابی (p.196892, §III.D):** "these transactions can be tracked with full transparency as the blockchain maintains a complete history of the transactions"؛ ماهیت توزیع‌شده "promotes the immutability, traceability, and verifiability".
- **حمل‌ونقل/IoV (p.196891, §III.B.1):** "Blockchain has the potential to give unique solutions to the Internet of Vehicles (IoV)"؛ "self-organizing data management platform"؛ مزایده برای تخصیص منابع؛ تجارت انرژی امن برای EVها.
- **بخش VII (p.196902):** "blockchain technology has positively impacted the transportation sector … hence the name smart transportation"؛ "The reliability and security of the vehicle-and-roadside collaboration directly affect transportation safety"؛ "Trust management systems play a crucial role in protecting the privacy, preservation, and identity protection of vehicles and their data."
- **نمونه کاربردها در VANET (برای بند «کاربردها»):**
  - *صحت پیام:* Yang et al. [8]: خودروها اعتبار پیام دریافتی را رتبه‌دهی و به RSU می‌فرستند؛ RSU آفست اعتماد را محاسبه می‌کند؛ اجماع PoW+PoS (p.196902). Zhang et al. [173]: ذخیره reputation در بلاکچین و کشف پیام نادرست (p.196902). Cong Pu [178] (p.196904).
  - *ذخیره مقادیر اعتماد:* "trust degrees are stored in the blocks [5]" (p.196893)؛ BLAST (Kandah et al. [6])، Zhang et al. [165] (GTL به‌عنوان بلوک جدید)، Cinque et al. [177] (p.196903–196904).
  - *حریم خصوصی/هویت شرطی:* Liu et al. [172]: نام مستعار (public address) در بلاکچین، ردیابی هویت مخرب توسط TA، امضای گروهی مبتنی بر هویت (p.196902)؛ SE zk-SNARKs برای "anonymity and conditional privacy in vehicular networks [84]" (p.196895)؛ Jiang et al. [82] NIZK (p.196895).
  - *مدیریت هویت و کلید:* Theodouli et al. [176]: W3C DIDs و VCs؛ "avoids a single point of failure and eliminates the need for a centralized Certificate Authority" (p.196903)؛ Javaid et al. [183]: PUF + blockchain PKI (p.196904)؛ Malik et al. [171]: کلیدها روی دفترکل (p.196902).
- **قراردادهای هوشمند:** Wang et al. [169]: دو قرارداد FASC و TESC برای ارزیابی اعتماد خودروها (p.196902). عبارت «اجرای خودکار سیاست امنیتی» عیناً در منبع نیست؛ نزدیک‌ترین: "DL-based access control … robustly enforce access control policies without depending on a single trusted party [52]" (p.196892، در زمینه وب‌اپلیکیشن).

### ۳.۶ مدل‌های مدیریت اعتماد (L429–436)

- **تعریف مدیریت اعتماد (p.196893, §IV.A):** "consists of information collection, trust-related content storage, trust calculation, trust maintenance, and decision-making"؛ "the first line of defense among the digital systems' security dimensions".
- **رده‌بندی Wang et al. [64]:** decision models، evaluation models، management models (p.196893؛ Fig. 5).
- **چهار رده TMS (p.196893–196894):** "The existing trust management systems (TMS) are divided into four classes: recommendation-based, prediction-based, reputation-based, and policy-based [61], [65]." — ⚠ منبع هیچ تعریفی برای این چهار رده نمی‌دهد.
- **بر اساس حالت مدیریت (p.196894, Fig. 5):** centralized (نقطه شکست واحد، مقیاس‌ناپذیری، هزینه بالای سرور)؛ decentralized ("eliminate the single point of failure" اما "massive computation and energy overheads")؛ semi-centralized (ترکیب؛ "overcome most of the disadvantages of both"). Fig. 5 بلاکچین و Edge/Fog را زیر مدل‌های غیرمتمرکز و Hybrid with DLT را زیر نیمه‌متمرکز قرار می‌دهد.
- **روش‌های محاسبه اعتماد (p.196894):** "Bayesian, fuzzy reasoning, maximum likelihood, weighted average, and grey reasoning".
- **تکنیک‌های پیاده‌سازی TMS (p.196894):** Certificate Generation؛ Cryptography (ECC, ECDSA, SAS, SHA-256, SSE, PKI)؛ Bayesian Inference؛ Fuzzy Logic؛ Trust Values (rating/reputation).
- **مدل عمومی (Fig. 4, p.196894):** Composition → Propagation → Aggregation → Update → Formation → Trustworthiness.
- **اعتماد چندلایه در VANET (p.196902–196903):** BLAST [6] با سه نوع اعتماد؛ [174]: detection، reference، transmission trust؛ [175]: global trust = میانگین وزنی local trustها؛ direct/recommended trust [118], [127] (حوزه شبکه برق، p.196899).

### ۳.۷ محدودیت‌ها و راهکارها (L445–464)

- **محدودیت‌های مستند در منبع:** TPS محدود Ethereum/Hyperledger و تأخیر نامناسب برای VANET بلادرنگ (§VIII.7, p.196907)؛ انرژی بالای PoW (Table 4؛ p.196896)؛ Storage Capacity (p.196891، فقط عنوان)؛ abstract: "scalability limitations, high energy consumption, and incompatibility with existing systems".
- **عدد TPS:** منبع هیچ عددی (۷ یا ۱۵ TPS) نمی‌دهد. کارمزد تراکنش (transaction fee) نیز در منبع نیامده است.
- **راهکارهای مستند:** "Alternative Consensus Mechanisms like PoS or PBFT can reduce latency but still may not meet the stringent low-latency requirements for real-time VANET applications" (p.196907)؛ الگوریتم‌های سفارشی/ترکیبی "by combining the strengths of widely known algorithms or by incorporating divergent technologies, such as virtual mining technology" (p.196906–196907)؛ ترکیب PBFT+PoS "improves scalability and reduces computational complexity" (Wang et al. [175], p.196903)؛ مدل نیمه‌متمرکز (p.196894).
- **Sharding، sidechains و Lightning Network:** در متن این منبع **نیامده‌اند** (جست‌وجوی کامل متن انجام شد). جدول‌های ۷ تا ۱۳ کامل خوانده نشد، ولی این اصطلاحات در متن اصلی وجود ندارند.

## ۴. بررسی ادعاهای فعلی

| خط | ادعا | حکم | مکان‌یاب | اصلاح پیشنهادی |
|---|---|---|---|---|
| L169 | بلاکچین به‌عنوان راهکار غیرمتمرکز برای اعتماد و امنیت در VANET مورد توجه است | پشتیبانی‌شده | §VII, p.196902؛ abstract | — |
| L169 | بلاکچین‌های سنتی مقیاس‌پذیری پایین و مصرف انرژی بالا دارند | پشتیبانی‌شده (این بخش)؛ IOTA در منبع نیست | abstract؛ §VIII.7 p.196907 | ارجاع Raza فقط برای جمله اول/محدودیت؛ IOTA به منابع دیگر |
| L341 | دفترکل دیجیتال غیرمتمرکز و توزیع‌شده، ثبت ایمن و شفاف | جزئی | p.196888 (DLT foundation)؛ p.196890 (P2P، بدون TTP) | تعریف را با نقل منبع هماهنگ کنید: «شبکه همتابه‌همتا… بدون نیاز به شخص ثالث مورد اعتماد» |
| L341 | هر بلوک شامل هش بلوک قبلی است | پشتیبانی‌شده | p.196890–196891, Fig. 2 | می‌توان سرآیند و گواهی را هم افزود |
| L345 | معماری شش‌لایه | پشتیبانی‌شده | p.196891؛ Fig. 3 p.196890 | ذکر کنید منبع اصلی [25], [26] است |
| L348–353 | توضیح هر لایه | جزئی (کلی‌تر از منبع) | Fig. 3 | اقلام Fig. 3 را جایگزین کنید (۳.۲) |
| L377 | PoW: پازل محاسباتی؛ انرژی «بسیار بالا»؛ مقیاس‌پذیری پایین | جزئی | p.196896؛ Table 4 | انرژی = High (نه Very High) |
| L378 | PoS: سهام اقتصادی؛ انرژی پایین؛ مقیاس‌پذیری متوسط | پشتیبانی‌شده | p.196896؛ Table 4 | — |
| L379 | DPoS: یک رأی به ازای هر سهم؛ انرژی پایین؛ مقیاس‌پذیری بالا | پشتیبانی‌شده | p.196895؛ Table 4 (Energy: Very Low) | می‌توان «بسیار پایین» نوشت |
| L380 | PBFT: «پیچیدگی چندجمله‌ای»؛ انرژی پایین؛ مقیاس‌پذیری متوسط | جزئی | p.196896؛ Table 5 | ویژگی: «کاهش پیچیدگی BFT از نمایی به چندجمله‌ای»؛ انرژی = Low/Medium؛ مقیاس‌پذیری در Table 5 = High (با قید "Inefficient for large networks") |
| L387–395 | فهرست شش چالش | جزئی | p.196891 (۹ بند) | Governance، Fork، Storage Capacity، Computational Complexity را بیفزایید |
| L391 | حریم خصوصی و امنیت: حمله ۵۱٪، کیف پول | جزئی (این‌ها زیر «Security» آمده‌اند) | §VIII.2 p.196906 | Privacy و Security را جدا کنید |
| L392 | توازن امنیت، مقیاس‌پذیری و کارایی انرژی در اجماع | پشتیبانی‌شده | §VIII.3 p.196907 | — |
| L393 | همکاری‌پذیری: ادغام با سیستم‌های موجود | پشتیبانی‌شده | §VIII.4 p.196907؛ abstract | — |
| L394 | محدودیت TPS | پشتیبانی‌شده | §VIII.7 p.196907 | — |
| L395 | مصرف انرژی: هزینه بالای محاسبات | پشتیبانی‌شده | p.196891؛ Table 4 (PoW) | — |
| L408 | غیرمتمرکزسازی: حذف نقطه شکست واحد، امنیت و تاب‌آوری | پشتیبانی‌شده (در بافت شهر هوشمند) | Conclusion p.196907 | — |
| L409 | تغییرناپذیری | پشتیبانی‌شده | Conclusion p.196907 | — |
| L410 | ردیابی: جلوگیری از استفاده مخرب از داده | پشتیبانی‌شده | Conclusion p.196907؛ p.196892 | — |
| L411 | شفافیت | پشتیبانی‌شده | p.196892 §III.D؛ Table 3 | — |
| L412 | قراردادهای هوشمند: اجرای خودکار سیاست امنیتی | جزئی | p.196892 [52]؛ p.196902 [169] | به‌صورت «قراردادهای هوشمند برای ارزیابی اعتماد/کنترل دسترسی» بازنویسی کنید |
| L420 | تعیین صحت پیام‌های پخش‌شده | پشتیبانی‌شده (از طریق مطالعات بخش VII) | p.196902 [8], [173] | — |
| L421 | رمزنگاری کلید عمومی برای حریم خصوصی | جزئی | p.196894–196895 | منبع کاستی‌های کلید عمومی در VANET را هم ذکر می‌کند (سربار گواهی، ذخیره‌سازی) |
| L422 | ذخیره مقادیر اعتماد در بلاکچین | پشتیبانی‌شده | p.196893؛ p.196902–196904 | — |
| L423 | مدیریت غیرمتمرکز کلیدها و گواهی‌ها | پشتیبانی‌شده | p.196903 [176]؛ p.196904 [183] | — |
| L424 | جلوگیری از دستکاری کیلومترشمار | پشتیبانی‌نشده | — (در منبع نیست) | منبع دیگری بیابید یا حذف کنید |
| L432–435 | چهار رده اعتماد (توصیه، پیش‌بینی، شهرت، سیاست) | جزئی | p.196893–196894 | نام‌ها تأیید می‌شود؛ توضیح هر رده در منبع نیست — غیرقابل‌تأیید از این منبع |
| L448 | TPS محدود (بیت‌کوین ۷، اتریوم ۱۵) | جزئی | §VIII.7 p.196907 | اعداد در منبع نیست؛ منبع دیگری برای اعداد لازم است |
| L449 | انرژی بالای PoW | پشتیبانی‌شده | p.196896؛ Table 4 | — |
| L450 | تأخیر بالا نامناسب برای بلادرنگ | پشتیبانی‌شده | §VIII.7 p.196907 | — |
| L451 | کارمزد تراکنش | پشتیبانی‌نشده | — | منبع دیگری بیابید |
| L452 | محدودیت ذخیره‌سازی | جزئی | p.196891 (Storage Capacity، فقط عنوان) | — |
| L460 | شاردینگ | پشتیبانی‌نشده (از این منبع) | — | ارجاع Raza برداشته شود؛ بررسی SBTMS |
| L461 | اجماع جایگزین PoS، DPoS، PBFT | جزئی | p.196907 (PoS یا PBFT)؛ p.196903 [175] | DPoS در این بند منبع نیست؛ قید «ممکن است نیاز بلادرنگ را برآورده نکند» را بیفزایید |
| L462 | زنجیره‌های فرعی | پشتیبانی‌نشده (از این منبع) | — | ارجاع جداگانه لازم است |
| L463 | Lightning Network | پشتیبانی‌نشده (از این منبع) | — | ارجاع جداگانه لازم است |

## ۵. اصطلاحات

| English | فارسی |
|---|---|
| Distributed Ledger Technology (DLT) | فناوری دفترکل توزیع‌شده |
| backward-linked list of blocks | فهرست پیوندی رو به عقب از بلوک‌ها |
| block header / block certificate | سرآیند بلوک / گواهی بلوک |
| trusted third party (TTP) | شخص ثالث مورد اعتماد |
| permissioned / permissionless / consortium | مجوزدار / بدون مجوز / کنسرسیومی |
| Merkle tree | درخت مرکل |
| Incentive layer | لایه انگیزش |
| consensus mechanism | سازوکار اجماع |
| Byzantine Generals' problem | مسئله ژنرال‌های بیزانسی |
| proof-based / voting-based | مبتنی بر اثبات / مبتنی بر رأی‌گیری |
| block finality | قطعیت بلوک |
| adversary tolerance | تحمل مهاجم |
| double-spending | دوبارخرج‌کردن |
| fork problem | مشکل انشعاب |
| 51% (majority) attack | حمله ۵۱ درصد (اکثریت) |
| interoperability | همکاری‌پذیری |
| governance | حکمرانی |
| trust management system (TMS) | سامانه مدیریت اعتماد |
| recommendation/prediction/reputation/policy-based | مبتنی بر توصیه/پیش‌بینی/شهرت/سیاست |
| centralized/decentralized/semi-centralized | متمرکز/غیرمتمرکز/نیمه‌متمرکز |
| direct trust / recommended trust | اعتماد مستقیم / اعتماد توصیه‌ای |
| local / global trust | اعتماد محلی / سراسری |
| conditional privacy | حریم خصوصی شرطی |
| traceability | ردیابی‌پذیری |
| immutability | تغییرناپذیری |

## ۶. شکل‌ها و جداول قابل استفاده

| شماره | محتوا | صفحه | کاربرد در گزارش |
|---|---|---|---|
| Fig. 2 | ساختار منطقی بلاکچین (Genesis Block، Header، Previous Hash، Transactions) | p.196890 | جایگزین/منبع شکل `blockchainstruct1.png` (L358) |
| Fig. 3 | معماری شش‌لایه با اقلام هر لایه | p.196890 | §لایه‌ها — بازترسیم به فارسی با ذکر منبع |
| Table 3 | مقایسه Public / Consortium / Private | p.196891 | افزودن زیربخش «انواع بلاکچین» |
| Table 4 | مقایسه اجماع proof-based (DPoS, PoA, PoAu, PoET, PoS, PoW) | p.196897 | اصلاح/گسترش جدول `tab:consensus` |
| Table 5 | مقایسه اجماع voting-based (PBFT, Ripple) | p.196897 | ستون PBFT |
| Fig. 4 | مدل عمومی مدیریت اعتماد (Composition→…→Formation) | p.196894 | §مدل‌های مدیریت اعتماد |
| Fig. 5 | رده‌بندی اعتماد (Evaluation/Management/Decision؛ متمرکز/غیرمتمرکز/نیمه‌متمرکز) | p.196894 | §مدل‌های مدیریت اعتماد |
| Fig. 6 | دسته‌بندی اجماع مبتنی بر اعتماد (proof/voting) | p.196895 | اختیاری (تصویر بررسی نشد؛ فقط ارجاع متنی) |
| Table 10/11 | دسته‌بندی و خلاصه مطالعات اعتماد در حمل‌ونقل | p.196903, p.196905 | بررسی نشد؛ احتمالاً مفید برای فصل VANET |
| Table 13 | مسائل امنیتی در سه حوزه | p.196906 | بررسی نشد |

**شکاف‌ها:** (۱) اعداد TPS بیت‌کوین/اتریوم، کارمزد تراکنش، کیلومترشمار، sharding، sidechain و Lightning در این منبع نیستند و منبع جایگزین لازم دارند. (۲) تعریف چهار رده اعتماد در منبع نیامده است. (۳) تناقض درونی Table 5 درباره مقیاس‌پذیری PBFT.
