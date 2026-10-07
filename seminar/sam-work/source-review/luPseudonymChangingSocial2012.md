# یادداشت استخراج محتوا — `luPseudonymChangingSocial2012` (PCS)

## ۱. مشخصات و دسترسی

- **استناد کامل:** R. Lu, X. Lin, T. H. Luan, X. Liang, and X. (Sherman) Shen, "Pseudonym Changing at Social Spots: An Effective Strategy for Location Privacy in VANETs," *IEEE Transactions on Vehicular Technology*, vol. 61, no. 1, pp. 86–96, Jan. 2012. DOI: 10.1109/TVT.2011.2162864.
- **سطح دسترسی: متن کامل (۱۱ صفحه، PDF ناشر).** فایل محلی: `/home/sam/Zotero/storage/F23VBE65/Lu et al. - 2012 - Pseudonym Changing at Social Spots An Effective Strategy for Location Privacy in VANETs.pdf` (نسخهٔ IEEE Xplore، واترمارک دانشگاه ناپل). فایل `KNFHGJS4/5960806.html` فقط چکیده + بخش اول مقدمه دارد. نسخهٔ باز (figshare 20935960، CORE) فقط فراداده بود و قابل دانلود نبود.
- **منشأ مقاله:** نسخهٔ گسترش‌یافتهٔ مقالهٔ کنفرانسی IEEE ICC 2011 (Kyoto) — p. 86، پانویس: "This paper was presented in part at the 2011 IEEE International Conference on Communications"؛ مرجع [1] همان مقاله است.
- **بررسی فرادادهٔ bib (`report.bib` خط 161):** عنوان، نویسندگان، `volume=61`، `number=1`، `pages=86--96`، `date=2012-01`، DOI و ISSN همگی با PDF مطابق‌اند. ✔ (تاریخ انتشار آنلاین: 25 July 2011 — p. 86.)
- **قرارداد locator:** `p.N` = شمارهٔ صفحهٔ مجله (86–96)؛ `§` = بخش؛ `Eq.` = معادله.

## ۲. خلاصهٔ ساختاریافته

- **مسئله:** تغییر مکرر شبه‌نام راه‌حل رایج حریم خصوصی مکانی در VANET است، اما اگر در زمان/مکان نامناسب انجام شود بی‌اثر است، چون مهاجم با `Location` و `Velocity` موجود در پیام‌های ایمنی می‌تواند شبه‌نام جدید را به قبلی پیوند دهد (p. 86، Fig. 1).
- **روش:** راهبرد PCS — تغییر شبه‌نام در «نقاط اجتماعی» (social spots) که چند خودرو موقتاً در آن توقف می‌کنند، تا نقطه به‌طور طبیعی mix zone شود (p. 87). سه سهم: (۱) PCS + مدل KPSD برای تولید کلیدهای کوتاه‌عمر و کاهش خطر سرقت خودرو؛ (۲) دو مدل تحلیلی مجموعهٔ گمنامی با معیار ASS؛ (۳) اثبات امکان‌پذیری با نظریهٔ بازی ساده‌شده (p. 87).
- **ارزیابی:** شبیه‌ساز رویدادگسستهٔ C++، هر سناریو 100 بار با seedهای مختلف، میانگین با 95% confidence interval؛ مقایسهٔ Sim با Ana (p. 93، §IV).
- **نتایج:** ASS و LPG با افزایش 1/λ (ترافیک کمتر) کاهش و با `T_S` بزرگ‌تر افزایش می‌یابند (Fig. 8)؛ در پارکینگ، با افزایش 1/ω هر دو افزایش می‌یابند و نتایج شبیه‌سازی و تحلیل "match very well" (Fig. 9)؛ با افزایش 1/μ، "except for the first two hours"، هر دو به‌آرامی افزایش می‌یابند (Fig. 10) (p. 93). **مقاله هیچ مقدار عددی صریحی از ASS/LPG در متن گزارش نمی‌کند** — اعداد فقط در نمودارها هستند (از نمودار خوانده نشد).
- **محدودیت‌ها (از متن مقاله):** مدل تهدید فقط ردیابی مکانی‑زمانی را در نظر می‌گیرد (آینده: مهاجم با عوامل بیشتر — p. 95، §VI)؛ ردیابی با دوربین خارج از دامنه است (p. 88)؛ RSU در مدل شبکه نیست، فقط V2V (p. 87، پانویس 2)؛ مهاجم فقط passive/external است (p. 88)؛ نیاز به آزمایش‌های عملی بیشتر (p. 95). **محدودیت‌های استنباطی من (نه ادعای مقاله):** فرض توزیع نمایی/پواسون؛ تحلیل بازی فرض می‌کند همهٔ خودروها عقلانی‌اند و هزینهٔ تغییر کم است؛ مسئلهٔ silent period یا تأثیر بر ایمنی بررسی نشده.

