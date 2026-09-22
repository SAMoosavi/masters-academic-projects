---
title: Cost figures and pseudonym privacy
aliases: []
tags: [clas, vanet, cahyadi2022]
source:: [[cahyadi2022-clas-scheme-en]]
pages:: p.9–p.19
---
# Cost figures and pseudonym privacy
- Measured costs use PC = 3.21 ms, SC = 0.39 ms, HC = 0.09 ms on Tate pairing 159-bit MNT at 80-bit security on i7 3.07 GHz (p.18).
- Ours Sign 3SC = 1.17 ms, Verify 3PC + 2SC = 10.41 ms, Aggregate-Verify 3PC + 2nSC = (9.63 + 0.78n) ms (p.18).
- Ours broadcasts (Mi, ti, PIDi, vpkIDi, si = (Ui, Si)) totaling 583 bytes single and 583n bytes for n messages, the smallest in Table 5 versus 715–735 byte rivals (p.19).
- Claims include mutual vehicle–TRA authentication with encrypted request and OTP, conditional privacy via one-time PIDi batches with TRA traceability, and resistance to replay (timestamps), MITM, masquerade and impersonation (reduction to CDHP) (p.9, p.16–p.17).
- Communication saving depends on the assumed sizes G1 = 128 bytes, hash/Zq = 20 bytes, timestamp = 4 bytes and VANET message = 67 bytes, so the 583-byte figure is conditional on those parameters (p.19).
## Links
- [[cahyadi2022-clas-scheme-construction]]
- [[cahyadi2022-clas-scheme-proofs]]
## Source
- source:: [[cahyadi2022-clas-scheme-en]] p.9–p.19
