# یادداشت استخراج محتوا — `ghovanlooyghajarSBTMSScalableBlockchain2021`

## ۱. مشخصات و دسترسی

- **ارجاع کامل:** Ghovanlooy Ghajar, F.; Salimi Sratakhti, J.; Sikora, A. "SBTMS: Scalable Blockchain Trust Management System for VANET." *Applied Sciences* 2021, 11(24), 11947. https://doi.org/10.3390/app112411947 — Received 9 Nov 2021, Accepted 11 Dec 2021, Published 15 Dec 2021 (p.1، حاشیه).
- **سطح دسترسی:** متن کامل (۱۷ صفحه، PDF محلی در `/home/sam/Zotero/storage/LUU59JV8/`، استخراج با `pdftotext -layout`؛ معادله‌ها و کسرهای خراب‌شده در متن استخراجی با رندر تصویری صفحات ۶، ۸، ۱۱ و ۱۵ بازبینی شدند). مقاله Open Access (CC BY 4.0).
- **بررسی متادیتای bib** (`report.bib` خطوط ۷۲–۸۶؛ مقایسه با PDF و Crossref):
  - نویسندگان: درست (Crossref: Fatemeh Ghovanlooy Ghajar; Javad Salimi Sratakhti; Axel Sikora). نکته: املای «Sratakhti» در خود مقاله و Crossref همین است، ولی در مرجع [44] همان مقاله «Sartakhti» آمده — احتمالاً غلط تایپی ناشر؛ bib را تغییر ندهید چون با DOI منطبق است.
  - volume=11، number=24، pages=11947 (شماره مقاله)، DOI، ISSN: درست.
  - **خطا:** `date = {2021-01}` نادرست است؛ تاریخ انتشار 2021-12-15 (p.1؛ Crossref `published: 2021-12-15`). پیشنهاد: `date = {2021-12-15}` یا `2021-12`.

## ۲. خلاصه ساختاریافته

- **مسئله:** سیستم‌های مدیریت اعتماد متمرکز در VANET گلوگاه و نقطه شکست واحد دارند؛ بلاکچین غیرمتمرکز است ولی به‌دلیل ماینینگ «low transaction throughput and poor scalability» دارد، درحالی‌که تعداد خودروها و پیام‌ها مدام زیاد می‌شود (§1, p.1–2).
- **روش/معماری (§4, p.4–8):** چهار گام: (۱) خودروی گیرنده امتیاز اطمینان مبتنی بر فاصله `c_s` و قابلیت اطمینان پیام `P(m|O,C)` را با استنباط بیزی حساب و به نزدیک‌ترین RSU می‌فرستد؛ (۲) RSU «قابلیت اطمینان خالص» (net reliability, `o_s`) را با تابع سیگموید تجمیع می‌کند؛ (۳) RSUها با حل PoW روی `EpochRandomness` هویت گذرا می‌سازند و به کمیته‌ها (شاردها) تقسیم می‌شوند؛ (۴) در هر کمیته PBFT روی مجموعه تراکنش‌ها اجرا شده و کمیته نهایی با PBFT مجدد بلوک را می‌سازد.
- **ارزیابی (§5, p.9, Table 2):** شبیه‌سازی Python ناهمگام؛ 20 RSU، 10–3000 خودرو، 3 رویداد (accident، traffic، road destruction)؛ ناحیه 800 × 1000، شعاع ارسال 50، سرعت بیشینه 200، زمان شبیه‌سازی 3600 (s)؛ k=10، x0=0.5، z=5 (Table 2)؛ ولی متن می‌گوید «committees of size 4, and the number of RSU in each committee for consensus is 3» (p.9) — **ناسازگاری درونی** با z=5 در Table 2. آستانه تأیید تراکنش: net reliability > 70% (p.9). نرخ رویدادها 2/5، 2/5، 1/5 (p.11).
- **نتایج کلیدی:** قابلیت اطمینان پیام و خالص با زمان همگرا و افزایشی است (Fig. 6, 7)؛ افزایش نرخ رویداد آن را کاهش (Fig. 8) و افزایش شعاع و تعداد خودرو آن را افزایش می‌دهد (Fig. 9, 10)؛ دقت و precision با تعداد بلوک‌ها بالا می‌رود (Fig. 12)؛ زمان تولید بلوک در شاردینگ «near linearly» رشد می‌کند در برابر PoW (Fig. 13, p.14)؛ زمان محاسبه خودرو کمتر از PoW (Fig. 14). از روی نمودار Fig. 13 (خوانش تقریبی، نه عدد گزارش‌شده در متن): PoW از حدود 1 تا حدود 14 ثانیه و Sharding از حدود 0 تا حدود 2 ثانیه در بازه 0–3000 خودرو.
- **محدودیت‌ها (برداشت داور، نه ادعای نویسندگان مگر مشخص‌شده):** هیچ عدد جدولی برای نتایج نیست (فقط نمودار)؛ «Data Availability: Not Applicable» (p.16)؛ تحلیل امنیتی صرفاً توصیفی است (§5.1)؛ فرض همکاری خودروها در ارسال پیام (§4, p.4)؛ ناسازگاری اندازه کمیته؛ نماد `s` در Table 2 دو بار با مقادیر 4 و 1 آمده (احتمالاً یکی پارامتر شیب معادله ۱ و دیگری توان تعداد کمیته‌ها — نامشخص). کار آینده به گفته نویسندگان: مکانیزم پاداش/تنبیه و Q-Learning (§7, p.15). حریم خصوصی/شبه‌نام در مدل پرداخته نشده (هیچ بخشی درباره آن وجود ندارد).

