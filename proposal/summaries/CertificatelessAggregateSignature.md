---
tags: [literature, CLAS, VANET]
paper: CertificatelessAggregateSignature
year: 2022
---

# A Certificateless Aggregate Signature Scheme for Security and Privacy Protection in VANET (Cahyadi et al. 2022, SAGE)

> Cahyadi, E.F., Su, T.-W., Yang, C.-C., Hwang, M.-S. — *A certificateless aggregate signature scheme for security and privacy protection in VANET.* International Journal of Distributed Sensor Networks 18(5) (2022) 15501329221080658.

## خلاصه (Summary)

این مقاله یک طرح **Certificateless Aggregate Signature (CLAS)** برای احراز هویت امن و خصوصی در شبکه‌های VANET ارائه می‌دهد که بر پایه‌ی **bilinear pairing** و فرض سختی **Computational Diffie–Hellman Problem (CDHP)** است. انگیزه‌ی اصلی: در VANET، خودروهای زیادی هم‌زمان پیام پخش می‌کنند و تأیید یک‌به‌یک همه‌ی امضاها تأخیر ایجاد می‌کند؛ CLAS با تجمیع چند امضا در یک امضای واحد، طول امضا و هزینه‌ی تأیید را کاهش می‌دهد. طرح پیشنهادی شامل ۹ الگوریتم (Setup, Registration, Partial-Private-Key-Gen, Vehicle-Key-Gen, Pseudonym-Gen, Sign, Verify, Aggregate, Aggregate-Verify) است و RSU امضاهای تک‌خودرو را تجمیع می‌کند تا AS با یک بار تأیید تجمیعی (با تعداد ثابت ۳ pairing مستقل از n) بپذیرد. طرح در **random oracle model (ROM)** تحت فرض CDHP در برابر هر دو مهاجم Type-1 (A1، حمله‌ی public-key replacement) و Type-2 (A2، حمله‌ی malicious KGC) به‌صورت existentially unforgeable اثبات شده است و هم‌زمان pseudonymity، identity privacy، mutual authentication، traceability و unlinkability (با pseudonym یک‌بارمصرف) را فراهم می‌کند. در مقایسه‌ی عملکردی، امضای تک 1.17 ms، تأیید تک 10.41 ms، تأیید تجمیعی (9.63 + 0.78n) ms و سربار ارتباطی 583 بایت به ازای هر پیام است که از همه‌ی خطوط پایه‌ی CDHP-based کمتر است.

## ایده اصلی و طرح (Core idea & scheme)

