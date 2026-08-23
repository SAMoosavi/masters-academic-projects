---
tags: [literature, PF-CLAS, signcryption, VANET]
paper: PairingFreeCertificatelessAggregate
authors: Cong Dai, Zhongwei Xu
year: 2023
venue: IEEE Internet of Things Journal, Vol. 10, No. 6, pp. 5063–5072 (online 15 Nov 2022)
---

# Pairing-Free Certificateless Aggregate Signcryption Scheme for Vehicular Sensor Networks (IEEE)

## خلاصه (Summary)

این مقاله یک طرح **Certificateless Aggregate Signcryption (CLASC)** مبتنی بر **elliptic curve cryptography (ECC)** و بدون **bilinear pairing** برای **vehicular sensor networks (VSNs)** ارائه می‌دهد. محیط **certificateless** هم مشکل مدیریت **certificate** و هم مشکل **key escrow** را از بین می‌برد. با **aggregate signcryption**، امضا و رمزنگاری همزمان انجام شده و چندین پیام چندمنبعی به‌صورت یکپارچه و با یک بار **verification** احراز هویت می‌شوند. طرح در **random oracle model (ROM)** به‌صورت **IND-CCA2** (از نظر **confidentiality**) و **EUF-CMA** (از نظر **unforgeability**) اثبات شده، **forward secrecy**، مقاومت در برابر حملات شناخته‌شده، و **pseudonym-based conditional privacy** را فراهم می‌کند و از نظر هزینه محاسباتی و **communication overhead** نسبت به کارهای state-of-the-art برتری دارد.

## ایده اصلی و طرح (Core idea & scheme)

- **Pairing-free / ECC-based**: بدون عملیات پرهزینه **bilinear pairing** و بدون **MapToPoint hash**؛ پایه‌ی امنیت روی مسائل سخت **CDH** و **ECDL** است.
- **Certificateless setting**: کلید خصوصی از دو بخش تشکیل می‌شود — یک بخش توسط **KGC** استخراج و بخش دیگر توسط خود کاربر تولید می‌شود؛ بنابراین **KGC** به کلید کامل دسترسی ندارد (حذف **key escrow**) و نیازی به گواهی نیست (حذف سربار مدیریت **certificate**).
- **Aggregation + simultaneous authentication**: signcryption به‌صورت همزمان امضا+رمز می‌کند، و امضاهای جداگانه به یک **aggregate** ادغام می‌شوند که تنها یک بار **verify** می‌شود؛ این کار پیچیدگی **verification** و حجم داده‌ی انتقالی برای انتقال‌های many-to-one را کاهش می‌دهد.
- **Pseudonym-based conditional privacy**: خودروها با **pseudonym (IDi)** که از **RIDi** (هویت واقعی) ساخته می‌شود ارتباط برقرار می‌کنند؛ **TRA** با **IDTRA** و **skIDTRA** می‌تواند **RIDi** را بازیابی کند و **conditional traceability** را میسر سازد.
- **Two-layer network model**: لایه‌ی بالا شامل **trusted authorities** و **application servers (AS)** (کانال‌های سیمی امن) و لایه‌ی پایین شامل خودروها و **roadside units (RSUs)**؛ ارتباطات V2V و V2I در کانال بی‌سیم باز انجام می‌شود.
- **Anti-replay**: برای جلوگیری از پیام‌های منقضی/تکراری از **tamper-resistant timestamps** و **nonces** استفاده می‌شود.
- **فقط ۲ نویسنده / مؤسسه**: Cong Dai (Tongji University و Third Research Institute of the Ministry of Public Security) و Zhongwei Xu (Tongji University — corresponding author).

## امنیت (Security)

- **Formal proof در ROM**: اثبات **IND-CCA2 confidentiality** زیر فرض **CDH** (Theorem 1) و **EUF-CMA unforgeability** زیر فرض **ECDL** (Theorem 2)، با استفاده از **Forking Lemma** و بازی‌های چهارگانه (A1: نوع I adversary، A2: نوع II adversary).
- **Forward secrecy**: حتی اگر کلید خصوصی و بخشی از کلیدها درز کند، بدون شکستن **CDH** نمی‌توان **Ki** را محاسبه کرد.
- **ESL resistance**: حتی با درز **ephemeral secrets (ui,1, ui,2)** نمی‌توان کلید جلسه یا کلیدهای خصوصی را به‌دست آورد — این نکته در متن به‌عنوان ضعف کارهای ECC-based قبلی ([33] Yu & Ren، [32] Ullah و…) ذکر شده که در این طرح رفع شده است.
- **Nonrepudiation**: به‌دلیل درگیر بودن کلید خصوصی فقط متعلق به مالک، طرح nonrepudiation را تأمین می‌کند.
- **مقاومت در برابر حملات**: **man-in-the-middle** (توسط confidentiality و unforgeability)، **DoS** (توسط **timestamp verification** امن و ذخیره‌ی استخر pseudonym برای ادامه کار در نبود TRA/KGC)، **replay** (توسط timestamp و nonce)، و **ESL attacks**.
- **Conditional traceability**: دشمن نمی‌تواند pseudonym را به هویت واقعی یا به pseudonym دیگر **link** کند، اما **TRA** می‌تواند هویت واقعی را بازیابی کند.
- **Validation ابزاری**: صحت پروتکل تحت **Dolev–Yao model** با ابزار **ProVerif** نیز راستی‌آزمایی شده است.