## ۳. استخراج محتوا برای بسط متن

### ۳.۱ بخش «شبه‌نام چیست؟» (report.tex خط 571–573)

- **پیام ایمنی و شبه‌نام:** "each safety message is a 4-tuple, including Time, Location, Velocity, Content, and is authenticated with a Signature with respect to a Pseudonym" (p. 86، §I).
- **چرا شبه‌نام:** "Because a vehicle uses different pseudonyms on the road, the unlinkability of pseudonyms can guarantee a vehicle's location privacy" (p. 86).
- **الزام R-1:** "Identity privacy is a prerequisite for the success of location privacy. Therefore, each vehicle should use a pseudonym in place of a real identity to broadcast messages." (p. 88، §II-C).
- **الزام R-2:** خودرو باید "periodically change its pseudonyms to cut down the relation between the former and the latter locations" و تغییر باید "at the appropriate time and location" انجام شود (p. 88).
- **الزام R-3 (حریم خصوصی شرطی):** "If a broadcast safety message is in dispute, the trusted authority (TA) can disclose the real identity" (p. 88).
- **تعریف رسمی تمایزناپذیری (برای پاراگراف تحلیلی):** بردار عوامل `F = {F1, F2, F3, ...}` مثلاً {Time, Location, Velocity}؛ شباهت کسینوسی دو فرایند تغییر شبه‌نام `cos(b0, b1)`؛ اگر `|1 − cos(b0, b1)| ≤ ε` برای مقدار کوچک ε، دو فرایند برای مهاجم تمایزناپذیرند (p. 87).
- ⚠ مقاله تعریف یک‌جمله‌ای «شناسهٔ موقت و غیرقابل پیوند» ندارد؛ واژهٔ "temporary" دربارهٔ شبه‌نام به کار نرفته (فقط "short-life keys" در KPSD، p. 88–89).

### ۳.۲ بخش «حل مشکل شبه‌نام» / PCS (report.tex خط 686–699)

**مسئلهٔ انگیزشی (Fig. 1، p. 86–87):** سه خودرو در جاده؛ اگر فقط یکی در بازهٔ Δt شبه‌نام عوض کند، پیوند قابل ردیابی است؛ حتی اگر هر سه همزمان عوض کنند، Location و Velocity سرنخ می‌دهد.

**تعریف نقطهٔ اجتماعی:** "the social spots are the places where several vehicles temporarily gather, e.g., the road intersection when the traffic light turns red or a free parking lot near a shopping mall" (p. 87). در مدل شبکه (p. 87–88):
- **small social spot:** تقاطع هنگام چراغ قرمز؛ چون "the session of a red traffic light is typically short, (i.e., 30 or 60 s)".
- **large social spot:** پارکینگ رایگان نزدیک مرکز خرید؛ چون مرکز خرید تمام روز باز است و خودروها مدت طولانی می‌مانند.
- "if all vehicles indistinguishably change their pseudonyms in the spots, the social spots naturally become mix zones" (p. 88).
- سازوکار گمنامی: اولین پیام پس از تغییر شامل "Location = social spot, Velocity = 0, and unlinkable Pseudonym" است — یعنی برای همه یکسان (p. 87).