- **Pairing-based و CDHP-based:** از bilinear map `ê : G1 × G1 → G2` (مشتق از Weil/Tate pairing روی منحنی بیضوی) استفاده می‌شود و امنیت روی سختی CDHP (یافتن `abcP` از روی `aP, bP, cP`) استوار است. برخلاف برخی طرح‌های دیگر، این طرح **pairing-free نیست** و در Verify و Aggregate-Verify از ۳ عملیات pairing استفاده می‌کند.
- **موجودیت‌ها و مدل سیستم (دولایه):** لایه‌ی بالا: **Application Server (AS)**، **KGC** و **TRA** (Trace Authority)؛ لایه‌ی پایین: **RSU** و **OBU** (مجهز به tamper-proof device). RSU از طریق کانال باز بی‌سیم با OBU و از طریق کانال امن با TRA/AS ارتباط دارد. AS داده‌های ترافیکی را از RSU جمع‌آوری و تحلیل می‌کند. KGC پارامترهای عمومی و partial private key را تولید می‌کند؛ TRA پرسونامی تولید کرده و در صورت اختلاف می‌تواند هویت واقعی را فاش کند.
- **Setup:** KGC پارامتر امنیتی `λ` را می‌گیرد، گروه‌های `G1, G2` با مرتبه‌ی اول `q` و مولد `P` می‌سازد، کلید مستر `a` را انتخاب و `Ppub = aP` را محاسبه می‌کند؛ شش تابع هش `h1..h6 : {0,1}* → Zq*` انتخاب می‌کند. TRA مقدار سکریت `b` و کلید عمومی `Tpub = bP` دارد؛ هر RSU نیز `yi` سکریت و `Prsui = yiP` عمومی دارد. پارامترها (`params = {q, G1, G2, P, ê, Ppub, h1..h6, Prsui}`) در TPD خودرو پیش‌بارگذاری می‌شوند.
- **Registration و Partial-Private-Key-Gen:** خودرو حضوری (offline) نزد TRA ثبت می‌شود؛ TRA `IDi` و `ri` را انتخاب کرده و هویت واقعی `QIDi = H(IDi, ri)` می‌سازد. خودرو یک nonce انتخاب کرده و `passIDi = h1(ri, nonce)` را به TRA می‌دهد. سپس KGC کلید جزئی `pskIDi = a·QIDi` را تولید و از طریق کانال امن ارسال می‌کند؛ صحت آن با `ê(pskIDi, P) = ê(QIDi, Ppub)` قابل بررسی است. چون خودرو خودش `vskIDi = xi` و `vpkIDi = xiP` را می‌سازد، مشکل key escrow حل می‌شود.
- **Pseudonym و محرمانگی شرطی (conditional privacy):** برای درخواست pseudonym، خودرو یک **one-time password** می‌سازد: `OTP = h2(passIDi ⊕ QIDi ⊕ Ti)` و پیام را با `Tpub` رمز می‌کند (`<ETpub(m, OTP, IDi, Ti, vpkIDi)>`) تا **mutual authentication** با TRA برقرار شود (TRA با محاسبه‌ی مجدد OTP خودرو را تأیید می‌کند). پس از تأیید، TRA با `Ci = h3(b, IDi, Ti')` مقدار `PIDi = QIDi·Ci` و با `Di = h4(PIDi)` مقدار `Ki = Ci·Di` را می‌سازد و دسته‌ای pseudonym (`PIDi,1 … PIDi,n`) را با `vpkIDi` رمز و از طریق RSU می‌فرستد. **هر pseudonym فقط یک‌بار استفاده می‌شود** (مخصوصاً در تقاطع‌ها/پارکینگ‌ها) که هم unlinkability می‌دهد و هم ردیابی توسط مهاجم را سخت می‌کند؛ فقط TRA با کلید `b` می‌تواند `PIDi` را به `QIDi`/هویت واقعی بازگرداند (traceability).
- **Sign و Verify (تکی):** خودرو `ui` تصادفی انتخاب، `Ui = uiP` و `hi = h6(Mi, PIDi, vpkIDi, Ui, ti)` را محاسبه و امضا می‌کند:
  - `Si = pskIDi·Ki + vskIDi·Ppub + hi·ui·Prsui`، امضا `si = (Ui, Si)`.
  - پیام نهایی: `(Mi, PIDi, vpkIDi, si, ti)` با timestamp.
  - RSU (یا خودروی گیرنده در V2V) با `ê(S, P) = ê(PIDiDi + vpkIDi, Ppub) · ê(hiUi, Prsui)` تأیید می‌کند (۳ pairing + ۲ scalar multiplication).
- **Aggregate و Aggregate-Verify:** RSU امضاهای n خودرو را ساده جمع می‌زند: `S = Σ_{i=1..n} Si` و امضای تجمیعی `σ = (U1..Un, S)` را به AS می‌فرستد. AS با یک معادله‌ی واحد و **تعداد ثابت ۳ pairing** تأیید می‌کند:
  `ê(S, P) = ê(Σ(PIDiDi + vpkIDi), Ppub) · ê(Σ hiUi, Prsui)`.
  فقط scalar multiplications با n رشد می‌کنند (2nSC)؛ این همان مزیت اصلی CLAS است. صحت هر دو معادله با جای‌گذاری `pskIDi = a·QIDi`، `K = Ci·Di` و `vpkIDi = xiP` اثبات می‌شود (قسمت Correctness).

## امنیت (Security)

- **Security model:** دو نوع مهاجم طبق تعریف استاندارد CLAS:
  - **Type-1 (A1):** خارجی که می‌تواند کلید عمومی کاربر را با هر مقداری جایگزین کند (public-key replacement attack) اما به master secret key کدسترسی ندارد.
  - **Type-2 (A2):** KGC بدخواه که به master secret key دسترسی دارد اما نمی‌تواند کلید عمومی کاربر را جایگزین کند.
  - دو بازی **Game-1** و **Game-2** با اوراکل‌های: CreateUser، RevealPartialPrivateKey، RevealPrivateKey، RevealPseudonym، ReplaceKey و Sign. هدف: existentially unforgeable under **adaptive chosen-message and identity attack**.
