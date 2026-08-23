---
tags: [report, PF-CLAS, CLAS, VANET]
title: گزارش جامع ادبیات PF-CLAS در VANET
---

# گزارش جامع ادبیات Pairing-Free Certificateless Aggregate Signature (PF-CLAS) در VANET

## ۱. شرح مسئله (تعریف مسئله، اهمیت موضوع، کاربردها، چالش‌های اصلی)

**تعریف VANET و نیاز به احراز هویت.** VANETها زیرساخت ارتباطی سیستم‌های حمل‌ونقل هوشمند (ITS) هستند. هر خودرو مجهز به **OBU** (واحد روی خودرو) و **RSU** (واحد کنار جاده) است و ارتباطات از طریق کانال باز بی‌سیم **DSRC (IEEE 802.11p)** در دو حالت **V2V** و **V2I** انجام می‌شود. خودروها هر ۱۰۰ تا ۳۰۰ میلی‌ثانیه پیام‌های وضعیت (موقعیت، سرعت، جهت، وضعیت جاده) را پخش می‌کنند، بنابراین RSU باید حدود ۶۰۰ تا ۲۰۰۰ پیام در ثانیه را در محیطی پرتحرک و time-critical تأیید کند ([[ComprehensiveSurveyCertificateless]]، [[EfficientCertificateLessAggregate]]). همه پیام‌ها باید بدون تغییر (integrity) بمانند و اصالت منبع آن‌ها (authentication) اثبات شود.

**چرا CLAS؟** راه‌حل‌های سنتی PKI به‌دلیل سربار سنگین مدیریت certificate برای VANET پویا نامناسب‌اند و cryptography مبتنی بر هویت (ID-PKC) مشکل **key escrow** دارد (KGC همه کلیدها را می‌داند). رمزنگاری **certificateless (CL-PKC)** با ترکیب یک partial private key از KGC و یک secret value انتخابی خود کاربر، هر دو مشکل را هم‌زمان حل می‌کند (Al-Riyami & Paterson 2003). **Aggregate signature** (Boneh et al. 2003) امضاهای n کاربر روی پیام‌های مختلف را در یک امضای واحد تجمیع می‌کند تا زمان تأیید دسته‌ای (batch verification) و طول امضا کاهش یابد — ترکیب این دو، خانواده **CLAS** را می‌سازد.

**چرا pairing-free؟** محاسبه‌ی **bilinear pairing** گران‌ترین عملیات رمزنگاری است: در بنچمارک Tate pairing حدود **3.21ms** در برابر **0.39ms** ضرب اسکالری (حدود ۸ برابر) ([[CertificatelessAggregateSignature]]، [[ComprehensiveSurveyCertificateless]])؛ در اندازه‌گیری‌های MIRACL یک pairing حدود **4.4 تا 4.6ms** است در حالی که scalar multiplication روی ECC تنها **0.17 تا 0.6ms** هزینه دارد ([[gongPCASCryptanalysisImprovement2023]]، [[wuSecurityenhancedCertificatelessAggregate2025]]). حذف pairing بزرگ‌ترین اهرم سرعت است؛ از این رو طرح‌های PF (بدون pairing) مبتنی بر ECC، جریان غالب ادبیات هستند.

**کاربردها.** احراز هویت پیام‌های ایمنی و ترافیکی، مدیریت ترافیک، smart grid مبتنی بر VANET ([[EfficientCertificateLessAggregate]])، V2X و IoV، و انتقال امن داده در NDN-IoT ([[wangECAEEfficientCertificateless2025]]) و IoMT ([[zhangEfficientPairingFreeCertificateless2024]]).

**چالش‌های اصلی.** (۱) سرعت تأیید دسته‌ای توسط RSU برای صدها تا هزاران امضا در ثانیه؛ (۲) حفظ حریم خصوصی با pseudonym و در عین حال **conditional privacy** (ردیابی متقلب توسط TA/TRA)؛ (۳) مقاومت در برابر حملات Type-I (public key replacement)، Type-II (malicious KGC)، rogue key، ائتلاف signerها و KGC مخرب؛ (۴) مقیاس‌پذیری برای 5G-V2X/6G که به latency زیر 10ms نیاز دارد ([[shimSecurityAggregateSignature2026]]).