**الگوریتم ۱ (p. 90):**
1. Case 1 (small): خودرو پشت چراغ قرمز توقف می‌کند؛ "When the traffic light turns to green, Vi changes its pseudonym."
2. Case 2 (large): خودرو در پارکینگ توقف می‌کند؛ "When leaving the parking lot, Vi changes its pseudonym."

**مدل تهدید (p. 88، §II-B):** مهاجم A «سراسری و خارجی»:
- Global: همهٔ پیام‌های ایمنی را با تجهیزات رادیویی (+ زیرساخت شنود [15]) جمع‌آوری می‌کند و ردیابی را "in a spatial–temporal way" با Time/Location/Velocity انجام می‌دهد.
- External: فقط شنود منفعل، بدون تلاش برای نفوذ به خودروها.
- دلیل: OBU هنگام حرکت قابل خاموش‌شدن نیست [17]. دوربین به دلیل هزینهٔ بالاتر خارج از دامنه.

**مدل KPSD (§III-A، p. 88–90):**
- انگیزه: راه‌حل Raya–Hubaux [6] حافظهٔ زیاد می‌خواهد؛ GSIS [18] (امضای گروهی) وارسی کند دارد؛ ECPP [5] و Calandriello [20] — در دومی اگر خودرو دزدیده شود، سارق می‌تواند گواهی کوتاه‌عمر معتبر بسازد.
- ایده: TA کلید ناشناس مجاز `ASK_i` را به **کاربر** (مالک) می‌دهد نه خودرو؛ کاربر آن را در محیط امن (مثلاً خانه) نگه می‌دارد و پیش از سفر کلیدهای کوتاه‌عمر خودتفویض‌شده را تولید و در OBU نصب می‌کند ("analogous to the fueling of a vehicle before a travel") (p. 88–89).
- آمار انگیزشی: "more than 170 000 vehicles stolen each year in Canada [22]" (p. 89).
- ساخت: مبتنی بر Boneh–Boyen short signature [24] و ECPP؛ چهار مرحله: system initialization، key generation، pseudonym self-delegated generation، conditional tracking (p. 89). امضا: `σ = g2^{1/(xj+H(M))}`؛ پیام `msg = (M‖σ‖Yj‖Certj)` (Eq. 3)؛ ردیابی شرطی توسط TA با کلید اصلی (u, v): `TV^u / TU^v = Ai^u` (Eq. 7، p. 90).
- کارایی: هزینهٔ وارسی n پیام از یک منبع: KPSD = `(3 + n)Tpair + (4 + n)Texp−1 + 5Texp−2`، GSB خالص = `3nTpair + 4nTexp−1 + 5nTexp−2`؛ `Tpair = 4.5 ms` (از [5])؛ محدودیت زمانی نمونه "within 300 ms" (p. 90، Fig. 4).

**تحلیل مجموعهٔ گمنامی (§III-B، p. 90–92):** معیار = ASS ("the larger the ASS, the higher the anonymity achieved"، p. 87).
- *نقطهٔ کوچک:* ورود خودروها فرایند پواسون با میانگین فاصلهٔ ورود 1/λ؛ `Ts = t` (30 یا 60 s). `Pr[X = x | Ts = t] = ((λt)^x / x!) e^{−λt}` (Eq. 8)؛ `ASS = Sa = E[X|Ts = t] = λt` (Eq. 10). پانویس 3: اگر صف بیش از آستانه باشد، `ASS = Nv + λt` (p. 91).
- *نقطهٔ بزرگ:* زمان از بازشدن مرکز خرید تا خروج V نمایی با میانگین 1/μ؛ ورود پواسون (1/λ)؛ مدت ماندن هر خودرو `tu` با میانگین 1/ω. `E[X] = λ/μ` (Eq. 12)؛ `ASS = E[X] − E[Y]` (Eq. 19) که Y خودروهای خارج‌شده پیش از V است؛ با فرض نمایی برای tu: `fu*(μ) = ω/(ω+μ)` (Eq. 20) و `ASS = λ/(ω + μ)` (Eq. 21، p. 92).

