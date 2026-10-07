# یادداشت استخراج محتوا — `mazzocca2025survey`

## ۱. مشخصات و دسترسی

- **ارجاع کامل:** C. Mazzocca, A. Acar, S. Uluagac, R. Montanari, P. Bellavista, M. Conti, "A Survey on Decentralized Identifiers and Verifiable Credentials," *IEEE Communications Surveys & Tutorials*, vol. 27, no. 6, pp. 3641–3671, 2025, doi: 10.1109/COMST.2025.3543197.
- **سطح دسترسی:** متن کامل (full text) — نسخهٔ پذیرفته‌شده در arXiv: `arXiv:2402.02455v2 [cs.CR] 16 Apr 2025` (۳۲ صفحه، سربرگ هر صفحه: «THIS ARTICLE HAS BEEN ACCEPTED FOR PUBLICATION IN IEEE COMMUNICATIONS SURVEYS & TUTORIALS: 10.1109/COMST.2025.3543197»). دریافت از `https://arxiv.org/pdf/2402.02455v2`؛ لینک OA از OpenAlex (`oa_status: green`).
- **قرارداد locatorها:** `p.N` = شمارهٔ صفحهٔ نسخهٔ arXiv (نه صفحهٔ نسخهٔ نهایی IEEE؛ نگاشت دقیق به 3641–3671 تأیید نشده) + شمارهٔ بخش/شکل/جدول.
- **بررسی bib (`report.bib` خط 198–208):** کامل و صحیح. نویسندگان (۶ نفر)، volume 27، number 6، pages 3641–3671، year 2025 و DOI همگی با رکورد OpenAlex (`biblio: volume 27, issue 6, first_page 3641, last_page 3671`) مطابقت دارند. پیشنهاد اختیاری: افزودن `eprint={2402.02455}, archivePrefix={arXiv}`.

## ۲. خلاصه ساختاریافته

- **هدف:** مرور جامع DID و VC «فراتر از SSI» — شامل تهدیدها و راهکارها، پیاده‌سازی‌ها، کاربردها، مقررات/پروژه‌ها و چالش‌ها (Abstract؛ §I-B, p.3).
- **ساختار:** §II مبانی هویت دیجیتال (تکامل، DID، VC، VDR)؛ §III نُه تهدید و راهکار؛ §IV پیاده‌سازی‌ها (DIDKit، IOTA Identity، Hyperledger Aries، Microsoft Entra Wallet Library، Veramo)؛ §V کاربردها (حمل‌ونقل هوشمند، سلامت، صنعت، سایر، مدیریت هویت)؛ §VI مقررات به تفکیک قاره؛ §VII چالش‌ها (استانداردسازی، مقیاس‌پذیری، کاربردپذیری، یکپارچه‌سازی، امنیت و حریم خصوصی)؛ §VIII نتیجه (Fig. 1, p.3).
- **روش:** مرور روایی (narrative survey)؛ معیار انتخاب حوزه‌ها: بلوغ حوزه، اثر بالقوه و وجود بدنهٔ پژوهشی (§V, p.11). روش جست‌وجوی نظام‌مند (PRISMA و مانند آن) گزارش نشده است.
- **یافتهٔ مرتبط با VANET:** بله، مقاله **بخش اختصاصی** دارد: §V-A «Smart Transportation» (p.11–13) و Table V (۱۲ اثر، شامل [71] «decentralized VANETs»). بنابراین استناد کلی گزارش به این مقاله برای VANET موجه است، ولی برخی ادعاهای خاص (مثلاً «یک DID برای هر خودرو») در مقاله نیست یا خلاف آن است (بخش ۴).
- **آنچه مقاله ندارد:** فهرست «اصول SSI» (مثلاً ده اصل Allen) ارائه **نشده است**؛ تعریف صریح «مدیریت هویت» به صورت «شناسایی، تصدیق هویت و مدیریت دسترسی» هم نیامده است؛ روش DID اختصاصی IOTA فقط در سطح چارچوب (نه مشخصات `did:iota`) آمده است.

## ۳. استخراج محتوا برای بسط متن

