---
title: "تشخیص با ردیابی هویت (Identity Tracing Detection)"
aliases: [Identity Tracing, Traceability, Conditional Privacy, ردیابی هویت]
tags: [detection, CLAS, traceability, privacy, accountability]
---

# تشخیص با ردیابی هویت

> [!info] خلاصه
> پس از تشخیص امضای نامعتبر، مسئولیت‌پذیری (accountability) نیاز به بازیابی **هویت واقعی** امضاکننده مخرب دارد. این کار فقط توسط نهاد مورد اعتماد (TRA/TMC) با کلید ردیابی ممکن است — نه عموم.

## مکانیسم

### بازیابی گام‌به‌گام ([[wang2025-detectable]])

TRA با کلید `t` (که `T_pub = tP`):

$$u_i = H_0(t) \oplus PID_{i,1}$$
$$ID_i = H_0(u_i \| TP_i) \oplus PID_{i,2}$$

این تنها برای مسئولیت‌پذیری پس از تشخیص استفاده می‌شود — سایرین نمی‌توانند ردیابی کنند (p.5, §3; p.7, §4.2).

### ردیابی در طرح‌های دیگر

- [[cahyadi2022-clas-scheme]]: `ID_i = PID_{i,1,j} \oplus H_1(kP + T_{i,j})` با کلید ردیابی TRA (p.3, §II.A).
- [[gong2023]]: `RID = pid \oplus H(s_1 K, T)` — فقط TA می‌تواند بازیابی کند (p.12, §5.4).
- [[xu2023]]: `VID_i = MID_i \oplus t·AID_{i,1}` — فقط TA (pp.13487–13488, §V).
- [[wu2025-pseudonyms]]: مکانیسم شبه‌هویت با قابلیت ردیابی.

## ملاحظات علمی

> [!warning] تفکیک مهم
> **ردیابی ≠ تشخیص مکانیسمی.** ردیابی هویت مکان‌یابی امضای نامعتبر را فراهم نمی‌کند؛ فقط پس از یافتن اندیس امضای نامعتبر (مثلاً با جستجوی دودویی) می‌توان هویت را بازیابی کرد.
> در حسابرسی ۲۰۲۶-۰۹-۲۱، عضویت شلِ پوشه Detect-Invalid تصحیح شد تا فقط مقالات دارای **مکانیسم تشخیص** ([[wang2025-detectable]]، [[xu2023]]) را در بر بگیرد و ردیابی محض جدا شود.

## مقالات مرتبط

| مقاله | مکانیسم ردیابی | سال | حالت |
|-------|----------------|-----|------|
| [[wang2025-detectable]] | TRA: `u_i = H_0(t) ⊕ PID_{i,1}` | 2025 | Full-text ✓ |
| [[xu2023]] | TA: `VID_i = MID_i ⊕ t·AID_{i,1}` | 2024 | Full-text ✓ |
| [[gong2023]] | TA: `RID = pid ⊕ H(s_1 K, T)` | 2023 | Full-text ✓ |
| [[cahyadi2022-clas-scheme]] | TRA pseudonym mapping | 2022 | Full-text ✓ |

## جستارهای وابسته

- [[binary-search|تشخیص با جستجوی دودویی]]
- [[Detect-Invalid]] — دسته‌بندی
- [[Type-III-resistance]] — دفاع مرتبط
