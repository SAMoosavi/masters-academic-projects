# Efficient Pairing-Free Certificateless Signcryption Scheme for Secure Data Transmission in IoMT (Zhang, Dong, Liu 2024)

*IoMT physiological-data scheme — not a VANET scheme: pairing-free CLSC for secure transmission of patient physiological indicators between sensor devices and doctors via cloud (p.4348, Abstract; p.4348–4349, §I).*

## Bibliographic

- Authors: Jianhong Zhang, Chenghe Dong, Yining Liu | Year: 2024 | Venue: IEEE Internet of Things Journal, Vol. 11, No. 3, pp. 4348–4361 | DOI: 10.1109/JIOT.2023.3298840 (p.4348, header/footer).
- Manuscript received 4 July 2023; accepted 21 July 2023; published 25 July 2023; current version 24 January 2024; supported by NSFC 62172005 and Beijing/Zhejiang funds (p.4348, footnote).
- Scope is IoMT throughout with 0 VANET mentions in source except cited refs [27]–[28]; construction is general-ECC scalar multiplication only, pairing-free with no bilinear map operator in the proposed scheme (p.4348–4361; p.4359, §IX).
- Keywords: certificateless signcryption, confidentiality, general ECC, pairing free, unforgeability; category CLS, IoMT secure data transmission (p.4348, Index Terms; p.4348, Abstract).

## Problem

- In IoMT, wearable or implanted sensor devices collect patient physiological indicators such as heart rate and blood oxygen, and openness of IoMT communication exposes this sensitive data to eavesdropping, manipulation, counterfeiting and replacement that can cause wrong diagnoses (p.4348, Abstract; p.4348, §I).
- Signcryption performing signature and encryption in one logical step is needed because separate encryption-then-signature drains resource-constrained wearable IoMT devices with strict energy limits (p.4348, §I).
- CLSC avoids PKI certificate management and IBC key escrow, suiting resource-constrained medical devices, yet two internal adversaries threaten it: Type I malicious users replacing public keys and Type II malicious KGC holding the master secret (p.4348–4349, §I).
- Most existing CLSC schemes are insecure against Type I or Type II adversaries or depend on heavy bilinear pairings, making them unsuitable for IoMT (p.4348–4349, §I; p.4350, §II).
- The paper takes the recent Chen et al. [29] pairing-free CLSC for medical IoT as an example and gives a detailed Type I forgery showing it cannot provide ciphertext unforgeability (p.4349, §I; p.4351–4352, §V–VI).

## Method

