---
title: Malicious-KGC Trapdoor on Wang
aliases: [shim2023-malicious-kgc-trapdoor]
tags: [clas, vanet, kgc-attack, forgery]
source:: [[shim2023-en]]
pages:: p.5
---
# Malicious-KGC trapdoor on Wang

- The malicious KGC picks secret alpha and publishes trapdoored parameter Q = alpha P in Setup (p.5, §III.A).
- The KGC collects one valid signature sigma_i = (Ui, Vi, Wi) on a message mi under the victim {PKi, PIDi,j} from the public channel or signing oracle (p.5, §III.A).
- The KGC extracts di Q by computing Wi − alpha hi Xi − Vi = di Q, since hi xi Q equals alpha hi Xi (p.5, §III.A).
- With (alpha, di Q) the KGC forges sigma_i' = (Ui', Vi', Wi') with Wi' = di Q + alpha hi' Xi + Vi' on any new message m' under the victim {PKi, PIDi,j} (p.5, §III.A).
- The forged signature passes the victim single-verification equation e(Wi', P) = e(Ri + ki Ppub + hi' Xi + Ui', Q) (p.5, §III.A).
- Framing follows because TRA traces the reused pseudonym via the victim equation IDi = PIDi,1,j xor H1(kP + Ti,j) to the honest vehicle Vhi (p.5, §III.A).

## Links

[[shim2023-eta-shift-forgery]]
[[shim2023-two-signature-key-recovery]]

## Source

source:: [[shim2023-en]] (p.5)