## ۲. پیشینه پژوهش (پژوهش‌های کلیدی، نقاط قوت و ضعف آنها)

### ۲.۱ طرح‌های pairing-free (PF-CLAS)

| طرح | ایده اصلی | هزینه / دستاورد | امنیت | نقاط ضعف |
|---|---|---|---|---|
| **eCLAS** (Han 2022, [[hanECLASEfficientPairingFree2022]]) | ECC بدون pairing؛ تجمیع امضاها روی پیام‌های مختلف از خودروهای مختلف (V2I) | مزیت آشکار در verification | ROM + ECDLP، adaptive chosen-message | فاقد تشخیص متقلب؛ بازیابی master key توسط گره مخرب (طبق Zheng) |
| **PCAS** (Gong 2023, [[gongPCASCryptanalysisImprovement2023]]) | حمله‌ی جعل بر LICLAS؛ طرح ترمیمی بدون pairing و بدون map-to-point؛ pseudonym با ردیابی TA (کلید s1) و partial key KGC (کلید s2) | امضا 0.1706ms، تأیید 0.6690ms، aggregate verify ≈ 0.3368n+0.1652ms؛ کاهش 25% سربار انتقال و 16.56%/25.34% سربار محاسبات | EUF-CMA در ROM تحت ECDLP، Type I/II | بازتأیید تک‌به‌تک پس از شکست دسته (O(n))؛ حجم دسته ثابت |
| **Zheng 2023** ([[zhengSecurityEnhancedPairingFreeCertificateless2023]]) | رفع نقص بازیابی master key طرح Han؛ PID متغیر + ردیابی فقط TA | Sign ~0.979ms، Verify ~3.903ms (MIRACL, i7-6700) | EUF-CMA در ROM، Type I/II، ECDLP، forking lemma | کمی کندتر از Han در verify؛ بدون تشخیص امضای بد در batch |
| **ES-CLAS** (Tao 2026, [[taoESCLASEfficientCerificateless2026]]) | تجمیع کامل (full aggregation) با general one-way hash به‌جای map-to-point؛ ردیابی شرطی سبک؛ حمله‌ی impersonation بر Thumbur | PIMS ≈19.8375ms، BVMM ≈(6.6125n+6.38)ms؛ کاهش محاسبات ≥24.3%؛ پیام ۱۶۸ بایت (−19.2%) | ROM + ECDL | مدل امنیتی ضعیف (فرض defensive بازیگران داخلی)؛ تشخیص متقلب صرفاً ردیابی هویت است نه یافتن امضای بد |
| **Yue 2025** ([[yueLightweightCertificatelessAggregate2025]]) | حمله‌ی **ephemeral rogue key** بر Zheng؛ رفع با افزودن **امضای aggregator** و تأیید هم‌زمان (dual-layer) | کاهش محاسبات تا ~50.9% در AS verification (n=100) | Unforgeability تحت ECDLP، مقاوم به rogue key و collusion | کمی گران‌تر از Zheng در verify (به‌جای امنیت) |
| **Wu-Ye 2025** ([[wuSecureEfficientCertificateless2025]]) | گنجاندن همه‌ی پارامترهای عمومی در هش + هش collision-resistant در تجمیع؛ حملات مشخص بر [30,31,33] | Overhead محاسباتی و ارتباطی پایین‌تر از هفت طرح PF-CLAS؛ شبیه‌سازی MIRACL | Type-I/II/III، generalized forking lemma | روش‌های تشخیص امضای نامعتبر پس از شکست تجمیع را «بیش‌ازحد پرهزینه» و کار آینده می‌داند؛ zero-trust برای RSU باز است |
| **Thumbur 2021** ([[thumburEfficientSecureCertificateless2021]]) | CLAS بدون pairing؛ تجمیع روی پیام‌ها و خودروهای متفاوت | کاهش زمان verification و فضای ذخیره‌سازی RSU | ادعای امن‌تر و کاراتر (جزئیات پشت paywall) | بدون مکانیزم cheater/forger identification |

