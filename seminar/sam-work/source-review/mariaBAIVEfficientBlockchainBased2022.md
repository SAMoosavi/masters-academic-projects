# یادداشت منبع: `mariaBAIVEfficientBlockchainBased2022` (BAIV)

## ۱. مشخصات و دسترسی

- **ارجاع کامل:** Maria, A.; Rajasekaran, A.S.; Al-Turjman, F.; Altrjman, C.; Mostarda, L. "BAIV: An Efficient Blockchain-Based Anonymous Authentication and Integrity Preservation Scheme for Secure Communication in VANETs." *Electronics* **2022**, 11(3), 488. DOI: 10.3390/electronics11030488.
- **تاریخ‌ها:** Received 24 December 2021؛ Accepted 4 February 2022؛ Published 8 February 2022 (p. 1). Academic Editor: Jun-Ho Huh.
- **دسترسی:** متن کامل، open access با مجوز CC BY 4.0 (p. 1). صفحه‌ی HTML ناشر (mdpi.com) برای دریافت خودکار خطای 403 داد؛ PDF ۲۰ صفحه‌ای از `https://mdpi-res.com/d_attachment/electronics/electronics-11-00488/article_deploy/electronics-11-00488.pdf` گرفته و با `pdftotext` استخراج شد.
- **هشدار درباره‌ی خوانایی:** در صفحات 5، 6، 11–12 و 16–18 فایل PDF، لایه‌ی متنِ نسخه‌ی «FOR PEER REVIEW» روی متن نهایی افتاده و در استخراج، متن‌ها درهم شده‌اند. متن این صفحات با مختصات کلمات (`pdftotext -bbox`) بازسازی شد. جداول ۲ و ۳ (نمودار گردش کار) فقط تا حدی خوانا بودند. هر جا متن مطمئن نبود، علامت ⚠ گذاشته‌ام.
- **بررسی bib (`report.bib`، خطوط 179–194):** عنوان، نویسندگان، سال/ماه (2022-01)، journal، volume 11، number 3، pages 488، ISSN 2079-9292، DOI و URL همه با PDF می‌خوانند ✔. نکته‌ی جزئی: `date = {2022-01}` درست است، چون شماره‌ی 3 مربوط به ژانویه است، ولی تاریخ انتشار آنلاین 8 February 2022 است. چکیده‌ی bib با چکیده‌ی PDF یکی است. ارجاع داخلی شماره‌ی [20] در خود مقاله همان BPAS (Feng et al. 2020) است و [36] همان GSIS (Lin et al. 2007)؛ هر دو در گزارش هم ارجاع دارند (p. 19–20، References).

## ۲. خلاصه‌ی ساختاریافته

**مسئله.** در طرح‌های موجود وقتی خودرو از ناحیه‌ی یک RSU وارد ناحیه‌ی RSU بعدی می‌شود، باید دوباره تصدیق هویت شود و این کار هزینه‌ی محاسباتی را بالا می‌برد. به گفته‌ی نویسندگان، طرح‌های بلاکچینیِ پیشین به ناشناسی شرطی (conditional anonymity) هم توجه نکرده‌اند (Abstract، p. 1؛ §1، p. 2).

**مدل سیستم.** سه موجودیت TA، RSU و OBU به‌علاوه‌ی یک شبکه‌ی بلاکچینِ مستقل در نظر گرفته شده است. همه‌ی RSUها و TA به‌طور مستقل به بلاکچین وصل‌اند. اطلاعات خودرو پس از اولین تصدیق هویت در بلاکچین ذخیره می‌شود و RSUهای بعدی نیازی به تصدیق دوباره ندارند (§3.1، p. 5؛ Figure 1).

