#set page(paper: "presentation-4-3", margin: 0pt, fill: rgb("#1a1a2e"))
#set text(font: "Vazirmatn", lang: "fa", dir: rtl, fill: white)
#set align(center + horizon)

#let primary = rgb("#16213e")
#let accent = rgb("#0f3460")
#let highlight = rgb("#e94560")
#let sub-hl = rgb("#53a8b6")
#let dim = rgb("#888888")

// ==================== Title ====================
#page(fill: gradient.linear(primary, accent))[
  #v(1.5cm)
  #image("images/amirkabir_logo-1.png", width: 2.8cm)
  #v(0.4cm)
  #text(size: 15pt, weight: "bold")[دانشگاه صنعتی امیرکبیر (پلی‌تکنیک تهران)]
  #v(0.1cm)
  #text(size: 13pt)[دانشکده مهندسی کامپیوتر]
  #v(1.2cm)
  #text(size: 30pt, weight: "bold")[حریم خصوصی و امنیت]
  #v(0.2cm)
  #text(size: 30pt, weight: "bold")[در شبکه اقتضایی خودرویی]
  #v(0.3cm)
  #text(size: 14pt, fill: sub-hl)[Vehicular Ad-hoc Networks (VANET)]
  #v(1.5cm)
  #text(size: 16pt)[گزارش سمینار کارشناسی ارشد]
  #v(0.8cm)
  #grid(columns: (auto, auto), column-gutter: 0.8cm, [#text(weight: "bold")[دانشجو:]], [سید علی موسوی])
  #grid(columns: (auto, auto), column-gutter: 0.8cm, [#text(weight: "bold")[شماره دانشجویی:]], [۴۰۴۱۳۱۰۱۰])
  #grid(columns: (auto, auto), column-gutter: 0.8cm, [#text(weight: "bold")[استاد درس سمینار:]], [دکتر رضا صفابخش])
  #grid(columns: (auto, auto), column-gutter: 0.8cm, [#text(weight: "bold")[استاد راهنما:]], [دکتر بابک صادقیان])
  #v(0.8cm)
  #text(size: 13pt)[مردادماه ۱۴۰۵]
]