### ۲.۲ طرح‌های pairing-based CLAS

| طرح | ایده اصلی | هزینه / دستاورد | امنیت | نقاط ضعف |
|---|---|---|---|---|
| **Cahyadi 2022** ([[CertificatelessAggregateSignature]]) | CLAS با ۳ pairing ثابت در aggregate verify؛ pseudonym یک‌بارمصرف | Sign 1.17ms، Verify 10.41ms، AggVerify (9.63+0.78n)ms؛ ۵۸۳ بایت/پیام | ROM + CDHP، Type-1/2 | pairing-based → کند؛ all-or-nothing |
| **Wang 2022** ([[wangConditionalPrivacyPreservingCertificateless2022]]) | اولین CLAS در **مدل استاندارد**؛ full aggregation، ۲ pairing ثابت | Sign ~5.85ms، AggVerify ≈3.9352n+30.15ms؛ RSU هر ۳۰۰ms هشت امضا | SM + CDHP، Type I/II | **توسط Yuan 2023 شکسته شد** (KGC attack و public key replacement) |
| **Yuan 2023** ([[yuanNewConditionalPrivacyPreserving2023]]) | Cryptanalysis طرح Wang + طرح بهبودیافته در SM | Sign ~2.30ms، AggVerify ≈3.54n+20.65ms؛ ۲۶۰ بایت تکی، ۶۵۶ بایت (n=100) | SM، Type I/II | pairing در verify (~24.2ms تکی)؛ بدون تشخیص امضای بد |
| **Wang 2025** ([[wangPrivacypreservingCertificatelessAggregate2025]]) | **الگوریتم تشخیص امضای نامعتبر با تقسیم‌وجستجو (divide-and-conquer)**؛ TRA هویت متقلب را فاش می‌کند | Sign ~27.94ms؛ AggVerify n=100 ≈1418.78ms؛ صرفه‌جویی ~24.1% و 84.9% | ROM + CDH، Type-I/II | **pairing-based** (۴ pairing)؛ امضای تکی کندتر |
| **Iqbal 2023** ([[iqbalEfficientSecureCertificateless2023a]]) | CLAS بر پایه‌ی HECC بدون pairing (V2I)؛ partial private key از کانال باز | هزینه‌ی محاسباتی و ارتباطی کمتر (کلید کوتاه‌تر) | ROM + HCDLP، Type 1/2 | بدون cheater detection |

### ۲.۳ طرح‌های signcryption (CLASC)

- **Dai & Xu 2023** ([[PairingFreeCertificatelessAggregate]]): CLASC بدون pairing برای VSN با ESL resistance و forward secrecy؛ اثبات IND-CCA2/EUF-CMA در ROM + راستی‌آزمایی ProVerif؛ aggregation ~۲۵٪ هزینه را کم می‌کند؛ n=350 → 466.43ms. ضعف: در برابر public key replacement آسیب‌پذیر (طبق Wu-Chen).
- **Wu-Chen 2025** ([[wuSecurityenhancedCertificatelessAggregate2025]]): حمله‌ی Type-I بر Dai و طرح ترمیمی CLASC با ردیابی/ابطال توسط KGC؛ MIRACL (Tbp≈4.60ms در برابر Tm≈0.59ms)؛ signcryption تکی ۹۲ بایت؛ بهبود ~69–86% در محاسبات.
- **Zhang 2024** ([[zhangEfficientPairingFreeCertificateless2024]]): CLSC بدون pairing برای IoMT بر پایه‌ی ایده‌ی zero-knowledge proof با **reduction tight** (بدون forking lemma)؛ سنجش روی Raspberry Pi 4 با Charm-Crypto؛ cost 7Tsm و ciphertext ۶۴۰ بیت؛ بدون مکانیزم تشخیص متقلب در batch.