- **فرض و مدل:** Random Oracle Model (ROM) + سختی CDHP (یافتن `abcP ∈ G1` از `P, aP, bP, cP`).
- **Theorem 1 (امنیت در برابر A1):** اگر A1 بتواند CLS معتبری در زمان `t` با احتمال ناچیزنبودن `ε` جعل کند، challenger با احتمال تقریبی `ε/qc` و زمان `t' = t + (qc + qH + qhi + qpsk + qvsk + qs)·tm` (که `tm` زمان یک scalar multiplication است) مسئله‌ی CDH را حل می‌کند — تناقض. اثبات با **forking lemma**: بازپخش A1 با اوراکل `h6` متفاوت دو امضای معتبر به‌دست می‌آید و با تفریق آن‌ها `abcP` استخراج می‌شود.
- **Theorem 2 (امنیت در برابر A2):** همین ادعا برای A2؛ اثبات «مشابه Type-1» و حذف شده است.
- **ویژگی‌های امنیتی/محرمانگی:** pseudonymity، identity privacy preservation (هویت واقعی در `(Mi, PIDi, vpkIDi, si, ti)` نیست)، mutual authentication (از طریق OTP)، message authentication/integrity (امضا با CDHP نمی‌تواند جعل شود)، non-repudiation (TRA می‌تواند فرستنده را مشخص کند)، untraceability (فقط TRA)، unlinkability (pseudonym یک‌بارمصرف)، user location privacy (چرخش pseudonym به‌ویژه در مناطق پرتراکم).
- **حملات مقاوم‌شده:** replay (timestamp و بررسی بازه‌ی زمانی)، man-in-the-middle، masquerade (مهاجم بدون `pskIDi` و `Ki` نمی‌تواند امضا بسازد)، impersonation (نیازمند جعل امضا = حل CDHP)، malicious KGC (A2) و public-key replacement (A1). جدول 3 نشان می‌دهد طرح پیشنهادی تنها طرحی است که در هر ۸ معیار (A1, A2, message authentication, anonymity, unlinkability, traceability, replay resistance, impersonation resistance) علامت ✓ دارد؛ در حالی که Malhi-Batra، Horng، Kumar-Sharma، Kamil-Ogundoyin، Zhong و Kumar et al. در برخی موارد ناامن/ناقص‌اند (مثلاً هیچ‌کدام از ۶ طرح دیگر در برابر A2 مقاوم نیستند).

## ارزیابی (Evaluation)

- **پیکربندی بنچمارک:** Tate pairing روی زیرگروه 159-bit منحنی MNT با embedding degree 6 در سطح امنیتی 80-bit روی CPU اینتل i7 با فرکانس 3.07 GHz. هزینه‌ها: **PC (pairing) = 3.21 ms**، **SC (scalar multiplication) = 0.39 ms**، **HC (MapToPoint hash) = 0.09 ms**.
- **Computation cost (جدول 4):**
  - Sign: **3SC = 1.17 ms** (برابر Malhi-Batra, Zhong, Kumar, Kamil-Ogundoyin؛ بهتر از Mei با 4SC+2HC = 1.74 ms).
  - Verify: **3PC + 2SC = 10.41 ms** (بهترین؛ Malhi-Batra/Kumar: 10.8، Zhong/Kamil-Ogundoyin: 10.5، Mei: 4PC+2SC = 13.62 ms).
  - Aggregate-Verify: **3PC + 2nSC = (9.63 + 0.78n) ms** (هم‌راستا با بهترین، Mei = (12.84 + 0.78n)؛ Malhi-Batra/Kumar = (9.63 + 1.17n)؛ Zhong/Kamil-Ogundoyin = (9.63 + 0.87n)).
- **Communication cost (جدول 5):** طول گروه‌ها G1 = 128 بایت، G2 = 40 بایت، خروجی هش و اعداد Zq* = 20 بایت، timestamp = 4 بایت، پیام ترافیکی = 67 بایت (استاندارد IEEE WAVE). پیام نهایی هر خودرو شامل `Mi, ti, (PIDi, vpkIDi, si = (Ui, Si) ∈ G1)` است:
  - تک‌پیام: **583 بایت** (بهترین) در برابر 715 (Zhong, Kamil-Ogundoyin)، 727 (Malhi-Batra, Kumar)، 735 (Mei) بایت.
  - n پیام: **583n بایت**.
