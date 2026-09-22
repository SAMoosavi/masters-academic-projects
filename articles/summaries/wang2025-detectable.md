---
title: "A privacy-preserving certificate-less aggregate signature scheme with detectable invalid signatures for VANETs"
authors: "Xiaoliang Wang, Peng Zeng, Guikai Liu, Kuan-Ching Li, Yuzhen Liu, Biao Hu, Francesco Palmieri"
year: 2025
journal: "Journal of Information Security and Applications"
doi: "10.1016/j.jisa.2025.104001"
tags: [certificateless-signature, aggregate-signature, detectable-invalid, V2V, VANET]
---

# A privacy-preserving certificate-less aggregate signature scheme with detectable invalid signatures for VANETs

## Bibliographic
- Authors: Xiaoliang Wang, Peng Zeng, Guikai Liu, Kuan-Ching Li, Yuzhen Liu, Biao Hu, Francesco Palmieri (p.1)
- Year: 2025 | Venue: Journal of Information Security and Applications, vol. 89, article 104001 (p.1)
- DOI: 10.1016/j.jisa.2025.104001, available online 18 February 2025 (p.1)
- Corresponding author: Kuan-Ching Li, kuancli@pu.edu.tw (p.1)

## Problem
VANETs improve traffic efficiency but face reliable message exchange and privacy-preserving concerns (p.1, §Abstract).
Under resource-limited conditions many signed safety messages must be verified in a short period (p.1, §Abstract).
Vehicles broadcast safety messages every 100–300 ms under DSRC, while one-by-one verification costs bandwidth and computation (p.2, §1).
Some existing CLAS schemes lack an efficient invalid-signature detector or carry unnecessary verification overhead when aggregate verification fails (p.1–2, §Abstract–§1.2).

## Method
The system has an upper layer (AS plus TAs split into KGC and TRA) and a lower layer (RSUs plus vehicles with OBUs communicating via DSRC) (p.3, §2.4).
Setup builds G1, G2 of prime order q with pairing e: G1 x G1 -> G2 and generator P, picks t with Tpub=tP, k with Kpub=kP, y with Ypub=yP, and seven hashes H0,4,5,6 to Zq* and H1,2,3 to G1 (p.4, §3).
TRA picks random u_i and sets PIDi,1=H0(t) xor u_i and PIDi,2=IDi xor H0(u_i || TPi), outputting PIDi=(PIDi,1, PIDi,2, TPi) (p.4, §3).
KGC computes Qi=H1(PIDi) and di=kQi over a secure channel, while the vehicle picks xi and sets Xi=xiP (p.4, §3).
The vehicle picks ri with Ri=riP and forms W=H2(Kpub || P), U=H3(Tpub || P), gi=H4(PIDi || mi || Xi || Kpub || Ti || Ri), hi=H5(PIDi || mi || Xi || Tpub || Ti || Ri), and Si=riW+gi xiU+hi di with sigma_i=(Ri, Si) (p.4–5, §3).
RSU checks timestamps Ti, sums S=sum Si and R=sum Ri, and AS checks e(S,P)=e(R,W)e(sum giXi,U)e(sum hiQi,Kpub) with a correctness derivation (p.5, §3).
On failure AS runs Algorithm 1 binary search that splits the group and verifies the left subgroup, recursing only where needed, unlike Algorithm 2 from [20,23] which re-aggregates and re-verifies the right subgroup unnecessarily (p.5, §3).
TRA recovers u_i=H0(t) xor PIDi,1 and IDi=H0(u_i || TPi) xor PIDi,2 for accountability (p.5, §3).