### ۲.۴ کارهای تحلیل امنیتی (cryptanalysis)

- **Zhang 2014** ([[zhangNotesSecurityCertificateless2014]]): چهار حمله بر CLAS زونگ (2013) — KGC صادق-اما-کنجکاو، KGC مخرب-اما-منفعل، ائتلاف signerهای درون‌سیستمی، و ائتلاف signer با KGC مخرب. نتیجه: «صحت تجمیع باید معادل صحت تک‌تک امضاها» (soundness)؛ پیشنهاد hash تجمیعی collision-resistant.
- **Pakniat 2019** ([[pakniatSecurityAnalysisTwo2019]]): شکستن دو CLS سبک (Karati برای IIoT و Kumar برای HWSN)؛ جعل partial private key با دستکاری توانی (y^α) و جعل امضا به‌دلیل خطی‌بودن امضا و جداشدنی بودن secret value.
- **Shim 2023** ([[shimSecurityAnalysisConditional2023]]): حمله‌ی KGC مخرب-اما-منفعل بر طرح Wang (CLAS) و جعل/استخراج کلید بر طرح Xiong (CLS)؛ نقض هم‌زمان unforgeability و traceability.
- **Shim 2024** ([[PDFCryptanalysisCompact2026]]): شکستن دو CLAS فشرده (Zhan-Wang-Lu برای HWMSN و Chen-Chen برای VANET) با Type-I و **universal forgery**؛ نتیجه: «طراحی CLAS فشرده و امن در برابر همه‌ی حملات جبری یک مسئله‌ی باز است».
- **Shim-Kwon 2026** ([[shimSecurityAggregateSignature2026]]): حمله‌ی Type-I بر Zhu-Guan و Chen-Guan با ریشه‌ی مشترک «خطی‌بودن معادله‌ی verification + نبود message binding»؛ اصلاح با هش‌های h5/h6 هزینه را به ≈3n+2 ضرب اسکالری می‌رساند → **معماری خطی hash-dependent نمی‌تواند امنیت/تأخیر/مقیاس‌پذیری 5G-V2X/6G را هم‌زمان بدهد**.
- **Yuan 2023** ([[yuanNewConditionalPrivacyPreserving2023]]) و **Xu et al. 2023** ([[SecurityEnhancedConditionalPrivacyPreserving]]) و **Wu-Ye 2025**: به‌ترتیب شکستن Wang 2022، Chen-Chen 2022 و [30,31,33] با public key replacement.

### ۲.۵ اجزای ساختی (building blocks)

- **Thumbur 2020** ([[thumburEfficientPairingFreeCertificateless2020]]): امضای تکی بدون pairing برای دستگاه‌های محدود — پایه‌ی مفهومی CLS بدون تجمیع.
- **ECAE** ([[wangECAEEfficientCertificateless2025]]): CLAS بدون pairing با امضای تجمیعی طول ثابت و تأیید پیچیدگی ثابت برای NDN-IoT؛ کاهش total computation تا 46.18% و communication تا 55.56%؛ طول امضا 2SM.

### ۲.۶ جمع‌بندی نقاط قوت/ضعف کلی

**نقاط قوت مشترک:** حذف pairing + ECC = سرعت (معیار مرجع این حوزه)؛ conditional privacy با pseudonym و ردیابی توسط TRA؛ اثبات EUF-CMA در ROM تحت ECDLP/CDHP با مدل دوگانه‌ی Type-I/II.
**نقاط ضعف مشترک:** (۱) **نبود روش سریع تشخیص متقلب** — تقریباً همه‌ی طرح‌ها (به‌جز Wang 2025 که pairing-based است و Xu et al. 2023 که شناسایی امضای نامعتبر دارد) پس از شکست تأیید تجمعی به بازتأیید پرهزینه‌ی O(n) تک‌به‌تک نیاز دارند؛ (۲) بسیاری از طرح‌ها پس از انتشار با cryptanalysis شکسته شده‌اند (الگوی تکرارشونده‌ی «طرح → حمله → ترمیم»)؛ (۳) حملات rogue key، ائتلاف signerها و KGC مخرب همچنان جدی‌اند؛ (۴) اثبات اغلب فقط در ROM است نه مدل استاندارد؛ (۵) طرح‌های compact با حذف مقادیر تکی، در برابر universal forgery آسیب‌پذیرند.

