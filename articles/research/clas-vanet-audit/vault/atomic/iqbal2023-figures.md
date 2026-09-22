---
title: Iqbal2023 Efficiency Figures and Anonymity
aliases: [iqbal2023-figures]
tags: [clas, vanet, hecc, efficiency, anonymity]
source:: [[iqbal2023-en]]
pages:: p.12-14
---
# Iqbal2023 efficiency figures and anonymity

- Total computation cost is 1.92 ms (0.96 ms sign + 0.96 ms verify), lowest among the four compared schemes in Table 5 (p.13, §6.2).
- Computation edge comes from HECC divisor multiplication at 0.48 ms per operation with an 80-bit key giving the same stated level as ECC/RSA comparators (p.13, §6.2).
- Communication cost is |m| + 2|n| = 1000 + 2 x 80 = 1160 bits, lowest among the four compared schemes in Table 6 (p.14, §6.3).
- Security-attribute comparison (Table 2) gives YES on all of UF1, UF2, SA, RA and PPK while Cahyadi, Yulei/Chen, Yibo/Han and Keitaro/Ogata meet UF1/UF2 but score NO on SA, RA and PPK (p.12, §6.1).
- Sender and receiver anonymity hold at partial-private-key request time (SA/RA) with partial-key distribution over an open channel and no secure channel (PPK) (p.12, §6.1).
- Vehicles share identities with trusted authorities over the open wireless channel via encrypted EID without revealing them to unauthorized participants (p.1, §Abstract).

## Links

[[iqbal2023-hecc-construction]]
[[iqbal2023-proofs]]

## Source

source:: [[iqbal2023-en]] (p.12-14)
