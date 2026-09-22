---
title: LICLAS Forgery Construction
aliases: [gong2023-liclas-forgery]
tags: [clas, vanet, forgery, liclas]
source:: [[gong2023-en]]
pages:: p.5-6
---
# LICLAS forgery construction

- Liu et al. [18] LICLAS claimed existential forgery security under the CDH assumption, which this paper disputes (p.5, §4.2).
- The adversary A0 is an ordinary node holding only the system params, the pseudonym, the public key and one valid signature on a known message with timestamp (p.5, §4.2).
- A0 hashes the old message and the new message with current timestamp under H1–H4, then derives scalar weights from the old and new hash values to reweight each signature component (p.5, §4.2).
- A0 reuses the original first signature component and outputs a recombined scalar that satisfies the verification equation, and the paper derives correctness to confirm acceptance (p.5–6, §4.2).
- PCAS finding states "still cannot resist the forgery" holds for its W_i design on a new message (p.5–6, §4.2).

## Links

[[gong2023-pcas-construction]]
[[gong2023-efficiency-gains]]

## Source

source:: [[gong2023-en]] (p.5-6)
