---
tags: [literature, CLAS, VANET, smart-grid]
paper: EfficientCertificateLessAggregate
year: 2021
---

# Efficient Certificate-Less Aggregate Signature Scheme with Conditional Privacy-Preservation for VANET Enhanced Smart Grid System (Sensors 2021)

## خلاصه (Summary)

این مقاله (Vallent, Hanyurwimfura, Mikeka — Sensors 2021, 21, 2900) یک طرح امضای تجمیعی بدون گواهی به نام **ECLAS** برای VANET های مجهز به شبکه هوشمند (Smart Grid) ارائه می‌دهد. طرح بر پایه **Elliptic Curve Cryptography (ECC)** است و عمداً از عملیات سنگین **bilinear pairing** و **map-to-point hash** پرهیز می‌کند تا هزینه محاسباتی برای خودروها (OBU) و واحدهای جاده‌ای (RSU) کمینه شود.

بستر هدف: ارتباط V2V/V2I/V2G با پروتکل DSRC (IEEE 802.11p)؛ خودروها هر 100 تا 300 میلی‌ثانیه پیام ترافیکی ارسال می‌کنند، بنابراین RSU باید حدود 600 تا 2000 پیام در ثانیه را تأیید کند. طرح با **aggregation** امضاهای n خودرو را در یک امضای تجمیعی واحد برای **batch verification** ادغام می‌کند.

ویژگی کلیدی: **conditional privacy-preservation** — خودروها با شبه‌هویت (pseudo-identity) ناشناس می‌مانند اما مرجع TRA می‌تواند در صورت تخلف، هویت واقعی را بازیابی و خودرو را در CRL قرار دهد. مشکل **key escrow** مرجع KGC هم با افزودن یک کلید خصوصی خود-ساخته (vehicle secret) به کلید جزئی، حل شده است.

امنیت با **formal proof** در مدل random oracle تحت فرض سختی ECDL (برای Adversary Type-1) و ECCDH (برای Adversary Type-2) اثبات شده است. ارزیابی عملکرد (با کتابخانه MIRACL، امنیت 80 بیت) نشان می‌دهد ECLAS در هزینه محاسباتی از اکثر طرح‌های پایه مرجع بهتر است (Signing و Individual Verify هرکدام ≈ 0.8841 ms) و ارتباطات آن 184 بایت به ازای هر پیام است.

## ایده اصلی و طرح (Core idea & scheme)

**پایه ریاضی:** یک گروه ضربی چرخه‌ای G از مرتبه q روی منحنی بیضوی E. دو مسئله سخت پایه: ECDL (یافتن x از Q=xP) و ECCDH (محاسبه xyP از xP, yP) و ECDDH.

**موجودیت‌ها:** (۱) KGC با کلید اصلی α و کلید عمومی Ppub = αP برای تولید partial private key؛ (۲) TRA با کلید اصلی β و کلید عمومی Tpub = βP برای شبه‌هویت و ردیابی؛ (۳) RSU که aggregator است؛ (۴) خودرو با OBU و TPD. KGC و TRA trusted ولی honest-but-curious فرض می‌شوند؛ OBU و RSU نامعتبر فرض شده و باید احراز هویت شوند.

**هشت الگوریتم:**
1. **Set-up:** انتخاب p، q، منحنی E: y²=x³+ax+b (mod p)، نقطه مولد P، سه تابع درهم H1: G→Zq*، H2: {0,1}*→Zq*، H3: {0,1}*→Zq* و انتشار params = {P, p, q, E, G, H1, H2, H3, Ppub, Tpub}.
2. **Pseudo-Identity Generation / Partial-Private-Key Extraction:**
   - خودرو: ک می‌شود PID1 = ki·P و (RIDi, PID1) را از کانال امن به TRA می‌فرستد.
   - TRA: PID2 = RIDi ⊕ H1(β·PID1 || Ti || Tpub) که Ti دوره اعتبار شبه‌هویت است؛ شبه‌هویت IDi = (PID1 || PID2 || Ti). بازیابی هویت واقعی توسط TRA: RIDi = PID2 ⊕ H1(β·PID1 || Ti || Tpub).
   - KGC: d_i ∈ Zq*، Q_IDi = d_i·P، partial private key: **psk_i = d_i + H2(IDi || Q_IDi)·α mod p**. صحت با psk_i·P = Q_IDi + H2(IDi||Q_IDi)·Ppub بررسی می‌شود.