### ۳-۱. مدیریت هویت / انگیزه (مقدمه)
- هویت دیجیتال فقط به انسان محدود نیست؛ دستگاه‌های IoT در 5G/6G نیز به هویت یکتا نیاز دارند (§I, p.1).
- ضعف ارائه‌دهندگان هویت متمرکز: مخازن متمرکز می‌توانند «lead to serious data breaches» و سیستم‌ها «susceptible to the single point of failure problem» هستند (§I, p.1).
- هویت فدرال برخی ضعف‌ها و نیاز مقیاس‌پذیری را حل کرد، اما «individuals retain limited control over their data» (§I, p.1).
- SSI با پشتیبانی مقرراتی مانند GDPR مطرح شده: «an individual should have full control over their information without being forced to outsource data to any centralized authority or third party» (§I, p.1).
- مقررات اتحادیهٔ اروپا: «in May 2024, the European Union introduced Regulation 2024/1183 [22], establishing the European Digital Identity Framework» (§I, p.2).

### ۳-۲. تکامل مدیریت هویت (§II-A, p.3–4; Fig. 2)
- کلیت: «The evolution of digital identity has undergone many eras, which have gradually shifted digital identification from centralized to decentralized identity models» (p.3).
- **متمرکز:** «identities are managed by a central authority». مبدأ: «One of the earliest forms of digital identity dates back to 1988 when the Internet Assigned Numbers Authority (IANA) was responsible for determining the validity of IP addresses»؛ سپس ICANN برای اعتبار نام دامنه (p.3). مشکلات: نام‌کاربری/گذرواژه و آسیب‌پذیری در برابر dictionary/phishing؛ تکه‌تکه شدن هویت («as many identities as the number of services»)؛ نقطهٔ شکست واحد و افشای داده؛ هزینهٔ سنگین نگهداری داده برای ارائه‌دهندگان (p.3–4).
- **فدرال:** «the second era»؛ یک هویت برای چندین سایت (SSO). پیشگام: Microsoft Passport؛ «In 2001, Sun Microsystems formed the Liberty Alliance»؛ امروز Google و Meta. مشکل: ارائه‌دهندگان هویت همچنان متمرکزند، کنترل محدود کاربر، و پیچیدگی شناسایی متقابل در مقیاس بزرگ (p.4).
- **کاربرمحور:** مدیریت مستقل هویت بدون فدراسیون متمرکز؛ رضایت صریح کاربر. «In 2005, the Identity Commons ... played a pivotal role in advocating for the Internet Identity Workshop (IIW)»؛ پروژه‌ها: OpenID، OpenID 2.0، OIDC، OAuth، FIDO. مشکل: همچنان وابسته به اعتماد به ارائه‌دهندگان سرویس (p.4).
- **SSI:** «SSI represents the last era ... Introduced in 2012» (p.4، به استناد Tobin & Reed [37]).
- **Fig. 2 (خط زمان):** سال‌های 1988، 1998، 1999، 2001، 2005، 2006، 2010، 2012، 2013، 2014، 2019 با برچسب‌های IANA، ICANN، Microsoft Passport، SUN Free Alliance، IIW، OpenID 2.0، OAuth، SSI، FIDO، OpenID Connect، DID/VC. ⚠ تطبیق دقیق برچسب↔سال از چیدمان شکل استنباط می‌شود (برچسب‌ها بالا/پایین محور)؛ با احتیاط استفاده شود.
- ⚠ **بازه‌های ۱۹۸۸–۱۹۹۸، ۱۹۹۸–۲۰۰۵، ۲۰۰۵–۲۰۱۲، ۲۰۱۲– در متن مقاله صریحاً نیامده‌اند.** فقط نقاط شروع 1988 (متمرکز)، 2005 (کاربرمحور، IIW) و 2012 (SSI) صریح‌اند. برای فدرال تاریخ صریح متنی فقط 2001 (Liberty Alliance) است؛ در Fig. 2، سال 1998 ظاهراً مربوط به ICANN است که مقاله آن را جزو دورهٔ **متمرکز** می‌آورد.

