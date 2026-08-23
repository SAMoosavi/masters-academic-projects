---
tags: [literature, CLASC, signcryption, VANET]
paper: wuSecurityenhancedCertificatelessAggregate2025
year: 2025
---

# A Security-Enhanced Certificateless Aggregate Signcryption Scheme for Vehicular Ad Hoc Networks (Wu & Chen 2025, Vehicular Communications)

## خلاصه (Summary)

این مقاله یک حمله امنیتی بر روی طرح CLASC (Certificateless Aggregate Signcryption) بدون pairing دای و همکاران (Dai et al. 2023) را تحلیل کرده و نشان می‌دهد که این طرح در برابر حمله جایگزینی کلید عمومی (public key replacement attack) آسیب‌پذیر است؛ به‌گونه‌ای که یک مهاجم Type-I می‌تواند یک پیام signcrypt شده معتبر جعل کند. نویسندگان برای رفع این نقص، یک طرح CLASC جدید مبتنی بر ECC (Elliptic Curve Cryptography) ارائه می‌دهند و محرمانگی (confidentiality) و عدم جعل‌پذیری (unforgeability) آن را در برابر adaptive chosen ciphertext/message attack در مدل random oracle (ROM) اثبات می‌کنند. طرح پیشنهادی همچنین ویژگی‌های ناشناسی (anonymity)، ردیابی و ابطال (traceability & revocation) را برآورده می‌کند و در مقایسه با طرح‌های مرتبط، سربار محاسباتی و ارتباطی به‌تری دارد.

## ایده اصلی و طرح (Core idea & scheme)

- **مشکل**: در VANET ها (V2V و V2I) مسائل امنیتی مانند impersonation، eavesdropping، دستکاری داده و ردیابی، محرمانگی و یکپارچگی داده را تهدید می‌کنند. نیازها: authentication، integrity، confidentiality، anonymity، traceability و revocation.
- **زمینه رمزنگاری**: طرح‌های PKI پرهزینه‌اند؛ ID-PKC مشکل key escrow دارد؛ بنابراین به سمت CL-PKC می‌روند که در آن KGC بخشی از کلید خصوصی را می‌سازد و کاربر بخش باقی‌مانده را خودش تولید می‌کند. سپس ترکیب signcryption (تلفیق امضا و رمزنگاری در یک گام) و aggregate signature منجر به خانواده CLASC شد.
- **حملات روی Dai et al.**: تحلیل نشان می‌دهد که مهاجم Type-I (بدون دسترسی به master secret key ولی توانایی جایگزینی کلید عمومی قربانی) می‌تواند signcryption معتبر جعل کند.
- **طرح پیشنهادی**: یک طرح CLASC pairing-free مبتنی بر ECC با مراحل System-Setup و Initialization، با ساختار هویت ناشناس \(ID_i = (ID_{i,1}, ID_{i,2})\) که در آن \(ID_{i,1} = \alpha_i P\) و \(ID_{i,2} = RID_i \oplus H_2(\mu ID_{i,1}, P_{pub}, t_i)\)؛ پیام signcrypt شده به شکل \(\sigma_i = (U_i, z_i, w_i)\) با timestamp است. سخت‌افزاری بودن مسئله ECDLP (Elliptic Curve Discrete Logarithm Problem) و CDHP پایه امنیت است.
- **ردیابی و ابطال**: KGC با استفاده از master secret key \(\mu\) می‌تواند هویت واقعی \(RID_i\) را از \(ID_{i,2}\) استخراج کند و با حذف کلید ابطال \(s_m\) از مجموعه و ساخت چندجمله‌ای جدید \(g'(x)\) با یک کلید ابطال جدید \(r'\)، خودروی مخرب را از دریافت کلید جدید محروم می‌کند.

## امنیت (Security)