3. **Vehicle-Key Generation:** خودرو x_i ∈ Zq* برمی‌گزیند، vpk_i = x_i·P، و **کل کامل sk_i = x_i + psk_i**. چون sk_i شامل x_i (فقط خود خودرو) است، نه KGC و نه TRA نمی‌توانند به جای خودرو امضا جعل کنند (حل escrow).
4. **Sign:** R_i = r_i·P؛ h_i = H3(Mi || IDi || Q_IDi || vpk_i || Ri || ti)؛ **S_i = h_i·r_i + sk_i (mod p)**؛ امضا σ_i = (R_i, S_i). پیام ارسالی: (IDi, Q_IDi, vpk_i, Mi, ti, σi).
5. **Individual Verify:** چک freshness (ti و Ti)؛ محاسبه h_i,0 = H2(IDi||Q_IDi) و h_i و برقرار بودن: **S_i·P = h_i·R_i + vpk_i + Q_IDi + h_i,0·Ppub**.
6. **Aggregate:** RSU مجموع S = Σ S_i را محاسبه و امضای تجمیعی σ = {(R1,S1), (R2,S2), …, (Rn,Sn)} را خروجی می‌دهد (هر R_i جدا نگه داشته می‌شود).
7. **Aggregate Verify:** **S·P = Σ h_i·R_i + Σ vpk_i + Σ Q_IDi + Σ h_i,0·Ppub** (جمع روی n خودرو). در صورت برقراری، کل بسته تأیید می‌شود.

**مهم:** چون pairing استفاده نشده، صحت (correctness) فقط با قواعد ساده ECC برقرار است؛ درست‌نمایی کامل در متن (Section 4) آورده شده.

## امنیت (Security)

**مدل امنیتی (مطابق Al-Riyami–Paterson و Zhang et al.):**
- **Type-1 Adversary (A1):** کاربر ناصادق؛ کنترل master key ندارد ولی می‌تواند public key کاربران را با مقادیر دلخواه **جایگزین** کند (public key replacement).
- **Type-2 Adversary (A2):** KGC مخرب؛ **master key را در اختیار دارد** ولی نمی‌تواند public key را عوض کند.
- Adversary کنترل کامل کانال ارتباطی را دارد (relay, modify, delay, interleave, delete).

**قضایا (Random Oracle Model):**
- **Theorem 1:** تحت فرض ناپذیر بودن ECDL، طرح در برابر A1 امن است (کاهش به حل ECDL؛ دوباره درخواست Sign با همان R دو معادله خطی می‌دهد که x را به دست می‌دهد). احتمال موفقیت شبیه‌سازی: (1 − q_h/q)^(qc) · (1 − q_h/q)^(q_h) · (1/qc) · ε.
- **Theorem 2:** تحت فرض ناپذیر بودن ECCDH، طرح در برابر A2 امن است (کاهش به حل ECDL با دو معادله خطی در متغیرهای r و y).