**تحلیل نظریهٔ بازی (§III-C، p. 92–93):**
- N = n + 1 خودرو؛ هر خودرو Vj: تغییر (C) با احتمال pj یا نگه‌داشتن (K).
- `dj ∈ (0,1)`: ارزش‌گذاری شخصی حریم خصوصی؛ `cj ∈ (0,1)`: هزینهٔ نرمال‌شدهٔ تغییر.
- K → پرداخت `−dj` (ردیابی با احتمال 1)؛ C → احتمال ردیابی 1/S و پرداخت `−dj/(npm+1) − cj`، با کران پایین `S = npm + 1` (Eq. 22).
- شرط تغییر: `cj < npm·dj / (npm + 1)` (Eq. 23). اگر `npm = 0` (هیچ همسایه‌ای عوض نکند) شرط برقرار نیست.
- LPG: `LPGj = (npm/(npm+1))·dj`، صعودی در pm؛ بیشینه وقتی pm = 1: `((N − 1)/N)·dj` — "a win–win situation when all vehicles change their pseudonyms" (p. 93).
- چون KPSD شبه‌نام کافی و ارزان می‌دهد، هزینهٔ تغییر "can be very low" (p. 92).

**جایگاه در ادبیات (§V، p. 93–95):** context mix (Gerlach [28])، swing & swap (Li et al. [13])، Buttyán et al. [9]، mix zones در تقاطع‌ها (Freudiger et al. [15])، جایگذاری بهینهٔ mix zone [29]، تحلیل بازی غیرهمکارانه [31]. ادعای نوآوری: کارهای قبلی عمدتاً فقط شبیه‌سازی کرده‌اند؛ PCS مدل تحلیلی ارائه می‌دهد (p. 87، p. 95). آنتروپی (Beresford–Stajano [10]): `H(PC) = −Σ P_{i→PC} log2 P_{i→PC}`، بیشینه `log2 N` در توزیع یکنواخت (p. 95).

## ۴. بررسی ادعاهای فعلی

| خط | ادعا | حکم | locator | اصلاح پیشنهادی |
|---|---|---|---|---|
| 573 | شبه‌نام «یک شناسه موقت و غیرقابل پیوند است که به جای هویت واقعی استفاده می‌شود» | جزئی | p. 88 R-1 ("use a pseudonym in place of a real identity")؛ p. 88 ("Pseudonym is unlinkable") | «موقت» در این منبع صریح نیست؛ یا با R-2 (تغییر دوره‌ای) پشتیبانی شود یا «موقت» فقط به منبع دیگر (`rahmawatiagustina…`) نسبت داده شود. |
| 573 | شبه‌نام امکان مشارکت بدون افشای هویت واقعی را می‌دهد | پشتیبانی‌شده | p. 88 R-1 ("by concealing the real identity, the identity privacy can be achieved") | — (می‌توان افزود که هویت توسط TA قابل افشای شرطی است، R-3). |
| 688 | «شبه‌نام یکی از مهمترین چالش‌ها در حفظ حریم خصوصی… است» | جزئی | p. 86 ("location privacy is imperative"؛ "if a vehicle changes its pseudonyms in an improper occasion, changing pseudonyms has no use") | بازنویسی: چالش، **تغییر شبه‌نام در زمان/مکان مناسب** برای حفظ حریم خصوصی مکانی است، نه خود شبه‌نام. |
| 692 | PCS پیشنهاد می‌کند خودروها در نقاط اجتماعی شبه‌نام عوض کنند | پشتیبانی‌شده | p. 87؛ Algorithm 1, p. 90 | افزودن لحظهٔ دقیق: هنگام سبزشدن چراغ / هنگام خروج از پارکینگ. |
| 695 | نقاط اجتماعی مکان‌هایی که چندین خودرو در آنها جمع می‌شوند | پشتیبانی‌شده | p. 87 ("places where several vehicles temporarily gather") | افزودن «به‌طور موقت». |
| 696 | مانند تقاطع‌های چراغ قرمز یا پارکینگ‌های رایگان | پشتیبانی‌شده | p. 87؛ p. 87–88 | دقیق‌تر: «پارکینگ رایگان نزدیک مرکز خرید»؛ تمایز small/large. |
| 697 | با تغییر همزمان شبه‌نام در این نقاط، حریم خصوصی افزایش می‌یابد | پشتیبانی‌شده | p. 88 ("social spots naturally become mix zones")؛ p. 93 (Fig. 8–10) | افزودن معیار ASS و شرط «تمایزناپذیر» (Location = social spot، Velocity = 0). |