## ۳. پرسش‌های پژوهش و ایده‌های پیشنهادی

**پرسش‌های اصلی حوزه:** چگونه verification دسته‌ای را با n بزرگ سریع نگه داریم؟ چگونه در برابر همه‌ی مهاجمان (Type-I/II/III، rogue key، ائتلاف KGC) امن باشیم؟ چگونه متقلب را بدون نقض anonymity ردیابی و افشا کنیم؟ چگونه بدون pairing به همه‌ی اینها برسیم؟

**مسئله‌های باز (open problems):**
1. **تشخیص سریع امضای نامعتبر/متقلب پس از شکست تأیید تجمعی** — اکثر طرح‌ها الگوریتم کارآمدی ندارند ([[gongPCASCryptanalysisImprovement2023]]، [[wuSecureEfficientCertificateless2025]]، [[PDFCryptanalysisCompact2026]])؛ تنها Wang 2025 تقسیم‌وجستجو دارد اما pairing-based است و Xu et al. 2023 نیز الگوریتم شناسایی امضای نامعتبر دارد. Lode 2026 به الگوریتم‌های مبتنی بر Merkle tree یا ساختار سلسله‌مراتبی اشاره می‌کند.
2. **معماری‌های خطی hash-dependent نمی‌توانند تعادل امنیت/تأخیر/مقیاس‌پذیری 5G-V2X/6G را بدهند** ([[shimSecurityAggregateSignature2026]])؛ نیاز به aggregation غیرخطی یا challenge-response سبک با verification زیرخطی.
3. **حملات rogue key و ائتلاف KGC** همچنان جدی ([[yueLightweightCertificatelessAggregate2025]]، [[zhangNotesSecurityCertificateless2014]]، [[shimSecurityAnalysisConditional2023]]).
4. **اثبات در مدل استاندارد** به‌جای ROM ([[wangConditionalPrivacyPreservingCertificateless2022]]، [[yuanNewConditionalPrivacyPreserving2023]]) و reduction tight بدون forking lemma ([[zhangEfficientPairingFreeCertificateless2024]]).
5. **معمای compactness**: امضای تجمیعی فشرده در برابر universal forgery امن نیست ([[PDFCryptanalysisCompact2026]]).

**کلیات روش پیشنهادی برای طرح جدید (سریع + امن + یافتن سریع متقلب):**
- **پایه‌ی PF-ECC بدون pairing**: معماری‌ای با یک scalar multiplication در تولید امضا (مانند Xu et al. 2023: ~0.32ms) و aggregate verify خطی با ضریب کوچک.
- **مکانیزم ثبت امضای تکی قابل بررسی جداگانه**: پس از شکست تأیید تجمعی، به‌جای بازتأیید O(n)، با **تقسیم‌وجستجو (divide-and-conquer)** امضای بد را در O(log n) یافتن (الگوی Wang 2025 که در آن فقط زیرگروه چپ بررسی می‌شود و در صورت موفقیت جستجو در راست ادامه می‌یابد) — منتها در بستر pairing-free منتقل شود.
- **Pseudonym با traceability شرطی**: ساختار `PID2 = RID ⊕ H(...)` با کلید ردیابی TA/TRA (الگوی [[taoESCLASEfficientCerificateless2026]]، [[gongPCASCryptanalysisImprovement2023]]) به‌همراه چرخش دوره‌ای pseudonym برای unlinkability و اتصال زنجیره‌ی «امضای بد → افشای هویت» توسط TRA.
- **مقاومت در برابر rogue key**: افزودن امضای aggregator و تأیید هم‌زمان (dual-layer) همانند Yue 2025.
- **هش‌های قوی با binding کامل**: همه‌ی پارامترهای عمومی (Ui، Ppub، Rj، کلید عمومی، timestamp و جزء تصادفی Yj) در ورودی هش‌ها تا هیچ ترکیب جبری نتواند master public key را از معادله حذف کند (درس مشترک Wu-Ye 2025، Shim-Kwon 2026، Shim 2024)؛ timestamp برای ضد replay و ضد Type-I کاهشی (Shim-Kwon).
- **تأیید تجمعی با تعداد عناصر ثابت (غیرcompact احتیاطی)**: نگهداشتن اجزای تکی قابل‌تفکیک برای حفظ soundness (اعتبار تجمعی ⟺ اعتبار تک‌تک) مطابق [[zhangNotesSecurityCertificateless2014]].

