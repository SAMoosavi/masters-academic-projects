---
tags: [literature, PF-CLAS, VANET]
paper: gongPCASCryptanalysisImprovement2023
year: 2023
---

# PCAS: Cryptanalysis and Improvement of Pairing-Free Certificateless Aggregate Signature Scheme (Gong et al. 2023, Ad Hoc Networks)

> Gong, Z., Gao, T., Guo, N. — *PCAS: Cryptanalysis and improvement of pairing-free certificateless aggregate signature scheme with conditional privacy-preserving for VANETs.* Ad Hoc Networks 144 (2023) 103134.

## خلاصه (Summary)

این مقاله یک حمله‌ی جعل (forgery attack) بر روی طرح CLAS پسرخانواده‌ی پرشده از bilinear pairing با نام LICLAS (مربوط به Liu et al. [18]) که برای شبکه‌های HWMSN (شبکه‌های حسگر پزشکی بی‌سیم) ارائه شده بود، ارائه می‌دهد و ثابت می‌کند که این طرح نمی‌تواند در برابر حمله‌ی جعل مقاومت کند. سپس نویسندگان طرح بهبودیافته‌ای به نام **PCAS** برای احراز هویت خودروها در VANETs پیشنهاد می‌کنند. PCAS بر پایه‌ی **Elliptic Curve Cryptography (ECC)** است و از **bilinear pairing** و عملیات **Map-to-Point hash** اجتناب می‌کند (پس **pairing-free** است). سازوکار **pseudonym** برای حفظ محرمانگی شرطی (conditional privacy preservation) استفاده شده و RSU می‌تواند امضاهای تجمیع‌شده از خودروها را به‌صورت دسته‌ای (batch verification) برای AS بفرستد تا زمان تأیید کاهش یابد. اثبات امنیت PCAS در مدل random oracle model تحت سختی ECDLP انجام شده و طبق تحلیل عملکرد، در مقایسه با LICLAS، سربار انتقال (transmission overhead) برای یک پیام و 2000 پیام هر دو 25٪ کاهش یافته و سربار محاسباتی (computation overhead) به ترتیب 16.56٪ و 25.34٪ کاهش یافته است.

## ایده اصلی و طرح (Core idea & scheme)

- **Pairing-free بودن:** امضای PCAS فقط شامل عملیات scalar multiplication و point addition روی منحنی بیضوی و هش به `Z_q*` است؛ هیچ عملیات bilinear pairing و Map-to-Point-hash ندارد، چون این دو عملیات بسیار پرهزینه‌تر از عملیات ECC هستند.
- **موجودیت‌ها:** OBU (روی خودرو)، RSU (کنار جاده)، AS (Application Server)، KGC (تولیدکننده‌ی partial secret key)، و TA (Trusted Authority). نقش‌ها جدا شده‌اند: TA کلید سکریت `s1` را برای ردیابی دارد و KGC کلید `s2` را برای استخراج partial key.
- **Pseudonym و محرمانگی شرطی:** خودرو ابتدا `l` عدد تصادفی `k_{i,j}` انتخاب کرده و `K_{i,j} = k_{i,j}P` می‌سازد و با TA ثبت می‌کند. TA با کلید سکریت خود `pseu_{i,j} = (K_{i,j}, pid_{i,j}, T_{i,j})` تولید می‌کند که در آن `pid_{i,j} = RID_i ⊕ H(s1·K_{i,j}, T_{i,j})`. فقط TA می‌تواند با `s1` هویت واقعی خودرو (`RID_i`) را از روی pseudonym استخراج کند (ردیابی = traceability). سه مقدار تصادفی (`k_i`, `r_i`, `y1_i`) در هر امضا باعث unlinkability می‌شود.
- **کلیدها:** KGC بخشی از کلید را به‌صورت `ps k_{i,j} = (d_{i,j}, R_i)` با `d_{i,j} = r_i + s2·h1_{i,j}` می‌سازد؛ خودرو مقدار سکریت خود `x_i` را انتخاب کرده و `X_i = x_iP` می‌سازد؛ کلید عمومی `PK_{i,j} = (D_{i,j}, R_i)` با `D_{i,j} = R_i + α_{i,j} X_i` و کلید خصوصی `SK_{i,j} = (d_{i,j}, x_i)`. از آن‌جا که مهاجم فقط با partial key نمی‌تواند کلید خصوصی کامل را بسازد، مشکل key escrow حل می‌شود.
- **امضا:** برای پیام `m_i` با timestamp فعلی `t_i`:
  - `Y1_i = y1_i P`
  - `w_i = [ h3_i (d_{i,j} + α_{i,j} x_i) + y1_i h4_i ] mod q`
  - امضا `σ_i = (Y1_i, w_i)`؛ تأیید تک‌امضا با رابطه `w_i P − h4_i Y1_i = h3_i D_{i,j} + h1_{i,j} P_pub`.