**فازها.** نویسندگان می‌نویسند طرح «seven sections» دارد، اما هشت مورد نام می‌برند (p. 7، §4):
1. System Initialization (§4.1)
2. Registration of Vehicles (§4.2)
3. Registration of an RSU (§4.3)
4. Anonymous Authentication of a Vehicle User (§4.4)
5. Anonymous Authentication of an RSU (§4.5)
6. سازوکار handover که بخش جداگانه ندارد و با «authentication receipt» در پایان §4.4 انجام می‌شود
7. Secure Message Transmission and Integrity Preservation (§4.6)
8. Revocation (§4.7)

**پایه‌ی رمزنگاری.** خم بیضوی محدود، نگاشت دوخطی (bilinear pairing) $e(P,Q)$، تابع درهم‌ساز $H$، XOR و سختی مسئله‌ی لگاریتم گسسته (DLP) (§1، p. 2–3؛ §4.1؛ §5.2).

**تحلیل امنیتی (غیررسمی).** مقاله در برابر این موارد استدلال توصیفی می‌آورد: impersonation، message modification، fake/bogus message، message integrity و unlinkability، replay (در متن «reply»)، conditional tracking، conditional privacy و non-repudiation (§5.1–5.8، p. 12–13). هیچ اثبات رسمی‌ای نیامده است: نه مدل ROM/reduction، نه BAN/ProVerif/AVISPA.

**عملکرد.**
- محیط: CYGWIN 1.7.35، Core i7 3.4 GHz، 8 GB RAM، GCC 4.9.2 و کتابخانه‌ی PBC (§6.1، p. 14).
- زمان عملیات پایه: point addition 0.011 ms، point multiplication 2.4 ms، hash 0.01 ms، pairing 2.9 ms، XOR 0.01 ms (p. 14).
- هزینه‌ی تصدیق هویت یک کاربر و یک RSU: **12.54 ms**، یعنی حدود **80** کاربر در ثانیه و «nearly 4800» کاربر در دقیقه (p. 14–15).
- برای 100 کاربر: **1291 ms**؛ طرح‌های دیگر «more than 1375 ms» (p. 16؛ Figure 7).
- مقادیر از میانگین 100 شبیه‌سازی تصادفی به دست آمده‌اند (p. 16–17، ⚠ متن درهم ولی قابل بازسازی).

**محدودیت‌ها.**
- *به گفته‌ی نویسندگان (کار آینده، §7، p. 18):* batch authentication با AI، امنیت 6G و edge computing، lightweight revocation مبتنی بر ECC، identity-based verification برای گروه خودروها، و بررسی message delay و transmission loss.
- *برداشت نگارنده‌ی یادداشت، نه ادعای مقاله:*
  - نوع بلاکچین (public/consortium)، اجماع، اندازه‌ی بلاک و تأخیر ثبت مشخص نشده است.
  - بلاکچین در ارزیابی پیاده‌سازی نشده و فقط عملیات رمزنگاری زمان‌سنجی شده‌اند.
  - هزینه‌ی ارتباطی (communication cost) تحلیل نشده است. فقط گفته شده «communication overhead will not have much more impact on the security… irrespective of the number of bits» (p. 17).
  - TA همچنان برای ثبت‌نام و ابطال لازم است.

## ۳. استخراج محتوا برای بسط متن

### ۳.۱ بخش گزارش: «تصدیق هویت ناشناس مبتنی بر بلاکچین (BAIV)» (`report.tex` خطوط 737–746)

**تعریف و انگیزه.**
- «In the existing scenario, when the authenticated vehicle user moves from one roadside unit (RSU) to another RSU region, re-authentication of the vehicle user is required by the current RSU, which increases the computational complexity.» (Abstract، p. 1)
- «blockchain is integrated with VANET, which enables the authentication of the vehicle user without the involvement of a trusted authority.» (Abstract، p. 1)
- «conditional privacy is introduced to revoke the malicious vehicles in the case of disputes and to avoid further damage to the VANET system.» (Abstract، p. 1)

**چهار مشارکت اعلام‌شده** (§1، p. 2):
1. anonymous authentication برای بررسی مشروعیت خودروها و RSUها
2. handover authentication مبتنی بر بلاکچین هنگام roaming
3. conditional privacy برای ابطال خودروهای متخلف «at any time»
4. integrity preservation در برابر modification attack