## ۳. استخراج محتوا برای بسط متن

### ۳.۱ بخش «مزایای بلاکچین در شبکه اقتضایی خودرویی» (report.tex خط ۴۰۵)
- ویژگی‌هایی که مقاله برمی‌شمرد: «Blockchain features are decentralized, distributed, mass storage, and non-manipulation features» (Abstract, p.1).
- حذف TTP: «there is no requires trusted third party (TTP) to establish trust» (§1, p.1–2)؛ بلاکچین «a distributed peer-to-peer (P2P) system for communicating and transferring transactions between nodes without TTP» (p.2).
- مشکل سیستم متمرکز: «bottlenecks ... slower decision-making and single-point of failure» (§1, p.1)؛ «If the main system goes down, the whole system will fail» (§3.1, p.3).
- ترکیب بلاکچین و IoT: «can greatly improve the field of security, reliability, storage of data, and immutability» (§1, p.2).
- **نکته:** شفافیت، ردیابی و قراردادهای هوشمند در این مقاله به‌عنوان مزیت برای VANET بحث نشده‌اند («intelligent contracts» فقط در فهرست کاربردهای عمومی بلاکچین، p.2، با ارجاع [7]).

### ۳.۲ بخش «مدل‌های مدیریت اعتماد» (خط ۴۲۹)
- طبقه‌بندی در این مقاله فقط **دوگانه** است: «There are two type of trust management system for networks, specially VANET: central and decentralized systems» (§3.1, p.3). مزیت متمرکز: «easier to control and have reduced cost».
- مدل‌های P2P: «Many trust models have been used in P2P network to update node’s belief based on the other node’s trust value» (§3.1, p.3)؛ مثال TrustVote [29] مبتنی بر crowdsourcing و رمزنگاری همومورفیک (§3.1, p.3).
- رویکرد داده‌محور SBTMS: اعتماد به **پیام** (نوع پیام + فرستنده) نه فقط به گره (§4.1, p.6).
- **طبقه‌بندی چهارگانه recommendation / prediction / reputation / policy در این منبع وجود ندارد** (جستجو در کل متن). اگر لازم است باید از منبع دیگری (مثلاً raza2024) تأیید شود.

