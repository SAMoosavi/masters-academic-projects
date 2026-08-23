---
tags: [literature, CLAS, VANET, cryptanalysis]
paper: yuanNewConditionalPrivacyPreserving2023
year: 2023
---

# A New Conditional Privacy-Preserving Certificateless Aggregate Signature Scheme in the Standard Model for VANETs (Yuan, Huang, Wu 2023, Mathematics)

منبع: Beibei Yuan, Hui Huang, Chenhuang Wu. *Mathematics* 2023, 11, 4766. https://doi.org/10.3390/math11234766

## خلاصه (Summary)

این مقاله یک تحلیل امنیتی (security analysis) روی یک طرح امضای تجمیعی بدون گواهی با حفظ حریم شرطی (conditional privacy-preserving CLAS) برای VANETs انجام می‌دهد که اخیراً توسط Wang et al. (2022, IEEE Access) در مدل استاندارد (standard model) ارائه شده است. تحلیل نشان می‌دهد که طرح Wang در برابر دو حمله آسیب‌پذیر است:

- **حمله KGC (KGC attack):** مهاجمی که نقش Key Generation Center را بازی می‌کند.
- **حمله جایگزینی کلید عمومی (public key replacement attack):** مهاجم می‌تواند کلید عمومی قربانی را با کلید خودش جایگزین کند و امضا جعل کند.

نویسندگان در پاسخ، یک طرح CLAS بهبودیافته ارائه می‌دهند که این آسیب‌پذیری‌ها را برطرف می‌کند، اثبات امنیت صوری و غیررسمی (formal + informal security) برای آن ارائه می‌کنند و با شبیه‌سازی، هزینه‌های محاسباتی و ارتباطی آن را ارزیابی می‌کنند.

## ایده اصلی و طرح (Core idea & scheme)

- **VANETs** شبکه‌هایی هستند که خودروهای مجهز به OBU (On Board Unit) و تجهیزات کنار جاده‌ای (RSU) را به هم متصل می‌کنند و امکان ارتباط V2V و V2I را فراهم می‌کنند تا ایمنی ترافیک و هوش حمل‌ونقل بهبود یابد. چالش‌های اصلی: یکپارچگی و اعتمادپذیری پیام‌ها (جلوگیری از جعل و تغییر داده) و حفاظت از حریم خصوصی خودروها.
- **Conditional privacy**: یک pseudo-identity ناشناس توسط Trace Authority (TRA) به خودرو داده می‌شود؛ در صورت اختلاف یا رفتار مخرب، Traffic Management Centre (TMC) می‌تواند هویت واقعی خودرو را فاش و آن را ردیابی کند.
- **Aggregate signature** (معرفی توسط Boneh et al., 2003) امضاهای n کاربر را در یک امضای واحد تجمیع می‌کند؛ سنجش‌گر (verifier) با یک بار verification صحت همه n پیام را می‌سنجد، که هزینه محاسباتی و بار ارتباطی RSU و OBU را به‌شدت کاهش می‌دهد.
- **Certificateless cryptography** (Al-Riyami & Paterson, 2003) به‌عنوان جایگزینی برای schemes مبتنی بر identity که مشکل key escrow دارند، معرفی شد؛ مسئله مدیریت certificate را هم حذف می‌کند.
- کارهای قبلی: نخستین CLAS در 2007 (Castro & Dahab)، سپس مواردی بر پایه bilinear pairing با هزینه زیاد (Gong et al.), بهبودهای Xiong et al.، Malhi & Batra (pairing ثابت)، و نقدهای بعدی نشان دادند که بسیاری از این طرح‌ها در برابر type II adversary یا حملات داخلی ناامن‌اند.
- **طرح بهبودیافته (improved scheme)**: نویسندگان یک CLAS اصلاح‌شده ارائه می‌دهند که در برابر دو حمله پیدا شده مقاوم است؛ امنیت آن در مدل استاندارد (standard model) و در برابر type I و type II attackers اثبات شده و الزامات امنیتی ویژه VANETs را برآورده می‌کند.

## امنیت (Security)

- **Cryptanalysis طرح Wang et al.:** دو حمله ساخته و ارائه شده است:
  1. **KGC attack** — مهاجم به‌عنوان KGC می‌تواند امضای معتبری برای پیام دلخواه جعل کند.
  2. **Public key replacement attack** — مهاجم با جایگزین کردن کلید عمومی کاربر قربانی، امضای معتبر جعل می‌کند.
  نتیجه: طرح Wang در مدل استاندارد امن نیست و امنیت اعلام‌شده آن برقرار نیست.