### ۳-۳. هویت خودمختار (SSI) (§II-A, p.4)
- SSI فرد را در مرکز قرار می‌دهد: «enabling them to decide when, if, and how they wish to disclose or modify their data».
- زیرساخت: «SSI relies on decentralized infrastructure and cutting-edge technologies such as DLTs, DIDs, and VCs». با DLT مانند بلاک‌چین «SSI eliminates the need for central authorities»؛ داده «cryptographically secured and verifiable, delivering transparency and immutability».
- سازوکار: هر فرد با DID مرتبط با جفت‌کلید تحت کنترل خود شناسایی می‌شود؛ کلید عمومی معمولاً روی DLT؛ ادعاها با VC اثبات می‌شوند «without interacting with the issuing centralized authority»؛ اعتبارنامه‌ها «typically transmitted off-chain due to privacy considerations».
- دستاورد بنیادین SSI: ارائهٔ اعتبارنامهٔ معتبر به طرف سوم «without needing an intermediary» (§I, p.2). مثال کاریابی با مدرک دانشگاهی امضاشده (p.2).

### ۳-۴. شناسه‌های غیرمتمرکز (DID) — معماری (§II-B, p.4–5; Fig. 3, Fig. 4)
- استاندارد: W3C؛ «after substantial collaborative efforts from 2017 to 2019, culminating in the publication of the DID specification as an official W3C Recommendation» (p.4). مرجع [11]: «Decentralized Identifiers (DIDs) v1.0», 2022. ⚠ متن «2017 to 2019» را به تلاش‌ها نسبت می‌دهد؛ سال Recommendation در خود متن ذکر نشده (فقط ارجاع 2022).
- تعریف: «a globally unique and cryptographic identifier scheme» (§I, p.2). «A DID uniquely identifies a DID Subject, which can be either a human or non-human entity» (p.5).
- اجزای نحوی: «the Uniform Resource Identifier, the identifier for the specific DID method, and the method-specific identifier» (p.5). مثال: `did:example:123456789abcdefghi` (Fig. 3–4).
- **DID method:** «specifies the processes for creating, resolving, updating, and deactivating DIDs and DID Documents» (p.5).
- **DID URL:** گسترش DID با path، query، fragment برای مکان‌یابی منبع (p.5).
- **DID Document:** «a machine-readable JSON-LD document containing information about the DID Subject, such as cryptographic public keys, service endpoints, authentication parameters, timestamps, and additional metadata» (p.5). Fig. 4 نمونه با `Ed25519VerificationKey2020` و `publicKeyMultibase`.
- پایداری: «DIDs are consistent and permanent, offering reliable identification even as individuals switch service providers» (p.5).
- اثبات مالکیت: با کلید خصوصی متناظر با کلید عمومی در DID Document؛ verifier سند را از VDR می‌خواند (p.5).
- **DID Controller:** «the entity authorized to modify the DID Document»؛ ممکن است چند کنترل‌گر باشد یا با DID Subject یکی باشد (p.5).
- **Fig. 3 (روابط):** DID → refers to → DID Subject؛ DID Controller → controls → DID؛ DID → recorded on → Verifiable Data Registry؛ DID → resolves to → DID Document؛ DID URL → refers/dereferences to.

### ۳-۵. انواع DID (§II-B, p.5)
- منبع مقاله برای این طبقه‌بندی [42] «Peer DID Method Specification» (2021) است، نه DID Core.
- **Anywise:** «can be utilized with an unspecified number of parties, typically strangers».
- **Pairwise:** «only known by their subject and one other party»؛ «each relationship has a unique DID, minimizing the risk of correlation».
- **N-wise:** «known by strictly N parties, including the subject. They encompass pairwise DIDs as a special case when N equals 2».

### ۳-۶. تحلیل/حل DID (DID Resolution) (§II-B, p.5)
- «DIDs are resolved through a universal resolver [41] that supports multiple DID systems»؛ هر سیستم DID باید یک **DID adapter** پیاده کند که بین DID methodهای خاص و universal resolver واسط است.
- پروتکل‌های ارتباطی: DID Auth با چرخهٔ challenge-response برای اثبات کنترل DID، جایگزین بالقوهٔ نام‌کاربری/گذرواژه (p.5–6). DIDComm به عنوان چارچوب تعامل‌پذیری (§VII-D, p.26).