### ۳.۳ بخش «محدودیت‌های بلاکچین» (خط ~۴۴۹؛ فعلاً به این منبع ارجاع ندارد ولی می‌تواند تقویت کند)
- «due to the mining process, most of the Blockchain technologies have some shortcomings such as low transaction throughput and poor scalability [15]» (§1, p.2).
- «one of their significant shortcoming is low transaction throughput and small scalability, while in VANET there are great number and high speed of generated transactions» (§3.3, p.4).
- خودخواهی RSU در کار Yang [33]: RSU می‌تواند سختی شبکه را خودش پایین بگذارد تا سریع‌تر ماین کند و پاداش بیشتر بگیرد (§5.1, p.10).
- PoS نیز «still has a sclability problem, which prevents vehicle transactions from being mined in near real time by the RSUs» (§6, p.15).
- اعداد TPS بیت‌کوین/اتریوم (۷ و ۱۵) **در این منبع نیست**.

### ۳.۴ بخش «راهکارهای موجود» (خط ۴۵۷)
- تعریف شاردینگ: «Sharding as a consensus algorithm can make Blockchain’s ledger more efficient, scalable, and sustainable by dividing large amounts of data into chunks» (§1, p.2)؛ «Sharding algorithm distributed mining tasks into committees, each of the committees processes a set of transactions [16]» (p.2).
- دسته‌بندی اجماع: «proof-based algorithms and Byzantine algorithms [20]» (§2, p.2)؛ مقاله شاردینگ را در کنار الگوریتم‌های بیزانسی آورده است (p.2).
- مقایسه با Tangle [37]: «Tangle technology uses the coordinator ... as the coordinator is not distributed, it represents a single-point-of-failure» درحالی‌که «the sharding algorithm is used, which is fully distributed» (§6, p.15) — برای پل زدن به فصل IOTA مفید است.
- DPoS، sidechain و Lightning Network در این منبع **ذکر نشده‌اند**.

### ۳.۵ بخش «SBTMS» (خطوط ۴۶۸–۴۷۷) — هسته اصلی
**گام ۱ — پیام و امتیاز اطمینان (§4.1, p.6):**
- پیام رویداد چندتایی پنج‌عضوی است: `(v_s, LL, e, m, t)` = شناسه فرستنده، طول/عرض جغرافیایی رویداد، نوع رویداد، شناسه پیام، مهر زمانی.
- قابلیت اطمینان بر دو عامل: (۱) فاصله فرستنده از رویداد (event confidence score) و (۲) سطح اعتماد فرستنده برای آن نوع پیام. «The message that sent by the nearest vehicles to the event is more reliable».
- **Eq. (1):** `c_s = 1 / (1 + e^{ s ( g − (d_s)^{-1} ) })`؛ اگر `V_s` پیامی نفرستد `c_s = 0`. (Table 2: g=0؛ مقدار s مبهم: 4 یا 1.)
- بردار `C = c_1, c_2, …` از فرستنده‌های مختلف؛ گیرنده `o_s` را از نزدیک‌ترین RSU می‌پرسد.

**استنباط بیزی (Eq. 2–10, p.6–7):**
- **Eq. (2):** `P(m|O,C) = P(m|C)·P(C|m,O) / [ P(m|C)·P(C|m,O) + P(m̄|C)·P(C|m̄,O) ]`.
- **Eq. (3)/(9):** `P(m|C) = P(m)∏_{s=1}^{N} P(c_s|m) / [ P(m)∏ P(c_s|m) + P(m̄)∏ P(c_s|m̄) ]`؛ با `P(m̄)=1−P(m)`، `P(c_s|m)=c_s`، `P(c_s|m̄)=1−c_s` (p.7).
- **Eq. (4),(5),(10):** `P(C|m,O) = ∏ P(c_s|m,O)` و چون `c_s` مستقل از نوع پیام است `P(c_s|m,O)=P(c_s|O)`.
- **Eq. (6):** `P(c_s|O) = P(c_s)P(O|c_s) / [P(c_s)P(O|c_s) + P(c̄_s)P(O|c̄_s)]`؛ «it is assumed that P(c_s) follows the normal distribution»، `P(c̄_s)=1−P(c_s)`.
- **Eq. (7),(8):** `P(O|c_s)=∏_{s'} o_{s'}` و `P(O|c̄_s)=∏_{s'} (1−o_{s'})`.
- خروجی به RSU: `(v_r, v_s, m, P(m|O,C))` (p.7). Algorithm 1 فعالیت خودرو را خلاصه می‌کند (دیدن رویداد → ارسال؛ دریافت → forward، محاسبه c_s، پرسش o_s، محاسبه P، ارسال به RSU) (p.7).