// ==================== Outline ====================
#page(fill: primary)[
  #v(0.8cm)
  #text(size: 28pt, weight: "bold")[فهرست ارائه]
  #v(0.8cm)
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 2cm,
    row-gutter: 0.6cm,
    [#text(size: 15pt, fill: highlight)[۱.] شبکه اقتضایی خودرویی چیست؟],
    [#text(size: 15pt, fill: highlight)[۲.] چالش‌های شبکه‌سازی و امنیتی],
    [#text(size: 15pt, fill: highlight)[۳.] حملات امنیتی بر VANET],
    [#text(size: 15pt, fill: highlight)[۴.] مکانیزم‌های حفظ حریم خصوصی],
    [#text(size: 15pt, fill: highlight)[۵.] رمزنگاری و امضاهای دیجیتال],
    [#text(size: 15pt, fill: highlight)[۶.] مدیریت اعتماد و شهرت],
    [#text(size: 15pt, fill: highlight)[۷.] زنجیره بلوکی و IOTA Tangle],
    [#text(size: 15pt, fill: highlight)[۸.] مدیریت هویت (SSI / DID / VC)],
    [#text(size: 15pt, fill: highlight)[۹.] هوش مصنوعی و فناوری‌های نوظهور],
    [#text(size: 15pt, fill: highlight)[۱۰.] مسائل باز و جمع‌بندی],
  )
  #v(0.8cm)
  #text(size: 13pt, fill: dim)[مدت ارائه: ۱۵ دقیقه • ۱۴ اسلاید]
]

// ==================== VANET Definition ====================
#page(fill: primary)[
  #v(0.4cm)
  #text(size: 26pt, weight: "bold")[شبکه اقتضایی خودرویی چیست؟]
  #v(0.3cm)
  #image("images/VANET artitecture.png", width: 70%)
  #v(0.2cm)
  #text(size: 13pt)[زیرمجموعه شبکه‌های خودمختار متحرک (MANET) • ارتباط مستقیم بین خودروها و زیرساخت‌های جاده‌ای]
  #v(0.2cm)
  #grid(
    columns: (1fr, 1fr, 1fr),
    column-gutter: 0.6cm,
    [
      #text(size: 12pt, weight: "bold", fill: sub-hl)[اجزای اصلی]
      #text(size: 11pt)[OBU: واحد سوارشونده خودرو
      RSU: واحد کنارجاده‌ای
      TA: مرجع قابل اعتماد]
    ],
    [
      #text(size: 12pt, weight: "bold", fill: sub-hl)[انواع ارتباط V2X]
      #text(size: 11pt)[V2V: خودرو به خودرو
      V2I: خودرو به زیرساخت
      V2P: خودرو به عابر پیاده
      V2N: خودرو به شبکه]
    ],
    [
      #text(size: 12pt, weight: "bold", fill: sub-hl)[ویژگی‌های کلیدی]
      #text(size: 11pt)[تحرک بالا و توپولوژی پویا
      تأخیر بسیار کم بلادرنگ
      حجم بالای پیام‌های ایمنی]
    ],
  )
]

// ==================== VANET Importance ====================
#page(fill: primary)[
  #v(0.4cm)
  #text(size: 26pt, weight: "bold")[اهمیت شبکه اقتضایی خودرویی]
  #v(0.4cm)
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 1.2cm,
    row-gutter: 0.4cm,
    [
      #text(size: 14pt, weight: "bold", fill: highlight)[ایمنی ترافیک]
      #text(size: 12pt)[
        سالانه ۱.۱۹ میلیون کشته در تصادفات جاده‌ای جهان (WHO)
        بیش از ۹۲٪ تصادفات ناشی از خطای انسانی
        هشدارهای بلادرنگ: ترمز ناگهانی، مانع، تغییر لاین
      ]
      #v(0.2cm)
      #text(size: 14pt, weight: "bold", fill: highlight)[مدیریت ترافیک]
      #text(size: 12pt)[
        کاهش ازدحام و بهینه‌سازی جریان ترافیک
        مدیریت هوشمند تقاطع‌ها و پشتیبانی از رانندگی خودکار
      ]
    ],
    [
      #text(size: 14pt, weight: "bold", fill: highlight)[چالش‌های شبکه‌سازی]
      #text(size: 12pt)[
        تکه‌تکه شدن مکرر شبکه به دلیل تحرک بالا
        مشکلات مسیریابی در توپولوژی پویا
        کمبود طیف فرکانسی و تأثیرات محیطی
      ]
      #v(0.2cm)
      #text(size: 14pt, weight: "bold", fill: highlight)[چالش‌های مقیاس‌پذیری]
      #text(size: 12pt)[
        حجم داده‌ها تا هزاران گیگابایت در روز
        پردازش بلادرنگ نیازمند منابع محاسباتی قابل توجه
        ناهمگونی فناوری‌ها: DSRC، LTE، 5G
      ]
    ],
  )
]

// ==================== Security Challenges ====================
#page(fill: primary)[
  #v(0.4cm)
  #text(size: 26pt, weight: "bold")[چالش‌های امنیتی]
  #v(0.4cm)
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 1.2cm,
    row-gutter: 0.4cm,
    [
      #text(size: 14pt, weight: "bold", fill: highlight)[الزامات امنیتی]
      #text(size: 12pt)[
        محرمانگی (Confidentiality): رمزنگاری داده‌ها
        یکپارچگی (Integrity): جلوگیری از دستکاری پیام
        تصدیق هویت (Authentication): تمایز معتبر از موذی
        دسترس‌پذیری (Availability): ارتباط به‌موقع
        عدم انکار (Non-repudiation): ثبت امن پیام‌ها
        حریم خصوصی (Privacy): محافظت از اطلاعات شخصی
      ]
    ],
    [
      #text(size: 14pt, weight: "bold", fill: highlight)[چالش‌های ساختاری]
      #text(size: 12pt)[
        تکه‌تکه شدن مکرر شبکه و قطع اتصالات
        مشکلات مسیریابی در شبکه‌های پویا
        محدودیت منابع پردازشی OBU و RSU
        مقیاس‌پذیری در تراکم بالای شهری
        ناهمگونی فناوری‌های ارتباطی
      ]
      #v(0.3cm)
      #text(size: 13pt, fill: sub-hl)[تعادل: امنیت نباید موجب تأخیر غیرقابل قبول شود]
    ],
  )
]

