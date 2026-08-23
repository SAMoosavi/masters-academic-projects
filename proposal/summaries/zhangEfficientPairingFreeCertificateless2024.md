---
tags: [literature, PF-CLAS, CLSC, signcryption, IoMT]
paper: zhangEfficientPairingFreeCertificateless2024
year: 2024
---

# Efficient Pairing-Free Certificateless Signcryption Scheme for Secure Data Transmission in IoMT (Zhang, Dong, Liu 2024, IEEE IoT Journal)

> Zhang, J., Dong, C., Liu, Y. — *Efficient Pairing-Free Certificateless Signcryption Scheme for Secure Data Transmission in IoMT.* IEEE Internet of Things Journal, vol. 11, no. 3, 2024. DOI: 10.1109/JIOT.2023.3298840.

## خلاصه (Summary)

این مقاله یک طرح **Certificateless Signcryption (CLSC)** پرشده از **bilinear pairing** (یعنی **pairing-free**) برای انتقال امن داده‌ها در **Internet of Medical Things (IoMT)** ارائه می‌دهد. در IoMT، داده‌های فیزیولوژیکی بیمار از طریق دستگاه‌های پزشکی پوشیدنی جمع‌آوری و به سامانه‌ی پزشکی ارسال می‌شود؛ این داده‌ها حساس و مطابق **HIPAA** باید محافظت شوند. CLSC به‌دلیل استقرار آسان (بدون نیاز به گواهی، برخلاف **PKI**) و بدون مشکل key escrow (برخلاف **IBC**) و همچنین ترکیب هم‌زمان encryption و signature در یک مرحله‌ی منطقی، برای دستگاه‌های محدود ازنظر انرژی مناسب است. نویسندگان ابتدا یک مثال از حمله‌ی **Type I** بر یک طرح CLSC اخیر IoMT ارائه می‌دهند و نشان می‌دهند که آن طرح **unforgeability** رمزنگاشت‌ها (ciphertexts) را تأمین نمی‌کند؛ سپس طرح خود را بر پایه‌ی ایده‌ی **zero-knowledge proof** و **ECC عمومی** می‌سازند. طرح پیشنهادی هم **confidentiality** و هم **unforgeability** را تحت حملات Type I و Type II فراهم می‌کند، قابلیت **public verification** دارد و طبق تحلیل نظری و آزمایشی، از پنج طرح CLSC اخیر (شماره‌های [5]، [26]، [27]، [28]، [29]) در هزینه‌ی محاسباتی و ارتباطی بهتر و زمان اجرای کمتری دارد.

## ایده اصلی و طرح (Core idea & scheme)

- **دو نوع مهاجم داخلی در CLSC:** **Type-I adversary** یک «کاربر مخرب» است که می‌تواند کلید عمومی هر کسی را جایگزین (public key replacement) کند ولی به master private key دسترسی ندارد؛ **Type-II adversary** یک **KGC** مخرب است که master secret key و در نتیجه partial private key کاربران را می‌داند ولی مجاز به جایگزینی کلیدهای عمومی نیست. اکثر طرح‌های CLSC پیشین ([11]–[17] و...) در برابر یکی از این دو مهاجم آسیب‌پذیرند.
- **مثال حمله (Contribution 1):** یک طرح CLSC مبتنی بر IoMT اخیر به‌عنوان مثال گرفته می‌شود و نشان داده می‌شود که یک مهاجم Type I می‌تواند با جایگزینی کلید عمومی کاربر، یک signcryptext جعلی بسازد که گیرنده آن را به‌درستی decrypt می‌کند؛ یعنی طرح **unforgeability** رمزنگاشت را ندارد. حمله به‌تفصیل ارائه شده است.
- **طرح پیشنهادی (Contribution 2):** یک CLSC **pairing-free** با **public verification** بر پایه‌ی ایده‌ی **zero-knowledge proof** و بر روی منحنی بیضوی عمومی (general ECC) طراحی شده که هم‌زمان confidentiality و unforgeability را تحت هر دو حمله‌ی Type I و Type II فراهم می‌کند و سربار محاسباتی و ارتباطی کمتری دارد. چون هیچ عملیات **bilinear pairing** انجام نمی‌شود، برای دستگاه‌های پزشکی کم‌منبع مناسب‌تر است.
- **ساختار عمومی CLSC:** پارامترهای سیستم شامل `param = (G, q, P, Ppub, H1, H2, H3, H4)` با `Ppub = sP` و master secret key `s`؛ هر کاربر کلید عمومی `Y_ID = x_ID·P` و partial private key `d_ID = t + h1·s` دارد (یعنی ترکیب انتخاب سکریت کاربر و سهم KGC، که مشکل key escrow را حل می‌کند). signcryptext به شکل `δ = (θ, U, c)` است و معادله‌ی تأیید آن به‌صورت `θP = U + r·f_s·(Y_IDs + T_s) + h_s·Ppub` ساخته شده تا هر دو حمله‌ی جایگزینی کلید و KGC مخرب را رد کند.