**گام ۲ — قابلیت اطمینان خالص (§4.2, p.7–8):**
- **Eq. (11):** `o(u,s,m) = 1 / (1 + e^{ −k( (1/N')·ΣP(m|O,C) − x0 ) })`؛ k شیب، x0 نقطه عطف، N' تعداد مقادیر دریافتی؛ بیشینه برابر ۱. توجیه: منحنی S برای پدیده بدون توصیف دقیق [42–44].

**گام ۳ — تشکیل کمیته (§4.3, p.8)** (برگرفته از پروتکل Luu et al. [45]):
- برای جلوگیری از تبانی، RSUها «self-generated transient identity rather than a permanent identity or a public key infrastructure» به‌کار می‌برند.
- **Eq. (12):** `O = H(EpochRandomness ‖ IP ‖ PK ‖ nonce) < 2^{γ−D}`؛ D سختی شبکه متناسب با تعداد RSUها. EpochRandomness تضمین می‌کند PoW «not precomputed» باشد.
- `N = 2^s · z` (N کل RSU، z بیشینه اندازه کمیته، 2^s تعداد کمیته)؛ تخصیص RSU به کمیته بر اساس بیت‌های آخر شناسه.
- **نکته مهم:** SBTMS از PoW حذف نشده؛ PoW فقط برای ساخت هویت گذرا (مقاومت در برابر تبانی/Sybil) استفاده می‌شود.

**گام ۴ — اجماع (§4.4, p.8, Fig. 4–5):**
- هر RSU قابلیت اطمینان خالص را به‌صورت تراکنش پخش می‌کند؛ اعضای کمیته شبکه overlay کاملاً متصل می‌سازند و PBFT [46] اجرا می‌کنند.
- فازها: pre-prepare (ارسال تراکنش به اعضا) → prepare (تأیید و ارسال نتیجه) → commit (پس از دریافت بیش از `2z/3` پیام prepare) → پذیرش پس از دریافت `2z/3` پیام commit.
- شارد اجماع‌شده «signed by at least z/2 + 1 RSUs» به کمیته نهایی (شناسه s-بیتی) می‌رود؛ کمیته نهایی digest رمزنگاری محاسبه و دوباره PBFT اجرا می‌کند و بلوک را منتشر می‌کند (p.8). (توجه: آستانه z/2+1 با آستانه کلاسیک PBFT یعنی 2f+1 متفاوت است؛ همان‌طور که در مقاله آمده نقل شود.)

**تحلیل امنیتی (§5.1, p.10):**
- مدل تهدید: خودروها و RSUهای مخرب/هک‌شده؛ پیام جعلی؛ گزارش reliability جعلی به RSU؛ RSU خودخواه («All agents ... are selfish»). ادعا: استنباط بیزی اثر پیام جعلی را خنثی می‌کند؛ epochRandomness ترکیب تصادفی کمیته را تضمین می‌کند. (تحلیل صوری/اثبات ندارد.)

**ارزیابی کارایی (§5.2–5.3):**
- دقت و precision: Eq. (13) `Precision = TP/(TP+FP)`، Eq. (14) `Accuracy = (TP+TN)/(TP+FP+TN+FN)` (p.12).
- «The sharding consensus algorithm in the proposed system scales up the performance nearly linearly with the computational power of RSUs» (p.11).
- Fig. 13: «by increasing number of vehicles, the required time to mine a new block in the proposed system, in contrast with POW, increases near linearly» (§5.3, p.14).
- Fig. 14: «the vehicle calculation time is less in our proposed model» (p.14).