// ==================== Attacks ====================
#page(fill: primary)[
  #v(0.3cm)
  #text(size: 26pt, weight: "bold")[حملات امنیتی بر VANET]
  #v(0.3cm)
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 0.8cm,
    row-gutter: 0.3cm,
    [
      #text(size: 13pt, weight: "bold", fill: highlight)[حملات بر دسترس‌پذیری]
      #text(size: 11pt)[
        + DoS/DDoS: اشباع RSU و شبکه با ترافیک اضافی
        + پارازیت (Jamming): اختلال در کانال بی‌سیم
        + سیل پیام (Flooding): اشباع پهنای باند
        + مبتنی بر حافظه: تخلیه حافظه OBU/RSU
      ]
      #v(0.2cm)
      #text(size: 13pt, weight: "bold", fill: highlight)[حملات بر محرمانگی]
      #text(size: 11pt)[
        + استراق سمع: شنود ترافیک بی‌سیم
        + تحلیل ترافیک: استنتاج الگوی رفتاری
        + حملات کانال جانبی: نشت زمان‌بندی و توان
      ]
    ],
    [
      #text(size: 13pt, weight: "bold", fill: highlight)[حملات بر صحت و یکپارچگی]
      #text(size: 11pt)[
        + جعل پیام و هویت (Spoofing)
        + حمله فردی در میان (MITM)
        + حمله بازپخش (Replay): استفاده مجدد از پیام ضبط‌شده
        + جعل موقعیت GPS و داده حسگر
        + ربایش نشست ارتباطی (Session Hijacking)
      ]
      #v(0.2cm)
      #text(size: 13pt, weight: "bold", fill: highlight)[حملات بر حریم خصوصی]
      #text(size: 11pt)[
        + ردیابی موقعیت و مسیر خودرو
        + نمایه‌سازی رفتاری در طول زمان
        + پیوندپذیری شبه‌نام‌ها به یک هویت
      ]
    ],
  )
  #v(0.2cm)
  #text(size: 12pt, fill: dim)[تهدید ویژه: گره‌های موذی داخلی • گواهی معتبر دارند اما محتوای نادرست تولید می‌کنند]
]

// ==================== Privacy Mechanisms ====================
#page(fill: primary)[
  #v(0.3cm)
  #text(size: 26pt, weight: "bold")[مکانیزم‌های حفظ حریم خصوصی]
  #v(0.3cm)
  #text(size: 15pt, weight: "bold", fill: highlight)[شبه‌نام (Pseudonym)]
  #text(size: 12pt)[شناسه موقت و غیرقابل پیوند به جای هویت واقعی]
  #v(0.2cm)
  #text(size: 13pt)[چرخه حیات: صدور → استفاده → تغییر → حل (ردیابی شرطی) → لغو]
  #v(0.2cm)
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 1cm,
    [
      #text(size: 13pt, weight: "bold", fill: highlight)[استراتژی‌های تغییر (ETSI TR 103 415)]
      #text(size: 11pt)[
        + تغییر با پارامتر ثابت: فواصل زمانی مشخص
        + تغییر تصادفی: فواصل نامنظم
        + دوره سکوت: توقف موقت ارسال پیام
        + تغییر مبتنی بر خودرو و تراکم
        + منطقه مخلوط‌سازی: تغییر هم‌زمان در مناطق پرتردد
      ]
    ],
    [
      #text(size: 13pt, weight: "bold", fill: highlight)[تکنیک‌های تکمیلی]
      #text(size: 11pt)[
        + Mix-zones: تغییر هماهنگ شبه‌نام در یک منطقه
        + k-anonymity: هر خودرو در گروه k خودرو
        + RAISE: تأیید اصالت توسط RSU با حفظ بی‌نامی
      ]
      #v(0.2cm)
      #text(size: 11pt, fill: dim)[فقط ۱۲٪ طرح‌ها چرخه حیات کامل را پیاده‌سازی کرده‌اند]
    ],
  )
]

