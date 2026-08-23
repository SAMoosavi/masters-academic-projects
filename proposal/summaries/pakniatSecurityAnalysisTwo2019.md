---
tags: [literature, CLS, certificateless, cryptanalysis]
paper: pakniatSecurityAnalysisTwo2019
year: 2019
---

# Security Analysis of Two Lightweight Certificateless Signature Schemes (Pakniat 2019, arXiv)

## خلاصه (Summary)

این مقاله یک **cryptanalysis** است که ادعای امنیت دو طرح سبک (lightweight) **certificateless signature (CLS)** را رد می‌کند: طرح Karati et al. برای **Industrial IoT** و طرح Kumar et al. برای **Healthcare Wireless Sensor Networks (HWSN)**. نویسنده (Pakniat) نشان می‌دهد که هر دو طرح که ادعای **existential unforgeability** داشتند به‌سادگی قابل **forge** شدن هستند:

- در طرح Karati et al.، یک **Type 1 adversary** (کاربر مخرب عادی که اجازه جایگزینی public key دارد) می‌تواند با داشتن یک **partial private key** معتبر مربوط به یک کاربر، یک partial private key معتبر برای هر کاربر دیگری بسازد و در نتیجه امضای هر کاربر را روی هر پیامی جعل کند.
- در طرح Kumar et al.، هر دو نوع **adversary** می‌توانند **unforgeability** را بشکنند: یک Type 1 adversary با مشاهده یک جفت (message, signature) می‌تواند امضای همان signer را روی هر پیام جدید جعل کند؛ و یک Type 2 adversary (KGC مخرب که به **master secret key** دسترسی دارد) بدون نیاز به دیدن حتی یک امضا، امضای هر کاربر را روی هر پیام جعل می‌کند.

## ایده اصلی و طرح (Core idea)

یادآوری چارچوب CLS: سه نهاد **KGC**، **signer** و **verifier** و شش الگوریتم: **Setup**، **Set-Partial-Private-Key**، **Set-Secret-Value/Set-Private-Key**، **Set-Public-Key**، **CLS-Sign** و **CLS-Verify**. مدل امنیتی شامل دو نوع adversary است: **A1** که به master secret key دسترسی ندارد ولی می‌تواند public key هر کاربر را با مقدار دلخواه جایگزین کند، و **A2** که به master secret key دسترسی دارد ولی نمی‌تواند public keys را جایگزین کند.

**طرح Karati et al.** (هم‌راستا با الگوریتم‌های روی pairing):
- Setup: گروه‌های دوخطی G1, G2 به ترتیب اول p، تولیدکننده g1، hash H: {0,1}* → Zp*، master secret key y، و پارامترهای عمومی g2 = e(g1,g1)^y و Y_KGC = g1^y.
- Set-Partial-Private-Key: برای هویت ID_i با h_i = H(ID_i)، KGC مقدار r_i تصادفی و R_i = g1^{r_i} و y_i = (g1)^{y·h_i/(h_i + r_i + y)} را می‌سازد؛ partial private key (y_i, R_i) با معادله تصدیق e(g1, Y_KGC)^{h_i} = e(y_i, (g1^{h_i}·R_i·Y_KGC)).
- Set-Private-Key: کاربر مقادیر تصادفی x_i, c_i را برمی‌گزیند؛ SK_i = (c_i, x_i, R_i).
- Set-Public-Key: Y_i = (Y_{i1} = y_i^{1/x_i}, Y_{i2} = g2^{c_i}).
- CLS-Sign: با t تصادفی، σ1 = g2^t و σ2 = (g1^{h_S}·R_S·Y_KGC)^{(c_S − t)x_S/m}.
- CLS-Verify: (Y_S2^{1/m}/σ1)^{h_S} = e(Y_S1, σ2).

**طرح Kumar et al.:**
- Setup: گروه G1 با تولیدکننده P، master secret key α با P_pub = α·P، و hashهای H1, H2: {0,1}* → G1 و H3: {0,1}* → Zq*.
- Set-Partial-Private-Key: Q_IDi = H1(ID_i) و D_i = α·Q_IDi.
- Set-Private-Key: x_i تصادفی و SK_i = (x_i, D_i).
- Set-Public-Key: Y_i = x_i·P.
- CLS-Sign: با r تصادفی، R = r·P، W = H2(Δ)، h = H3(m, ID_S, Y_S, R)، و V = D_S + r·W + h·x_S·P_pub؛ امضا σ = (R, V) تحت state information Δ.
- CLS-Verify: e(V, P) = e(Q_ID_S + h·Y_S, P_pub)·e(R, W).