**موجودیت‌ها** (§3.1، p. 5–6):
- **TA:** بالاترین واحد سیستم. RSU، OBU و کاربران را ثبت می‌کند و registration ID یکتا می‌دهد. کلیدهای خصوصی و عمومی را تولید می‌کند و مسئول ابطال با «conditional tracking mechanism» است. ارتباط RSU و TA از طریق سیم (wired) برقرار است.
- **RSU:** کنار جاده، در پارکینگ یا تقاطع نصب می‌شود. ارتباط کوتاه‌برد آن با «IEEE 802.11p» است. با سیم به RSUهای همسایه و TA و بی‌سیم به خودروها وصل است و اطلاعات مکان‌محور (location-based) ارائه می‌دهد.
- **OBU:** GPS (طول و عرض جغرافیایی و زمان) و data recorder شبیه «black box in the aircraft» دارد.
- ⚠ نکته‌ی متنی: در §1 (p. 2) ارتباط V2R «through a wired medium» توصیف شده که با §3.1.2 (ارتباط بی‌سیم RSU با خودرو) ناسازگار است. این را به‌عنوان ادعا در گزارش نیاورید.

**بلاکچین در طرح** (§3.2، p. 6–7؛ متن صفحه‌ی 6 با bbox بازسازی شد):
- «Every block in the blockchain is linked through the hash of the previous block.»
- «all the information are displayed in the form of the SHA256 hash code.»
- «There is no third party governing the blockchain, thus it is completely decentralized.»
- زیربخش ⚠ (عنوان «Blockchain in VANETs»، شماره‌ی آن به‌دلیل هم‌پوشانی نامطمئن است): «Initially, TA computes all the public and private parameters and stores $(D_{IDv}, A)$ in the blockchain, where $A=e(P,Q)^{\gamma_i}$… The RSU takes the dummy identity from the blockchain to create the authentication receipt, and the RSU transmits the authentication receipt to all the neighboring RSUs in order to avoid frequent re-authentication.» (p. 6–7)

**فازهای پروتکل، گام‌به‌گام** (نمادها مطابق Table 1، p. 8):

*۱. راه‌اندازی (§4.1، p. 7–8):*
- TA خم $y^2=x^3+ax+b \bmod q$ (با $q$ عدد اول بزرگ) و نقاط $P, Q$ را انتخاب می‌کند.
- اعداد تصادفی $\alpha,\beta\in Z_q^*$ را برمی‌گزیند و کلید عمومی $T_{pub}=\alpha P$ و کلید تأیید $T_{ver}=\beta P$ را محاسبه می‌کند.
- $(T_{pub},T_{ver},H,P,Q,e(P,Q),q)$ را منتشر می‌کند.

*۲. ثبت‌نام خودرو (§4.2، p. 8):*
- کاربر مدارک واقعی خود (شماره تلفن، شناسه‌ی شخصی، نشانی) را حضوری به TA می‌دهد.
- TA مقدار $\gamma_i\in Z_q^*$ را انتخاب می‌کند و $A_{ID1}=\gamma_i(\alpha+\beta)$ را محاسبه می‌کند.
- شناسه‌ی ساختگی $D_{IDv}\in Z_q^*$ را برمی‌گزیند. نگاشت آن به هویت واقعی «only in the TA» نگه داشته می‌شود.
- $A_{ID2}=H(D_{IDv}\times A_{ID1})$ را محاسبه می‌کند.
- $(\gamma_i, A_{ID1}, A_{ID2})$ را به‌طور امن به کاربر می‌دهد و $(D_{IDv}, A)$ را با $A=e(P,Q)^{\gamma_i}$ در بلاکچین ذخیره می‌کند.