### ۳-۷. اعتبارنامه‌های تأییدپذیر (VC) (§II-C, p.6; Fig. 5, Fig. 6)
- تعریف: «VC is a specification developed by the W3C to create an interoperable data structure capable of representing claims (e.g., properties or attributes) that are cryptographically verifiable and tamper-proof» (p.6). مرجع [12]: «Verifiable Credentials Data Model v1.1», 2022.
- نگهداری در کیف پول دیجیتال و قابل‌حمل (p.6). مثال Fig. 5: `AlumniCredential` دانشگاه Example با `proof` از نوع `RsaSignature2018`.
- **نقش‌ها:** holder = «an entity exercising control over one or more VCs»؛ issuer = «trusted entities such as government agencies or banks»؛ verifier = «an entity, such as an e-commerce website, that requires valid credentials to offer a service» (p.6–7).
- **Fig. 6:** گام‌ها: (1) Issuer ثبت شناسه‌ها/استفاده از schema در VDR، (2) Issue VC به Holder، (3) Holder → (4) Send VP به Verifier، (5) Verifier بررسی شناسه‌ها و schema در VDR. ⚠ ترتیب دقیق شماره‌ها از متن استخراج‌شدهٔ شکل استنباط شده.
- VDR میانجی برای اشتراک شناسه‌ها، کلیدها و schemaها؛ VCها «typically shared off-chain instead of being stored on a VDR» (p.7).
- **ساختار VC:** Subject URI، issuer URI، URI یکتای اعتبارنامه؛ URI می‌تواند DID باشد؛ شامل «claim expiration conditions and cryptographic signatures» (p.7).

### ۳-۸. ارائهٔ تأییدپذیر (VP) (§II-C, p.7; Fig. 7)
- «Verifiable Presentations (VPs), which specify the methods for signing and presenting VCs by the holder»؛ قالب‌ها: «JSON-LD, JSON, or JSON Web Token» (p.7).
- Fig. 7: VP با `proofPurpose: authentication`، `challenge` و `domain` — مرتبط با مقابله با replay (Threat 9).

### ۳-۹. افشای انتخابی (Selective Disclosure)
- «VCs allow selectively disclosing a subset of the information»؛ دسته‌ها: «mono claims, hashed values, Zero-Knowledge Proofs (ZKP), and selective disclosure signatures»؛ «The current state-of-the-art solution is SD-JWT [47], which enhances privacy by replacing plaintext claims with digests of their salted values» (§II-C, p.7).
- مثال‌ها: خرید شراب با افشای فقط تاریخ تولد؛ اثبات بیمه بدون افشای سابقهٔ پزشکی؛ پنهان‌سازی با HMAC [137] (§V-E, p.20).
- محدودیت SD-JWT: اندازهٔ اعتبارنامه «grows linearly with the number of claims» و تعداد دقیق ادعاها را افشا می‌کند → حملهٔ استنتاج (§VII-E, p.26–27).
- Threat 5/6 (§III-C, p.9): افشای بیش از حد → راهکار selective disclosure؛ پیوندپذیری میان ارائه‌ها → pairwise DID «though it does not entirely prevent linkage»؛ پرهیز از شناسهٔ پایدار در VC؛ اما «when a credential is used for authentication, the service provider must recognize repeat presentations to prevent Sybil attacks» → «Linked unlinkability approaches [60]».

### ۳-۱۰. اثبات دانش‌صفر (ZKP)
- به عنوان یکی از دسته‌های selective disclosure (p.7).
- IOTA Identity از «Zero-Knowledge Selective Disclosure (ZKSD)» پشتیبانی می‌کند؛ Hyperledger Aries: BBS+/ SD-JWT/ZKSD در Table IV (p.9–10). ⚠ ستون‌بندی Table IV در استخراج متن به‌هم‌ریخته است؛ تخصیص سلول‌ها پیش از استفاده با PDF چک شود.
- کاربرد خودرویی: VCهای «ZKP-enabled» در D-V2X و ZKP در انتقال شهرت [70] (p.13).
- چالش: «novel approaches that leverage cryptographic accumulators and ZKP» برای ابطال (§VII-E, p.26).