// ==================== Cryptography ====================
#page(fill: primary)[
  #v(0.3cm)
  #text(size: 26pt, weight: "bold")[رمزنگاری و امضاهای دیجیتال]
  #v(0.3cm)
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 1.2cm,
    row-gutter: 0.3cm,
    [
      #text(size: 13pt, weight: "bold", fill: highlight)[انواع امضا]
      #text(size: 11pt)[
        + امضای مبتنی بر هویت (IBC): کلید از هویت استخراج می‌شود
        + امضای تجمیعی: ترکیب چند امضا در یک امضای فشرده
        + امضای بدون گواهی: کلید خصوصی مشترک بین کاربر و PKG
        + امضای مبتنی بر ECC: طول کلید کوتاه، هزینه پایین
      ]
      #v(0.2cm)
      #text(size: 13pt, weight: "bold", fill: highlight)[زیرساخت کلید عمومی (PKI)]
      #text(size: 11pt)[
        صدور، توزیع و مدیریت چرخه حیات گواهی‌ها
        مدیریت لیست ابطال گواهی (CRL)
        گواهی‌های کوتاه‌عمر برای کاهش افشای کلید
      ]
    ],
    [
      #text(size: 13pt, weight: "bold", fill: highlight)[چالش‌ها]
      #text(size: 11pt)[
        + محدودیت منابع: OBU/RSU نمی‌توانند الگوریتم سنگین اجرا کنند
        + تأخیر بلادرنگ: پیام ایمنی باید فوری تولید و تأیید شود
        + مدیریت کلید و ابطال: حلقه ضعیف در شبکه متحرک
        + ناتوانی در برابر حملات داخلی: پیام صحیح اما نادرست
        + تهدید کوانتومی: الگوریتم‌های ECC و RSA آسیب‌پذیر
        + توازن امنیت و کارایی: کلید بلندتر = سربار بیشتر
        + ناهمگونی پروتکل‌ها: DSRC vs LTE vs 5G
      ]
    ],
  )
]

// ==================== Trust Management ====================
#page(fill: primary)[
  #v(0.4cm)
  #text(size: 26pt, weight: "bold")[مدیریت اعتماد و شهرت]
  #v(0.3cm)
  #text(size: 13pt)[مکمل رمزنگاری • شناسایی گره‌های موذی داخلی که گواهی معتبر دارند اما محتوای نادرست تولید می‌کنند]
  #v(0.3cm)
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 1.2cm,
    row-gutter: 0.3cm,
    [
      #text(size: 13pt, weight: "bold", fill: highlight)[مدل‌های اعتماد]
      #text(size: 11pt)[
        + مبتنی بر توصیه: بر اساس بازخورد سایر گره‌ها
        + مبتنی بر پیش‌بینی: بر اساس الگوهای رفتاری
        + مبتنی بر شهرت: بر اساس سابقه عملکرد
        + مبتنی بر سیاست: بر اساس قوانین و مقررات
      ]
      #v(0.2cm)
      #text(size: 13pt, weight: "bold", fill: highlight)[روش‌های محاسبه]
      #text(size: 11pt)[
        + جمع وزنی امتیازات از منابع مختلف
        + استنباط بیزی: به‌روزرسانی با مشاهده رفتار
        + یادگیری تقویتی (Q-learning): ارزیابی پویا
        + منطق فازی: محاسبه اعتماد با دقت بالا
      ]
    ],
    [
      #text(size: 13pt, weight: "bold", fill: highlight)[سیستم‌های شهرت]
      #text(size: 11pt)[
        + ذخیره‌سازی غیرمتمرکز در زنجیره بلوکی/IOTA
        + سیستم DIVA: شهرت مبتنی بر DID بر IOTA
        + دقت ~۹۰٪ در شناسایی مشارکت‌کنندگان موذی
        + مکانیزم‌های انگیزشی: پاداش همکاری، جریمه خودخواهی
      ]
      #v(0.2cm)
      #text(size: 12pt, fill: sub-hl)[چالش کلیدی: تعادل بین شفافیت اعتماد و حریم خصوصی رانندگان]
    ],
  )
]

// ==================== Blockchain and IOTA ====================
#page(fill: primary)[
  #v(0.3cm)
  #text(size: 26pt, weight: "bold")[زنجیره بلوکی و IOTA Tangle]
  #v(0.3cm)
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 0.8cm,
    row-gutter: 0.3cm,
    [
      #text(size: 13pt, weight: "bold", fill: highlight)[زنجیره بلوکی]
      #text(size: 11pt)[
        + غیرمتمرکز و تغییرناپذیر
        + مدیریت اعتماد، هویت و قرارداد هوشمند
        + معماری ۶ لایه: داده، شبکه، توافق، انگیزش، قرارداد، کاربرد
      ]
      #v(0.1cm)
      #text(size: 11pt, fill: dim)[محدودیت‌ها:]
      #text(size: 11pt, fill: dim)[
        مقیاس پایین: بیت‌کوین ۷ TPS، اتریوم ۱۵ TPS
        مصرف انرژی بالا (PoW)، تأخیر تأیید، هزینه تراکنش
        حمله ۵۱٪ و محدودیت ذخیره‌سازی
      ]
      #v(0.1cm)
      #text(size: 11pt, fill: dim)[راهکارها: شاردینگ، PoS، زنجیره فرعی، لایه مقیاس‌پذیری]
    ],
    [
      #text(size: 13pt, weight: "bold", fill: highlight)[IOTA Tangle (DAG)]
      #text(size: 11pt)[
        + ساختار گراف جهت‌دار بدون دور (DAG)
        + بدون کارمزد و بدون ماینر
        + مقیاس‌پذیری بالا: هرچه تراکنش بیشتر، شبکه قوی‌تر
        + مصرف انرژی پایین و تأیید سریع
        + V2.0: حذف هماهنگ‌کننده متمرکز
        + سه لایه: شبکه، ارتباطات، کاربردی
        + امضای Ed25519 و قرارداد هوشمند ISCP
      ]
    ],
  )
  #v(0.2cm)
  #image("images/IOTA vs Blockchain.png", width: 65%)
]