- Setup: KGC generates ECC parameters over general elliptic curves with master secret s and P_pub = sP, plus hashes H1–H4, all ECC-only with no pairings and hardness from Square-DH and CDH over the cyclic addition group (p.4352–4353, §VII.A; p.4350–4351, §III).
- Keys: KGC picks alpha_i, computes T_i = alpha_i·P, h_i = H1(ID_i, T_i, P_pub), d_IDi = alpha_i + s·h_i; the entity picks secret x_IDi, sets full key sk_i = (x_IDi, d_IDi) and public key pk_i = (Y_IDi = x_IDi·P, T_i) with f_i = H3(Y_IDi, T_i) binding the components (p.4353, §VII.B–C).
- Signcryption (sender IDs to receiver IDr): pick u, compute U = uP and V = u·h_r·f_r·Y_IDr + h_s·T_r + h_r·P_pub, then Y = H2(IDr, IDs, U, V), c = Y xor m, r = H4(U, c, T_s, Y_IDs), theta = u + r·f_s·x_IDs + d_IDs, output delta = (U, theta, c) at 3T_sm cost (p.4353, §VII.D; p.4359, §IX.A).
- Unsigncryption: compute V' = (h_r·f_r·x_IDr + h_s·d_IDr)·U and Y' = H2(IDr, IDs, U, V'), recover m' = c xor Y', then verify theta·P = U + r'·(f_s·Y_IDs + T_s + h_s·P_pub) with r' = H4(U, c, T_s, Y_IDs) at 4T_sm cost, 7T_sm total (p.4353, §VII.E; p.4359, §IX.A).
- Public verification: anyone checks theta·P = U + r'·(f_s·Y_IDs + T_s + h_s·P_pub) using only the sender public key with no secret keys needed (p.4353, §VII.F).
- Key insight: theta = u + r·(f_s·x_IDs + d_IDs) is a "double zero-knowledge proof" that f_s·Y_IDs + T_s + h_s·P_pub is a scalar multiple of P, so replacing Y_IDs with an arbitrary value breaks verification (p.4353, §VII.D).
- Security proofs: IND-CLSC-CCA2 confidentiality and EUF-CLSC-CMA unforgeability under Type I and Type II adversaries in the random oracle model, reduced to Square-DH via Lemmas 1–4 with tight reduction using no forking lemma (p.4353–4358, §VIII; p.4359–4360, §IX.C).
- Evaluation method: comparison against five recent CLSC schemes on computation in T_sm/T_psm/T_p/T_inv units and ciphertext size, implemented with Charm-Crypto 0.50 in Python on a Dell laptop plus Raspberry Pi 4B as the IoMT device at 80-bit security (p.4358–4359, §IX; p.4359, §IX.A–B).

## Key findings

- Chen et al. [29] is forgeable under Type I attack: replacing the sender public key with T_IDs = beta·P and crafted Q_IDs lets the adversary forge delta that passes receiver verification (p.4351–4352, §VI).
- Confidentiality holds as IND-CLSC-CCA2 under both Type I and Type II adversaries, reduced to the Square-DH assumption in the random oracle model (p.4353–4356, §VIII).
- Unforgeability holds as EUF-CLSC-CMA under both Type I and Type II adversaries, reduced to the Square-DH assumption in the random oracle model (p.4356–4358, §VIII).
- The reduction is tight with no forking lemma, unlike schemes [26]–[29] with loose reductions, giving stronger guarantees than loose-reduction schemes at equal hardness (p.4359–4360, §IX.C).
- Public verifiability holds: any party verifies source and validity from the sender public key alone without secret keys (p.4353, §VII.F).
- Computation cost is 3T_sm signcrypt plus 4T_sm unsigncrypt for 7T_sm total, the lowest among the compared schemes and among secure schemes, all in general-ECC scalar multiplication with no pairings (p.4359, §IX.A).
- Ciphertext is 640 bits, equal to schemes [27]–[28] and only 57.14% of Chen et al. [29] at 1120 bits, far below pairing-based 1344 and 3392 bits, measured at 160-bit message length (p.4359, §IX.B).
- Only the proposed scheme is both pairing-free and secure against Type I and Type II attacks among the six compared, while [5], [26], [27], [29] fail Type I and [28] fails Type II (p.4359–4360, §IX.C).

## Limitations

- The implementation evidence rests on Charm-Crypto 0.50 Python simulations on a Dell laptop and a Raspberry Pi 4B at 80-bit security, so results are tied to that software and hardware setup (p.4358–4359, §IX).
- Ciphertext-size claims assume a 160-bit message and the Table II pairing versus ECC parameter choices, so other message lengths or curves change the absolute numbers (p.4359, §IX.B).
- Security holds in the random oracle model under the Square-DH assumption, so guarantees rest on idealized hashes and that hardness assumption (p.4353–4358, §VIII).
- Interpretation: the paper states no explicit deployment, revocation, or dynamic-membership mechanism for hospitals and devices, so operational IoMT enrollment and key-update behavior is untested (p.4351, §IV; p.4360–4361, §X).
- Interpretation: scope is IoMT physiological data with no VANET evaluation in the source, so transfer to vehicular channels and mobility regimes is not shown (pp.4348–4361, p.4359, §IX).

## Related Work

- The paper surveys PKI and IBC signcryption plus Barbosa-Farshim CLSC and many pairing-based successors, noting key-escrow, certificate, and public-key-replacement flaws across [10]–[17] (p.4349–4350, §II).
- Direct cryptanalysis target is Chen et al. [29] pairing-free CLSC for medical IoT, broken here by Type I public-key replacement and used as the efficiency baseline at 6T_sm and 1120 bits (p.4351–4352, §V–VI; p.4359, §IX).
- Performance and security comparators are Gong et al. [5], Chen et al. [26], Dai-Xu [27], Du et al. [28], and Chen et al. [29], compared in computation, ciphertext size, and Type I and Type II resistance (p.4359–4360, §IX).
- Vault neighbours for follow-up (navigation only, not paper claims): [[dai2022]] and [[gong2023]] as the closest pairing-free CLSC comparators in the paper comparison set (p.4359, §IX).

## Provenance

- Database + endpoint + params: IEEE Xplore via DOI 10.1109/JIOT.2023.3298840; publisher PDF; full-text dump at research/clas-vanet-audit/sources/zhang2024.txt.
- Access date: 2026-09-21 (dump audit 2026-09-22); source key ZCLEKD7V.
- Coverage: full text verified, pp. 4348–4361, IEEE Internet of Things Journal Vol. 11 No. 3; IoMT scope with 0 VANET mentions except cited refs [27]–[28]; ECC-only pairing-free equations audited.

Mode: Full-text
