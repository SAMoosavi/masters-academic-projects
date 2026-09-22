# A Comprehensive Survey on Certificateless Aggregate Signature in Vehicular Ad Hoc Networks

## Bibliographic

- Authors: Eko Fajar Cahyadi, Min-Shiang Hwang | Year: 2022 (published online 10 Jan 2022) | Venue: IETE Technical Review, vol. 39, no. 6, pp. 1265–1276 | DOI: 10.1080/02564602.2021.2017800 (p.1265)

## Problem

VANETs disseminate traffic messages via V2V/V2I links with vehicles broadcasting to hundreds of peers every 100–300 ms over open wireless channels, so authentication is time-critical and privacy-sensitive (p.1265, §1).
Traditional PKC requires a certificate per public key, which increases verification time, while ID-PKC removes certificates but lets the KGC generate all private keys, creating the key-escrow problem where a compromised KGC exposes every key (pp.1265–1266, §1).
Certificateless PKC (Al-Riyami–Paterson) splits each private key between the KGC and the user to remove escrow, and aggregate signatures compress many signers' signatures into one to cut verification cost, making their CLAS combination valuable for resource-constrained VANETs (p.1266, §1).
Since the first CLAS-in-VANETs article in 2015 at least 23 schemes were published with no complete survey, so this paper claims to be the initial comprehensive survey of their features, cryptanalysis links, security and performance (p.1266, §1).

## Method

The survey reviews 23 CLAS-in-VANETs schemes [16]–[38] published 2015–2021, tabulating per-scheme algorithm counts (seven to nine), claimed contributions and cryptanalysis/improvement links in Table 1 (pp.1270–1271, §4).
It systematises the background topology as two layers — an upper layer of TA (KGC plus tracking authority TRA) with the application server as aggregate verifier, and a lower layer of RSUs and OBUs — with TRA/KGC fully trusted, RSUs semi-trusted (honest-but-curious) and OBUs untrusted behind tamper-proof devices (p.1267, §2.1).
It defines seven security/privacy requirements S1–S7: non-repudiation, identity privacy-preserving, message authentication, traceability, replay-attack resistance, unlinkability and impersonation-attack resistance (p.1268, §2.6).
It defines a generic eight-algorithm CLAS framework (Setup, PseudonymGen, PartialPrivateKeyGen, VehicleKeyGen, Sign, Verify, Aggregate, AggregateVerify) with the RSU as verifier/aggregator and the application server as aggregate verifier (pp.1268–1269, §3.1).
It adopts the Type-1 (public-key replacement, no master secret) versus Type-2 (master secret, no key replacement) adversary model with five oracles (CreateUser, RevealPartialPrivateKey, RevealPrivateKey, ReplaceKey, Sign) and Game-1/Game-2 existential-unforgeability definitions (pp.1269–1272, §3.2).
It distinguishes pairing-based CDHP assumptions from pairing-free ECC/ECDLP assumptions, noting the pairing operation (PC) dominates scalar multiplication (SC) and MapToPoint-hash (HC) costs (pp.1267–1268, §2.3–§2.5; p.1273, §4.2).
Performance is reduced to Sign/Verify/AggregateVerify operation counts (PC/SC/HC/SEC, n verified messages) in Table 3, reporting two 80-bit-security literature setups: MNT-curve Tate pairing (PC/SC/HC 3.21/0.39/0.09 ms) and supersingular-curve pairing (PC/SC/HC/SEC 4.2110/1.7090/4.406/0.4420 ms) (p.1273, §4.2).

## Key findings