## امنیت (Security)

- **اهداف امنیتی:** دو ویژگی بنیادین **IND-CLSC-CCA2** (محرمانگی) و **EUF-CLSC-CMA** (بدون جعل‌پذیری) — اولی confidentiality پیام و دومی unforgeability آن را تضمین می‌کند.
- **آسیب‌پذیری طرح‌های مقایسه‌ای:** در طرح‌های [5]، [26]، [27] و [29]، مهاجم Type I با جایگزینی کلید عمومی می‌تواند signcryptext جعلی بسازد که گیرنده به‌درستی decrypt می‌کند — پس از EUF-CLSC-CMA تحت حمله‌ی Type I برخوردار نیستند. در طرح [28]، یک گیرنده‌ی مخرب که کلید عمومی‌اش جایگزین شده می‌تواند همچنان متن اصلی را decrypt کند — پس **IND-CLSC-CCA** را نقض می‌کند. طرح پیشنهادی در برابر هر دو مهاجم Type I و Type II مقاوم است و هر دو ویژگی IND-CLSC-CCA2 و EUF-CLSC-CMA را برآورده می‌کند.
- **اثبات‌ها (Random Oracle Model):** از طریق بازی‌های تعاملی با مهاجمان Type I (Lemma 3, EUF-CMA-I) و Type II (Lemma 4, EUF-CMA-II)، نشان داده می‌شود که اگر مهاجم بتواند امضا/رمزنگاشت جعل کند، challenger می‌تواند مساله‌ی **square-DH** (مربع دیفی-هلمن) را حل کند — تناقض با سختی آن. تحلیل احتمال abort در خلال سوالات Oracle (private key extract، partial private key، signcryption) نیز ارائه شده است.
- **Tight security reduction:** برخلاف طرح‌های [26]، [27]، [28] و [29] که برای اثبات unforgeability از **forking lemma** (پوینتچول و استرن) استفاده می‌کنند و reduction سستی دارند، هم طرح [5] و هم طرح پیشنهادی از forking lemma استفاده نمی‌کنند و **tight** هستند. ضعف reduction سست آن است که حتی اگر مساله‌ی سخت به‌شکل کارا حل شود لزوماً به معنای شکست‌پذیر بودن طرح نیست؛ بنابراین طرح پیشنهادی ضمانت امنیتی قوی‌تری دارد.

## ارزیابی (Evaluation)