## ارزیابی (Evaluation)

- **بستر اندازه‌گیری**: کتابخانه‌ی **MIRACL** روی **Intel I7-4770 (3.4 GHz)، 4 GB RAM، Windows 7**.
- **مزیت aggregation**: برای **aggregate unsigncryption** به‌جای unsigncrypt کردن n بار، کاهش زمان اجرا به‌ترتیب **24.60% (n=100)**، **24.78% (n=350)**، **24.80% (n=500)**؛ و کاهش **output size** به‌ترتیب **24.75% (n=100)**، **24.93% (n=350)**، **24.95% (n=500)** — یعنی aggregation حدود یک‌چهارم هزینه‌ی محاسباتی و ارتباطی را کم می‌کند.
- **مقایسه با state-of-the-art** (برای n=350، زمان aggregate unsigncryption فقط **466.4302 ms**): بهبود کارایی محاسباتی **92.99%** نسبت به [27] Eslami et al.، **90.35%** نسبت به [29] Basudan et al.، **0.13%** نسبت به [33] Yu & Ren، و **39.88%** نسبت به [40] Luo & Ma. طرح‌های ECC-based به‌طور کلی بسیار کاراتر از طرح‌های pairing-based هستند.
- **سناریوی ترافیک**: طبق **DSRC** هر خودرو هر 300ms یک پیام می‌فرستد؛ در یک منطقه ~100 خودرو در ثانیه ~350 پیام تولید می‌شود، بنابراین n=350 مبنای مقایسه است.
- **مقایسه‌ی امنیتی (Table II)**: طرح پیشنهادی همه‌ی الزامات را برآورده می‌کند، در حالی که کارهای [27]، [29]، [33]، [40] در دو یا سه مورد (نبود forward secrecy، نبود timestamp verification امن، آسیب‌پذیری به ESL و tracking) ناقص‌اند.
- **منبع / سال / ناشر**: IEEE Internet of Things Journal، جلد 10، شماره 6، 15 مارس 2023 (پذیرش 10 نوامبر 2022؛ انتشار آنلاین 15 نوامبر 2022)؛ DOI: 10.1109/JIOT.2022.3222237 — نویسندگان: **Cong Dai** و **Zhongwei Xu**.
- **کار آینده**: بهره‌گیری از **CLASC** در سیستم‌های **blockchain-based** برای طراحی پروتکل احراز هویت نوین در VANET.

## نکات برای طرح امضای جدید (Takeaways for a new fast+secure+cheater-detecting scheme)

- **مسیر سریع = pairing-free + ECC**: حذف **bilinear pairing** و **MapToPoint** مهم‌ترین عامل سرعت است؛ طرح جدید باید همین مسیر را ادامه دهد.
- **Aggregation حدود ۲۵٪ صرفه‌جویی می‌دهد**: در signcryption چندمنبعی (مانند n≈350 پیام/ثانیه)، aggregation هم زمان و هم حجم خروجی را حدود یک‌چهارم کم می‌کند — برای کارایی بالا aggregation ضروری است.
- **ESL resistance را از ابتدا طراحی کنید**: ضعف اصلی کارهای ECC-based قبلی همین بود؛ طرح جدید باید حتی با درز **ephemeral secrets** امن بماند (مثلاً از **ui,1 و ui,2** جداگانه در ساخت کلید جلسه استفاده شود تا با یک فاکتور واحد قابل نقض نباشد).
- **Forward secrecy** و **conditional traceability** الزامات پایه‌ی VSN/VANET هستند که کارهای رقیب ناقص‌اند؛ pseudonym با قابلیت بازیابی هویت توسط **TRA** الگوی استاندارد است.
- **Timestamp + nonce** برای مقاومت در برابر **replay/DoS** ضروری است.
- **چالش برای cheater detection**: در **aggregate verification**، تشخیص این که کدام signcrypter پیام تقلبی/نامعتبر ارسال کرده سخت است — طرح جدید باید ساختاری داشته باشد که هنگام شکست verification، بتواند signcrypter متقلب را به‌صورت کارآمد و بدون از دست دادن مزیت aggregation ردیابی کند (مثلاً با نگه‌داشتن binding فردی قابل تفکیک در بخش‌های aggregate، یا سازوکار **subset/divide-and-conquer** برای جداسازی گره‌ی متقلب).
- **بستر ارزیابی یکسان**: مقایسه‌ی منصفانه نیازمند اعلام زمان اجرای هر primitive (scalar multiplication و …) روی سخت‌افزار مشخص و تعداد پیام واقعی در بازه‌ی DSRC است.
