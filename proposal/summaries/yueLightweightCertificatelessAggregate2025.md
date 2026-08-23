---
tags: [literature, PF-CLAS, CLAS, VANET]
paper: yueLightweightCertificatelessAggregate2025
year: 2025
---

# A Lightweight Certificateless Aggregate Signature Scheme without Pairing for VANETs (Yue, Jiang, Lei 2025, Scientific Reports)

## خلاصه (Summary)

این مقاله یک طرح امضای تجمیعی بدون گواهی (Certificateless Aggregate Signature, CLAS) بدون pairing برای شبکه‌های VANET ارائه می‌دهد. نویسندگان ابتدا طرح Zheng et al. (2022) را تحلیل می‌کنند و نشان می‌دهند که این طرح در برابر **temporary/ephemeral rogue key attack** آسیب‌پذیر است: مهاجم می‌تواند با بهره‌گیری از random nonces داخل امضاها یک rogue key موقتی بسازد و با آن به‌همراه کلید خصوصی خود، یک aggregate signature جعلی تولید کند که بدون شناسایی شدن از بررسی عبور می‌کند. برای رفع این آسیب‌پذیری، طرح بهبودیافته‌ای پیشنهاد می‌شود که یک **امضای aggregator اضافی (additional aggregator's signature)** را به چارچوب اصلی اضافه می‌کند و با **بررسی هم‌زمان (simultaneous verification)** امضای aggregator و aggregate signature در برابر حملات rogue key مقاوم می‌شود. نتایج آزمایش‌ها نشان می‌دهد که این طرح در هزینه محاسباتی و ارتباطی مزیت قابل توجهی نسبت به طرح‌های دیگر دارد.

## ایده اصلی و طرح (Core idea & scheme)

- **مشکل:** طرح Zheng et al. مبتنی بر pairing نیست (pairing-free) اما در برابر rogue key attack موقتی آسیب‌پذیر است. یعنی مهاجم (گره/کاربر مخرب) می‌تواند با سوءاستفاده از random numbers داخل امضاها، یک ephemeral rogue key تولید کند و با استفاده از این rogue key به‌همراه کلید خصوصی خود، یک aggregate signature جعلی برای پیام‌های دلخواه بسازد که بدون شناسایی، بررسی را رد می‌کند.
- **راه‌حل:** افزودن یک aggregator signature به چارچوب اصلی و انجام dual-layer verification — یعنی بررسی هم‌زمان امضای aggregator و امضای تجمیعی. این سازوکار مقاومت در برابر collusion attacks و aggregators مخرب را هم تقویت می‌کند.
- طرح بر پایه ECC و بدون bilinear pairing است و ادعای اثبات ناپذیری جعل (unforgeability) تحت فرض ECDLP در برابر دو نوع مهاجم دارد؛ همچنین ویژگی‌های vehicle authentication، anonymity، traceability، non-repudiation و unlinkability را حفظ می‌کند.
- (در appendix مقاله، نسخه CLAS از Γ-signature نیز با اضافه‌کردن partial private keys به key generation برای استفاده در VANET سازگار شده است.)

## امنیت (Security)

- **حمله rogue key (توصیف):** در طرح Zheng et al.، مهاجم می‌تواند random numbers (nonces) موجود در امضاها را برای ساخت یک rogue key موقتی به کار ببرد؛ سپس با ترکیب این rogue key و کلید خصوصی خود، یک aggregate signature جعلی می‌سازد که بررسی آن موفق و قابل قبول است و قابل شناسایی نیست. این یک نقص بنیادین در معماری امنیتی طرح‌های CLAS سنتی است.
- **تحلیل امنیتی راه‌حل:** با افزودن امضای aggregator و بررسی هم‌زمان آن با aggregate signature، امکان جعل از طریق rogue key از بین می‌رود؛ چون صحت زنجیره امضا/تجمیع قابل کنترل است و این سازوکار (dual-validation) مقاومت در برابر حملات collusion و aggregator مخرب را افزایش می‌دهد.
- مقاله علاوه بر rogue key attack، به نقاط ضعف سایر طرح‌ها اشاره می‌کند (مثلاً Kamil مستعد forgery attack، طرح Gayathri با risk از طرف KGC مخرب) و نشان می‌دهد که طرح پیشنهادی به‌طور هم‌زمان pairing-free و مقاوم در برابر ephemeral rogue-key است (طبق Table 1).

## ارزیابی (Evaluation)

- **هزینه محاسباتی:** در مقایسه با طرح‌های دیگر (Wang et al., Mei et al., Zhong et al., Kumar et al., Zhu et al., Zheng et al.)، در AS verification با n=100 طرح پیشنهادی به ترتیب حدود 24.89%، 50.91%، 1.62%، 24.06% و 29.35% کاهش هزینه محاسباتی دارد (نسبت به refs 22, 30–33). در دیگر مراحل (مثلاً reduce computational overhead به میزان 68.62%، 58.17%، 45.85% و 53.26% نسبت به refs 22, 30–32) نیز مزیت دارد. اگرچه نسبت به Zheng et al. در فاز verification کمی گران‌تر است، آن طرح آسیب‌پذیر است. هزینه محاسباتی با استفاده از Python روی Ubuntu 20.04 (AMD Ryzen 7 7840HS, 16GB RAM) اندازه‌گیری شده است.
- **هزینه ارتباطی (Communication overhead):** با |G1|=1024bits، |G|=320bits، |Zq*|=160bits، ارتباط طرح پیشنهادی 3|G| + 3|Zq*| است. این مقدار حدود 67.4%، 66.1%، 72.7% و 62.3% نسبت به refs 22, 30–32 و 18.1% نسبت به ref 27 کاهش دارد. برای AS با n=100، کاهش حدود 19.1% نسبت به Zheng et al. و Γ-signature* در VANET و 63.6% و 41.4% نسبت به refs 30, 31 است.
- **نتیجه:** طرح به‌طور هم‌زمان امنیت را افزایش و هزینه محاسباتی/ارتباطی را کاهش می‌دهد؛ در مجموع برای محیط‌های VANET با منابع محدود مناسب و مقیاس‌پذیر است.

## نکات برای طرح امضای جدید (Takeaways for a new fast+secure+cheater-detecting scheme)

- **مقاومت در برابر rogue key حیاتی است:** هر طرح CLAS بدون توجه به این حمله، اجازه جعل aggregate signature نامشخص (undetected) را می‌دهد؛ بنابراین طراحی باید نقش aggregator را به‌طور صریح و قابل راستی‌آزمایی در بر بگیرد.
- **افزودن امضای aggregator + بررسی هم‌زمان** یک روش کم‌هزینه (نسبتاً ناچیز) برای مقاوم‌سازی است که تأثیر کمی بر روند verification دارد؛ می‌تواند الگویی برای تشخیص cheat در تجمیع باشد.
- **بدون pairing** بودن مزیت محاسباتی/ارتباطی قابل توجهی برای تجهیزات محدود دارد؛ ECC با فرض امنیتی ECDLP کفایت می‌کند.
- ترکیب عناصر ephemeral (مثل Ui) با random challenge hashes (رویکرد Γ-signature) هم می‌تواند مانع دستکاری اجزای منفرد امضا بدون دانستن کلید خصوصی شود.
- جهت‌گیری آینده: ترکیب CLAS با blockchain برای برنامه‌های غیرمتمرکز و توسعه به سناریوهایی مثل سلامت و آموزش.
