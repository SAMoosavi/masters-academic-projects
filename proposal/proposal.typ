// Persian academic proposal — Typst
// Font: Vazirmatn (available on this system)

#set document(title: "امضای تجمیعی بدون گواهی بدون جفت‌سازی برای شبکه اقتضایی خودرویی", author: "")
#set page(paper: "a4", margin: (x: 2.5cm, y: 2.5cm), numbering: "1", number-align: center)
#set text(font: ("Vazirmatn", "Noto Sans Arabic"), size: 11pt, dir: rtl)
#set heading(numbering: "1.")
#set par(justify: true, leading: 0.8em, first-line-indent: 1.5em)
#show heading: set par(first-line-indent: 0em)

// ─── Title ────────────────────────────────────────────────────────────
#align(center)[
  #v(1cm)
  #text(size: 18pt, weight: "bold")[
    طراحی امضای تجمیعی بدون گواهی بدون جفت‌سازی\
    با قابلیت تشخیص سریع امضای مخرب\
    برای شبکه‌های اقتضایی خودرویی
  ]
  #v(0.8cm)
  #text(size: 12pt)[
    پیشنهاد پژوهشی — کارشناسی ارشد
  ]
  #v(2cm)
]

// ═══════════════════════════════════════════════════════════════════════
// Section 1
// ═══════════════════════════════════════════════════════════════════════
= شرح مسئله