### ۳-۱۱. ابطال (Revocation) (§III-B, p.8; Fig. 8; §VII-E)
- Threat 4: اعتبار VC با زمان تغییر می‌کند؛ راهکار اول: دورهٔ اعتبار در خود VC؛ برای ابطال به دلیل سلب امتیاز: OCSP و CRL از PKI، و W3C «Revocation List 2020» — بیت‌رشته‌ای که «When a bit is set to 1, the corresponding VC is revoked»؛ قابل فشرده‌سازی با ZLIB (p.8).
- Fig. 8: برچسب‌های «16KB» → «ZLIB Compression» → «135 bytes» (اعداد فقط به‌عنوان برچسب شکل؛ توضیح متنی جداگانه ندارند).
- چالش: «At the time of this paper, only one proposed specification exists, but it has not yet achieved W3C standard status»؛ فقط یک کار [59] برای ابطال کارا در IoT؛ مقیاس‌پذیری در محیط‌های پرترافیک و دستگاه‌های محدود «underexplored» (§VII-E, p.26). مقیاس‌پذیری: accumulatorها و tail files (§VII-B, p.25).

### ۳-۱۲. VDR (§II-D, p.7–8)
- «A VDR acts as a trusted intermediary ... serving as a repository or database that stores and provides access to essential information. This includes DID Documents».
- مدیریت چرخهٔ حیات: ایجاد، ثبت و ابطال DID/VC.
- «Currently, the W3C's standards do not specify how the VDR should be implemented»؛ بیشتر مبتنی بر DLT و بلاک‌چین؛ قرارداد هوشمند؛ جایگزین ICN (p.7–8).

### ۳-۱۳. تهدیدها (§III, p.7–9) — خلاصه برای بخش امنیت
- T1 به خطر افتادن کلید (phishing/malware/سرقت) → چرخش کلید، MFA، HSM، بازیابی از طرف سوم.
- T2 سرقت/تبانی اعتبارنامه → درج DID holder در VC و اثبات دانستن کلید خصوصی.
- T3 جعل VC/صادرکنندهٔ فاقد صلاحیت → امضای issuer و رجیستری issuerهای مورد اعتماد.
- T4 اعتبار → ابطال (بالا). T5–T7 حریم خصوصی (بالا؛ T7: رمزنگاری ادعاها برای verifier).
- T8 MITM → رمزنگاری سرتاسری؛ T9 replay VP → nonce/timestamp و challenge.

### ۳-۱۴. چارچوب IOTA Identity (§IV-B, p.9; §IV-F, p.11; §V-F, p.21)
- «implements decentralized identity solutions using both a DLT-agnostic approach and dedicated IOTA method specification. It is built on the Tangle, a next-generation DLT tailored for the IoT ecosystem».
- Rust و Node.js (via WASM)؛ verifier کلید عمومی issuer را روی Tangle تأیید می‌کند؛ SD-JWT و ZKSD.
- مزایا: «Feeless: Unlike traditional blockchains, IOTA has no miners or validators. Messages, including DID Documents, can be stored without incurring transaction fees»؛ Ease-of-use (بدون توکن رمزارز، Stronghold برای اسرار)؛ General Purpose DLT.
- درس‌آموخته: «IOTA's underlying distributed ledger ... inherently supports a VDR» (p.11)؛ «in contexts such as smart agriculture and smart transportation, where entities like smart sensors and vehicles require digital identities, IOTA Identity stands as a natural solution» (p.21) ← مستقیماً مفید برای پیوند IOTA و VANET در گزارش.

