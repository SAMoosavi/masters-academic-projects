# On the Security of Aggregate Signature-Based Conditional Privacy-Preserving Authentication Schemes for VANETs (Shim, Kwon 2026)

## Bibliographic

- Title: On the security of aggregate signature-based conditional privacy-preserving authentication schemes for VANETs (p.1)
- Authors: Kyung-Ah Shim, Hyeokdong Kwon — National Institute for Mathematical Sciences, Daejeon, South Korea (p.1)
- Venue / Year: ICT Express 12 (2026) 566–570, year 2026 (p.1)
- DOI: 10.1016/j.icte.2026.02.012 — https://doi.org/10.1016/j.icte.2026.02.012 (p.1)
- Dates: Received 27 October 2025; Revised 19 February 2026; Accepted 24 February 2026; Available online 26 February 2026; CC BY (p.1)
- Targets cryptanalyzed (victims, not proposals): Zhu–Guan [12] IEEE Sens. J. 24(21) (2024) 35743–35756 and Chen–Guan [13] IEEE Sens. J. 25(14) (2025) 27611–27627 (p.5)

## Problem

- CLAS lets multiple vehicles combine individual signatures into one compact authenticator, cutting transmission and verification overhead in bandwidth-constrained VANETs for large-scale ITS real-time authentication (p.1).
- VANET authentication must finish within a sub-10 ms latency budget in 5G-V2X and ETSI ITS-G5 deployments, yet open wireless medium, high mobility and scale expose message fabrication, impersonation and tracking (p.1, §1).
- CL-PKC decouples key generation between a trusted authority issuing the partial private key and the user choosing a secret value and full key, with Type I adversaries replacing public keys without the master secret and Type II adversaries knowing the master secret without replacing keys, under EUF-CMA security (p.1, §1).
- The paper shows the victim Zhu–Guan and Chen–Guan CLAS-based conditional privacy-preserving schemes fall to Type I public-key-replacement forgery without the victim partial private key, because missing binding between public keys and ephemeral randomness allows algebraic elimination of the master public key (p.1) (p.3–4, §3).

## Method

- Reviews the victim Zhu–Guan pairing-free construction [12]: group G of order q with generator P, master secret s with P_pub = sP and hashes H1–H4, seeds and pseudonyms PID, secret x with X = xP, partial key pair A = aP and c = a + s·h3, keys SK = (x, c) and PK = (X, A), single sign z = b + c + x·h4 with B = bP, single verify zP = B + A + h3·P_pub + h4·X, and aggregate z_agg as the sum of z values with summed verification (p.2, §2.1).
- Victim Zhu–Guan single-sign and verification equations (ECC-only, no pairings) are stated as below (p.2, §2.1).

$$
z_{i,j} = b_{i,j} + c_{i,j} + x_{i,j}\cdot h_{4i,j},\quad B_{i,j} = b_{i,j}P
$$

$$
z_{i,j}P = B_{i,j} + A_{i,j} + h_{3i,j}\cdot P_{pub} + h_{4i,j}\cdot X_{i,j}
$$

- Reviews the victim Chen–Guan construction [13]: biometric BID with seeds, PID as encrypted identity plus timestamp, secret x with X = xP, partial key R = rP and d = r + s·h3, full keys vsk = x·h3 + d and vpk = (U = R + h3·X, R), single sign c = b + vsk + x·h4 with B = bP, single verify cP = B + U + h3·P_pub + h4·X, and aggregate c_agg as the sum with summed verification (p.2–3, §2.2).
- Victim Chen–Guan single-sign and verification equations (ECC-only, no pairings) are stated as below (p.2–3, §2.2).

$$
c_i = b_i + vsk_i + x_i\cdot h_{4i},\quad B_i = b_iP
$$

$$
c_iP = B_i + U_i + h_{3i}\cdot P_{pub} + h_{4i}\cdot X_i
$$

- Executes the Zhu–Guan Type I forgery against victim [12]: replace PK = (X, A) with adversary key (X′ = x′P, A′ = a′P), choose random b but set B = −h3·P_pub independently of b with h3 over (PID, X′, A′) where the paper prints H1, set z = a′ + x′·h4, and verification passes by cancellation to zP (p.3, §3.1).
- Zhu–Guan forgery validity follows B + A′ + h3·P_pub + h4·X′ = A′ + h4·X′ = (a′ + x′·h4)P = zP after setting B = −h3·P_pub, as derived in the validity check (p.3, §3.1).

$$
B_{i,j} + A^{\prime}_{i,j} + h_{3i,j}\cdot P_{pub} + h_{4i,j}\cdot X^{\prime}_{i,j} = (a^{\prime}_{i,j} + x^{\prime}_{i,j}h_{4i,j})P = z_{i,j}P % (p.3, §3.1)
$$