== تعریف شبکه اقتضایی خودرویی (#text(dir: ltr)[VANET])

شبکه اقتضایی خودرویی (#text(dir: ltr)[Vehicular Ad-hoc Network — VANET]) زیرساخت ارتباطی سیستم‌های حمل‌ونقل هوشمند (#text(dir: ltr)[ITS]) است که در آن خودروها و واحدهای کنار جاده‌ای (#text(dir: ltr)[RSU]) از طریق کانال باز بی‌سیم #text(dir: ltr)[DSRC] (استاندارد #text(dir: ltr)[IEEE] 802.11p) با یکدیگر تعامل دارند @cahyadiComprehensiveSurveyCertificateless2022. هر خودرو مجهز به واحد روی خودرو (#text(dir: ltr)[OBU]) است و ارتباطات در دو حالت ارتباط خودرو با خودرو (#text(dir: ltr)[V2V]) و ارتباط خودرو با زیرساخت (#text(dir: ltr)[V2I]) انجام می‌شود. خودروها به‌صورت دوره‌ای هر ۱۰۰ تا ۳۰۰ میلی‌ثانیه پیام‌های وضعیت شامل موقعیت، سرعت، جهت حرکت و وضعیت جاده را پخش می‌کنند @vallentEfficientCertificatelessAggregate2021. در شرایط ترافیکی پرتراکم، هر واحد کنار جاده‌ای (#text(dir: ltr)[RSU]) باید حدود ۱۰۰۰ تا ۲۰۰۰ پیام در ثانیه را دریافت و تأیید کند @cahyadiCertificatelessAggregateSignature2022.

== اهمیت احراز هویت و یکپارچگی پیام‌ها

از نگاه امنیتی، سه ویژگی اصالت (#text(dir: ltr)[authentication])، یکپارچگی (#text(dir: ltr)[integrity]) و انکارناپذیری (#text(dir: ltr)[non-repudiation]) برای پیام‌های #text(dir: ltr)[VANET] ضروری است. پیام‌های جعلی و نامعتبر می‌تواند باعث اختلال در شبکه، ایجاد هرج و مرج ترافیکی و در نتیجه تصادفات و خطرات جانی شود @shimSecurityAggregateSignature2026. بنابراین مکانیزمی برای اطمینان از صحت فرستنده پیام و جلوگیری از جعل ضروری است.

== محدودیت‌های راه‌حل‌های موجود

=== امضای دیجیتال سنتی (#text(dir: ltr)[PKI])
امضاهای دیجیتال سنتی مبتنی بر زیرساخت کلید عمومی (#text(dir: ltr)[PKI]) نیاز به گواهی دیجیتال دارند که لازمه آن مراجعه به یک فرد معتمد (#text(dir: ltr)[CA]) و بررسی صحت گواهی است. در شبکه‌های اقتضایی خودرویی با تعداد زیاد خودرو و نرخ پیام‌های بالا، سربار مدیریت گواهی‌ها به‌شدت سنگین می‌شود @cahyadiComprehensiveSurveyCertificateless2022.

=== امضای مبتنی بر هویت (#text(dir: ltr)[IBS])
امضاهای مبتنی بر هویت (#text(dir: ltr)[Identity-Based Signature]) که توسط #text(dir: ltr)[Shamir] @shamirIdentityBasedCryptosystems1984 معرفی شد و سپس رمزنگاری مبتنی بر هویت توسط #text(dir: ltr)[Boneh و Franklin] @bonehIdentityBasedEncryption2001 به‌صورت کاربردی درآمد، با چالش امنیتی #text(dir: ltr)[key escrow] مواجه‌اند؛ شخص مرجع کلید خصوصی کاربران را در اختیار دارد و می‌تواند به نام دیگران امضا تولید کند @gongPCASCryptanalysisImprovement2023.

=== امضای بدون گواهی (#text(dir: ltr)[CLS]) و امضای تجمیعی بدون گواهی (#text(dir: ltr)[CLAS])
رمزنگاری بدون گواهی (#text(dir: ltr)[Certificateless Public Key Cryptography — CL-PKC]) که توسط #text(dir: ltr)[Al-Riyami] و #text(dir: ltr)[Paterson] @alriyamiCertificatelessPublicKey2003 معرفی شد، با ترکیب یک #text(dir: ltr)[partial private key] از #text(dir: ltr)[KGC] و یک #text(dir: ltr)[secret value] انتخابی توسط خود کاربر، هر دو مشکل مدیریت گواهی و #text(dir: ltr)[key escrow] را هم‌زمان حل می‌کند @hanECLASEfficientPairingFree2022. امضای تجمیعی (#text(dir: ltr)[Aggregate Signature]) که توسط #text(dir: ltr)[Boneh] و همکاران @bonehAggregateVerifiablyEncrypted2003 معرفی شد، امضاهای n کاربر روی پیام‌های مختلف را در یک امضای واحد تجمیع می‌کند تا زمان تأیید دسته‌ای و طول امضا کاهش یابد. ترکیب این دو، خانواده #text(dir: ltr)[CLAS] را می‌سازد @hanECLASEfficientPairingFree2022.

== چرا بدون جفت‌سازی (#text(dir: ltr)[Pairing-Free])؟

محاسبه #text(dir: ltr)[bilinear pairing] گران‌ترین عملیات رمزنگاری است: در بنچمارک #text(dir: ltr)[Tate pairing] حدود ۳.۲۱ میلی‌ثانیه در برابر ۰.۳۹ میلی‌ثانیه ضرب اسکالری (حدود ۸ برابر کندتر) @cahyadiCertificatelessAggregateSignature2022. در اندازه‌گیری‌های #text(dir: ltr)[MIRACL] یک #text(dir: ltr)[pairing] حدود ۴.۴ تا ۴.۶ میلی‌ثانیه هزینه دارد در حالی که #text(dir: ltr)[scalar multiplication] روی #text(dir: ltr)[ECC] تنها ۰.۱۷ تا ۰.۶ میلی‌ثانیه @gongPCASCryptanalysisImprovement2023 @wuSecurityenhancedCertificatelessAggregate2025. حذف #text(dir: ltr)[pairing] بزرگ‌ترین اهرم سرعت است؛ طرح #text(dir: ltr)[BLS] @bonehShortSignaturesWeil2004 نمونه کلاسیک امضای کوتاه مبتنی بر جفت‌سازی است و طرح‌های #text(dir: ltr)[pairing-free] مبتنی بر #text(dir: ltr)[ECC] جریان غالب ادبیات این حوزه هستند @lodeComprehensiveReviewECCbased2026a.

== چالش‌های اصلی و مسئله‌های باز

علیرغم پیشرفت‌های اخیر، سه مشکل اصلی برای امضاهای تجمیعی بدون گواهی بدون جفت‌سازی (#text(dir: ltr)[PF-CLAS]) باقی مانده است:

=== یافتن امضای مخرب در بین هزاران امضا
یکی از مشکلات جدی طرح‌های تجمیعی این است که اگر یک فرد امضای مخربی بفرستد (امضایی که در بررسی صحت به شکست منجر شود)، کل امضا شکست می‌خورد و نیاز است تا آن امضا پیدا شود و از جمع امضاها حذف شود. در طرح‌های موجود یا این کار انجام نمی‌شود یا با الگوریتم #text(dir: ltr)[O(n)] بازتأیید تک‌به‌تک انجام می‌شود که کند است @wangPrivacypreservingCertificatelessAggregate2025 @wuSecureEfficientCertificateless2025.

=== ضعف در برابر حملات
حملات متنوعی شامل #text(dir: ltr)[Type-I] (جایگزینی کلید عمومی)، #text(dir: ltr)[Type-II] (#text(dir: ltr)[KGC] مخرب)، #text(dir: ltr)[Type-III] (ائتلاف #text(dir: ltr)[signer]ها)، #text(dir: ltr)[rogue key] و ائتلاف #text(dir: ltr)[KGC] با #text(dir: ltr)[signer] وجود دارد و هنوز طرح امضای محکم و قوی‌ای برای #text(dir: ltr)[PF-CLAS] مطرح نشده است @shimSecurityAnalysisConditional2023 @yueLightweightCertificatelessAggregate2025.

=== ضعف در اثبات
طرح‌های موجود امنیت خود را عمدتاً در مدل پیشگوی تصادفی (#text(dir: ltr)[ROM]) اثبات می‌کنند که اثبات دقیق و کاملی ارائه نمی‌دهد. انتقال به مدل استاندارد یا حداقل #text(dir: ltr)[reduction tight] بدون #text(dir: ltr)[forking lemma] همچنان یک چالش باقی مانده است @wangConditionalPrivacyPreservingCertificateless2022 @zhangEfficientPairingFreeCertificateless2024.

// ═══════════════════════════════════════════════════════════════════════
// Section 2
// ═══════════════════════════════════════════════════════════════════════
= پیشینه پژوهش

بررسی جامع اخیر @vermaCertificatelessAggregateSignatures2024 نشان می‌دهد که امضاهای تجمیعی بدون گواهی (#text(dir: ltr)[CLAS]) در حوزه‌های #text(dir: ltr)[IoT]، #text(dir: ltr)[VANET] و سلامت الکترونیک کاربرد گسترده‌ای دارند. در ادامه، تحول این حوزه به‌صورت زمانی مرور می‌شود.

== سال‌های ۲۰۱۴ تا ۲۰۱۹: تحلیل امنیتی و شکست طرح‌های اولیه

نخستین تحلیل جدی امضاهای تجمیعی بدون گواهی توسط #text(dir: ltr)[Zhang] و همکاران @zhangNotesSecurityCertificateless2014 در سال ۲۰۱۴ ارائه شد. آن‌ها چهار حمله متنوع شامل #text(dir: ltr)[KGC] صادق-اما-کنجکاو، #text(dir: ltr)[KGC] مخرب-اما-منفعل، ائتلاف #text(dir: ltr)[signer]ها و ائتلاف #text(dir: ltr)[signer] با #text(dir: ltr)[KGC] را بر طرح #text(dir: ltr)[Xiong] @xiongEfficientCertificatelessAggregate2013 نشان دادند و نتیجه گرفتند که «صحت تجمیع باید معادل صحت تک‌تک امضاها باشد». در سال ۲۰۱۹، #text(dir: ltr)[Pakniat] @pakniatSecurityAnalysisLightweight2019 دو طرح #text(dir: ltr)[CLS] سبک را با جعل #text(dir: ltr)[partial private key] و جعل امضا به‌دلیل خطی‌بودن ساختار هش شکست.

== سال ۲۰۲۲: ظهور طرح‌های کاربردی برای #text(dir: ltr)[VANET]

در سال ۲۰۲۲ چندین طرح مهم مطرح شد. #text(dir: ltr)[Cahyadi] و همکاران @cahyadiCertificatelessAggregateSignature2022 اولین طرح #text(dir: ltr)[CLAS] مبتنی بر جفت‌سازی را برای #text(dir: ltr)[VANET] پیشنهاد کردند که در آن تأیید تجمعی با ۳ عملیات #text(dir: ltr)[pairing] ثابت انجام می‌شد و #text(dir: ltr)[pseudonym] یک‌بارمصرف برای حفظ حریم خصوصی استفاده می‌شد؛ اما زمان امضا ۱.۱۷ میلی‌ثانیه و زمان تأیید ۱۰.۴۱ میلی‌ثانیه بود که برای شبکه‌های پرتراکم کند محسوب می‌شد.

همزمان، #text(dir: ltr)[Han] و همکاران @hanECLASEfficientPairingFree2022 طرح #text(dir: ltr)[eCLAS] را معرفی کردند که اولین طرح #text(dir: ltr)[pairing-free] مبتنی بر #text(dir: ltr)[ECC] برای #text(dir: ltr)[VANET] بود. این طرح از تجمیع روی پیام‌های مختلف از خودروهای مختلف (#text(dir: ltr)[V2I]) پشتیبانی می‌کرد و مزیت آشکاری در زمان تأیید نسبت به طرح‌های جفت‌سازی‌محور داشت. امنیت آن در مدل پیشگوی تصادفی (#text(dir: ltr)[ROM]) تحت فرض #text(dir: ltr)[ECDLP] اثبات شد، اما طرح فاقد تشخیص متقلب بود و در برابر بازیابی #text(dir: ltr)[master key] آسیب‌پذیر بود.

#text(dir: ltr)[Wang] و همکاران @wangConditionalPrivacyPreservingCertificateless2022 اولین طرح #text(dir: ltr)[CLAS] در مدل استاندارد (#text(dir: ltr)[Standard Model]) را ارائه کردند که از تجمیع کامل (#text(dir: ltr)[full aggregation]) با ۲ عملیات #text(dir: ltr)[pairing] ثابت بهره می‌برد. با وجود اثبات امنیت بالاتر، این طرح توسط #text(dir: ltr)[Yuan] در سال ۲۰۲۳ با حملات #text(dir: ltr)[KGC] و جایگزینی کلید عمومی شکسته شد.

== سال ۲۰۲۳: بهبود امنیت و تحلیل شکست

#text(dir: ltr)[Gong] و همکاران @gongPCASCryptanalysisImprovement2023 طرح #text(dir: ltr)[PCAS] را معرفی کردند که حمله جعل بر طرح #text(dir: ltr)[LICLAS] (امضای تجمیعی بدون گواهی سبک برای شبکه‌های حسگر بی‌سیم پزشکی) را نشان داد و طرح ترمیمی بدون #text(dir: ltr)[pairing] و بدون #text(dir: ltr)[map-to-point] ارائه کرد. در این طرح از مکانیزم #text(dir: ltr)[pseudonym] با ردیابی توسط مرجع (#text(dir: ltr)[TA]) استفاده شد. زمان امضا ۰.۱۷ میلی‌ثانیه و زمان تأیید ۰.۶۷ میلی‌ثانیه بود و سربار انتقال ۲۵ درصد کاهش یافت. امنیت آن تحت #text(dir: ltr)[EUF-CMA] در #text(dir: ltr)[ROM] برای دشمنان #text(dir: ltr)[Type] I/II اثبات شد، اما پس از شکست تأیید تجمعی، بازتأیید #text(dir: ltr)[O(n)] تک‌به‌تک ضروری بود.

#text(dir: ltr)[Zheng] و همکاران @zhengSecurityEnhancedPairingFreeCertificateless2023 طرح #text(dir: ltr)[Han] @hanECLASEfficientPairingFree2022 را بهبود دادند و نقص بازیابی #text(dir: ltr)[master key] آن را رفع کردند. در این طرح از #text(dir: ltr)[PID] متغیر و ردیابی فقط توسط #text(dir: ltr)[TA] استفاده شد. زمان امضا حدود ۰.۹۸ میلی‌ثانیه و زمان تأیید حدود ۳.۹۰ میلی‌ثانیه بود. با این حال، طرح همچنان فاقد تشخیص امضای بد در حالت تأیید دسته‌ای بود.

#text(dir: ltr)[Shim] @shimSecurityAnalysisConditional2023 حمله #text(dir: ltr)[KGC] مخرب-اما-منفعل بر طرح #text(dir: ltr)[Wang] @wangConditionalPrivacyPreservingCertificateless2022 (CLAS) و جعل/استخراج کلید بر طرح #text(dir: ltr)[Xiong] @xiongEfficientCertificatelessAggregate2013 (CLS) را نشان داد و درس‌هایی برای طراحی امن‌تر ارائه کرد.

== سال ۲۰۲۵: تمرکز بر کارایی و مقاومت در برابر حملات

در سال ۲۰۲۵ چندین طرح مهم مطرح شد. #text(dir: ltr)[Yue] و همکاران @yueLightweightCertificatelessAggregate2025 حمله #text(dir: ltr)[ephemeral rogue key] بر طرح #text(dir: ltr)[Zheng] @zhengSecurityEnhancedPairingFreeCertificateless2023 را کشف کردند و آن را با امضای #text(dir: ltr)[aggregator] و تأیید هم‌زمان (#text(dir: ltr)[dual-layer]) رفع کردند. این طرح کاهش حدود ۵۰.۹ درصدی در زمان تأیید امضای تجمیعی برای n=۱۰۰ نسبت به طرح #text(dir: ltr)[Zheng] @zhengSecurityEnhancedPairingFreeCertificateless2023 نشان داد و در برابر حملات #text(dir: ltr)[rogue key] و ائتلاف مقاوم بود، اما کمی گران‌تر از طرح #text(dir: ltr)[Zheng] @zhengSecurityEnhancedPairingFreeCertificateless2023 بود.

#text(dir: ltr)[Wu] و #text(dir: ltr)[Ye] @wuSecureEfficientCertificateless2025 طرحی ارائه کردند که همه پارامترها را در تابع هش گنجاند و مقاومت در برابر حملات #text(dir: ltr)[Type]-I/II/III را با استفاده از #text(dir: ltr)[generalized forking lemma] اثبات کرد. سربار محاسباتی کمتر از ۷ طرح #text(dir: ltr)[PF-CLAS] موجود بود و شبیه‌سازی با #text(dir: ltr)[MIRACL] عملکرد واقعی را تأیید کرد. با این حال، تشخیص امضای نامعتبر را «بیش‌ازحد پرهزینه» دانست و آن را به کار آینده واگذار کرد — دقیقاً همان شکافی که پژوهش حاضر آن را پر می‌کند.

#text(dir: ltr)[Wang] و همکاران @wangECAEEfficientCertificateless2025 طرح #text(dir: ltr)[ECAE] را برای محیط #text(dir: ltr)[NDN-IoT] معرفی کردند که #text(dir: ltr)[CLAS] بدون جفت‌سازی با امضای تجمیعی طول ثابت بود. کاهش ۴۶.۱۸ درصدی هزینه محاسباتی و ۵۵.۵۶ درصدی هزینه ارتباطی نسبت به طرح‌های موجود نشان داده شد، اما طرح فاقد مکانیزم تشخیص متقلب بود.

#text(dir: ltr)[Wang] و همکاران @wangPrivacypreservingCertificatelessAggregate2025 تنها طرحی بودند که الگوریتم تشخیص امضای نامعتبر با تقسیم‌وجستجو (#text(dir: ltr)[divide-and-conquer]) ارائه کردند که هویت متقلب را توسط #text(dir: ltr)[TRA] فاش می‌کند. با این حال، این طرح مبتنی بر جفت‌سازی بود (۴ عملیات #text(dir: ltr)[pairing]) و زمان امضا حدود ۲۷.۹۴ میلی‌ثانیه بود که برای #text(dir: ltr)[VANET] پرتراکم گران است.

#text(dir: ltr)[Yuan] و همکاران @yuanNewConditionalPrivacyPreserving2023 تحلیل #text(dir: ltr)[cryptanalysis] طرح #text(dir: ltr)[Wang] @wangConditionalPrivacyPreservingCertificateless2022 را ارائه کردند و طرح بهبودیافته‌ای در مدل استاندارد پیشنهاد کردند، اما همچنان از جفت‌سازی در تأیید استفاده می‌کردند (~۲۴.۲ میلی‌ثانیه).

== سال ۲۰۲۶: چالش‌های جدید و معماری نسل جدید

#text(dir: ltr)[Tao] و #text(dir: ltr)[Cui] @taoESCLASEfficientCerificateless2026 طرح #text(dir: ltr)[ES-CLAS] را معرفی کردند که تجمیع کامل (#text(dir: ltr)[full aggregation]) با #text(dir: ltr)[hash] عمومی و ردیابی شرطی سبک ارائه می‌کرد. کاهش حداقل ۲۴.۳ درصدی هزینه محاسباتی و طول پیام ۱۶۸ بایت نتایج مطلوبی بود، اما مدل امنیتی ضعیف و نبود تشخیص متقلب از نقاط ضعف آن بود.

#text(dir: ltr)[Shim] و #text(dir: ltr)[Kwon] @shimSecurityAggregateSignature2026 حمله #text(dir: ltr)[Type-I] بر طرح‌های #text(dir: ltr)[Zhu-Guan] @zhuLatticeBasedCertificatelessAggregate2025 و #text(dir: ltr)[Chen-Guan] @chenCPPCLASEfficientConditional2022 را نشان دادند و نتیجه گرفتند که «معماری خطی #text(dir: ltr)[hash-dependent] نمی‌تواند تعادل امنیت/تأخیر/مقیاس‌پذیری 5G-#text(dir: ltr)[V2X] و 6G را بدهد» و طراحی نسل جدید #text(dir: ltr)[CLAS] ضروری است.

== جمع‌بندی نقاط قوت و ضعف

=== نقاط قوت

بررسی طرح‌های موجود نشان می‌دهد که اکثر آن‌ها ویژگی‌های مشترک مثبتی دارند. نخست، حذف عملیات گران‌بها #text(dir: ltr)[bilinear pairing] و جایگزینی آن با ضرب اسکالری ساده روی منحنی بیضوی (#text(dir: ltr)[ECC]) بزرگ‌ترین اهرم کاهش هزینه محاسباتی است. دوم، استفاده از مکانیزم #text(dir: ltr)[pseudonym] برای حفظ حریم خصوصی شرطی (#text(dir: ltr)[conditional privacy]) و امکان ردیابی هویت متقلب توسط مرجع ردیابی (#text(dir: ltr)[TRA]) در صورت لزوم. سوم، اثبات امنیت در مدل پیشگوی تصادفی (#text(dir: ltr)[ROM]) تحت فرض‌های استاندارد #text(dir: ltr)[ECDLP] یا #text(dir: ltr)[CDHP] با مدل دوگانه دشمنان #text(dir: ltr)[Type]-I/II.

=== نقاط ضعف

علی‌رغم این پیشرفت‌ها، پنج ضعف اساسی در طرح‌های موجود مشاهده می‌شود:

*اول — نبود تشخیص سریع متقلب.* تقریباً تمام طرح‌ها پس از شکست تأیید تجمعی، فاقد الگوریتمی کارآمد برای یافتن امضای مخرب هستند. در این حالت باید تمام n امضا را یکی‌یکی بازتأیید کرد که پیچیدگی #text(dir: ltr)[O(n)] دارد و برای شبکه‌های پرتراکم غیرعملی است.

*دوم — شکست پس از انتشار.* بسیاری از طرح‌ها پس از انتشار توسط محققان دیگر با حملات #text(dir: ltr)[cryptanalysis] شکسته شده‌اند. این نشان‌دهنده ضعف در فرآیند طراحی و اثبات امنیت است.

*سوم — آسیب‌پذیری در برابر حملات متنوع.* حملات #text(dir: ltr)[rogue key] (کلید مخرب موقت)، ائتلاف #text(dir: ltr)[signer]ها و حمله #text(dir: ltr)[KGC] مخرب همچنان تهدیدات جدی محسوب می‌شوند و هنوز طرحی که در برابر همه آن‌ها مقاوم باشد ارائه نشده است.

*چهارم — ضعف در مدل اثبات.* اکثر اثبات‌ها فقط در مدل پیشگوی تصادفی (#text(dir: ltr)[ROM]) ارائه شده‌اند و انتقال به مدل استاندارد یا اثبات با کاهش سفت (#text(dir: ltr)[reduction tight]) بدون استفاده از #text(dir: ltr)[forking lemma] همچنان یک چالش باقی مانده است.

*پنجم — معمای فشردگی.* امضاهای تجمیعی فشرده و کوتاه در برابر حمله #text(dir: ltr)[universal forgery] آسیب‌پذیر هستند، زیرا ساختار فشرده امکان جعل امضا را آسان‌تر می‌کند.

// ═══════════════════════════════════════════════════════════════════════
// Section 3
// ═══════════════════════════════════════════════════════════════════════
= پرسش‌های پژوهش و ایده‌های پیشنهادی

== پرسش‌های اصلی پژوهش

با توجه به مسئله‌های باز مطرح‌شده برای امضاهای تجمیعی بدون گواهی بدون جفت‌سازی، پرسش‌های اصلی این پژوهش عبارتند از:

+ چگونه می‌توان الگوریتمی کارا برای تشخیص سریع امضای مخرب پس از شکست تأیید تجمعی طراحی کرد به‌گونه‌ای که به‌جای بازتأیید #text(dir: ltr)[O(n)] تک‌به‌تک، در #text(dir: ltr)[O(log n)] امضای بد را یافت؟
+ چگونه می‌توان طرحی ارائه داد که هم از #text(dir: ltr)[pseudonym] بهره ببرد، هم توانایی ردیابی شرطی هویت متقلب توسط #text(dir: ltr)[TRA] را داشته باشد و هم در برابر حملات #text(dir: ltr)[Type]-I/II/III، #text(dir: ltr)[rogue key] و ائتلاف مقاوم باشد؟
+ چگونه بدون #text(dir: ltr)[bilinear pairing] و با حفظ سرعت مناسب شبکه اقتضایی خودرویی، امنیت قابل اثبات (ترجیحاً نزدیک به مدل استاندارد) تضمین شود؟
+ آیا می‌توان معماری خطی #text(dir: ltr)[hash-dependent] را به‌گونه‌ای بازطراحی کرد که تعادل امنیت/تأخیر/مقیاس‌پذیری برای 5G-#text(dir: ltr)[V2X] و 6G محقق شود؟

== مسئله‌های باز

+ *تشخیص سریع امضای نامعتبر پس از شکست تأیید تجمعی:* اکثر طرح‌ها الگوریتم کارآمدی ندارند @gongPCASCryptanalysisImprovement2023 @wuSecureEfficientCertificateless2025. تنها #text(dir: ltr)[Wang] 2025 @wangPrivacypreservingCertificatelessAggregate2025 الگوریتم تقسیم‌وجستجو دارد اما #text(dir: ltr)[pairing-based] است.
+ *حملات #text(dir: ltr)[rogue key] و ائتلاف #text(dir: ltr)[KGC]:* همچنان جدی هستند @yueLightweightCertificatelessAggregate2025 @zhangNotesSecurityCertificateless2014.
+ *اثبات در مدل استاندارد:* انتقال از #text(dir: ltr)[ROM] به مدل استاندارد و #text(dir: ltr)[reduction tight] بدون #text(dir: ltr)[forking lemma] @wangConditionalPrivacyPreservingCertificateless2022.
+ *معمای #text(dir: ltr)[compactness]:* امضای تجمیعی فشرده در برابر #text(dir: ltr)[universal forgery] آسیب‌پذیر است @lodeComprehensiveReviewECCbased2026a.

== کلیات روش پیشنهادی

=== پایه: #text(dir: ltr)[PF-ECC] بدون #text(dir: ltr)[pairing]
معماری‌ای با یک #text(dir: ltr)[scalar multiplication] در تولید امضا و #text(dir: ltr)[aggregate verify] خطی با ضریب کوچک، مشابه بهترین طرح‌های موجود مانند #text(dir: ltr)[Wu-Ye] 2025 @wuSecureEfficientCertificateless2025 و #text(dir: ltr)[ECAE] @wangECAEEfficientCertificateless2025.

=== مکانیزم تشخیص سریع امضای مخرب
پس از شکست تأیید تجمعی، به‌جای بازتأیید #text(dir: ltr)[O(n)]، با تقسیم‌وجستجو (#text(dir: ltr)[divide-and-conquer]) امضای بد را در #text(dir: ltr)[O(log n)] یافتن. ایده از طرح #text(dir: ltr)[Wang] 2025 @wangPrivacypreservingCertificatelessAggregate2025 گرفته شده که در آن فقط زیرگروه چپ بررسی می‌شود و در صورت موفقیت جستجو در راست ادامه می‌یابد — منتها در بستر #text(dir: ltr)[pairing-free].

=== #text(dir: ltr)[Pseudonym] با #text(dir: ltr)[traceability] شرطی
ساختار #text(dir: ltr)[PID] با کلید ردیابی #text(dir: ltr)[TA]/#text(dir: ltr)[TRA] (الگوی @taoESCLASEfficientCerificateless2026 و @gongPCASCryptanalysisImprovement2023) به‌همراه چرخش دوره‌ای #text(dir: ltr)[pseudonym] برای #text(dir: ltr)[unlinkability] و اتصال زنجیره «امضای بد → افشای هویت» توسط #text(dir: ltr)[TRA].

=== مقاومت در برابر #text(dir: ltr)[rogue key]
افزودن امضای #text(dir: ltr)[aggregator] و تأیید هم‌زمان (#text(dir: ltr)[dual-layer]) همانند #text(dir: ltr)[Yue] 2025 @yueLightweightCertificatelessAggregate2025.

=== هش‌های قوی با #text(dir: ltr)[binding] کامل
گنجاندن همه پارامترهای عمومی (#text(dir: ltr)[Ui]، #text(dir: ltr)[Ppub]، #text(dir: ltr)[Rj]، کلید عمومی، #text(dir: ltr)[timestamp] و جزء تصادفی #text(dir: ltr)[Yj]) در ورودی توابع #text(dir: ltr)[hash] تا هیچ ترکیب جبری نتواند #text(dir: ltr)[master public key] را از معادله حذف کند. درس مشترک #text(dir: ltr)[Wu-Ye] 2025 @wuSecureEfficientCertificateless2025، #text(dir: ltr)[Shim-Kwon] 2026 @shimSecurityAggregateSignature2026 و #text(dir: ltr)[Wei] 2025 @weiNewEfficientProvably2025.

=== تأیید تجمعی با حفظ #text(dir: ltr)[soundness]
نگهداشتن اجزای تکی قابل‌تفکیک برای حفظ #text(dir: ltr)[soundness] (اعتبار تجمیعی ⟺ اعتبار تک‌تک) مطابق @zhangNotesSecurityCertificateless2014.

== نوآوری نسبت به کارهای قبلی

نوآوری اصلی این پژوهش، آوردن ایده «تشخیص سریع متقلب + افشای هویت» به بستر #text(dir: ltr)[pairing-free] است. #text(dir: ltr)[Wang] 2025 @wangPrivacypreservingCertificatelessAggregate2025 تنها طرح با چنین قابلیتی است ولی #text(dir: ltr)[pairing-based] و برای #text(dir: ltr)[VANET] پرتراکم گران است. از طرف دیگر، #text(dir: ltr)[Wu-Ye] 2025 @wuSecureEfficientCertificateless2025 صراحتاً تشخیص امضای نامعتبر را «بیش‌ازحد پرهزینه» دانسته و آن را کار آینده اعلام کرده است. طرح پیشنهادی این شکاف را با ترکیب الگوریتم تقسیم‌وجستجو با ساختار #text(dir: ltr)[pairing-free] #text(dir: ltr)[ECC] پر می‌کند.

== ارزیابی پیشنهادی

=== معیارهای استاندارد حوزه
زمان تولید امضا (#text(dir: ltr)[ms])، زمان تأیید تکی و تجمعی (#text(dir: ltr)[ms] برای n امضا)، هزینه ارتباطی (اندازه امضا/پیام بر حسب #text(dir: ltr)[byte]) و صرفه‌جویی درصدی #text(dir: ltr)[overhead].

=== مجموعه‌های محک و اعداد مرجع
- #text(dir: ltr)[MIRACL]: T_ecsm ≈ ۰.۱۷#text(dir: ltr)[ms] در برابر T_bp ≈ ۴.۴۴#text(dir: ltr)[ms] @gongPCASCryptanalysisImprovement2023
- #text(dir: ltr)[JPBC]: T_bp ≈ ۳.۲۳#text(dir: ltr)[ms]، T_htp ≈ ۴.۴۳#text(dir: ltr)[ms] @wangPrivacypreservingCertificatelessAggregate2025
- مقایسه با #text(dir: ltr)[Wu-Ye] 2025 @wuSecureEfficientCertificateless2025، #text(dir: ltr)[ES-CLAS] 2026 @taoESCLASEfficientCerificateless2026، #text(dir: ltr)[Zheng] 2023 @zhengSecurityEnhancedPairingFreeCertificateless2023 و #text(dir: ltr)[PCAS] 2023 @gongPCASCryptanalysisImprovement2023

=== معیار جدید: تشخیص متقلب
تعداد و زمان تأییدهای تجمعی اضافی برای یافتن امضای بد در بدترین حالت (#text(dir: ltr)[O(log n)] در برابر #text(dir: ltr)[O(n)]) و #text(dir: ltr)[overhead] برحسب #text(dir: ltr)[ms] برای nهای مختلف — معیاری که در ادبیات موجود وجود ندارد.

=== شبیه‌سازی #text(dir: ltr)[VANET]
بار پیام واقعی #text(dir: ltr)[DSRC] (۶۰۰–۲۰۰۰ پیام/ثانیه) و چگالی/سرعت‌های مختلف با معیار ظرفیت سرویس #text(dir: ltr)[RSU].

=== ابزارها و کتابخانه‌ها
#text(dir: ltr)[MIRACL] یا #text(dir: ltr)[JPBC] روی سخت‌افزار مشخص، شبیه‌سازی #text(dir: ltr)[Veins] با #text(dir: ltr)[OMNeT++] و #text(dir: ltr)[SUMO].

// ═══════════════════════════════════════════════════════════════════════
// Bibliography
// ═══════════════════════════════════════════════════════════════════════
#pagebreak()
#bibliography("refrence.bib", style: "ieee")