- **محیط آزمایش:** لپ‌تاپ Dell با Intel Core i7-6600U @ 2.6 GHz، 4 GB RAM و Ubuntu 18.04 LTS (روی VMware Workstation Pro 15.5.2 و Windows 10)؛ به‌عنوان دستگاه IoMT از **Raspberry Pi 4 B** (Cortex-A72 ARM v8 @ 1.5 GHz، 4 GB RAM) استفاده شده. پیاده‌سازی با زبان **Python** و کتابخانه‌ی **Charm-Crypto 0.50** در سطح امنیتی 80-bit با پارامترهای ECC و pairing.
- **محاسباتی (signcryption + unsigncryption):** [26] = `5Tpsm + 5Tp`، [5] = `5Tpsm + Tinv + Tp`، [27] = `8Tsm`، [28] = `9Tsm + Tinv`، [29] = `12Tsm`، طرح پیشنهادی = `3Tsm + 4Tsm = 7Tsm`. بنابراین طرح پیشنهادی **کمترین زمان اجرا** را دارد (فقط scalar multiplication روی ECC، بدون pairing/درون‌یابی). مقایسه در Table I و نمودار زمان اجرای شکل 2.
- **ارتباطی (اندازه‌ی ciphertext برای پیام 160-bit):** [26] ≈ 3392 bits، [5] ≈ 1344 bits، [27] ≈ 640 bits، [28] ≈ 640 bits، [29] ≈ 1120 bits، طرح پیشنهادی ≈ **640 bits** — هم‌اندازه‌ی بهترین‌ها و **57.14٪** اندازه‌ی [29]. دلیل: عناصر ECC روی میدان `F_q` با اندازه‌ی `O(log q)` تعریف می‌شوند درحالی‌که عناصر pairing روی میدان توسعه‌یافته‌ی `F_{q^k}` با اندازه‌ی `O(k·log q)` هستند؛ پس طرح‌های ECC در همان سطح امنیتی پارامترهای کوچک‌تری دارند.
- **نتیجه‌گیری مقایسه:** آزمایش‌ها نشان می‌دهد طرح پیشنهادی از هر پنج طرح اخیر در «تعادل امنیت و عملکرد» بهتر است و برای سناریوی انتقال داده در IoMT مناسب‌تر است.

## نکات برای طرح امضای جدید (Takeaways for a new fast+secure+cheater-detecting scheme)

- **Pairing-free بودن مزیت قاطع است:** حذف عملیات bilinear pairing (به‌همراه `Tpsm` و `Tp`) کلید رسیدن به سربار محاسباتی کم است؛ مقایسه‌ی `7Tsm` در برابر `5Tpsm + 5Tp` نشان می‌دهد تفاوت تنها به‌خاطر انتخاب primitive است، نه طراحی معادلات. در طرح جدید هم باید روی **general ECC** و بدون pairing ساخت.
- **هش و معادله‌ی تأیید باید هر دو نوع مهاجم داخلی را هم‌زمان ببندد:** ضعف طرح‌های [5]/[26]/[27]/[29] این بود که با جایگزینی کلید عمومی (Type I) قابل جعل‌اند و [28] با گیرنده‌ی مخرب (نقض IND-CCA). ساخت معادله‌ی تأیید به‌گونه‌ای که هم partial key KGC (`d`، شامل `Ppub`) و هم جزء سکریت کاربر (`x`، شامل کلید عمومی) را درگیر کند، هر دو نوع را هم‌زمان پوشش می‌دهد — درس مستقیم برای بخش fast+secure.
- **Zero-knowledge proof به‌عنوان چارچوب طراحی:** نویسندگان طرح را بر پایه‌ی ایده‌ی zero-knowledge proof ساخته‌اند تا امضا اثبات «داشتن کلید سکریت» بدون افشای آن باشد. این ایده برای طراحی امضای جدید قابل تکرار است و در عین حال مسیر public verification را باز می‌گذارد.
- **Tight reduction را فدای سادگی نکنیم:** طرح‌های [26]–[29] با forking lemma reduction سست دارند؛ طرح پیشنهادی بدون آن اثبات tight می‌دهد. برای طرح جدید، انتخاب ساختاری که اثبات tight را ممکن کند (بدون forking lemma) مزیت امنیتی ملموسی است.
- **اندازه‌ی ciphertext معیار مهم در IoMT:** طرح پیشنهادی با 640 bits به کمترین اندازه‌ی گروه مقایسه رسیده است؛ در طرح جدید، هدف‌گذاری اندازه‌ی signcryptext در همین حد (~640 bits) معیار مرجع خوبی است.
- **شکاف برای ایده‌ی cheater detection:** این مقاله هیچ مکانیزمی برای **تشخیص فریبکار / یافتن امضای نامعتبر در یک دسته** ندارد؛ بحث کل مقاله روی امنیت و کارایی «تکی» است. سناریوی IoMT (بسیاری دستگاه‌ها → سرور) و طرح‌های تجمیعی مثل [27] و [28] (aggregate CLSC) دقیقاً جایی است که یک طرح جدید fast+secure+cheater-detecting می‌تواند ارزش اضافه‌ی خود را نشان دهد — بازتأیید تک‌به‌تک هنگام شکست یک دسته، سربار O(n) دارد و این جای خالی طراحی ماست.