*۳. ثبت‌نام RSU (§4.3، p. 9):*
- $V_{ID1}=\frac{1}{\alpha+\beta}Q$، شناسه‌ی ساختگی $D_{IDR}\in Z_q^*$ و $V_{ID2}=H(D_{IDR}\times V_{ID1})$.
- TA مقادیر $(V_{ID1},V_{ID2},\beta)$ را «secretly» در RSU ذخیره می‌کند.

*۴. تصدیق هویت ناشناس خودرو (§4.4، p. 9):*
1. OBU مقدار $\gamma_i P$ را به RSU می‌فرستد.
2. RSU مقدار $D_{IDR}P$ را به OBU می‌فرستد.
3. کاربر $k=\gamma_i D_{IDR}P$ را محاسبه می‌کند.
4. RSU همان $k=D_{IDR}\times\gamma_i P$ را محاسبه می‌کند. این گام در عمل یک تبادل کلید شبه Diffie–Hellman است؛ این توصیف از نگارنده است و اصطلاح خود مقاله نیست.
5. کاربر $k_1=A_{ID1}\oplus H(k)$ را می‌فرستد.
6. RSU مقدار $A_{ID1}=k_1\oplus H(k)$ را بازیابی می‌کند و بررسی می‌کند که $e(A_{ID1}P, V_{ID1})$ با مقدار $A$ ثبت‌شده در بلاکچین برابر باشد. «Here, the blockchain is used to verify the authenticity without the involvement of TA.»
- **اثبات درستی:** $e(\gamma_i(\alpha+\beta)P,\frac{1}{\alpha+\beta}Q)=e(P,Q)^{\gamma_i}=A$.
- **رسید handover:** RSU از بلاکچین $D_{IDv}$ را برمی‌دارد و $AR=(D_{IDR},D_{IDv},H(D_{IDR},D_{IDv}))$ را می‌سازد. این رسید «will be transmitted to all the upcoming RSUs to avoid frequent re-authentication». RSU همچنین $k_2=A_{ID1}\oplus D_{IDR}$ را می‌فرستد و کاربر $D_{IDR}=A_{ID1}\oplus k_2$ را استخراج می‌کند.

*۵. تصدیق هویت ناشناس RSU (§4.5، p. 9):*
- RSU مقدار $x_i\in Z_q^*$ را انتخاب می‌کند و این مقادیر را محاسبه می‌کند: $u_i=x_iP$، $\varphi_i=H(A_{ID1}\times T_{pub})$، $\lambda_i=(x_i+\varphi_i\beta)\bmod q$، $s_1=D_{IDR}\oplus\lambda_i$ و $s_2=A_{ID2}\oplus\varphi_i$.
- RSU مقادیر $(u_i,s_1,s_2)$ را می‌فرستد. کاربر $\lambda_i$ و $\varphi_i$ را بازیابی می‌کند و بررسی می‌کند که $\lambda_iP=u_i+\varphi_iT_{ver}$ باشد. در صورت برقراری، RSU را می‌پذیرد و اطلاعات مکان‌محور را دریافت می‌کند.

*۶. ارسال امن پیام و حفظ یکپارچگی (§4.6، p. 10):*
- فرستنده $\mu_i, a_i\in Z_q^*$ را انتخاب می‌کند و این مقادیر را محاسبه می‌کند: $X_1=\mu_iT_{pub}$، $Y_1=\lambda_iT_{pub}$، $\wp=X_1+Y_1$، $A_i=a_iT_{pub}$ و $\eta_i=\delta_i(a_i+\mu_i+\lambda_i)\bmod q$ با $\delta_i=H(m_i\times A_i)$.
- امضا $\theta_i=(A_i,m_i)$ است و ارسال به شکل $(\eta_i,t_i,m_i,\theta_i,\wp,D_{IDv})$ انجام می‌شود.
- گیرنده $\delta_i$ را محاسبه می‌کند و بررسی می‌کند که $\eta_iT_{pub}=\delta_i(A_i+\wp)$ باشد.
- $t_i$ مهر زمانی است.