- **حمله روی طرح Dai et al.**: آسیب‌پذیری در برابر public key replacement attack؛ مهاجم Type-I می‌تواند signcryption را جعل کند.
- **مدل امنیتی طرح جدید**: محرمانگی و عدم جعل‌پذیری در برابر adaptive chosen ciphertext/message attack در مدل random oracle؛ اثبات از طریق reduction به ECDLP و با استفاده از Forking Lemma انجام می‌شود (بازی‌های Game 1 و Game 2 برای دو نوع مهاجم).
- **ویژگی‌های امنیتی برآورده‌شده**: anonymity (استخراج هویت نیازمند حل ECDLP است)، traceability و revocation توسط KGC، مقاومت در برابر man-in-the-middle، replay (به دلیل timestamp) و impersonation.
- توجه: نویسندگان در کار آینده اشاره می‌کنند که چرا برخی طرح‌های ناامن هنوز می‌توانند تحت مدل امنیتی proof ارائه دهند.

## ارزیابی (Evaluation)

- **متریال**: MIRACL cryptography library روی دسکتاپ با CPU 2.10 GHz AMD Ryzen 5 3550H و Ubuntu-20.04؛ زمان پایه‌ها: scalar multiplication روی ECC \(T_m = 0.5929\) ms، bilinear pairing \(T_{bp} = 4.5956\) ms.
- **محاسبات**: طرح پیشنهادی برای n پیام: signcryption با \((2n+1)T_m + 2T_a\) و aggregate unsigncryption با \((3n+2)T_m + 5nT_a\)، مجموعاً \((5n+3)T_m + (5n+2)T_a\). در مقایسه با طرح‌های [26]، [27]، [20] و [28]: بهبود aggregate unsigncryption به میزان 69.68%، 81.36%، 39.49% و 39.60% برای \(n=500\) و بهبود کل محاسبات به میزان 82.99%، 85.93%، 49.69% و 44.18% برای \(n=450\).
- **ارتباطات**: طول هر signcryption تکی 92 بایت (\(|G| = 48\) بایت، \(|\mathbb{Z}_q^*| = 24\) بایت، پیام 20 بایت) و aggregate \(n|G| + |\mathbb{Z}_q^*| + n|m|\)؛ در مقایسه با [27] (296 بایت)، [26] (276 بایت)، [28] (144 بایت) و [20] (140 بایت)، بهبود کارایی ارتباطی 75.34%، 54.13%، 43.30% و 41.35% برای \(n=300\).
- نتیجه: همزمان امنیت بالاتر (ردیابی و ابطال، عدم جعل‌پذیری) و سربار کمتر نسبت به طرح‌های مقایسه‌شده.

## نکات برای طرح امضای جدید (Takeaways for a new fast+secure+cheater-detecting scheme)

- **pairing-free و ECC مسیر درست است**: حذف bilinear pairing کاهش عظیمی در هزینه محاسباتی می‌دهد (\(T_{bp} \approx 4.6\) ms در مقابل \(T_m \approx 0.59\) ms)؛ طرح جدید باید scalar multiplication های کمتری داشته باشد.
- **CL-PKC در مقابل key escrow**: ساختار KGC برای partial private key و تولید مستقل بخش دیگر توسط کاربر، هم key escrow و هم بار مدیریت گواهی را حذف می‌کند — برای طرح جدید لازم است.
- **هشدار امنیتی**: "امنیت اثبات‌شده" کافی نیست؛ حملات جایگزینی کلید عمومی (Type-I) باید به‌طور صریح در طراحی و proof در نظر گرفته شوند، وگرنه proof ممکن است گمراه‌کننده باشد (نکته‌ای که خود نویسندگان در future work مطرح می‌کنند).
- **طراحی کارا**: قرار دادن timestamp در \(\sigma_i\) راهی کم‌هزینه برای مقابله با replay attack است؛ ساختار aggregate با طول \(n|G|\) (به‌جای \(2n|G|\)) سربار ارتباطی را به‌طور خطی کمتر نگه می‌دارد.
- **ردیابی و ابطال**: طرح جدید می‌تواند سازوکار \(RID_i \oplus H_2(\mu ID_{i,1}, P_{pub}, t_i)\) را برای ردیابی و ابطال خودروهای مخرب الگوبرداری کند — این ویژگی در اکثر طرح‌های جدول مقایسه غایب است.
- **معیار سنجش**: مقایسه مستقیم با [26]، [27]، [20] و [28] با معیارهای (a) تعداد scalar multiplication در signcryption/unsigncryption و (b) طول پیام، چارچوب ارزیابی مناسبی برای ادعای کارایی است.