## امنیت (Security)

**حمله بر طرح Karati et al. (Theorem 1 — Type 1):**
فرض A1 به partial private key معتبر (y_S, R_S) کاربر S با هویت ID_S (و h_S = H(ID_S)) دسترسی دارد. برای جعل partial private key کاربر دیگر S′ با هویت دلخواه ID_S′:
1. h_S′ = H(ID_S′) را محاسبه می‌کند.
2. α = h_S′/h_S را در Zp* می‌سازد (چون خروجی H در Zp* است، وارون h_S موجود است).
3. y_S′ = y_S^α و R_S′ = R_S / g1^{(α−1)·h_S} را محاسبه می‌کند.
4. (y_S′, R_S′) را به‌عنوان partial private key کاربر S′ قرار می‌دهد.

درستی جعل با زنجیره معادلات اثبات می‌شود که در نهایت به e(g1, Y_KGC)^{h_S′} می‌رسد (تساوی (10) در متن)، و این دقیقاً همان شرط اعتبار معادله (1) است؛ یعنی (y_S′, R_S′) یک partial private key کاملاً معتبر است. با داشتن این partial private key، A1 می‌تواند به‌جای S′ مراحل Set-Private-Key و Set-Public-Key را اجرا کند و سپس با CLS-Sign امضای S′ را روی هر پیام دلخواه جعل کند.

**ریشه علت در طرح Karati:** partial private key ساختار جبری ضرب‌پذیر در توان h دارد (y_i = (g1)^{y·h_i/(h_i+r_i+y)}) و **master secret key y هیچ‌جا به‌صورت مستقیم دخالت نکرده و برابرسازی توانی (exponent manipulation)** — یعنی y_S′ = y_S^{h_S′/h_S} — امکان جعل partial private key برای هر هویت دلخواه را می‌دهد. به بیان دیگر، partial private key شامل هیچ مکانیزم اتصال (binding) امن به هویتِ امضاکنندهٔ آن نیست که مانع **key derivation** توسط کاربرِ دیگر شود. این نقص، قابلیت forge کردن امضای هر کاربر را برای هر Type 1 adversary فراهم می‌کند.

**حمله بر طرح Kumar et al. (Theorems 2 و 3):**

- *Theorem 2 (Type 1):* فرض A1 به یک امضای معتبر (m, σ=(R,V), Δ) از S دسترسی دارد:
  1. با Query **Request-Secret-Value** روی ID_S مقدار x_S را می‌گیرد.
  2. D_{S,Δ} = V − x_S·h·P_pub = D_S + r·H2(Δ) را محاسبه می‌کند (با حذف مولفه وابسته به x_S).
  3. برای پیام جدید m′ مقدار h′ = H3(m′, ID_S, Y_S, R) و V′ = D_{S,Δ} + h′·x_S·P_pub را می‌سازد و σ′ = (R, V′) را به‌عنوان امضای معتبر روی m′ خروجی می‌دهد.

- *Theorem 3 (Type 2):* A2 که به master secret key α دسترسی دارد:
  1. r تصادفی می‌گیرد و R = r·P می‌سازد.
  2. h = H3(m, ID_S, Y_S, R) و V = D_S + r·H2(Δ) + h·α·Y_S را محاسبه می‌کند.
  3. σ = (R, V) را بدون نیاز به دیدن حتی یک امضای قبلی خروجی می‌دهد.

**ریشه علت در طرح Kumar:** مشکل اصلی این است که امضا خطی (linear) است و **secret value x_S در امضا به‌صورت قابل تفکیک (separably) با h·P_pub ظاهر می‌شود**؛ به همین دلیل یک Type 1 adversary می‌تواند با یک امضای نمونه، مولفه D_S + r·H2(Δ) را بازیابی و دوباره با x_S ترکیب کند (انتشار از یک امضای دیده‌شده به هر پیام دیگر). در سمت Type 2 نیز چون A2 خودش D_S را می‌داند و می‌تواند R را خودش تولید کند، می‌تواند با جایگزینی h·α·Y_S (معادل h·x_S·P_pub) امضای معتبر بسازد؛ در واقع معادله verify به‌گونه‌ای است که دانش master key α معادل جعل کامل است.