### ۳-۱۵. کاربرد در VANET / حمل‌ونقل هوشمند (§V-A, p.11–13; Table V; Fig. 10)
- مسئله: «a key challenge in V2V communications is the lack of trust between vehicles, as they typically do not have prior relationships and rely on centralized network authorities» (p.12).
- «In V2V communications, DIDs and VCs ensure integrity, authentication, confidentiality, and privacy without relying on a centralized trusted authority» (p.12).
- MOBI: «a blockchain-based Vehicle IDentification (VID) standard in 2019 [75]» مبتنی بر DID که VIN را با بلاک‌چین سازگار می‌کند؛ Fig. 10 معماری مرجع (کیف‌پول خودرو با VCهای Title، Birth، Registration، Warranty، Insurance، Ownership، Identity، Mileage؛ صادرکنندگان: نهاد دولتی، OEM، RSU) (p.12).
- **D-V2X [67]:** حذف واسطهٔ مورد اعتماد؛ D-VPKI جایگزین VPKI سنتی؛ ثبت DID تصادفی، صدور VC حاوی VIN توسط OEM؛ خودرو هم subject و هم holder. حریم خصوصی: «a vehicle registers multiple DIDs, all linked to the master DID through ZKP-enabled VCs issued by the OEM»؛ یا MPC؛ «Vehicles can also use pseudonyms by creating two VPs» (p.12–13).
- GPS spoofing: VC مکان از زیرساخت نزدیک (مثلاً چراغ راهنمایی)؛ data provenance [68] با RSU و basic safety messages (p.13).
- **VDKMS [69]:** مدیریت کلید غیرمتمرکز در V2X؛ VC پیونددهندهٔ DID به VIN (p.13).
- **حریم خصوصی/شهرت [70]:** تغییر آدرس بلاک‌چین با حفظ شهرت؛ آدرس جدید از رازِ مشتق از کلید خصوصی DID؛ «These addresses form a deterministic chain, allowing reconstruction for auditing or investigation purposes»؛ «promise» + ZKP به قرارداد هوشمند و Merkle Tree (p.13) ← نزدیک‌ترین مورد به «ردیابی شرطی».
- **BDRA [71]:** بلاک‌چین دولایه (لایهٔ بالا RSUهای مجاز، لایهٔ پایین RSU و خودروهای پوشش)؛ خودرو DID خود را می‌سازد؛ RSUها VC یکتا صادر می‌کنند؛ گیرنده DID فرستنده را با فهرست مجاز چک و آستانهٔ شهرت را بررسی می‌کند؛ بازخورد به RSU برای به‌روزرسانی شهرت (p.12–13). Table V: «A secure registration and authentication mechanism for decentralized VANETs, assisted by double-layer blockchain and DIDs».
- سایر: کامیون در بندر [72]، انتقال حقوق خودرو با pairwise DID [73]، data provenance خودرویی [74]، CVIN/CVID [75]، تجارت انرژی EV [76]، ISO 15118-20 به‌عنوان «a robust alternative to the complex, centralized PKI» [77] (p.13).
- درس‌آموخته: «in vehicular scenarios, these technologies are used to enable secure and verifiable communications between vehicles and roadside units [67]» (§V-F, p.21).

### ۳-۱۶. چالش‌ها (§VII, p.24–27) — برای بخش جمع‌بندی/چالش‌ها
- استانداردسازی: ناسازگاری مشخصات DID methodها؛ نبود اجماع روی الگوریتم‌ها و مدیریت کلید (p.24–25).
- مقیاس‌پذیری: تأیید off-chain است، اما رشد دفتر کل و ازدحام شبکه؛ indexing/caching/sharding (p.25).
- امنیت: جعل هویت توسط DID controller؛ چرخش کلید؛ **Accountability**: سازگار کردن حریم خصوصی DID با KYC/AML (p.26).

## ۴. بررسی ادعاهای فعلی