- **امنیت طرح بهبودیافته:** با اثبات صوری (formal) نشان داده می‌شود که طرح جدید در مدل استاندارد در برابر type I و type II attackers امن است (proof of security). تحلیل غیررسمی (informal) نیز الزامات امنیتی VANETs از جمله مقاومت در برابر جعل، حفظ حریم شرطی و یکپارچگی پیام را پوشش می‌دهد.
- نکته مهم برای امنیت واقعی: اثبات امنیت به تنهایی کافی نیست؛ ساختار امضا باید مانع ترکیب‌هایی شود که مهاجم بتواند با بازی KGC یا تعویض کلید عمومی، مسیر ساخت امضا را دور بزند.

## ارزیابی (Evaluation)

شبیه‌سازی روی دسکتاپ Intel Core i5-11300H (3.11 GHz, 16 GB RAM) با Java و کتابخانه‌های Java.security و it.unisa.dia.gas.jpbc برای عملیات pairing-based انجام شد. زمان اجرای عملیات پایه:

- Bilinear pairing (Tbp): ~10.3239 ms
- Map-to-point hash (Tmtp): ~2.4507 ms
- Scalar multiplication (Tmul): ~1.1508 ms
- Point addition (Tpa): ~0.0276 ms
- One-way hash (Th): ~0.0015 ms

**Computation overhead** (مقایسه با [21,22,23,28,37]):
- Signature generation توسط خودرو: 2Tmul + 2Th ≈ 2.3046 ms — کمترین هزینه در میان طرح‌های مقایسه‌شده.
- Single signature verification توسط RSU: 2Tbp + 3Tmul + 3Tpa + 3Th ≈ 24.1875 ms — کمتر از [21,22,28,37] و اندکی بیشتر از Wang et al.
- Aggregate verification توسط TMC: 2Tbp + 3nTmul + 3nTpa + 3nTh ≈ 3.5397n + 20.6478 ms.

**Communication overhead** (p = 64 bytes، عناصر G1 = 128 bytes، خروجی hash = 20 bytes، timestamp = 4 bytes؛ n = 100):
- Single signature: 2|G1| + |timestamp| = 260 bytes.
- Aggregate signature: 2|G1| + n|timestamp| = 656 bytes — کمتر از طرح‌های [21,22,23,37] و برابر با Kamil et al. [28] (اما هزینه generation و verification طرح Kamil بیشتر است).

**Practicality (Rsc):** با فرمول Rsc = p·d / (Tver · N · v)، که Tver ≈ 34.0827 ms، فاصله پوشش RSU = 1000 m، سرعت خودرو v بین 5 تا 20 m/s، ظرفیت سرویس RSU با افزایش تراکم و سرعت خودروها کاهش می‌یابد؛ یعنی با کاهش تراکم خودروها می‌توان ظرفیت بهتری گرفت. نتایج نشان می‌دهد هزینه‌های طرح بهبودیافته قابل مقایسه با طرح قبلی CLAS ولی امنیت آن بالاتر است.

## نکات برای طرح امضای جدید (Takeaways for a new fast+secure+cheater-detecting scheme)

1. **قبل از اعتماد، cryptanalysis جدی انجام بده:** حتی طرح‌های دارای اثبات در standard model (مثل Wang et al.) می‌توانند ناامن باشند. ساختار طرح را از منظر KGC attack و public key replacement attack بررسی کن؛ هر مرحله از ساخت امضا را ببین که مهاجم با دانش کدام کلید می‌تواند شبیه‌سازی کند.
2. **اثبات امنیت در standard model قوی‌تر از random oracle است** ولی تنها با توجه به جزئیات طرح (binding کلید عمومی به هویت و امضا، نقش KGC در خروجی partial private key) معتبر است؛ این الزامات را به‌عنوان checklist طراحی نگه دار.
3. **برای سرعت:** از pairing‌های کم (در اینجا 2 pairing در verification منفرد و 2 pairing ثابت در aggregate verification، مستقل از n) استفاده کن؛ هزینه verification تجمیعی باید به‌صورت خطی در n با ضرایب کوچک رشد کند (~3.5n ms). از hash‌های ارزان و scalar multiplication کم بهره بگیر.
4. **برای کاهش بار ارتباطی:** امضای تجمیعی باید شامل تعداد ثابتی از عناصر G1 باشد (اینجا 2|G1| + n·timestamp) نه رشد (n+1)|G1|؛ اندازه پیام‌های per-signature نیز کوچک بماند.
5. **تشخیص متقلب (cheater detection):** طرح با conditional privacy باید امکان ردیابی هویت واقعی توسط TRA/TMC را حفظ کند؛ در طرح جدید، باندل کردن pseudo-identity با مکانیزم ردیابی شرطی ضروری است و برای «تشخیص اینکه کدام خودرو امضای نامعتبر در batch تولید کرده» باید یک سازوکار آشکارسازی جداگانه اضافه شود.
6. **عملی بودن:** با معیار Rsc (ظرفیت سرویس RSU در تراکم و سرعت مختلف) عملی بودن طرح را بسنج؛ این متریک نشان می‌دهد بار verification باید آنقدر کم باشد که در تراکم بالا هم سرویس‌پذیری حفظ شود.