- **Aggregation و batch verification:** RSU امضاهای `n` خودرو را جمع می‌زند: `Y = Σ h4_i Y1_i`، `w = Σ w_i` و امضای تجمیعی `σ = (Y, w)` را به AS می‌دهد. AS با یک معادله‌ی واحد تأیید می‌کند:
  `wP − Y = Σ_{i=1..n} (h3_i D_{i,j} + h1_{i,j} P_pub)`
  بنابراین به‌جای `n` بار تأیید جداگانه، یک بار محاسبه‌ی تجمیعی انجام می‌شود.
- **ساختار حمل‌ونقل:** مدل دولایه — لایه‌ی پایین V2V و V2I بر پایه‌ی DSRC؛ خودرو هر 100–300 ms پیام وضعیت (سرعت، جهت، ترافیک) پخش می‌کند.

## امنیت (Security)

- **طرحِ مورد Cryptanalysis — LICLAS:** طرح Liu et al. [18] که خودش نسخه‌ی بهبودیافته‌ی Gayathri et al. [17] برای HWMSN بود. این طرح ادعا می‌کرد تحت فرض CDHP امن است، اما حمله‌ی جعل زیر ارائه شد.
- **حمله‌ی جعل (Forgery attack):** یک گره‌ی معمولی (MSN عادی، که نقش adversary را دارد) با داشتن پارامترهای سیستم، pseudo-identity، کلید عمومی و یک امضای معتبر `σ_i` روی `m_i || t_i`، می‌تواند با محاسبه‌ی هش‌های جدید برای پیام جدید `m'_i || t'_i` و ترکیب ضرایب (محاسبه‌ی `W'_i` از روی `Y1_i`، `X_i` و `R_i`) یک امضای معتبر جعلی روی پیام جدید بسازد. ریشه‌ی ضعف در **طراحی `W_i`** است: مهاجم می‌تواند یک `W'_i` جدید بسازد که معادله‌ی تأیید را برآورده کند.
- **اصلاح:** در PCAS، `w_i` به‌گونه‌ای بازطراحی شده که مقدار تصادفی `y1_i` و `h4_i` (که وابسته به timestamp و کلید عمومی است) را داخل خود دارد، بنابراین ترکیب‌های جعل در LICLAS دیگر کار نمی‌کند. علاوه بر این، کلید generation هم بازطراحی شده تا کارایی تأیید بیشتر شود.
- **Security Model:** دو بازی استاندارد: **Game I** با مهاجم Type I (`A1`، حمله‌ی key replacement که کلید عمومی خودرو را عوض می‌کند ولی به master secret کدسترسی ندارد) و **Game II** با مهاجم Type II (`A2`، حمله‌ی malicious KGC که به master secret دسترسی دارد ولی نمی‌تواند کلید عمومی را عوض کند). پنج oracle: Create-user، Partial-Secret-Key، Secret-Key، Vehicle-Key-Replacement و Sign.
- **اثبات:** با استفاده از **forking lemma**، نشان داده می‌شود که اگر مهاجم Type I یا Type II بتواند امضای معتبر (تکی یا تجمیعی) جعل کند، challenger می‌تواند **ECDLP** را با احتمال ناچیز نبودن (non-negligible) حل کند — تناقض با فرض سختی ECDLP. نتیجه: PCAS تحت adaptive chosen message attack در random oracle model به‌صورت **existentially unforgeable** است.
- **مهاجمان Type III و Type IV:** در ادامه نشان داده می‌شود که حتی اگر مهاجم partial secret key (Type III) یا master key KGC را داشته باشد (Type IV)، به دلیل preimage resistance هش و نیاز به حل ECDLP برای یافتن `x_i`/`y1_i`، نمی‌تواند امضا جعل کند.
- **حملات مقاوم‌شده:** replay (به‌کمک timestamp)، impersonation، modification، man-in-the-middle و malicious KGC. ویژگی‌های محرمانگی: message authentication/integrity/non-repudiation، identity privacy، unlinkability، traceability (فقط TA).