*۷. ابطال (§4.7، p. 10):*
- خودروهای مجاور شکایت می‌کنند و $(t_i,m_i^*,\theta_i,D_{IDv})$ از طریق RSU به TA می‌رسد.
- TA خودروی دارای $D_{IDv}$ را ابطال می‌کند و $(D_{IDv},H(D_{IDv},\beta))$ را به همه‌ی RSUها می‌فرستد.
- RSU مقدار $F=H(D_{IDv},\beta)$ را محاسبه می‌کند. اگر برابر بود، $D_{IDv}$ را در «block list» همه‌ی RSUها قرار می‌دهد و آن خودرو دیگر اجازه‌ی ارتباط ندارد.

**مدل تهدید** (§3.3، p. 7):
- مهاجم داخلی («insider») و خارجی تعریف شده‌اند، ولی «the concentration is mainly focused on the external attacker».
- حملات تعریف‌شده: Impersonation، Fake Message، Privacy Revealing، Masquerading (هک شدن login/password) و Forgery (جعل گواهی یا امضا).

**استدلال‌های امنیتی** (§5، p. 12–13؛ برای بازنویسی در قالب نثر):
- *Impersonation:* $\gamma_i$ و $D_{IDR}$ را TA به‌صورت امن و آفلاین تعیین می‌کند، پس بدون نفوذ به TA به دست نمی‌آیند (§5.1).
- *Message modification:* $m_i$ از طریق $\delta_i$ به $\eta_i$ گره خورده است و یافتن $a_i$ از $A_i$ به DLP برمی‌گردد (§5.2).
- *Fake message:* برای ساختن $\wp$ دانستن $\mu_i$ و $\lambda_i$ لازم است (§5.3).
- *Unlinkability:* برای هر پیام امضای جدید با $a_i$ تصادفی ساخته می‌شود، پس «complete unlinkability between the successive messages» (§5.4).
- *Replay:* مهر زمانی؛ پیامی که دیرتر از بازه‌ی مشخص برسد دور ریخته می‌شود (§5.5). در متن همه‌جا «reply attack» نوشته شده که غلط تایپی replay است.
- *Conditional privacy:* فقط شناسه‌های ساختگی استفاده می‌شوند. اگر شناسه‌ی ساختگی افشا شود، مهاجم «zero knowledge about the real identity» دارد (§5.7).
- *Non-repudiation:* اعتبارنامه‌ها پس از ثبت‌نام آفلاین از TA گرفته می‌شوند، پس قابل انکار نیستند (§5.8).

**مقایسه‌ی هزینه‌ی محاسباتی** (Table 4، p. 14؛ واحد ms):

| طرح | یک کاربر و یک RSU | n کاربر و n RSU |
|---|---|---|
| Azees et al. [35] (EAAP 2017) | $2Ex_p+5Ex_m$ = 17.8 | $(1+n)Ex_p+5nEx_m$ |
| X. Lin et al. [36] (GSIS 2007) | $3Ex_p+9Ex_m$ = 30.3 | $3nEx_p+(3+6n)Ex_m$ |
| Zhang et al. [37] (INFOCOM 2008) | $3Ex_p+4Ex_m+3Ex_h$ = 18.33 | $3nEx_p+(2n+2)Ex_m+3nEx_h$ |
| R. Lu et al. [38] (TVT 2012) | $4Ex_p+10Ex_m$ = 35.6 | $(3+n)Ex_p+(4+6n)Ex_m$ |
| BAIV | $4Ex_m+Ex_p+Ex_a+3Ex_{xor}$ = 12.54 | $4nEx_m+nEx_p+nEx_a+3nEx_{xor}$ |