## Key findings
- Theorem 1 states the scheme is EUF-ACMAs under the ROM-based CDH assumption via Lemmas 1 and 2 (p.5, §4.1).
- Lemma 1 bounds Type-I success as eps' >= (1-zeta)^{qppk+qs}(1-(1-zeta)^n)eps after qppk partial-key, qupk user-key and qs signature queries (p.6, §4.1).
- Lemma 2 bounds Type-II success as eps' >= (1-zeta)^{qupk+qs}(1-(1-zeta)^n)eps with Kpub=kknownP and U=u(bP) embedding (p.6–7, §4.1).
- Algorithm 1 detects invalid signatures and TRA outputs the corresponding real identities, avoiding the redundant right-subgroup verification shown in Algorithm 2 (p.5, §3).
- Signature generation costs 2Thtp+4Tpm ~= 27.94 ms given Tbp=3.23 ms, Thtp=4.43 ms and Tpm=4.77 ms (p.8, §5).
- Aggregate verification costs 4Tbp+(n+2)Thtp+2nTpm, i.e. about 1418.78 ms at n=100 (p.8–9, §5–Table 3).
- At n=100 the scheme saves about 24.1% versus [27,30], about 25.0% versus [28], about 84.9% versus [31], about 34.5% versus [32] and about 35.8% versus [33] as claimed, while it is about 1.0% more expensive than [24] and about 0.5% more than [29]; only this scheme provides invalid-signature detection and [24,29] are marked insecure against Type-II (p.8–9, §5–Table 3).
- Conditional anonymity, unlinkability, traceability, replay resistance via Ti, impersonation resistance via CDH, and man-in-the-middle resistance are claimed with pseudonym and trace equations (p.7, §4.2).

## Limitations
The authors state future work extends the approach to e-healthcare and optimizes toward pairing-free CLAS with a better detector (p.9, §6).
Interpretation: H6 is defined in Setup with H0,4,5,6 to Zq* (p.4, §3), yet signing, verification and proofs use only H1–H5 (p.4–7, §3–§4.1).
Interpretation: Ypub appears in params (p.4, §3), yet the verification equation uses only Kpub and Tpub (p.5, §3).
Evaluation uses one desktop (i5-7300HQ, 8 GB, Windows 10, Java with JPBC) for timing Tbp, Thtp and Tpm (p.8, §5).

## Tables / Figures
- Table 1: notation list (TA, AS, RSU, TRA, KGC, ROM, CDH, Vi, IDi, PIDi, k/Kpub, t/Tpub, xi/Xi, di, Ti, TPi, sigma_i, sigma, params, A1/A2, C) (p.3, §2).
- Fig. 1: two-layer VANET system model with AS/TAs above and RSUs/vehicles below (p.3–4, §2.4).
- Algorithm 1: proposed Invalid Signatures Detection binary search over (L1, L2, low, high) (p.5, §3).
- Algorithm 2: prior Invalid Signatures Search from [20,23] with the extra verification step (p.5, §3).
- Table 2: dominant-operation times Tbp=3.23 ms, Thtp=4.43 ms, Tpm=4.77 ms (p.8, §5).
- Table 3: signature and aggregate-verification cost plus security versus [24,27–33] (p.9, §5).
- Fig. 2 and Fig. 3: time overhead in signature generation and aggregate verification (p.8, §5).

## Why it matters here
For the question "Verify bib + detectable-invalid claims", the bib is verified as JISA 89 (2025) 104001 with DOI 10.1016/j.jisa.2025.104001 (p.1).
The detectable-invalid claim is verified as Algorithm 1 binary search that isolates invalid signatures and recovers identities, explicitly contrasted with Algorithm 2 overhead (p.5, §3).
Security and cost context is verified as EUF-ACMAs under ROM-CDH with 4Tbp+(n+2)Thtp+2nTpm verification and Table 3 comparison (p.5–9, §4.1–§5).

## Provenance
- Database + endpoint + params: Zotero local storage key ZNYGPD2R; PDF filename "Wang et al. - 2025 - A privacy-preserving certificate-less aggregate signature scheme with detectable invalid signatures.pdf"; publisher endpoint https://doi.org/10.1016/j.jisa.2025.104001
- Access date: 2026-09-21
- Full-text: local PDF extracted with pdftotext -layout to 797-line text dump, 10 journal pages