## ارزیابی (Evaluation)

این مقاله یک paper حمله (attack paper) است، نه طرح جدید؛ بنابراین فاقد ارزیابی عملکردی/کارایی است. پیامد اصلی آن دو نتیجه است: (1) طرح Karati et al. که برای **IIoT** ادعای "provably secure and lightweight" داشت، به‌طور کامل ناامن است و هر کاربرِ مشروع می‌تواند به‌عنوان Type 1 adversary امضای همه کاربران را جعل کند؛ (2) طرح Kumar et al. برای **HWSN** به‌کلی forgeable است و هر دو نوع adversary (کاربر عادی و KGC مخرب) می‌توانند امضای هر signer را جعل کنند. نتیجه‌گیری ضمنی برای جامعه: ادعای **provable security** باید با تحلیل دقیق و جدا از formal proof بررسی شود؛ چراکه هردو طرح مورد نظر اثبات امنیتی داشتند اما عملاً ناامن بودند.

## نکات برای طرح امضای جدید (Takeaways for a new fast+secure+cheater-detecting scheme)

نکاتی که یک طرح CLS جدید (سریع، امن، و قادر به **cheater detection**) باید از این مقاله بیاموزد:

1. **Partial private key باید به هویت کاربر binding شود به‌گونه‌ای که قابل derivation توسط کاربر دیگر نباشد.** ساختارهای توانی ساده مانند y^α یا نسبت‌های مثل h_S′/h_S که اجازه تبدیل partial private key یک کاربر به کاربر دیگر را می‌دهند، فاجعه‌بارند. هر partial private key باید در هش هویت (یا یک salt/randomness وابسته به هویت) «قفل» شود؛ بهتر است از مکانیزم‌های **Boneh–Franklin style / IBE-based** اثبات‌شده استفاده شود.
2. **از خطی‌بودن امضا اجتناب کنید.** امضاهایی که secret value به‌صورت جداپذیر (مثلاً به شکل x_S·h·P_pub) در فرمول ظاهر می‌شوند، اجازه می‌دهند یک امضای نمونه به پیام‌های دیگر extrapolate شود. مولفه‌های امضا باید به پیام و randomness به‌گونه‌ای گره بخورند که جدا کردن secret value از یک امضا ناممکن باشد.
3. **مولفه r·W (randomness) باید با پیام گره بخورد.** در طرح Kumar، R برای پیام‌های مختلف ثابت می‌ماند و همین اجازه re-forge روی m′ را می‌دهد؛ قرار دادن R (یا hash آن) در ورودی h و الزام به randomness تازه برای هر پیام ضروری است.
4. **امضای Type 2 / KGC باید محدود شود.** دانش master secret key نباید به‌تنهایی امکان جعل امضای دلخواه را بدهد؛ یعنی امضا باید به secret value کاربر (که KGC نمی‌داند) به‌صورتی گره بخورد که حتی KGC نتواند بدون آن جعل کند — در غیر این صورت **key escrow** عملاً به جعل کامل تبدیل می‌شود.
5. **Proof ≠ Security.** وجود formal security proof تضمین امنیت نیست؛ هر طرح باید با cryptanalysis مستقل (مانند این مقاله) راستی‌آزمایی شود. برای یک طرح جدید، توصیه می‌شود از ابتدا با ابزارهای دقیق‌تر (مثلاً کاهش به مسائل سخت استاندارد و آزمون بازی‌های واقعی adversary) اعتبارسنجی شود.
6. **برای cheater detection** (یعنی تشخیص متقلب در بدنه امضاها/داده‌ها): چون در CLS هر کاربر partial private key + secret value خودش را دارد، اگر طرح، امضا را از secret value و partial private key به‌طور تفکیک‌ناپذیر بسازد، می‌توان بدون نشت هیچ مولفه‌ای (بدون D_{S,Δ} قابل استخراج) یک signer متقلب را از کاربر صادق متمایز کرد؛ در طرح‌های ناامن فوق، همین تفکیک‌پذیری بود که هم جعل را ممکن کرد و هم هر claim در مورد هویت امضاکننده را بی‌اعتبار ساخت.