**نوآوری نسبت به کارهای قبلی:** آوردن ایده‌ی «تشخیص سریع متقلب + افشای هویت» به بستر **pairing-free** — Wang 2025 تنها طرح با چنین قابلیتی است ولی pairing-based و در نتیجه برای VANET پرتراکم گران است؛ و Xu et al. 2023 شناسایی امضای نامعتبر دارد اما بدون افشای هویت متقلب و ردیابی شرطی یکپارچه.

## ۴. روش ارزیابی

**معیارهای استاندارد حوزه:**
- زمان تولید امضا (ms)، زمان تأیید تکی و تأیید تجمعی (ms برای n امضا، معمولاً n=100/350/500)، هزینه‌ی ارتباطی (اندازه‌ی امضا/پیام بر حسب بایت)، صرفه‌جویی درصدی overhead نسبت به خطوط پایه.

**مجموعه‌های محک و اعداد مرجع (صرفاً از مقاله‌ها):**
- Tate pairing روی MNT-159 (سطح 80 بیت): PC≈3.21ms، SC≈0.39ms، HC≈0.09ms ([[ComprehensiveSurveyCertificateless]]، [[CertificatelessAggregateSignature]]).
- MIRACL ([[gongPCASCryptanalysisImprovement2023]]): T_ecsm≈0.1652ms در برابر T_bp≈4.4410ms و T_bpsm≈4.8726ms؛ PCAS: امضا 0.1706ms، تأیید 0.6690ms، aggregate verification 0.3368n+0.1652ms؛ کاهش 25% انتقال و 16.56%/25.34% محاسبات (1/2000 پیام).
- MIRACL ([[wuSecurityenhancedCertificatelessAggregate2025]]): شبیه‌سازی عملی؛ T_bp≈4.6ms در برابر T_m≈0.59ms ([[wuSecurityenhancedCertificatelessAggregate2025]]).
- JPBC ([[wangPrivacypreservingCertificatelessAggregate2025]]): T_bp≈3.23ms، T_htp≈4.43ms، T_pm≈4.77ms؛ تولید امضا ≈27.94ms؛ AggVerify n=100 ≈1418.78ms.
- JPBC ([[yuanNewConditionalPrivacyPreserving2023]]): Tbp≈10.32ms، Tmtp≈2.45ms، Tmul≈1.15ms.
- ES-CLAS ([[taoESCLASEfficientCerificateless2026]]): JPBC، i7-4770؛ کاهش محاسبات ≥24.3% و ارتباطات ~19.2%؛ پیام ۱۶۸ بایت.
- ECAE ([[wangECAEEfficientCertificateless2025]]): کاهش computation تا 46.18% و communication تا 55.56%.
- ECLAS smart grid ([[EfficientCertificateLessAggregate]]): Sign/Verify ≈0.8841ms، batch ~0.8841n ms؛ ۱۸۴ بایت؛ باید ۶۰۰–۲۰۰۰ پیام/ثانیه را پوشش دهد.