## ارزیابی (Evaluation)

- **پیکربندی هم‌سطح امنیتی:** طرح‌های مبتنی بر bilinear pairing با کلید 1024-bit (یکسان با RSA-1024) و طرح‌های ECC با میدان 160-bit و طول گروه `|G| = 320 bits` مقایسه می‌شوند؛ طول هش 160-bit فرض شده است. اجراها با کتابخانه‌ی MIRACL: `T_ecsm = 0.1652 ms`، `T_ecpa = 0.0014 ms`، `T_mtZ = 0.0018 ms`، در مقابل `T_bpsm = 4.8726 ms` و `T_bp = 4.4410 ms`.
- **Transmission overhead (اندازه‌ی امضا):**
  - PCAS: `|G| + |Z_q*| = 480 bits` (هم برای امضای تک و هم تجمیعی — اندازه ثابت).
  - Liu [18]: `2|G| = 640 bits`؛ Gayathri [17]: 640 (تکی) / 800 (تجمیعی)؛ Xie [35]: 520 (تکی) / `320n+160`؛ shen [24] و Kumar [33] و Wu [34]: 2048 (تکی) و `(n+1)·1024`.
  - کاهش در برابر [18]: **25٪** (هم برای 1 پیام، هم 2000 پیام)؛ در برابر [24,33,34]: 76.56٪ (تکی) و 99.98٪ (2000 پیام).
- **Computation overhead (زمان اجرا):**
  - PCAS: امضا `0.1706 ms`، تأیید `0.6690 ms`، aggregate `0.1684n + 0.0014 ms`، aggregate verification `0.3368n + 0.1652 ms`.
  - Liu [18]: امضا `0.3358 ms`، تأیید `0.6704 ms`، aggregate `0.1698n − 0.0028 ms`، aggregate verification `0.507n ms`.
  - کاهش در برابر [18]: **16.56٪** برای 1 پیام و **25.34٪** برای 2000 پیام. در برابر [24,33,34] (مبتنی بر pairing): 97.04٪ / 97.48٪ / 97.48٪ (تکی) و 94.32٪ / 94.67٪ / 94.90٪ (2000 پیام)؛ در برابر [17]: 28.21٪ و 24.80٪؛ در برابر [35]: −0.05٪ و 49.93٪.