// ==================== SSI / DID / VC ====================
#page(fill: primary)[
  #v(0.3cm)
  #text(size: 26pt, weight: "bold")[مدیریت هویت و SSI]
  #v(0.3cm)
  #image("images/SSI vs centeralized.png", width: 55%)
  #v(0.2cm)
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 1cm,
    row-gutter: 0.3cm,
    [
      #text(size: 13pt, weight: "bold", fill: highlight)[مدیریت هویت • تکامل]
      #text(size: 11pt)[
        ۱۹۸۸-۱۹۹۸: هویت متمرکز (کنترل مرکزی)
        ۱۹۹۸-۲۰۰۵: هویت فدرالی (ورود یکپارچه)
        ۲۰۰۵-۲۰۱۲: هویت کاربرمحور
        ۲۰۱۲-اکنون: هویت خودمختار (SSI)
      ]
      #v(0.2cm)
      #text(size: 13pt, weight: "bold", fill: highlight)[SSI / DID / VC]
      #text(size: 11pt)[
        SSI: کنترل کامل کاربر بر داده‌های شخصی
        DID: شناسه غیرمتمرکز بدون مرجع مرکزی
        VC: اعتبارنامه تأییدپذیر با افشای انتخابی (ZKP)
      ]
    ],
    [
      #text(size: 13pt, weight: "bold", fill: highlight)[مزایای امنیتی]
      #text(size: 11pt)[
        + حذف نقطه شکست منفرد
        + حفظ حریم خصوصی با حداقل افشای اطلاعات
        + قابلیت ردیابی شرطی توسط مرجع قانونی
        + مدیریت شهرت غیرمتمرکز
        + مقابله با حملات سیبل و تقلید
      ]
      #v(0.2cm)
      #text(size: 13pt, weight: "bold", fill: highlight)[طرح‌های پیشنهادی]
      #text(size: 11pt)[
        PCS: تغییر شبه‌نام در نقاط اجتماعی
        SRPS: تعادل حریم خصوصی و ایمنی (~۱۰ پیام/ثانیه)
        DIVA: DID + IOTA (دقت ۹۰٪ شناسایی موذی)
        BPAS: تصدیق هویت مبتنی بر Hyperledger
      ]
    ],
  )
]

// ==================== AI and Emerging Tech ====================
#page(fill: primary)[
  #v(0.4cm)
  #text(size: 26pt, weight: "bold")[هوش مصنوعی و فناوری‌های نوظهور]
  #v(0.4cm)
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 1.2cm,
    row-gutter: 0.4cm,
    [
      #text(size: 13pt, weight: "bold", fill: highlight)[هوش مصنوعی و یادگیری ماشین]
      #text(size: 11pt)[
        + تشخیص ناهنجاری: شبکه‌های CNN و LSTM
        + تحلیل آسیب‌پذیری زنده ترافیک شبکه
        + یادگیری فدرال: امن + حفظ حریم خصوصی
        + یادگیری تقویتی: ارزیابی اعتماد خودروهای خودران
        + منطق فازی: محاسبه اعتماد پیام‌های رویداد
      ]
      #v(0.2cm)
      #text(size: 12pt, fill: dim)[چالش: مسموم‌سازی داده آموزشی و حملات تخاصمی]
    ],
    [
      #text(size: 13pt, weight: "bold", fill: highlight)[فناوری‌های نوظهور]
      #text(size: 11pt)[
        + رایانش ابری/لبه/مه: کاهش بار محاسباتی خودرو
        + 5G/6G: معماری SBA با AUSF/SEAF/ARPF
        + برش شبکه: ایزولاسون امنیتی بین سرویس‌ها
        + SDVN: جداسازی صفحه کنترل از صفحه داده
        + معماری‌های ترکیبی: DLT + ابر + لبه
        + دوقلوهای دیجیتال: شبیه‌سازی بدون اختلال
      ]
    ],
  )
]

