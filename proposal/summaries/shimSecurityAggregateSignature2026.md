---
tags: [literature, CLAS, VANET, cryptanalysis]
paper: shimSecurityAggregateSignature2026
year: 2026
---

# On the Security of Aggregate Signature–Based Conditional Privacy-Preserving Authentication Schemes for VANETs (Shim & Kwon 2026, ICT Express)

## خلاصه (Summary)

این مقاله (ICT Express, vol. 12, 2026, pp. 566–570) دو طرح معروف کلاس CLAS (Certificateless Aggregate Signature) برای VANET — طرح Zhu–Guan [12] و طرح Chen–Guan [13] — را از نظر امنیتی تحلیل می‌کند و نشان می‌دهد که هر دو در برابر حمله Type I (adversary مجاز به جایگزینی public key) ناامن هستند. حمله‌گر می‌تواند بدون دسترسی به partial private key قربانی، روی پیام‌های دلخواه امضای معتبر جعل کند. علت ریشه‌ای: عدم وجود binding رمزنگاریشده بین public keyها و randomness زودگذر، که امکان حذف جبری (algebraic elimination) master public key در معادله‌ی verification را فراهم می‌کند. مقاله با معرفی هش‌های اضافی ℎ5 و ℎ6 راه‌حلی ارائه می‌دهد که امنیت را برمی‌گرداند اما هزینه‌ی aggregate verification را به حدود 3n+2 ضرب اسکالری می‌رساند — غیرقابل‌مقایسه با نیازهای real-time. نتیجه‌گیری مقاله: معماری خطی و hash-dependent فعلی CLAS با محدودیت ذاتی روبه‌روست و به یک پارادایم طراحی نسل‌جدید برای 5G-V2X و 6G نیاز داریم.

## ایده اصلی و طرح (Core idea)

- **CLAS در VANET**: چند خودرو امضای فردی خود را در یک امضای تجمیعی (aggregate signature) ترکیب می‌کنند تا overhead انتقال و verification در شبکه‌های با پهنای‌باند محدود کاهش یابد؛ برای ITS در مقیاس بزرگ و احراز هویت real-time جذاب است. امنیت باید در بازه‌ی latency زیر 10ms برقرار شود.
- **زمینه‌ی رمزنگاری**: CL-PKC با decouple کردن تولید کلید بین TA و کاربر، هم مدیریت certificate در PKI را حذف می‌کند و هم key escrow نهفته در IBC را ندارد. مدل استاندارد دو adversary دارد: **Type I** (اجازه‌ی جایگزینی public key، بدون دسترسی به master secret key) و **Type II** (دانستن master secret key، بدون اجازه‌ی جایگزینی).
- **طرح Zhu–Guan (بدون pairing)**: TA برای هر خودرو partial private key به شکل D=(A,c) با c = a + s·h3 تولید می‌کند؛ کلید کامل SK=(x, c) و PK=(X, A). امضا σ=(B, z) با z = b + c + x·h4. معادله‌ی verification:
  `z·P = B + A + h3·Ppub + h4·X`
- **طرح Chen–Guan (با pseudonym پویا و biometric)**: ساخت کلید ترکیبی vsk = x·h3 + d (که h3 مولفه‌های TA و کاربر را به هم پیوند می‌دهد)، vpk=(U, R) با U = R + h3·X. امضا σ=(B, c) با c = b + vsk + x·h4؛ معادله‌ی verification: `c·P = B + U + h3·Ppub + h4·X`. نکته‌ی مقاله: ساختار نهایی معادله‌ی verification در هر دو طرح تقریباً یکسان است؛ تفاوت در روش ترکیب کلیدهاست که استراتژی forgery را تغییر می‌دهد.

## امنیت (Security)

**حمله‌ی Type I به Zhu–Guan**: مهاجم X′ = x′·P و A′ = a′·P انتخاب کرده، PK قربانی را با PK′ جایگزین می‌کند و سپس B را طوری جبرانی می‌سازد که جمله‌ی h3·Ppub از معادله حذف شود:
`B = −h3·Ppub`، سپس z = a′ + x′·h4. در verification:
`B + A′ + h3·Ppub + h4·X′ = A′ + h4·X′ = z·P` ✅
یعنی مهاجم بدون دانستن s (master secret) و بدون partial private key قربانی، امضای معتبر جعل می‌کند.

**حمله‌ی Type I به Chen–Guan**: مهاجم X′ و R′ انتخاب کرده، vpk قربانی را با vpk′=(U′, R′) جایگزین می‌کند. از طریق signing oracle یک امضا روی پیام m می‌گیرد و مقدار قابل‌استفاده‌ی θ = b − x′·h4 = b + vsk را استخراج می‌کند (چون secret x′ خودش را دارد). سپس برای هر پیام دلخواه m′ و timestamp t′ مقدار c′ = θ + x′·h4′ را می‌سازد — یعنی امضای معتبر بدون partial private key. علت: مقدار θ به message/timestamp **bound نیست** و قابل استفاده‌ی مجدد است.