- Malhi–Batra [16] (2015, nine algorithms) and Horng et al. [17] (2015, seven algorithms) are the first two partial-aggregation CLAS-in-VANETs schemes (p.1270, Table 1).
- Li et al. [18] cryptanalyse Horng et al. [17], showing vulnerability to "malicious-but-passive KGC attacks" (p.1270, Table 1).
- Cui et al. [19] (2018) is the first pairing-free ECDLP scheme in the list, using partial aggregation with RSU batch verification (p.1270, Table 1; p.1273, Table 3).
- Kumar–Sharma [20] cryptanalyse Cui et al. [19], showing insecurity against Type-2 adversary attack (p.1270, Table 1).
- Yang et al. [21] cryptanalyse Kumar–Sharma [20], showing insecurity against internal signers and "coalition attacks from malicious…" KGC plus RSU, at higher AggregateVerify cost (p.1270, Table 1).
- Zhong et al. [23] (2019) is a full-aggregation scheme claiming better efficiency than [16] (p.1270, Table 1).
- Li et al. [30] (2020) and Kamil–Ogundoyin [32] (2020) each cryptanalyse Zhong et al. [23], showing Type-2 signature-forgery vulnerability (pp.1270–1271, Table 1).
- Kamil–Ogundoyin [24] (2019) is a pairing-free full-aggregation scheme that cryptanalyses Cui et al. [19] for Type-2 forgery (p.1270, Table 1).
- Zhao et al. [25] (2019) cryptanalyse Hu et al.'s scheme for forgery attacks, and Hu et al. [26] (2019) cryptanalyse Shen et al. [60] for forgery attacks (p.1270, Table 1).
- Ye et al. [37] (2021) cryptanalyse Kamil–Ogundoyin [24], revealing weakness to "coalition attacks from malicious vehicles" (p.1271, Table 1).
- Ali et al. [28] (2019) add blockchain for pseudonym-revocation transparency, and Ren et al. [38] (2021) use blockchain for vehicle-identity checks with batch verification in Verify (pp.1270–1271, Table 1).
- Li et al. [29] (2019) propose online/offline signing with heavy computation in the offline phase, claiming pairing-free efficiency gains over [16][17][23] (p.1271, Table 1).
- Xu et al. [31] (2020) target secure routing with a seven-algorithm partial-aggregation scheme (p.1271, Table 1).
- Mei et al. [34] (2021) is a full-aggregation scheme claiming better efficiency than [20]–[22], and Thumbur et al. [35] (2021) is an ECDLP scheme claiming apparent efficiency advantages over CDHP schemes (p.1271, Table 1).
- Table 2 grades every scheme on SA1/SA2 plus S1–S7 with citing cryptanalyses, and states refs [25]–[38] still have no cryptanalysis from others since considerably new (p.1272, §4.1).
- Table 3 shows CDHP pairing-based schemes structurally costlier than ECDLP pairing-free ones because of bilinear pairings, with per-scheme Sign/Verify/AggregateVerify counts in PC/SC/HC/SEC (p.1273, §4.2).

## Limitations

The authors state rapid topology change and high vehicle mobility leave rogue-vehicle identification challenging in VANETs (p.1273, §5).
The authors state illegal/malicious messages make the AggregateVerify phase inefficient and call for filtering them while retaining the remaining legal messages (p.1273, §5).
The authors propose, but do not perform, a future quantitative/bibliometric analysis of publications per year, per publisher, and journals versus publications (p.1273, §5).
Interpretation: cross-paper timing claims are not directly comparable because the literature uses two incompatible 80-bit setups (MNT Tate versus supersingular pairings with different PC/SC/HC/SEC timings), which the survey reports without normalising (p.1273, §4.2).

## Related Work

- [[vallent2021]] — surveyed here as ref [36]: eight-algorithm conditional privacy-preservation scheme whose smart-grid framing gets no further technical discussion in the survey (p.1271, Table 1).
- [[cahyadi2022-clas-scheme]] — scheme-level companion to this survey's generic eight-algorithm CLAS framework and Tables 1–3 comparison method (pp.1268–1271, §3.1–§4).
- [[han2022]] — related pairing-free CLAS work in the same time-critical V2I verification setting this survey motivates (p.1265, §1).
- [[zhang2014]] — background VANET authentication lineage of the kind this survey positions CLAS against (PKI-, symmetric-, ID-based, CLS/CLAS- and group-signature categories) (p.1266, §1).

## Provenance

- Database + endpoint + params: DOI 10.1080/02564602.2021.2017800 via Taylor & Francis (IETE Technical Review, vol. 39, no. 6); text dump research/clas-vanet-audit/sources/cahyadi2022-survey.txt (874 lines, pdftotext -layout); audited ground truth summaries/cahyadi2022-survey.md.
- Access date: 2026-09-22; expected the 12-page survey (pp. 1265–1276) and retrieved the full text with all pages and Tables 1–3 present.
- Mode: survey paper — no concrete scheme equations exist to extract, only the generic eight-algorithm framework plus comparison tables (pp.1268–1269, §3.1).

Full-text