## ۵. اصطلاحات

| English | فارسی پیشنهادی |
|---|---|
| Pseudonym Changing at Social Spots (PCS) | تغییر شبه‌نام در نقاط اجتماعی |
| social spot (small / large) | نقطهٔ اجتماعی (کوچک / بزرگ) |
| mix zone | ناحیهٔ اختلاط |
| location privacy | حریم خصوصی مکانی |
| identity privacy | حریم خصوصی هویت |
| conditional privacy | حریم خصوصی شرطی |
| unlinkability | پیوندناپذیری |
| anonymity set size (ASS) | اندازهٔ مجموعهٔ گمنامی |
| location privacy gain (LPG) | بهرهٔ حریم خصوصی مکانی |
| quality of privacy (QoP) | کیفیت حریم خصوصی |
| global external adversary | مهاجم سراسری خارجی |
| spatial–temporal tracking | ردیابی مکانی‑زمانی |
| key-insulated pseudonym self-delegation (KPSD) | خودتفویضی شبه‌نام با کلید ایزوله |
| authorized anonymous key | کلید ناشناس مجاز |
| short-life key | کلید کوتاه‌عمر |
| trusted authority (TA) | مرجع مورد اعتماد |
| onboard unit (OBU) | واحد درون‌خودرویی |
| game-theoretic analysis / payoff | تحلیل نظریهٔ بازی / پرداخت (سود) |
| Poisson process / interarrival time | فرایند پواسون / فاصلهٔ زمانی بین ورودها |

## ۶. شکل‌ها و جداول قابل استفاده

- **Fig. 1 (p. 87):** پیوند شبه‌نام‌ها به دلیل تغییر در زمان نامناسب — مناسب برای انگیزهٔ بخش.
- **Fig. 2 (p. 87):** نقاط اجتماعی (تقاطع با چراغ قرمز و پارکینگ نزدیک مرکز خرید) — بهترین گزینه برای بخش PCS (بازترسیم با ذکر منبع).
- **Fig. 3 (p. 89):** مدل KPSD (TA → کاربر → OBU).
- **Fig. 4 (p. 90):** مقایسهٔ زمان وارسی KPSD با GSB خالص.
- **Fig. 5 / Fig. 6 (p. 90–91):** تغییر شبه‌نام در تقاطع / پارکینگ؛ **Fig. 7:** نمودار زمانی پارکینگ.
- **Fig. 8–10 (p. 94):** ASS و LPG بر حسب 1/λ، 1/ω (با 1/μ = 4 h)، 1/μ (با 1/ω = 40 min).
- **Table I (p. 93) — پارامترها:** `T_S` = 30, 60 seconds؛ 1/λ (small) = [2, 4, 6, 8, 10, 12] seconds؛ 1/μ = [1, 2, ..., 10] hours؛ 1/λ (large) = [2, 4, 6] minutes؛ 1/ω = [10, 20, ..., 90] minutes؛ dj = normalized.
  - ⚠ ناهمخوانی درون‌منبعی: Table I برای 1/λ در نقطهٔ کوچک تا 12 s می‌دهد، اما متن (p. 93) می‌گوید "varies from 2 s to 10 s". در صورت نقل، هر دو را با locator ذکر کنید یا از ذکر بازهٔ دقیق صرف‌نظر شود.
  - ⚠ اشتباه تایپی احتمالی در منبع: Eq. 16–19 از `fu*(u)` استفاده می‌کند در حالی که Eq. 15 `fu*(μ)` است؛ در نقل فرمول از Eq. 20–21 استفاده شود.