- **خطوط پایه‌ی مقایسه:** پنج طرح CDHP-based شامل Malhi & Batra 2015، Zhong et al. 2019، Kumar et al. 2019، Kamil & Ogundoyin 2020، Mei et al. 2021 (همگی مبتنی بر bilinear maps). ادعای اصلی: برتری محاسباتی در Verify و Aggregate-Verify و برتری واضح در سربار ارتباطی.

## نکات برای طرح امضای جدید (Takeaways for a new fast+secure+cheater-detecting scheme)

- **تجمیع با تعداد ثابت pairing حیاتی است:** درس کلیدی این طرح این است که ساختار `Si = psk·K + vsk·Ppub + hi·ui·Prsui` با جمع خطی `S = ΣSi` باعث می‌شود هزینه‌ی تأیید تجمیعی با **تعداد ثابت ۳ pairing** مستقل از n باقی بماند و فقط 2nSC به آن اضافه شود. هر طرح جدید باید این ویژگی «pairings ثابت + رشد خطی ارزان» را حفظ کند.
- **پرهزینه بودن pairing → مسیر «fast» pairing-free است:** خود این طرح pairing-based است (Verify = 10.41 ms، عمدتاً به دلیل 3PC). برای طرح سریع‌تر، مسیر اثبات‌شده در ادبیات (مثل Cui et al. 2018 یا Thumbur et al. 2021 که در همین مقاله مرور شده‌اند) حذف pairing و استفاده از خالص ECC است؛ سپس امنیت می‌تواند به جای CDHP روی ECDLP/ECDLP-based باشد.
- **شکاف برای «cheater detection»:** این طرح تجمیع را به‌صورت all-or-nothing تأیید می‌کند — اگر یک امضا در دسته نامعتبر باشد، کل دسته رد می‌شود و چاره‌ای جز بازتأیید یک‌به‌یک (پرهزینه) نیست. مقاله هیچ مکانیزمی برای **محلی‌سازی امضای بد/تشخیص فریبکار** ارائه نمی‌دهد؛ این دقیقاً جای خالی است که طرح جدید «fast + secure + cheater-detecting» می‌تواند پر کند (مثلاً تأیید دسته‌ای با ساختار درختی/تقسیم‌بندی که بدون بازتأیید O(n) امضای بد را ردیابی کند).
- **الگوی pseudonym یک‌بارمصرف برای conditional privacy:** چرخش pseudonym در هر پیام unlinkability و location privacy می‌دهد و نگه‌داشتن کلید سکریت ردیابی فقط نزد TRA (از طریق `Ci = h3(b, IDi, Ti')` در ساختار `PIDi = QIDi·Ci`) traceability را در موارد اختلاف تضمین می‌کند. در طرح جدید این «تولید دسته‌ای pseudonym توسط TRA + مصرف یک‌باره» الگوی خوبی است، ولی باید تولید اولیه را سبک‌تر کرد (در این مقاله برای هر دسته pseudonym، تعامل mutual authentication با OTP لازم است).
- **فرض امنیتی را صریح اعلام کن:** اثبات در ROM + CDH با fork lemma است و اثبات Type-2 به‌سادگی «حذف شده». برای طرح جدید بهتر است هر دو بازی Game-1/Game-2 واقعاً اثبات شوند و در صورت امکان به مدل قوی‌تر (بدون ROM یا با فرض‌های استانداردتر) برویم.
- **معیارهای کمّی مرجع:** برای مقایسه‌ی منصفانه می‌توان از همین اعداد استفاده کرد: تأیید تک ~10.4 ms و تأیید تجمیعی ~(9.63 + 0.78n) ms در pairing-based؛ سربار ارتباطی ~583 بایت/پیام؛ و هم‌سطح امنیتی 80-bit (MNT-159). طرح جدید باید هم‌زمان با افزودن تشخیص فریبکار، این ارقام را بهتر کند. زمان‌سنجی‌های مبتنی بر timestamp (ضد replay) و پیش‌بارگذاری پارامترهای RSU در OBU (کاهش درخواست‌های مکرر به KGC) دو جزئیات عملی قابل امانت‌گیری هستند.