- بازمحاسبه‌ی نگارنده با زمان‌های پایه‌ی p. 14 هر پنج عدد را تأیید می‌کند. مثلاً $4(2.4)+2.9+0.011+3(0.01)=12.541$.
- ⚠ **تناقض داخلی مقاله:** در p. 14 نوشته شده «four pairing operations, a one-point multiplication operation…». فرمول و عدد 12.54 و متن p. 16 («only one pairing operation, a four-point multiplication operation») نشان می‌دهند درستش **۱ pairing و ۴ point multiplication** است. در گزارش نسخه‌ی درست را بیاورید.
- ⚠ برای حالت n، متن p. 16 «4n pairing operations, n point multiplication» می‌گوید که باز با فرمول $4nEx_m+nEx_p$ ناسازگار است.
- ادعای ظرفیت: «in one second of time, the RSU can authenticate approximately 80 vehicle users. Thus, in one minute, an RSU can authenticate nearly 4800 vehicle users.» (p. 14–15)
- برای 100 کاربر: «our scheme requires 1291 ms, whereas the other existing schemes consume more than 1375 ms» (p. 16).
- **توجه:** 100 × 12.54 = 1254 ms است، نه 1291. مقاله این اختلاف را توضیح نمی‌دهد. یک فرض این است که عدد 1291 از شبیه‌سازی آمده و 1254 از فرمول، اما این فقط حدس است. اگر 1291 را نقل کردید، به Figure 7 ارجاع دهید.
- ⚠ از Figure 7 به‌صورت متنی فقط محور y (0–2500 ms) و n = 20…100 قابل خواندن است. مقادیر میله‌ها را از شکل نخوانده‌ام.

**ظرفیت سرویس‌دهی RSU** (§6.2، p. 17، ⚠ متن درهم):
- $\mathbb{N}$ تعداد کاربران تصدیق‌شده، $p$ احتمال سرویس و $\Delta=12.54$ ms است. فرمول $RSU_{ser}=\frac{p}{\mathbb{N}\cdot\Delta\cdot\mathbb{N}}$ است (⚠ شکل دقیق کسر از متن درهم بازسازی شده).
- Figure 8 نشان می‌دهد با افزایش تعداد کاربران، زمان محاسبه بالا می‌رود و نسبت سرویس‌دهی RSU کاهش می‌یابد.
- استقرار RSU: «the RSU should be placed every 300 m» (p. 16).

**مشاهدات انتقادی نگارنده** (ادعای مقاله نیستند؛ اگر در گزارش استفاده می‌شوند، باید به‌عنوان تحلیل مؤلف گزارش آورده شوند و ترجیحاً با منبع دیگری تأیید شوند):
1. معادله‌ی تأیید پیام $\eta_iT_{pub}=\delta_i(A_i+\wp)$ هیچ مؤلفه‌ای را که به کلید یا اعتبارنامه‌ی ثبت‌شده‌ی فرستنده وابسته باشد بررسی نمی‌کند. $\wp$ و $A_i$ را خود فرستنده می‌فرستد و $D_{IDv}$ در معادله نمی‌آید. در ظاهر هر کسی با انتخاب دلخواه $a_i,\mu_i,\lambda_i$ می‌تواند tuple معتبر بسازد. این تردید جدی‌ای درباره‌ی ادعای §5.3 است، ولی فقط تحلیل نگارنده است و تأیید مستقل نشده.
2. «امضا» با $\theta_i=(A_i,m_i)$ تعریف شده که تعریف متعارف امضا نیست. همچنین در §1 (p. 3) امضای دیجیتال به‌صورت «encrypted using the sender's public key and decrypted using the sender's private key» توصیف شده که وارونه‌ی تعریف استاندارد است.
3. ادعای «بدون TA» فقط برای مرحله‌ی تأیید درست است. ثبت‌نام، نگهداری نگاشت هویت واقعی و ابطال همگی وابسته به TA هستند.

### ۳.۲ بخش گزارش: BPAS (`report.tex` خطوط 726–735)

