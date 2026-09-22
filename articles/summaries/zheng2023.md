---
title: "A Security-Enhanced Pairing-Free Certificateless Aggregate Signature for Vehicular Ad-Hoc Networks"
authors: "Zheng, Luo, Zhang, Peng, Feng"
year: 2023
journal: "IEEE Systems Journal"
doi: "10.1109/JSYST.2022.3220869"
tags: [CLAS, VANET, pairing-free, ECC, security-enhanced, provable-security]
---

# A Security-Enhanced Pairing-Free CLAS for VANETs

## Bibliographic

- Zheng, Luo, Zhang, Peng and Feng, IEEE Systems Journal, vol. 17, no. 3, September 2023, pp. 3822–3833, DOI 10.1109/JSYST.2022.3220869, manuscript received 25 May 2022, revised 5 September and 16 October 2022, accepted 6 November 2022, published 18 November 2022 (p.3822, header/footer and footnote).
- Full text is 12 pages (pp. 3822–3833 including references and bios) under heading "ZHENG et al.: SECURITY-ENHANCED PAIRING-FREE CERTIFICATELESS AGGREGATE SIGNATURE" (p.3822–p.3833, §I–VIII).

## Problem

VANETs need data authenticity and integrity over insecure V2V/V2I channels while staying within resource-constrained OBU/RSU budgets, so protecting authenticity while improving efficiency is the main challenge (p.3822, Abstract and §I). Existing CLAS candidates either carry serious vulnerabilities or impose tremendous pairing/Map-to-point overhead unsuitable for VANETs/IoT (p.3822–p.3823, §I; p.3824, §II). Han et al. [5] offered a pairing-free CLAS for VANETs but the authors claim it has defects against malicious participants (p.3823, §I.A; p.3826, §V). The paper therefore revisits Han et al. [5] with a concrete attack and proposes a security-enhanced pairing-free CLAS (p.3823, §I.A).

## Method

The system has TA, KGC, AB, RSU and OBU with V2V/V2I traffic, pseudonym identities PIDi and timestamps Ti for conditional privacy and freshness (p.3822–p.3823, §I and Fig. 1; p.3826, §IV.B–C). Security is modeled as super Type-I (external, key replacement, no master key) and super Type-II (malicious KGC, no replacement) games with EUF-CMA targets in the random oracle model (p.3825, §IV.A). The construction uses one ECC group G of order q with generator P, master keys a and b with Kpub=aP and Tpub=bP, and three hashes to Zq with params {P, q, E, G, h1, h2, h3, Kpub, Tpub} and no pairing operator (p.3827, §VI.A). Keys are partial key di=ri+a*h1i with Ri=ri*P plus user secret xi with Xi=xi*P, signing as si=ui+di*h2i+xi*h3i with Ui=ui*P, and aggregation as s=sum si with U=sum Ui (p.3827, §VI.A). Verification checks si*P=Ui+(Ri+h1i*Kpub)*h2i+Xi*h3i singly and s*P=U+sum(Ri+h1i*Kpub)*h2i+sum Xi*h3i in aggregate using only scalar multiplication and point addition (p.3827, §VI.A; p.3828, §VI.B). Proofs reduce Type-I and Type-II aggregate forgery to ECDLP via Lemmas 1–2 and Theorems 1–2 with forking-lemma replay, and performance is measured with MIRACL on Linux against [5]–[9] at 1024-bit RSA-equivalent level (p.3828–p.3830, §VI.C–D; p.3830, §VII).

## Key findings

- Gives a concrete break of Han et al. [5]: partial key dm=a*h2m lets a malicious node compute h2m and Tm=h2m^-1 mod q and recover a=Tm*dm, exploding master-key privacy (p.3827, §V.B).
- Proves correctness of single and aggregate verification by expanding si*P and s*P into Ui+(Ri+h1i*Kpub)*h2i+Xi*h3i sums (p.3827–p.3828, §VI.B).
- Proves the scheme "existentially unforgeable against adaptive chosen…" (p.3822) for super Type-I (Theorem 1) and super Type-II (Theorem 2) under ECDLP via the forking lemma (p.3828–p.3830, §VI.C).
- Claims conditional anonymity via TA-only RID recovery, unlinkability via updated pseudonyms, integrity via hashes, and resistance to replay, MITM, impersonation, forgery and DoS (p.3830–p.3831, §VI.D).
- Reports single sign 0.979 ms and verify 3.903 ms, saving about 82.1% in [6] and about 89.1% in [7] for signing and about 67.2% in [6] and 69.7% in [7] for verification by giving up pairing, plus about 49.8% sign gain over [8]–[9] and about 19.8% verify gain over [8] (p.3830–p.3831, §VII and Tables II–III).
- Finds the scheme slightly costlier than Han et al. [5] in single sign by about 0.8% and single verify by about 50.2%, framed as a security-for-efficiency compromise for VANETs (p.3831, §VII).

## Limitations

The authors frame the only stated cost as slightly higher single sign/verify time than Han et al. [5] in exchange for enhanced security, presenting it as a compromise rather than a limitation section (p.3831, §VII). Security rests solely on the random oracle model and ECDLP hardness with no standard-model or quantum discussion (p.3828–p.3830, §VI.C). The adversary model covers only super Type-I/II forgery with no stated rogue-key or coalition aggregate-key analysis for the sum-based aggregate check (p.3825, §IV.A; p.3827, §VI.A). Interpretation: the fixed n-user aggregate form sigma=(U1…Un, s) keeps linear verifier work, so dense-traffic batch behavior is bounded by the reported 100-user timings rather than shown at larger scale (p.3827, §VI.A; p.3831, §VII and Fig. 3).

## Tables / Figures

- Fig. 1: five-party VANET system model (KGC, TA, AB, RSU, OBU) with V2V/V2I flows (p.3822, §I).
- Table I: notation descriptions for the preliminaries (p.3824, §III).
- Table II: 100-user aggregate time comparison against [5]–[9] (p.3831, §VII).
- Table III: per-operation millisecond costs from the MIRACL/Linux run used for the comparisons (p.3831, §VII).
- Fig. 2: single sign/verify millisecond bars across schemes (p.3832, §VII).
- Fig. 3: 100-user aggregate sign/verify bars across schemes (p.3832, §VII).

## Why it matters here

Interpretation: this is the pairing-free baseline our audit must pin down, because its ECC-only equations contain no e(G1, G1) pairing check while the evaluation baseline explicitly names the dropped double-Tate pairing e: G1 x G1 -> G2 (p.3827, §VI.A; p.3830, §VII). Interpretation: its aggregate verifier sums separately supplied (Ri, Xi) keys without a rogue-key binding discussion, which is exactly the surface our rogue-key question targets (p.3827, §VI.A). The verified bibliographic anchor is IEEE Systems Journal 2023 with DOI 10.1109/JSYST.2022.3220869 for citation repair (p.3822, header/footer).

## Provenance

- Database + endpoint + params: local publisher-PDF read via Zotero storage key Z4RTIJNI, file "Zheng et al. - 2023 - A Security-Enhanced Pairing-Free Certificateless Aggregate Signature for Vehicular Ad-Hoc Networks.pdf", extracted with pdftotext -layout to research/clas-vanet-audit/sources/zheng2023.txt.
- Access date: 2026-09-21.
- Full-text: Full-text verified (12 journal pages pp. 3822-3833, IEEE header/footer and DOI on p.3822 matching frontmatter); no web fetch needed.