**مقایسه با کارهای قبل (§6, p.15):** Tangle [37] (coordinator = نقطه شکست واحد)، Kang [38] (PoS، مشکل مقیاس‌پذیری)، Yang [33] (PoW؛ همه تراکنش‌ها برای همه RSUها در دسترس نیست ← امکان تراکنش/بلوک جعلی برای پاداش؛ SBTMS با broadcast تراکنش و کمیته‌ها حل می‌کند).

### ۳.۶ بخش‌های دیگری که می‌تواند تقویت شود
- **ساختار بلوک (فصل مفاهیم بلاکچین):** «The header contains index, previous hash, number of transactions, timestamp, nonce, and Merkel tree» (§2, p.2; Fig. 1). تعریف: «a distributed and consensus-based ledger that all successful transactions are stored in a list of blocks» (§2, p.2).
- **کارهای مرتبط بلاکچین در VANET** (§3.3, p.4): Yang [33] (بیزی + بلاکچین)، Kang [36] (کنسرسیوم + قرارداد هوشمند + شهرت سه‌گانه)، Kang [38] (انتخاب ماینر بر اساس شهرت + contract theory)، Bartolomeu [37] (IOTA)، Gao [41] (پرداخت حافظ حریم خصوصی).
- **هوش مصنوعی و اعتبارسنجی** (§3.2, p.3): ALICIA [30] با شبکه عصبی برای انتخاب/حذف گره در اجماع.

## ۴. بررسی ادعاهای فعلی

| خط report.tex | ادعا | حکم | مکان شاهد | اصلاح پیشنهادی |
|---|---|---|---|---|
| ۴۰۵ + ۴۰۸ | غیرمتمرکزسازی: حذف نقطه شکست واحد | پشتیبانی‌شده | §1 p.1؛ §3.1 p.3؛ Abstract | — |
| ۴۰۹ | تغییرناپذیری | پشتیبانی‌شده | Abstract («non-manipulation»)؛ §1 p.2 («tamper-proof ledger», «immutability») | — |
| ۴۱۰–۴۱۲ | ردیابی، شفافیت، قراردادهای هوشمند | پشتیبانی‌نشده (در این منبع) | قراردادهای هوشمند فقط به‌عنوان کاربرد عمومی [7] p.2 | ارجاع این سه مورد را به منابع دیگر (raza/feng) محدود کنید |
| ۴۲۹–۴۳۵ | چهار مدل اعتماد (توصیه/پیش‌بینی/شهرت/سیاست) | پشتیبانی‌نشده | §3.1 p.3 فقط «central and decentralized» | ارجاع SBTMS را حذف کنید یا جمله‌ای درباره دوگانه متمرکز/غیرمتمرکز با ارجاع به آن بیفزایید |
| ۴۵۷ + ۴۶۰ | شاردینگ برای افزایش مقیاس‌پذیری | پشتیبانی‌شده | §1 p.2 | — |
| ۴۶۱ | PoS، DPoS، PBFT به جای PoW | جزئی | PBFT: §4.4 p.8؛ PoS به‌عنوان راهکار ناکافی §6 p.15؛ DPoS ذکر نشده | توجه: در SBTMS، PBFT جایگزین کامل PoW نیست (PoW برای هویت گذرا §4.3) |
| ۴۶۲–۴۶۳ | زنجیره‌های فرعی، Lightning Network | پشتیبانی‌نشده | ذکر نشده | ارجاع منبع دیگر |
| ۴۷۰ | معماری غیرمتمرکز | پشتیبانی‌شده | Abstract؛ §4 p.4, Fig. 3 | — |
| ۴۷۱ | الگوریتم شاردینگ: تقسیم شبکه به بخش‌های کوچک‌تر | پشتیبانی‌شده (دقیق‌تر: تقسیم RSUها به کمیته) | §4.3 p.8 | «تقسیم RSUها به کمیته‌هایی که هر یک مجموعه‌ای از تراکنش‌ها را پردازش می‌کند» |
| ۴۷۲ | استنباط بیزی برای محاسبه اعتماد | پشتیبانی‌شده | §4.1 Eq. 2–10 p.6–7 | دقیق‌تر: محاسبه قابلیت اطمینان پیام توسط خودرو |
| ۴۷۳ | پروتکل PBFT | پشتیبانی‌شده | §4.4 p.8, Fig. 4 | افزودن اینکه PBFT درون هر کمیته و دوباره در کمیته نهایی اجرا می‌شود |
| ۴۷۷ | شاردینگ زمان تولید بلوک را تقریباً خطی افزایش می‌دهد | پشتیبانی‌شده | §5.3 p.14, Fig. 13 | متغیر مستقل را ذکر کنید: «با افزایش تعداد خودروها (تا 3000)» |
| ۴۷۷ | در PoW این زمان نمایی افزایش می‌یابد | پشتیبانی‌نشده | مقاله فقط «in contrast with POW» می‌گوید؛ Fig. 13 رشد PoW را تا حدود 14 s نشان می‌دهد ولی واژه «exponential» ندارد و شکل منحنی به‌وضوح نمایی نیست | «... در حالی که در PoW زمان تولید بلوک با شیب بسیار بیشتری رشد می‌کند (حدود 14 ثانیه در برابر حدود 2 ثانیه برای 3000 خودرو، بر اساس خوانش Fig. 13)» |