| خط | ادعا | حکم | locator | اصلاح پیشنهادی |
|---|---|---|---|---|
| 171 | SSI، DID و VC راهکار مدیریت هویت و شبه‌نام در VANET‌اند | جزئی | §V-A p.12–13 (D-V2X: «Vehicles can also use pseudonyms by creating two VPs») | مقاله کاربرد خودرویی دارد؛ بهتر است «شبکه‌های خودرویی/V2X» گفته و مثال D-V2X/BDRA آورده شود. |
| 558 | مدیریت هویت = شناسایی، تصدیق هویت و مدیریت دسترسی | غیرقابل‌تأیید | — (تعریفی در مقاله نیست) | ارجاع را بردارید یا به منبع تعریفی (مثلاً NIST) منتقل کنید؛ یا بنویسید «هویت دیجیتال کلید دسترسی به سرویس‌ها است» (§I p.1). |
| 562–568 | چهار دوره با بازه‌های ۱۹۸۸–۱۹۹۸، ۱۹۹۸–۲۰۰۵، ۲۰۰۵–۲۰۱۲، ۲۰۱۲– | جزئی | §II-A p.3–4؛ Fig. 2 | فقط 1988، 2005 و 2012 صریح‌اند؛ برای فدرال: Microsoft Passport و Liberty Alliance (2001). بازه‌ها را با «از حدود» یا با رویداد شاخص هر دوره بنویسید. |
| 565–568 | توصیف هر دوره (کنترل مرکزی، SSO، مدیریت مستقل، کنترل کامل) | پشتیبانی‌شده | §II-A p.3–4 | — (می‌توان مشکلات هر دوره را افزود). |
| 591 | SSI کنترل کامل به کاربر؛ بر DLT، DID، VC بنا شده | پشتیبانی‌شده | p.4: «SSI relies on decentralized infrastructure ... such as DLTs, DIDs, and VCs» | — |
| 604–608 | دلایل SSI: نقطهٔ شکست واحد، نقض داده، کنترل محدود، نگرانی حریم خصوصی (بدون ارجاع) | پشتیبانی‌شده | §I p.1؛ §II-A p.3–4 | افزودن `\cite{mazzocca2025survey}`؛ می‌توان GDPR را نیز ذکر کرد. |
| 613 | DID شناسهٔ جهانی یکتا بدون مرجع مرکزی؛ مثال `did:example:123456789abcdefghi` | پشتیبانی‌شده | p.2 «globally unique and cryptographic identifier scheme»؛ p.5؛ Fig. 3–4 | — |
| 623–626 | اجزای معماری: DID، DID Document (JSON-LD، کلید عمومی، service endpoint)، DID method (ایجاد/حل/به‌روزرسانی/غیرفعال‌سازی)، VDR | پشتیبانی‌شده | §II-B p.5؛ §II-D p.7 | افزودن DID Subject، DID Controller، DID URL و universal resolver (Fig. 3). |
| 632–634 | Anywise/Pairwise/N-wise | پشتیبانی‌شده | §II-B p.5 | معادل «بی‌طرفه» برای Anywise گمراه‌کننده است → «همگانی/با هر طرف». منبع اصلی طبقه‌بندی Peer DID spec است ([42] مقاله). |
| 648 | VC مدارک «رمزنگاری‌شده و تغییرناپذیر» استانداردشدهٔ W3C | جزئی | §II-C p.6: «cryptographically verifiable and tamper-proof» | «رمزنگاری‌شده» → «قابل تأیید رمزنگارانه»؛ «تغییرناپذیر» → «مقاوم در برابر دست‌کاری». |
| 653–655 | holder/issuer/verifier | پشتیبانی‌شده | §II-C p.6–7؛ Fig. 6 | افزودن VDR به‌عنوان مؤلفهٔ چهارم و VP. |
| 663 | تصدیق هویت غیرمتمرکز بدون مرجع مرکزی در VANET | پشتیبانی‌شده | p.12: «without relying on a centralized trusted authority» | — |
| 664 | استفاده از DID به‌عنوان شبه‌نام | جزئی | p.13 (D-V2X: چند DID متصل به master DID؛ pseudonym با دو VP) | دقیق‌تر: «چند DID به ازای هر خودرو، متصل به DID اصلی با VCهای مبتنی بر ZKP». |
| 665 | ردیابی شرطی | جزئی | p.13 [70]: «deterministic chain, allowing reconstruction for auditing or investigation purposes»؛ §VII-E p.26 Accountability | ذکر کنید که این ویژگی در طرح خاص [70] است و مقاله آن را چالش باز (KYC/AML) هم می‌داند. |
| 666 | ذخیرهٔ غیرمتمرکز امتیاز شهرت | پشتیبانی‌شده | p.13 ([70] قرارداد هوشمند؛ BDRA [71] شهرت روی بلاک‌چین) | — |
| 674 | حذف نقطهٔ شکست واحد | پشتیبانی‌شده | p.12–13 (D-V2X «eliminates the need for a trusted intermediary»)؛ §I p.1 | — |
| 675 | DID به‌عنوان شبه‌نام + افشای انتخابی | جزئی | p.13؛ §II-C p.7 | افشای انتخابی در مقاله عمومی است نه VANET-محور؛ بیان شود. |
| 676 | حذف نیاز به مدیریت گواهی‌نامهٔ پیچیده | جزئی | p.12–13: D-VPKI «replaces the traditional VPKI»؛ ISO 15118: «alternative to the complex, centralized PKI» (EV charging) | «جایگزینی VPKI متمرکز با D-VPKI» (نه «حذف کامل»)؛ مقاله خود OCSP/CRL را برای ابطال VC پیشنهاد می‌کند. |
| 677 | مقابله با حملات تقلید با تصدیق رمزنگارانه | جزئی | §III-A p.7–8 (T2/T3، عمومی، نه VANET) | ارجاع به Threat 2/3 به‌صورت عمومی. |
| 678 | حملهٔ سیبل: «یک DID برای هر خودرو» | **پشتیبانی‌نشده** (در تضاد) | p.13: «a vehicle registers multiple DIDs»؛ p.9: Sybil فقط در Threat 6 و «Linked unlinkability» | حذف یا بازنویسی: «تشخیص ارائه‌های تکراری با linked unlinkability [60]» یا انتقال به منبعی که واقعاً این را می‌گوید (مثلاً DIVA؛ تأیید نشده). |