- BAIV در کارهای مرتبط درباره‌ی BPAS می‌گوید: «Qi Feng et al. [20] suggested a scheme based on blockchain technology associated with the VANET system. The process is highly scalable and provides automatic authentication for vehicle users. If any malicious users are found in the network, they will be revoked by the trusted authority. Though security is enhanced in this work, it is vulnerable to reply attacks.» (§2، p. 3)
- این جمله را می‌شود به‌عنوان یک نقد ثانویه آورد: «به گفته‌ی Maria et al.، BPAS در برابر حمله‌ی بازپخش آسیب‌پذیر است». این ادعای BAIV است و در این یادداشت مستقلاً بررسی نشده.

### ۳.۳ بخش گزارش: GSIS (`report.tex` خطوط 748–755)

- GSIS همان طرح «X. Lin et al. [36]» در جدول مقایسه‌ی BAIV است: یک کاربر و یک RSU با $3Ex_p+9Ex_m$ = **30.3 ms** و حالت n با $3nEx_p+(3+6n)Ex_m$ (Table 4، p. 14). از این عدد می‌شود برای مقایسه‌ی کمی GSIS و BAIV در نثر استفاده کرد، با این قید که زمان‌ها روی سکوی آزمایشی BAIV اندازه‌گیری شده‌اند.

### ۳.۴ بخش گزارش: کارهای مرتبط بلاکچینی (اختیاری، برای پاراگراف پیشینه)

خلاصه‌ی نقدهای BAIV بر کارهای دیگر (§2، p. 3–4)، همه به‌عنوان ادعای BAIV:
- BARS (Lu et al. 2018 [17]): «communication cost and computational analysis are very high»
- Lu et al. 2019 [19]: چند گواهی و هزینه‌ی محاسباتی بالا
- Kouicem et al. [21]: consortium blockchain با «storage cost… high»
- Ma et al. [22]: مدیریت کلید با چندجمله‌ای دومتغیره و «considerable latency»
- BCPPA (Lin et al. 2020 [24]): هزینه‌ی بالای تولید و تأیید گواهی
- BUA (Liu et al. [26]): «latency and storage costs»

## ۴. بررسی ادعاهای فعلی گزارش

| خط | ادعا | حکم | locator | اصلاح پیشنهادی |
|---|---|---|---|---|
| 739 | BAIV تصدیق هویت ناشناس و حفظ یکپارچگی پیام را ترکیب می‌کند | پشتیبانی‌شده | Title؛ Abstract p. 1؛ §4.4، §4.6 | — (می‌توان «و ابطال شرطی» را هم افزود) |
| 742 | انتقال ایمن: تصدیق هویت بدون مرجع قابل اعتماد | جزئی | Abstract p. 1؛ §4.4 p. 9 | «تصدیق هویت در زمان اتصال به RSU بدون دخالت برخط TA و با بررسی مقدار ثبت‌شده در بلاکچین؛ TA همچنان برای ثبت‌نام آفلاین و ابطال لازم است». برچسب «انتقال ایمن» هم بهتر است «handover بدون تصدیق مجدد» شود، چون ادعای اصلی مقاله حذف re-authentication است (§1 p. 2؛ p. 16). |
| 743 | حریم خصوصی شرطی: لغو خودروهای مخرب در صورت اختلاف | پشتیبانی‌شده | Abstract p. 1؛ §4.7 p. 10؛ §5.6–5.7 p. 13 | سازوکار را هم ذکر کنید: شناسه‌ی ساختگی $D_{IDv}$ که فقط TA آن را به هویت واقعی نگاشت می‌کند، و block list در RSUها. |
| 744 | حفظ یکپارچگی: جلوگیری از دستکاری پیام‌ها | پشتیبانی‌شده (ادعای مقاله) | §4.6 p. 10؛ §5.2 p. 12 | پیشنهاد می‌شود تصریح کنید که این ادعا فقط استدلال غیررسمی دارد (مشاهده‌ی ۱ در §۳.۱). |
| 745 | کارایی بالا: استفاده از رمزنگاری منحنی بیضوی | جزئی | §1 p. 2–3؛ §6.1 p. 14 | ECC همراه با bilinear pairing استفاده شده است. کارایی را با عدد بیان کنید: 12.54 ms برای یک کاربر و یک RSU در برابر 17.8 تا 35.6 ms در چهار طرح دیگر (Table 4)، و حدود 80 تصدیق در ثانیه. دلیل اصلی کارایی به گفته‌ی مقاله حذف تصدیق مجدد و تنها یک pairing است، نه صرفاً ECC (p. 16). |