شمارش: ۱۳ ادعا — پشتیبانی‌شده ۸، جزئی ۱، پشتیبانی‌نشده ۴، غیرقابل‌تأیید ۰.

## ۵. اصطلاحات

| English | فارسی پیشنهادی |
|---|---|
| Trust Management System (TMS) | سامانه مدیریت اعتماد |
| message reliability | قابلیت اطمینان پیام |
| net reliability | قابلیت اطمینان خالص (تجمیعی) |
| event confidence score | امتیاز اطمینان رویداد |
| Bayesian inference | استنباط بیزی |
| sharding | شاردینگ (بخش‌بندی دفتر کل) |
| committee | کمیته |
| final committee | کمیته نهایی |
| transient identity | هویت گذرا |
| EpochRandomness | تصادف دوره (رشته تصادفی هر دوره) |
| Practical Byzantine Fault Tolerance (PBFT) | تحمل خطای بیزانسی عملی |
| pre-prepare / prepare / commit | پیش‌آماده‌سازی / آماده‌سازی / تعهد |
| collusion | تبانی |
| selfish agent | عامل خودخواه |
| sigmoid (S-curve) | تابع سیگموید (منحنی S) |
| inflection point / steepness | نقطه عطف / شیب |
| single point of failure | نقطه شکست واحد |
| trusted third party (TTP) | شخص ثالث مورد اعتماد |
| coordinator (IOTA) | هماهنگ‌کننده |

## ۶. شکل‌ها و جداول قابل استفاده

- **Fig. 3 (p.5):** معماری پیشنهادی ادغام VANET با بلاکچین — مناسب برای بازترسیم به‌عنوان شکل اصلی بخش SBTMS.
- **Fig. 4 (p.9):** فرایند PBFT در کمیته (سه فاز) — برای توضیح PBFT.
- **Fig. 5 (p.9):** پروتکل شاردینگ در SBTMS (کمیته‌ها ← کمیته نهایی ← بلوک).
- **Fig. 1 (p.3):** ساختار بلوک (هدر و بدنه) — برای فصل مفاهیم بلاکچین.
- **Table 1 (p.6):** نمادها و پارامترها — برای بازنویسی فرمول‌ها.
- **Table 2 (p.9):** پارامترهای شبیه‌سازی (با هشدار ناسازگاری z و تکرار s).
- **Fig. 13 (p.15):** مقایسه زمان تولید بلوک Sharding و PoW در برابر تعداد خودرو (0–3000) — شاهد اصلی ادعای خط ۴۷۷.
- **Fig. 14 (p.15):** مقایسه زمان محاسبه خودرو Sharding و PoW (در 3000 خودرو حدود 11 s در برابر حدود 14 s، خوانش تقریبی نمودار).
- Fig. 6–12: رفتار همگرایی قابلیت اطمینان و دقت/precision — در صورت نیاز به بحث ارزیابی.