- Executes the Chen–Guan Type I forgery against victim [13]: replace vpk = (U, R) with (U′ = R′ + h3·X′, R′) using fresh r′, x′, query the allowed post-replacement signing oracle under the replaced key for (B, c), and compute reusable theta = b − x′·h4 for forging new signatures (p.3–4, §3.2).
- Forges Chen–Guan signatures on arbitrary new m′, t′ as c′ = theta + x′·h4′ with the same B, which passes B + U′ + h3·P_pub + h4′·X′ = c′P without the victim partial private key (p.3–4, §3.2).
- Diagnoses two structural causes, linear verification combinations that let B cancel h3·P_pub and unbound signing material reusable across messages, so the claimed random-oracle and ECDLP Type I and Type II proofs do not hold (p.4, §3.3).
- Applies the Shim–Kwon proposal of Sec 3.3 to patch Zhu–Guan as z = h5·b + h6·c + x·h4 with zP = h5·B + h6·A + h3·P_pub + h4·X where h5 = H5(PID, X, A, B) and h6 = H6(PID, X, A, B), adding h6·A specifically against insider collusion (p.4, §3.3).
- Applies the Shim–Kwon proposal of Sec 3.3 to patch Chen–Guan as c = h5·b + h6·vsk + x·h4 with cP = h5·B + h6·(U + h3·P_pub) + h4·X where h5 and H6 range over (PID, P_pub, vpk, B, X, m, t), at about 3n + 2 scalar multiplications for n aggregates (p.4, §3.3).

## Key findings

- Both the victim Zhu–Guan and Chen–Guan CLAS-based conditional privacy-preserving schemes are forgeable by a Type I public-key-replacement adversary without the victim partial private key (p.1) (p.3–4, §3).
- The flaw is the "lack of cryptographic binding…" between public keys and ephemeral randomness, letting verification algebraically eliminate the master public key term (p.1).
- Zhu–Guan forgery validity follows B + A′ + h3·P_pub + h4·X′ = A′ + h4·X′ = (a′ + x′·h4)P = zP after setting B = −h3·P_pub (p.3, §3.1).
- Chen–Guan forgery reuses theta = b − x′·h4 extracted via the allowed post-replacement signing oracle to sign arbitrary new messages with the same B (p.3–4, §3.2).
- Shim–Kwon proposed hash-bound fixes of Sec 3.3 stop reuse because the recovered h5·b + h6·vsk quantity depends on the original message and randomness, with h6·A and U binding added for colluding users (p.4, §3.3).
- Restored security costs about 3n + 2 scalar multiplications in aggregate verification, so heavy hash-dependent linear CLAS is judged inefficient for dense real-time VANET and a non-linear next-generation paradigm for 5G-V2X toward 6G ITS is called for with construction left as future work (p.4, §3.3; p.4–5, §4).

## Limitations

- The patched schemes restore security but need about 3n + 2 scalar multiplications for n aggregated signatures, a non-trivial cost in high-density VANET scenarios (p.4, §3.3).
- Fully blocking such attacks requires hashing all public keys and random values, which the authors say brings non-negligible latency and scalability limits in deployment (p.4–5, §4).
- No concrete replacement construction is given; message-dependent randomness, algebraically non-malleable encodings, and lightweight zero-knowledge or challenge–response batch verification are left as future work (p.4–5, §4).
- Interpretation: the evidence is scoped to the two reviewed victim schemes [12][13] with cost counted as scalar multiplications and no measured timings reported (p.2–5, §§2–4).

## Related Work

- The paper situates itself among CLAS-based conditional privacy-preserving schemes [5–11] and targets the pairing-free Zhu–Guan [12] and Chen–Guan [13] IEEE Sensors Journal constructions for cryptanalysis (p.1, §1; p.5, Refs).
- It follows the cryptanalysis-and-improvement precedent of Gong et al. PCAS [9] for pairing-free CLAS with conditional privacy in VANETs, cited in its own reference list (p.5, Ref [9]).
- Vault neighbours for follow-up (navigation only, not paper claims): [[shim2023]] and [[gong2023]].
- Further pairing-free CLAS context for the audit (navigation only, not paper claims): [[zhang2024]] and [[cahyadi2022-clas-scheme]].

## Provenance

- Database + endpoint + params: ScienceDirect (Elsevier) via DOI endpoint https://doi.org/10.1016/j.icte.2026.02.012; open-access publisher PDF under CC BY; local full-text dump at research/clas-vanet-audit/sources/shim2026.txt
- Access date: 2026-09-22
- Coverage: Full-text verified, 5 pages pp. 566–570, metadata matching header and article info including received 27 October 2025 and accepted 24 February 2026 (p.1)
- Expected-vs-retrieved: expected ICT Express 12 (2026) 566–570 via DOI, retrieved the same 5-page open-access PDF with matching title, authors, DOI and reference list [12][13] intact (p.1; p.5)
- Warnings: Sec 3.1 forgery hashes are printed as H1 over (PID, X′, A′) and (PID, X′, B, m′, t) where H3 and H4 domains are expected, carried over verbatim from the audited summary without inventing corrected formulas (p.3, §3.1); Sec 3.2 theta line carries the paper compact notation reused as theta = b − x′·h4 for forging (p.3–4, §3.2)

Mode: Full-text