**ویژگی‌های امنیتی/حریم خصوصی:**
- **Anonymity:** هویت اعلامی فقط شبه‌هویت است؛ استخراج RIDi نیازمند β (حل ECDL روی Tpub = βP) است.
- **Message Integrity & Authentication:** جعل σi بدون دانستن sk_i = x_i + psk_i ناممکن است؛ معادله تأیید همزمان امضاکننده و طرف TA را تصدیق می‌کند.
- **Traceability:** TRA با β هویت واقعی را از PID2 بازیابی و در CRL ثبت می‌کند؛ هر دامنه CRL را در همه RSU های خود نگه می‌دارد.
- **Unlinkability:** چون PID1 = k_i·P با k_i تصادفی برای هر پیام نو است، شبه‌هویت هر بار تصادفی دیده می‌شود و دو پیام قابل پیوند نیستند.
- **مقاومت در برابر حملات:** Replay (چک timestamp)، Modification (جعل ناممکن)، Impersonation (نیاز به حل ECDLP/ECCDH)، Stolen Verifier Table (هیچ جدول چکی روی TA یا کاربر نیست).
- **Key-Escrow Resilience:** به دلیل sk_i = x_i + di + H2(ID||Q_ID)·α، حتی با دانستن α و β نمی‌توان به جای خودرو امضا ساخت.

**مقایسه ویژگی‌های امنیتی (Table 2)** — شش شاخص SF-1..SF-6 (احراز هویت/یکپارچگی، ناشناسی، ردیابی/بازپس‌گیری، عدم پیوندپذیری، حل escrow، مقاومت در برابر حملات):
- ECLAS: همه ✔
- Alazzawi [47]: SF-4 و SF-5 ✘
- Bayat [53]: SF-4، SF-5، SF-6 ✘
- Malhi [54]: SF-1، SF-4، SF-5، SF-6 ✘

## ارزیابی (Evaluation)

**زمان اجرای عملیات (Table 3، از MIRACL، امنیت 80 بیت):** Tbp (pairing) = 4.211 ms؛ Tbp.m = 1.709 ms؛ Tbp.sm = 0.0535 ms؛ Tbp.a = 0.0071 ms؛ TH (map-to-point hash) = 4.406 ms؛ Te.m (اسکالر ضرب ECC) = 0.4420 ms؛ Te.sm = 0.0138 ms؛ Te.a = 0.0018 ms؛ Th (hash) = 0.0001 ms.

**هزینه محاسباتی (Table 4):**

| Scheme | Signing | Individual Verify | Aggregate Verify |
|---|---|---|---|
| Horng [27] | 3Te.m ≈ 1.326 ms | 3Tbp+Te.m+TH ≈ 17.481 ms | 3Tbp+nTe.m+nTH ≈ 12.633+4.4198n ms |
| Cui [13] | ≈ 0.4439 ms | ≈ 1.3298 ms | ≈ 6.2973n ms |
| Xiong [55] | ≈ 5.1413 ms | ≈ 19.2262 ms | ≈ 12.633+7.8312n ms |
| Tzeng [2] | ≈ 9.533 ms | ≈ 10.131 ms | ≈ 10.131n ms |
| Kamil [23] | ≈ 1.3297 ms | ≈ 0.8859 ms | ≈ 0.8859n ms |
| **ECLAS** | **2Te.m+Th ≈ 0.8841 ms** | **2Te.m+Th ≈ 0.8841 ms** | **2nTe.m+nTh ≈ 0.8841n ms** |

- هزینه ترکیبی (Sign + Individual Verify) هر واحد: Horng 18.807 ms، Cui 1.7737 ms، Xiong 24.3675 ms، Tzeng 19.664 ms، Kamil 2.1887 ms، **ECLAS 1.7682 ms** (بهترین؛ فقط Cui [13] هزینه امضا کمی پایین‌تر دارد ولی در [23] ناامن اعلام شده).
- Batch verification برای 2000 امضا: تأخیر ECLAS به‌صورت خطی با n رشد می‌کند و کمترین است (شکل 3).
- نکته: اعداد هزینه امضای Cui و Kamil به دلیل حضور Te.a/Th گاهی شبیه ECLAS به نظر می‌رسند ولی ECLAS ساده‌ترین فرم (2Te.m+Th) را دارد.

**هزینه ارتباطی (Table 5):** اندازه عناصر: G1 = 128 بایت، G = 40 بایت، Zq* = 20 بایت، hash = 20 بایت، timestamp = 4 بایت.

