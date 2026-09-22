# A Certificateless Aggregate Signature Scheme for Security and Privacy Protection in VANET

## Bibliographic
- Authors: Eko Fajar Cahyadi, Tzu-Wei Su, Chou-Chen Yang and Min-Shiang Hwang | Year: 2022 | Venue: International Journal of Distributed Sensor Networks, Vol. 18(5) | DOI: 10.1177/15501329221080658 (p.1).
- Received 30 August 2021, accepted 6 January 2022, handling editor Yanjiao Chen (p.1).
- Corresponding author: Min-Shiang Hwang, Department of Computer Science and Information Engineering, Asia University (p.1).

## Problem
- VANET uses V2V and V2I communication where OBUs communicate over open insecure wireless channels via DSRC, so messages need authentication (p.2).
- Vehicles transmitting many messages may cause reception delays affecting the whole system, so signature compression that keeps verification cost low is beneficial for time-, bandwidth- and storage-constrained VANETs (p.1).
- Several certificateless aggregate signature schemes have issues under specific existing attacks, motivating an authentication scheme improving security, privacy and efficiency (p.1).
- The paper applies CLAS to prevent OBU devices from leaking sensitive information when sending messages (p.1).

## Method
- The scheme is pairing-based over cyclic additive G1 and cyclic multiplicative G2 of prime order q with generator P and bilinear map ^e: G1 x G1 -> G2, with KGC master secret a and Ppub = aP, TRA secret b and Tpub = bP, and RSU keys Prsui = yiP (p.8).
- System entities are OBU, RSU and trusted authority (TRA plus KGC), where RSU talks to OBU over open insecure wireless and to TRA over a secure channel, and TRA registers vehicles and traces real identities in disputes (p.2).
- Construction is described as Setup, Registration, Partial-Private-Key-Gen, Vehicle-Key-Gen, Pseudonym-Gen, Sign, Verify, then Aggregate and Aggregate-Verify (p.8).
- Partial key is pskIDi = aQIDi with vehicle check ^e(pskIDi, P) = ^e(QIDi, Ppub), vehicle keys are vskIDi = xi and vpkIDi = xiP, and pseudonyms use Ci = h3(b, IDi, Ti'), PIDi = QIDiCi, Di = h4(PIDi), Ki = CiDi (p.9–p.10).
- Sign picks Ui = uiP and hi = h6(Mi, PIDi, vpkIDi, Ui, ti), then computes Si = pskIDiK + vskIDiPpub + hiu_iPrsui with signature si = (Ui, Si) broadcast as (Mi, PIDi, vpkIDi, si, ti) (p.10).
- Verify checks ti freshness, recomputes hi and Di = h4(PIDi), then checks eq. (6) ^e(S, P) = ^e(PIDiDi + vpkIDi, Ppub) · ^e(hiUi, Prsui) (p.12).
- Aggregate sums S = sum Si over n pairs into s = (U1..Un, S), and Aggregate-Verify checks eq. (8) ^e(S, P) = ^e(sum PIDiDi + vpkIDi, Ppub) · ^e(sum hiUi, Prsui) (p.12).
- Security is modeled as Game-1/Game-2 with CreateUser/Reveal/ReplaceKey oracles for outsider Type-1 (no master key) and KGC-role Type-2 (with master key), proven existentially unforgeable in the ROM under CDH (Theorem 1/Theorem 2) (p.6, p.13, p.16).

## Key findings
- The scheme is proven existentially unforgeable against A1 in the ROM under CDH intractability (Theorem 1) (p.13).
- The scheme is proven existentially unforgeable against A2 in the ROM under CDH intractability, with the Type-2 proof sketched as comparable to Type-1 (Theorem 2) (p.16).
- Comparison Table 3 marks Ours as withstanding A1 and A2 while the six listed VANET CLAS rivals fail at least A2 (p.13).
- The paper states the design goal as "keeps the verification cost low" for constrained VANET environments (p.1).
- Measured costs use PC = 3.21 ms, SC = 0.39 ms, HC = 0.09 ms on Tate pairing 159-bit MNT at 80-bit security on i7 3.07 GHz, giving Ours Sign 3SC = 1.17 ms, Verify 3PC + 2SC = 10.41 ms, Aggregate-Verify 3PC + 2nSC = (9.63 + 0.78n) ms (p.18).
- Ours broadcasts (Mi, ti, PIDi, vpkIDi, si = (Ui, Si)) totaling 583 bytes single and 583n bytes for n messages, the smallest in Table 5 versus 715–735 byte rivals (p.19).
- Claims include mutual vehicle–TRA authentication with encrypted request and OTP, conditional privacy via one-time PIDi batches with TRA traceability, and resistance to replay (timestamps), MITM, masquerade and impersonation (reduction to CDHP) (p.9, p.16–p.17).

## Limitations
- Verify and Aggregate-Verify still need 3 pairings, and pairing (PC) is the dominant cost versus SC/HC (p.18–p.19).
- Performance comparison is restricted to CDHP-based CLAS rivals using bilinear maps in Verify/Aggregate-Verify, so no pairing-free comparison is grounded in the paper (p.18).
- Evaluation rests on a Tate pairing 159-bit MNT 80-bit-security setup on an i7 3.07 GHz CPU, a dated low-security testbed for extrapolating to modern deployments (p.18).
- Interpretation: the paper never analyses a Type-III (malicious TRA/RSU collusion) adversary, so no Type-III claim can be grounded in its Game-1/Game-2 model and comparison table (p.6, p.13).
- Communication saving depends on the assumed sizes G1 = 128 bytes, hash/Zq = 20 bytes, timestamp = 4 bytes and VANET message = 67 bytes, so the 583-byte figure is conditional on those parameters (p.19).

## Related Work
- The companion survey by the same first author systematises 23 CLAS-in-VANET schemes with the same Type-1/Type-2 ROM game model, see [[summaries/cahyadi2022-survey]], and this paper instantiates one pairing-based entry in that space with explicit A1+A2 proofs (p.1, p.13).
- A standard-model CLAS alternative proves unforgeability without random oracles, see [[summaries/wang2022]], while this paper stays in the ROM under CDH with Game-1/Game-2 oracle proofs (p.13–p.16).
- A pairing-free CLAS line removes the 3-pairing Verify/Aggregate-Verify bottleneck reported here, see [[summaries/zheng2023]], whereas Ours keeps 3PC plus 2SC/2nSC as its dominant cost (p.18–p.19).
- Table 3 positions Ours against six prior VANET CLAS rivals that fail at least A2, and Tables 4–5 benchmark only CDHP-based rivals on Sign/Verify/Aggregate-Verify and bytes per message (p.13, p.18–p.19).

## Provenance
- Database + endpoint + params: SAGE Journals (journals.sagepub.com/home/dsn), DOI 10.1177/15501329221080658, publisher PDF via DOI resolution.
- Access date: 2026-09-22.
- Expected full text, retrieved full text as 1265-line dump at research/clas-vanet-audit/sources/cahyadi2022-clas-scheme.txt; ground-truth summary summaries/cahyadi2022-clas-scheme.md; equations copied from summary with locators intact, no new math.
- Mode: Full-text.