**ابزارها و کتابخانه‌ها:** MIRACL (بیشتر طرح‌های PF-CLAS)، JPBC (Wang 2025، Yuan 2023، ES-CLAS)، Charm-Crypto 0.50 + Raspberry Pi 4 B (Zhang 2024، IoMT)، OpenSSL/GMP/PBC (ECAE)، شبیه‌سازی Veins با OMNeT++ 5.3 + SUMO (PCAS)؛ زبان Python (Yue 2025) و Java (Wang 2025، Yuan 2023).

**توصیه‌ها برای ارزیابی طرح جدید:**
1. مقایسه‌ی کمّی با بهترین طرح‌های PF-CLAS یعنی Wu-Ye 2025، ES-CLAS 2026، Zheng 2023 و PCAS 2023 در شش معیار: امضای تکی، تأیید تکی، تأیید تجمعی (n=100 تا 2000)، اندازه‌ی امضا، سربار ارتباطی، و تأخیر در شبیه‌سازی ترافیک (خودرو هر 100–300ms).
2. **معیارهای تشخیص متقلب**: تعداد و زمان تأییدهای تجمعی اضافی برای یافتن امضای بد در بدترین حالت (O(log n) با تقسیم‌وجستجو در برابر O(n) بازتأیید)، و overhead برحسب ms برای nهای مختلف — معیاری که در ادبیات موجود وجود ندارد و باید به‌عنوان ستون جدید جدول مقایسه ارائه شود.
3. شبیه‌سازی VANET: بار پیام واقعی DSRC (۶۰۰–۲۰۰۰ پیام/ثانیه) و چگالی/سرعت‌های مختلف با معیار ظرفیت سرویس RSU (Rsc) همانند [[wangConditionalPrivacyPreservingCertificateless2022]] و [[yuanNewConditionalPrivacyPreserving2023]].
4. پیاده‌سازی با کتابخانه‌ی رمزنگاری واقعی (ترجیحاً MIRACL روی سخت‌افزار مشخص) به‌جای صرف تحلیل تئوریک، و گزارش زمان هر primitive همان‌گونه که طرح‌های مرجع گزارش می‌دهند تا مقایسه منصفانه باشد.
5. راستی‌آزمایی امنیتی فراتر از اثبات ROM: بررسی «شکست‌پذیری جبری معادله‌ی تأیید» (درس [[PDFCryptanalysisCompact2026]]) و حملات Type-I با signing oracle پس از جایگزینی کلید ([[shimSecurityAggregateSignature2026]]).

---

## پیوندها (Links)

- [[ComprehensiveSurveyCertificateless]]
- [[lodeComprehensiveReviewECCbased2026a]]
- [[hanECLASEfficientPairingFree2022]]
- [[gongPCASCryptanalysisImprovement2023]]
- [[zhengSecurityEnhancedPairingFreeCertificateless2023]]
- [[taoESCLASEfficientCerificateless2026]]
- [[yueLightweightCertificatelessAggregate2025]]
- [[wuSecureEfficientCertificateless2025]]
- [[thumburEfficientSecureCertificateless2021]]
- [[CertificatelessAggregateSignature]]
- [[wangConditionalPrivacyPreservingCertificateless2022]]
- [[yuanNewConditionalPrivacyPreserving2023]]
- [[wangPrivacypreservingCertificatelessAggregate2025]]
- [[iqbalEfficientSecureCertificateless2023a]]
- [[EfficientCertificateLessAggregate]]
- [[PairingFreeCertificatelessAggregate]]
- [[wuSecurityenhancedCertificatelessAggregate2025]]
- [[zhangEfficientPairingFreeCertificateless2024]]
- [[pakniatSecurityAnalysisTwo2019]]
- [[shimSecurityAnalysisConditional2023]]
- [[shimSecurityAggregateSignature2026]]
- [[zhangNotesSecurityCertificateless2014]]
- [[PDFCryptanalysisCompact2026]]
- [[SecurityEnhancedConditionalPrivacyPreserving]]
- [[thumburEfficientPairingFreeCertificateless2020]]
- [[wangECAEEfficientCertificateless2025]]