| Scheme | یک پیام | n پیام |
|---|---|---|
| Horng [27] | 124 بایت (متن) / 644 (جدول) — ناسازگاری داخلی | 644n |
| Cui [13] | 184 | 184n |
| Xiong [55] | 184 | 184n |
| Malhi [54] | 768 | 768n |
| Kamil [23] | 184 | 184n |
| **ECLAS** | **184 بایت (4×40+20+4)** | **184n** |

ECLAS از Horng و Malhi کمتر و با Cui/Xiong/Kamil هم‌سطح است، ولی این رقبا در برخی جنبه‌های امنیتی ناقص‌اند.

## نکات برای طرح امضای جدید (Takeaways for a new fast+secure+cheater-detecting scheme)

1. **Pairing-free است بهتر است:** یک pairing (4.211 ms) ≈ 9.5 برابر اسکالر ضرب ECC (0.442 ms) است؛ ساختار ECLAS (امضای S_i = h·r + sk و تأیید S·P = h·R + vpk + Q + h0·Ppub) بدون pairing و بدون map-to-point hash کار می‌کند و همین باعث هزینه 0.8841 ms امضا/تأیید می‌شود.
2. **ساختار certificateless دوسویه:** جدا کردن کلید جزئی (KGC) از کلید کامل (خودرو، sk = x + psk) هم مشکل escrow را حل می‌کند و هم مدل تهدید دوگانه (A1: public key replacement؛ A2: malicious KGC) را لازم می‌کند. طرح جدید باید در همین مدل دو-دشمن اثبات شود (کاهش به ECDL/ECCDH در random oracle).
3. **conditional privacy ارزان به دست می‌آید:** شبه‌هویت ID = (PID1||PID2||T) با دوره اعتبار T و یک XOR + یک ECDL بر β کافی است؛ بدون نیاز به نگهداری list شبه‌هویت در TA و با امکان revoke از طریق CRL.
4. **خطی بودن aggregation یک نقطه ضعف برای تشخیص متخلف است:** در ECLAS، امضای تجمیعی σ = {(R1,S1),…,(Rn,Sn)} تمام R_i را جدا نگه می‌دارد و Aggregate Verify فقط یک معادله جمعی است: **اگر یک امضا خراب باشد، کل بسته رد می‌شود و هیچ اطلاعاتی درباره اینکه کدام خودرو متخلف است داده نمی‌شود** (all-or-nothing). برای یک طرح «cheater-detecting»، باید سازوکاری (مثلاً ساختار شاخه‌ای/تقسیم و حل یا امضای قابل تقسیم) اضافه شود تا بسته ناموفق به متخلف(های) مشخصی مپ شود بدون اینکه هر بار به تأیید فردی (Individual Verify) برگردد.
5. **هزینه Batch Verification خطی است:** Aggregate Verify ECLAS = 2n·Te.m + n·Th ≈ 0.8841n ms (بدون جمله ثابت pairing)؛ برای 600 تا 2000 پیام/ثانیه کافی است، ولی برای سرعت بیشتر می‌توان از تکنیک‌هایی مثل small-scalar batching (Te.sm = 0.0138 ms) یا pre-computation استفاده کرد.
6. **نکات مقایسه‌ای:** کاندیدهای مرجع مهم برای بنچ‌مارک: Cui [13] (ارزان‌ترین امضا ولی ناامن)، Kamil [23] (نزدیک به ECLAS ولی با شکنندگی امنیتی)، Xiong/Tzeng (پایه pairing، سنگین). بهتر است طرح جدید هم از نظر ms و هم بایت در برابر همین گروه مقایسه شود.
7. **خواسته اصلی کاربر (cheater-detection) را هم در بخش امنیتی اثبات کنید:** طرح‌های موجود «تشخیص متخلف در batch verification» را به‌عنوان یک ویژگی امنیتی مدل نمی‌کنند؛ این یک شکاف (gap) قابل ادعا برای کار جدید است که هم در مقدمه و هم در ارزیابی باید کمی شود (هزینه جستجوی متخلف در بدترین حالت).
