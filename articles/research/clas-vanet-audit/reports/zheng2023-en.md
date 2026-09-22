# Zheng et al. 2023 — Security-Enhanced Pairing-Free CLAS for VANETs (G5 EN)

## Bibliographic
- Zheng, Luo, Zhang, Peng and Feng, IEEE Systems Journal, vol. 17, no. 3, September 2023, pp. 3822–3833, DOI 10.1109/JSYST.2022.3220869, received 25 May 2022, revised 5 September and 16 October 2022, accepted 6 November 2022, published 18 November 2022 (p.3822, header/footer and footnote).
- Full text spans 12 journal pages under heading on security-enhanced pairing-free certificateless aggregate signature, Sections I–VIII plus references and bios (pp.3822–3833, §I–VIII).

## Problem
VANETs need data authenticity and integrity over insecure V2V/V2I channels within resource-constrained OBU/RSU budgets, so protecting authenticity while improving efficiency is the main challenge (p.3822, Abstract and §I). Existing CLAS candidates either carry serious vulnerabilities or impose tremendous pairing and Map-to-point overhead unsuitable for VANET and IoT settings (pp.3822–3823, §I; p.3824, §II). Han et al. offered a pairing-free CLAS for VANETs but the authors claim it has defects against malicious participants (p.3823, §I.A; p.3826, §V). The paper therefore revisits that scheme with a concrete attack and proposes a security-enhanced pairing-free CLAS (p.3823, §I.A).

## Method
- System parties are TA, KGC, AB, RSU and OBU with V2V/V2I traffic, pseudonym identities PIDi and timestamps Ti for conditional privacy and freshness (pp.3822–3823, §I and Fig. 1; p.3826, §IV.B–C).
- Security is modeled as super Type-I with key replacement and no master key versus super Type-II with malicious KGC and no replacement, targeting EUF-CMA in the random oracle model (p.3825, §IV.A).
- Construction uses one ECC group G of order q with generator P, master keys a and b with Kpub = aP and Tpub = bP, and three hashes to Zq with params {P, q, E, G, h1, h2, h3, Kpub, Tpub} and no pairing operator (p.3827, §VI.A).
- Keys are partial key di = ri + a * h1i with Ri = ri * P plus user secret xi with Xi = xi * P, signing as si = ui + di * h2i + xi * h3i with Ui = ui * P, and aggregation as s = sum si with U = sum Ui (p.3827, §VI.A).
- Single verification checks si * P = Ui + (Ri + h1i * Kpub) * h2i + Xi * h3i and aggregate verification checks s * P = U + sum (Ri + h1i * Kpub) * h2i + sum Xi * h3i using only scalar multiplication and point addition (p.3827, §VI.A; p.3828, §VI.B).
- Proofs reduce Type-I and Type-II aggregate forgery to ECDLP via Lemmas 1–2 and Theorems 1–2 with forking-lemma replay, and performance is measured with MIRACL on Linux against schemes [5]–[9] at 1024-bit RSA-equivalent level (pp.3828–3830, §VI.C–D; p.3830, §VII).

## Key findings
- Gives a concrete break of Han et al.: partial key dm = a * h2m lets a malicious node compute h2m and Tm = h2m inverse mod q and recover a = Tm * dm, exposing master-key privacy (p.3827, §V.B).
- Proves correctness of single and aggregate verification by expanding si * P and s * P into Ui + (Ri + h1i * Kpub) * h2i + Xi * h3i sums (pp.3827–3828, §VI.B).
- Proves the scheme is "existentially unforgeable against adaptive chosen…" (p.3822) for super Type-I under Theorem 1 and super Type-II under Theorem 2 assuming ECDLP hardness via the forking lemma (pp.3828–3830, §VI.C).
- Claims conditional anonymity via TA-only RID recovery, unlinkability via updated pseudonyms, integrity via hashes, and resistance to replay, MITM, impersonation, forgery and DoS (pp.3830–3831, §VI.D).
- Reports single sign 0.979 ms and single verify 3.903 ms, saving about 82.1 percent over scheme [6] and about 89.1 percent over scheme [7] for signing and about 67.2 percent over scheme [6] and 69.7 percent over scheme [7] for verification by giving up pairing, plus about 49.8 percent sign gain over schemes [8]–[9] and about 19.8 percent verify gain over scheme [8] (pp.3830–3831, §VII and Tables II–III).
- Finds the scheme slightly costlier than Han et al. in single sign by about 0.8 percent and single verify by about 50.2 percent, framed as a security-for-efficiency compromise for VANETs (p.3831, §VII).
- Presents Fig. 1 five-party VANET model, Table II 100-user aggregate time comparison, Table III per-operation millisecond costs from the MIRACL run, Fig. 2 single sign and verify bars, and Fig. 3 100-user aggregate bars (p.3822, §I; p.3831, §VII; p.3832, §VII).

## Limitations
- The authors frame the only stated cost as slightly higher single sign and verify time than Han et al. in exchange for enhanced security, presenting it as a compromise rather than a limitation section (p.3831, §VII).
- Security rests solely on the random oracle model and ECDLP hardness with no standard-model or quantum discussion (pp.3828–3830, §VI.C).
- The adversary model covers only super Type-I and Type-II forgery with no stated rogue-key or coalition aggregate-key analysis for the sum-based aggregate check (p.3825, §IV.A; p.3827, §VI.A).
- Interpretation: the fixed n-user aggregate form sigma = (U1 … Un, s) keeps linear verifier work, so dense-traffic batch behavior is bounded by the reported 100-user timings rather than shown at larger scale (p.3827, §VI.A; p.3831, §VII and Fig. 3).

## Related Work
The direct baseline is [[han2022|eCLAS: An Efficient Pairing-Free Certificateless Aggregate Signature for Secure VANET Communication]], the pairing-free CLAS attacked in Section V and improved in Section VI. The evaluation contrasts the ECC-only design against pairing-based schemes [6]–[7] by naming the dropped costly double-Tate pairing defined from G1 to G2 as the source of the savings, alongside pairing-free schemes [8]–[9].

## Provenance
- Database + endpoint + params: IEEE Xplore publisher PDF via DOI 10.1109/JSYST.2022.3220869, local text dump by pdftotext -layout.
- Access date: 2026-09-21.
- Source paths: research/clas-vanet-audit/sources/zheng2023.txt (pp.3822–3833 dump); summaries/zheng2023.md (audited ground truth); template ~/.config/opencode/skills/sam-research-crew/assets/report-en.md.
Full-text