## ۵. اصطلاحات

| English | فارسی |
|---|---|
| Anonymous authentication | تصدیق هویت ناشناس |
| Integrity preservation | حفظ یکپارچگی |
| Conditional privacy / conditional anonymity | حریم خصوصی شرطی / ناشناسی شرطی |
| Conditional tracking | ردیابی شرطی |
| Revocation / block list | ابطال / فهرست مسدودی |
| Re-authentication | تصدیق هویت مجدد |
| Handover authentication | تصدیق هویت هنگام دست‌به‌دست شدن (handover) |
| Authentication receipt (AR) | رسید تصدیق هویت |
| Dummy identity | شناسه‌ی ساختگی (مستعار) |
| Trusted Authority (TA) | مرجع مورد اعتماد |
| Roadside Unit (RSU) / Onboard Unit (OBU) | واحد کنار جاده‌ای / واحد درون‌خودرویی |
| Bilinear pairing | نگاشت دوخطی (جفت‌سازی) |
| Point multiplication / point addition | ضرب نقطه‌ای / جمع نقطه‌ای |
| Discrete Logarithm Problem (DLP) | مسئله‌ی لگاریتم گسسته |
| Impersonation / masquerading / forgery attack | حمله‌ی جعل هویت / نقاب‌زنی / جعل امضا |
| Replay attack («reply» در متن مقاله) | حمله‌ی بازپخش |
| Non-repudiation | انکارناپذیری |
| Unlinkability | پیوندناپذیری |
| Computational cost / communication cost | هزینه‌ی محاسباتی / هزینه‌ی ارتباطی |
| RSU serving capability | ظرفیت سرویس‌دهی RSU |

## ۶. شکل‌ها و جداول قابل استفاده

با مجوز CC BY 4.0 می‌توان آن‌ها را با ذکر منبع بازتولید کرد.

- **Figure 1 (p. 5): مدل سیستم.** TA، بلاکچین، RSUها، خودروها، ارتباط V2V و V2R و ثبت‌نام آفلاین اولیه. برای توضیح معماری مفید است.
- **Figure 2 (p. 6): زنجیره‌ی بلاک‌ها.** previous hash، Merkle root و block hash. برای بخش مبانی بلاکچین گزارش مناسب است، هرچند شکل عمومی است.
- **Table 1 (p. 8): فهرست نمادها.** اگر فازها با فرمول بازنویسی شوند، به کار می‌آید.
- **Table 2 (p. 10–11) و Table 3 (p. 11–12): نمودار گردش پیام.** شامل راه‌اندازی، ثبت‌نام، تصدیق خودرو و RSU و ارسال پیام است. ⚠ در استخراج متنی درهم بودند و بهتر است از نسخه‌ی HTML یا تصویر PDF استفاده شود.
- **Table 4 (p. 14): مقایسه‌ی هزینه‌ی تصدیق.** پنج طرح در حالت تک و حالت n. بهترین گزینه برای یک جدول مقایسه‌ای در گزارش است (بازنویسی‌شده در §۳.۱ بالا).
- **Figures 3–5 (p. 15):** نتایج شبیه‌سازی تصدیق خودرو، تصدیق RSU و ارسال پیام (اسکرین‌شات خروجی‌اند و ارزش کمی محدودی دارند).
- **Figure 6 (p. 16):** خروجی شبیه‌سازی هزینه‌ی طرح‌ها.
- **Figure 7 (p. 17):** نمودار هزینه‌ی محاسباتی بر حسب n = 20…100 برای پنج طرح.
- **Figure 8 (p. 18):** ظرفیت سرویس‌دهی RSU.