**علت‌های ریشه‌ای (دو نقص ساختاری)**:
1. **Linear verifiability**: معادلات verification ترکیب خطی عناصر مستقل (public key، randomness اپیمیرال، خروجی هش) هستند؛ این خطی بودن به مهاجم اجازه می‌دهد با جابجایی public key، جمله‌ی h3·Ppub (مقصد trust anchoring) را جبران کند.
2. **Insufficient message binding**: مواد امضای استخراجشده به context پیام گره نخورده‌اند؛ استخراج θ از یک query به signing oracle برای جعل پیام‌های دیگر کافی است.

**راه‌حل پیشنهادی (hash-based countermeasure)**: افزودن چالش‌های هش‌شده ℎ5 و ℎ6 که pseudonym، public key و randomness هر امضاکننده را به هم گره می‌زند:
- Zhu–Guan: `z = h5·b + h6·c + x·h4` و `z·P = h5·B + h6·A + h3·Ppub + h4·X` با h5, h6 = H5/H6(PID, X, A, B).
- Chen–Guan: `c = h5·b + h6·vsk + x·h4` و `c·P = h5·B + h6·(U + h3·Ppub) + h4·X`.
چون B به وسیله‌ی h5 به public key ها binding می‌شود، تلاش برای ساختن public key ای که اثر Ppub را حذف کند شکست می‌خورد. ضرب h6 با A هم علیه حملات colluding داخلی (insider collusion) لازم است، نه فقط برای حمله‌ی Type I.

**هزینه و محدودیت**: این اصلاح امنیت را برمی‌گرداند ولی aggregate verification را به ≈ 3n+2 ضرب اسکالری می‌رساند — برای VANET پرتراکم و real-time سنگین است. نتیجه: ساختارهای خطی و hash-heavy ذاتاً برای deployment عملی ناکارآمدند.

## نکته معماری (Architectural takeaway)

- خطی بودن معادله‌ی verification و تکیه بر hash-binding، نقطه‌ی ضعف مشترک نسلی از طرح‌های CLAS است؛ اثبات‌های امنیتی موجود (random oracle + ECDLP) وقتی public-key replacement مجاز باشد، ناکافی‌اند.
- «بازگرداندن امنیت» با افزودن هش، هزینه را خطی (و سنگین) می‌کند؛ بنابراین معماری خطی hash-dependent نمی‌تواند همزمان امنیت قوی، latency بسیار پایین و scalability انبوه را بدهد.
- به پارادایم نسل‌جدید CLAS نیاز است که از linear hash-binding فراتر رود: (i) randomness وابسته به پیام در فرآیند aggregation، (ii) encoding های جبراً غیرقابل دست‌کاری (algebraically non-malleable)، یا (iii) مکانیزم‌های ZKP/challenge-response سبک که manipulability خطی را بشکنند و batch verifiability را حفظ کنند — با هدف verification زیرخطی در سناریوهای متراکم و سازگاری با 5G-V2X و ITS مبتنی بر 6G.

## نکات برای طرح امضای جدید (Takeaways for a new fast+secure+cheater-detecting scheme)

1. **هرگز عناصر خطی را جداگانه انتخاب نکن**: public key، ephemeral randomness و خروجی هش باید به هم پیوند جبری غیرخطی داشته باشند تا حذف جمله‌ی Ppub با جابجایی کلید غیرممکن شود — یعنی معادله‌ی verification نباید قابل «کنسل کردن» باشد.
2. **امضای استخراجی (θ) را به message/timestamp/trace گره بزن**: هر material قابل‌استفاده‌ی مجدد باید به context گره بخورد تا استخراج از signing oracle برای جعل پیام دیگر بی‌فایده باشد.
3. **هزینه را زیرخطی نگه دار**: روش‌های hash-binding (≈3n+2 ضرب اسکالری) برای 5G-V2X/6G پذیرفتنی نیست؛ به سمت aggregation غیرخطی یا challenge-response سبک برو که batch verification و scalability را حفظ کند.
4. **مدل adversary را جدی بگیر**: Type I با signing oracle بعد از public-key replacement را به‌صراحت در بازی امنیتی در نظر بگیر؛ اثبات صرف در ROM کافی نیست.
5. **جلوگیری از تقلب (cheater detection)**: در مقابل insider collusion (زمانی که چند کاربر برای جعل امضای تجمیعی همکاری می‌کنند) نیاز به مکانیزمی هست که سهم هر امضاکننده (مثل A در این طرح‌ها) قابل تثبیت و قابل ردیابی باشد — در این مقاله با هش اضافی h6 روی A به این هدف اشاره شده است.
