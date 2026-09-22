---
title: Iqbal2023 FGR1-FGR2 ROM Proofs
aliases: [iqbal2023-proofs]
tags: [clas, vanet, hecc, proofs, rom, hcdlp]
source:: [[iqbal2023-en]]
pages:: p.9-11
---
# Iqbal2023 FGR1/FGR2 ROM proofs

- Theorem 1 states a Type 1 (FGR1) forger forging in polynomial time implies a challenger FCR solving HCDLP with non-negligible probability nOnpb (p.9, §Theorem 1).
- Theorem 1 reduction gives FCR only D and HDLP = x . D with the task of extracting x, keeping Dot_p secret from FGR1 (p.9, §Theorem 1).
- Theorem 1 query phase answers H01/H02/H03, secret-value, PRPKG, public-key-generation, public-key-replacement, SIGG and SIGV queries over lists LH1/LH2/LH3/LSVG/LPRPKG/LPBKG/LSIGG before forgery (p.9, §Theorem 1).
- Theorem 1 forgery uses two signatures (S_OBU*, W_OBU*) and (S_OBU*1, W_OBU*1) via the forking lemma so FCR extracts x only if both tuples verify (p.10, §Theorem 1).
- Theorem 2 states a Type 2 (FGR2) forger forging in polynomial time implies a challenger FCR solving HCDLP with non-negligible probability nOnpb (p.10, §Theorem 2).
- Theorem 2 reduction hands both PB_frm and Dot_p to FGR2, modelling the malicious-KGC adversary, and answers the same H01/H02/H03, secret-value, public-key and SIGG query games (p.10, §Theorem 2).
- Both theorems conclude unforgeability against FGR1 and FGR2 in ROM under HCDLP, with no standard-model or stronger-adversary claim (p.11, §Theorem 2).

## Links

[[iqbal2023-hecc-construction]]
[[iqbal2023-figures]]

## Source

source:: [[iqbal2023-en]] (p.9-11)