- **تأخیر تأیید 2000 پیام:** PCAS و [17] حدود **0.6738 s**؛ در مقابل [18] حدود 1.014 s، [35] حدود 1.0078 s، [24] حدود 8.8939 s، [33] حدود 18.9373 s و [34] حدود 19.8139 s.
- **Time complexity:** امضا و تأیید تک‌امضا `O(1)`؛ aggregate و aggregate verification `O(n)` — مانند سایر طرح‌ها، اما با ضرایب کوچک‌تر.
- **شبیه‌سازی Veins:** OMNeT++ 5.3 + SUMO 0.32.0 + Veins 4.7.1 روی Intel i7-10700F، ناحیه‌ی 1500×1500 متر، 10–50 خودرو. نتایج با تحلیل نظری هم‌خوان است؛ در 500 پیام، تأخیر تأیید PCAS حدود 25٪ کمتر از [18] است.
- **خطوط پایه‌ی مقایسه:** [24] Shen et al. (ID-based)، [33] Kumar et al.، [34] Wu et al. (پایه bilinear pairing)، [35] Xie et al. (iCLAS)، [17] Gayathri et al. (pairing-free، برای HWMSN)، [18] Liu et al. (LICLAS).

## نکات برای طرح امضای جدید (Takeaways for a new fast+secure+cheater-detecting scheme)

- **Design of `w`/امضا حیاتی است:** ضعف LICLAS از یک امضای «ترکیب‌پذیر خطی» نشأت گرفت که مهاجم با هش‌های جدید می‌توانست بازترکیب کند. در امضای جدید باید هر جزء امضا (اعم از nonce، کلید عمومی، timestamp و partial key) به‌طور به‌هم‌پیوسته داخل هش‌ها و ضرایب قفل شود تا معادله‌ی تأیید برای بازترکیب‌های جعلی برقرار نشود. بخش اول کار (fast + secure) یعنی: pairing-free + ECC + وابستگی کامل به h4_i (timestamp) دقیقاً همین درس است.
- **کنترل توسط RSU/aggregator:** تجمیع در RSU و تأیید در AS باعث می‌شود تعداد عملیات گران‌قیمت (scalar multiplication) به جای `n` بار، یک‌بار (به‌صورت مجموع) انجام شود. برای طرح خودمان، تفکیک «امضای تک → تأیید میدانی توسط RSU» و «aggregate → تأیید توسط واحد بالادست» الگوی مناسبی است.
- **مشکل open در این طرح برای ایده‌ی جدید:** نویسندگان خودشان تصریح می‌کنند که (۱) هنگام شکست تأیید تجمیعی باید دوباره تأیید تک‌به‌تک انجام شود که پرهزینه است، و (۲) اندازه‌ی دسته (batch size) ثابت است نه پویا. این دقیقاً همان جای خالی برای طراحی ماست: **cheater detection** (یافتن امضاهای بد در یک دسته‌ی ناموفق بدون بازتأیید کامل `n` امضا) — یعنی با یک روش تشخیص فریبکار/ردیابی تک‌امضاهای نامعتبر، سربار بازتأیید را به‌جای O(n) کاهش دهیم.
- **Pseudonym و conditional privacy:** استفاده از دو موجودیت مستقل (TA برای ردیابی با `s1`، KGC برای partial key با `s2`) به‌خوبی مشکل key escrow و ردیابی را جدا می‌کند؛ اما pseudonym generation در PCAS پیچیده و پرهزینه است (تعاملات زیاد و `l` بار هش) — در طرح جدید بهتر است تولید pseudonym را سبک‌تر یا روی خودرو انجام دهیم.
- **معیارهای کمّی مرجع:** برای مقایسه‌ی طرح جدید، می‌توان از همین معیارها استفاده کرد: امضای تک با اندازه‌ی ~480 bits، تأیید ~0.67 ms در ECC-160، و تأخیر تجمیعی خطی با ضریب ~0.34 ms بر پیام. هر طرح جدید باید به‌ویژه در «تأیید دسته‌ای» و «تشخیص فریبکار» بهتر از این مقادیر باشد.
- **ملاحظه‌ی عملی:** خودروها به tamper-proof device و GPS مجهزند؛ پس می‌توانیم برای جلوگیری از استخراج کلید و هم‌زمان‌سازی زمان (ضد replay) روی همین مفروضات طراحی کنیم.