## ۵. اصطلاحات

| English | فارسی پیشنهادی |
|---|---|
| Digital Identity | هویت دیجیتال |
| Centralized / Federated / User-centric Identity | هویت متمرکز / فدرال / کاربرمحور |
| Self-Sovereign Identity (SSI) | هویت خودمختار |
| Decentralized Identifier (DID) | شناسهٔ غیرمتمرکز |
| DID Subject / DID Controller | موضوع DID / کنترل‌گر DID |
| DID Document | سند DID |
| DID Method | روش DID |
| DID URL | نشانی DID |
| Universal Resolver / DID adapter | حل‌کنندهٔ جهانی / مبدل DID |
| Verifiable Data Registry (VDR) | ثبت‌کنندهٔ دادهٔ تأییدپذیر |
| Anywise / Pairwise / N-wise DID | DID همگانی / دوطرفه / N‌طرفه |
| Verifiable Credential (VC) | اعتبارنامهٔ تأییدپذیر |
| Verifiable Presentation (VP) | ارائهٔ تأییدپذیر |
| Holder / Issuer / Verifier | دارنده / صادرکننده / تأییدکننده |
| Claim | ادعا |
| Selective Disclosure | افشای انتخابی |
| Zero-Knowledge Proof (ZKP) | اثبات دانش‌صفر |
| Revocation List / Bitstring | فهرست ابطال / رشته‌بیت |
| Linked unlinkability | پیوندناپذیری پیوندی (اصطلاح ترجمه‌نشده بهتر است) |
| Key Rotation | چرخش کلید |
| Tamper-proof | مقاوم در برابر دست‌کاری |
| Correlation | همبسته‌سازی (پیوند دادن تعاملات) |
| Data Provenance | منشأیابی داده |
| Decentralized Vehicular PKI (D-VPKI) | زیرساخت کلید عمومی خودرویی غیرمتمرکز |

## ۶. شکل‌ها و جداول قابل استفاده

- **Fig. 2 (p.4)** خط زمان تکامل هویت — برای بخش «تکامل مدیریت هویت» (بازترسیم با ذکر منبع).
- **Fig. 3 (p.5)** معماری DID و روابط اجزا — جایگزین مناسب فهرست گلوله‌ای خطوط 622–627.
- **Fig. 4 (p.5)** نمونهٔ DID و DID Document (JSON).
- **Fig. 5 / Fig. 7 (p.6–7)** نمونهٔ VC و VP — برای نشان دادن تفاوت VC و VP (`challenge`, `domain`).
- **Fig. 6 (p.6)** نقش‌های VC (Issuer/Holder/Verifier/VDR).
- **Fig. 8 (p.8)** Revocation List 2020 (16KB → ZLIB → 135 bytes).
- **Fig. 10 (p.12)** معماری مرجع MOBI برای حمل‌ونقل هوشمند مبتنی بر DID/VC — بسیار مرتبط با VANET.
- **Table IV (p.9)** مقایسهٔ پیاده‌سازی‌ها (IOTA Identity: Tangle، Stronghold، SD-JWT/ZKSD) — ⚠ سلول‌ها با PDF چک شوند.
- **Table V (p.12)** طبقه‌بندی ۱۲ کار حمل‌ونقل هوشمند — مبنای خوبی برای جدول «طرح‌های DID در VANET».