// ==================== Open Issues ====================
#page(fill: primary)[
  #v(0.4cm)
  #text(size: 26pt, weight: "bold")[مسائل باز و کارهای آینده]
  #v(0.4cm)
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 1.2cm,
    row-gutter: 0.3cm,
    [
      #text(size: 13pt, weight: "bold", fill: highlight)[مسائل امنیتی]
      #text(size: 11pt)[
        + معاوضه حریم خصوصی، امنیت و کارایی
        + چرخه حیات کامل شبه‌نام بدون افت عملکرد
        + کاهش وابستگی به RSU (نقطه شکست منفرد)
        + مقیاس‌پذیری در تراکم بالای شهری
        + امضاهای دیجیتال سبک و سریع بلادرنگ
      ]
      #v(0.2cm)
      #text(size: 13pt, weight: "bold", fill: highlight)[مسائل فنی]
      #text(size: 11pt)[
        + رمزنگاری پساکوانتومی (PQC) و مشبکه‌ها
        + مقاومت ML در برابر حملات تخاصمی
        + تحلیل رسمی با ProVerif و Tamarin
      ]
    ],
    [
      #text(size: 13pt, weight: "bold", fill: highlight)[مسائل ساختاری]
      #text(size: 11pt)[
        + مجموعه‌داده‌های باز و واقعی از ترافیک VANET
        + چارچوب‌های مقرراتی یکپارچه بین‌المللی
        + هماهنگی مقررات حریم خصوصی بین کشورها
        + امنیت ارتباطات چندپرشی در لایه‌های ITS
        + آمادگی برای گذار تدریجی به رمزنگاری پساکوانتومی
      ]
      #v(0.2cm)
      #text(size: 12pt, fill: sub-hl)[نیاز: همکاری بین‌رشته‌ای رمزنگاری، شبکه، AI، حقوق و سیاست‌گذاری]
    ],
  )
]

// ==================== Conclusion ====================
#page(fill: primary)[
  #v(0.4cm)
  #text(size: 26pt, weight: "bold")[جمع‌بندی]
  #v(0.4cm)
  #text(size: 14pt)[امنیت VANET یک مسئله چندبعدی است: ابعاد فنی، حقوقی، اجتماعی و اقتصادی]
  #v(0.4cm)
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 1.2cm,
    row-gutter: 0.4cm,
    [
      #text(size: 13pt, weight: "bold", fill: highlight)[راهکارهای کلیدی]
      #text(size: 11pt)[
        + رمزنگاری سبک: ECC، IBC، تأیید دسته‌ای
        + شبه‌نام + مناطق مخلوط‌سازی برای حریم خصوصی
        + مدیریت اعتماد توزیع‌شده مکمل PKI
        + IOTA Tangle جایگزین زنجیره بلوک سنتی
        + SSI/DID/VC برای هویت غیرمتمرکز
        + تشخیص ناهنجاری مبتنی بر AI
      ]
    ],
    [
      #text(size: 13pt, weight: "bold", fill: highlight)[چشم‌انداز آینده]
      #text(size: 11pt)[
        + یکپارچگی AI + DLT + 5G/6G
        + رمزنگاری پساکوانتومی پیش از تهدید عملی
        + معماری‌های ترکیبی: ابر + لبه + زنجیره بلوک
        + مجموعه‌داده‌های استاندارد و واقعی
        + تحلیل رسمی اثبات امنیت پروتکل‌ها
        + همکاری بین‌رشته‌ای متخصصان
      ]
    ],
  )
]

// ==================== Thank You ====================
#page(fill: gradient.linear(accent, primary))[
  #v(4cm)
  #text(size: 40pt, weight: "bold")[با تشکر از توجه شما]
  #v(1cm)
  #text(size: 20pt)[پرسش و پاسخ]
  #v(2cm)
  #text(size: 14pt)[سید علی موسوی • ۴۰۴۱۳۱۰۱۰]
  #v(0.3cm)
  #text(size: 14pt)[استاد درس سمینار: دکتر رضا صفابخش]
  #v(0.3cm)
  #text(size: 14pt)[استاد راهنما: دکتر بابک صادقیان]
  #v(0.3cm)
  #text(size: 14pt)[دانشگاه صنعتی امیرکبیر • مردادماه ۱۴۰۵]
]
