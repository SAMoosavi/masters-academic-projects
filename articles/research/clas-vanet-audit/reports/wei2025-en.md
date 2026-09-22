# A New Efficient and Provably Secure Certificateless Signature Scheme Without Bilinear Pairings for the Internet of Things (Wei, Liu, Zhao, Li, Liu 2025) — IoT-CLS single-signer, NOT aggregate, NOT VANET

## Bibliographic

- Authors: Zhanzhen Wei, Xiaoting Liu, Hong Zhao, Zhaobin Li, Bowen Liu | Year: 2025 | Venue: Sensors, volume 25, article 5224 | DOI: 10.3390/s25175224
- Affiliations: Department of Electronic and Communication Engineering, Beijing Electronic Science and Technology Institute, Beijing, China; correspondence Xiaoting Liu (p.1, header)
- Article history: received 9 July 2025, revised 9 August 2025, accepted 21 August 2025, published 22 August 2025, MDPI open access CC BY (p.1, header)
- Length and keywords: 14 pages; certificateless signature, Internet of Things, forgery attack (p.1, header; pp.1–14)
- Scope: IoT-CLS single-signer only — not a VANET scheme and not an aggregate (CLAS) scheme (p.1, Title; p.1, Abstract)

## Problem

IoT traffic runs over the open public Internet exposed to eavesdropping, tampering, and forgery, so lightweight authentication with unforgeability and non-repudiation is paramount (p.2, §1).
Certificate management for store, distribute, verify, and revoke is too heavy for IoT, while IBC escrows full private keys to the PKG, motivating certificateless keys where the KGC issues only a partial key (p.2, §1).
Prior pairing-free CLS repairs keep falling in turn — He to Type II, Gong to Type I, then Wang–Yeh–Jia–Du–Xiang–Ma–Feng chains each broken again (p.2–3, §1.1).
A shared vulnerability class persists: even fixes blocking older forgeries still admit a new common-factor forgery by Type I adversaries (p.1, Highlights; p.3, §1.2).
Scope here is single-signer IoT-CLS only, not aggregate and not VANET (p.1, Title; p.1, Abstract).

## Method

- Review four PF-CLS schemes (Xiang, Du, Karati, Pakniat–Vanda) over six algorithms from Setup to Verification (p.4–6, §3).
- Define the Common Factor Substitution Attack: independent randoms scaled by a common factor so replaced keys and signatures still verify (p.8, Definition 1).
- Break Xiang/Du via forged keys scaled by the system key with a matching forged scalar passing verification for any message (p.7, §4.1).
- Harden Pakniat–Vanda with h1 over Q_ID to block Shim's forgery, then break the hardened variant with the same common-factor attack (p.7–8, §4.2).
- Break Karati by the same attack, by direct reference to the above forgery flow (p.8, §4.2).
- Propose an enhanced scheme binding both key parts to P_pub via H1(ID, X_ID, R_ID, P_pub), with Schnorr-style signing and single-equation verification (p.8, §5).
- Prove EUF-CMA security against super Type I and Type II adversaries in ROM under ECDLP via the forking lemma (Theorems 1–2) (p.9–11, §6).
- Benchmark sign/verify time and signature size against six comparators on MIRACL over 1000 runs (p.11–12, §7).

### Setup (copied from audited summary, locators intact)

KGC selects elliptic-curve additive group G of order q with generator P, master key s, public key P_pub = sP, and publishes params = (G, q, P, P_pub, H1, H2) (p.8, §5).

$$
\begin{aligned}
&s \leftarrow \mathbb{Z}_q^*,\quad P_{pub} = sP \\
&H_1 : \{0,1\}^* \times \mathbb{G}^3 \rightarrow \mathbb{Z}_q^*,\quad H_2 : \{0,1\}^{*2} \times \mathbb{G}^3 \rightarrow \mathbb{Z}_q^* % (p.8, §5)
\end{aligned}
$$

### Set Secret Value (copied from audited summary, locators intact)

User picks secret x_ID and computes X_ID = x_ID·P, transmitting it to KGC (p.8, §5).

$$
\begin{aligned}
&x_{ID} \leftarrow \mathbb{Z}_q^* \\
&X_{ID} = x_{ID}P
\end{aligned}
$$

### Partial Private Key Extract (copied from audited summary, locators intact)

KGC picks r_ID, computes R_ID = r_ID·P, h1 = H1(ID, X_ID, R_ID, P_pub), partial key d_ID = r_ID + h1·s, and sends (d_ID, R_ID) over a secure channel (p.8, §5).

$$
\begin{aligned}
&r_{ID} \leftarrow \mathbb{Z}_q^*,\quad R_{ID} = r_{ID}P \\
&h_1 = H_1(ID, X_{ID}, R_{ID}, P_{pub}) \\
&d_{ID} = r_{ID} + h_1 \cdot s
\end{aligned}
$$

### Set Private/Public Key (copied from audited summary, locators intact)

Full private key SK_ID = (x_ID, d_ID) and public key PK_ID = (X_ID, R_ID) (p.8, §5).

$$
\begin{aligned}
&SK_{ID} = (x_{ID}, d_{ID}) \\
&PK_{ID} = (X_{ID}, R_{ID})
\end{aligned}
$$

### Signature (copied from audited summary, locators intact)

Signer picks t, computes T = tP, h2 = H2(m, ID, X_ID, R_ID, T), v = t + h2·(x_ID + d_ID), outputting τ = (T, v) (p.8, §5).

$$
\begin{aligned}
&t \leftarrow \mathbb{Z}_q^*,\quad T = tP \\
&h_2 = H_2(m, ID, X_{ID}, R_{ID}, T) \\
&v = t + h_2(x_{ID} + d_{ID}) \bmod q \\
&\tau = (T, v)
\end{aligned}
$$

### Verification (copied from audited summary, locators intact)

Verifier recomputes h1, h2 and accepts iff vP = T + h2·(X_ID + R_ID + h1·P_pub) (p.8, §5).

$$
\begin{aligned}
&h_1 = H_1(ID, X_{ID}, R_{ID}, P_{pub}) \\
&h_2 = H_2(m, ID, X_{ID}, R_{ID}, T) \\
&vP \stackrel{?}{=} T + h_2(X_{ID} + R_{ID} + h_1 \cdot P_{pub})
\end{aligned}
$$

Pairing-free construction uses only ECC scalar multiplication, point addition, modular arithmetic, and general hashes — no bilinear-pairing operator appears anywhere in the scheme or summary equations (p.8, §5; p.11–12, Tables 1–2).

## Key findings

- The common-factor forgery passes verification for any user on any message in all four schemes, including the Shim-hardened Pakniat–Vanda variant (p.7–8, §4.1–4.2).
- The vulnerability class is structural: forged components share no relation the verifier can check, so prior per-scheme patches do not remove it (p.8, Definition 1).
- The enhanced scheme resists both super Type I and super Type II forgeries in ROM under ECDLP (Theorems 1–2) (p.9–11, §6).
- Verification costs 3Tsm + 3Tpa = 1.008945 ms, below Feng/Ma at 1.343218 ms and Du/Xiang at 1.341176 ms, with total cost about 19.76–20.05% below Feng/Ma, Du/Xiang, and Pakniat (p.12, §7; p.12, Table 2).
- Signature size is |G| + |Z_q*| = 480 bits, half the communication of Pakniat's 840-bit signatures (p.12, §7; p.12, Table 2).

## Limitations

- Single CLS only — no aggregation, batch verification, pseudonyms, traceability, or VANET mobility handling, so VANET transfer needs separate work (p.8, §5; p.13, §8).
- Evaluation is computation-only on one desktop CPU with no IoT-device deployment or side-channel measurement, listed as future work alongside ZKP/ring-signature anonymity (p.13, §8).
- Interpretation: the unforgeability proofs assume the random oracle model and ECDLP hardness with the forking lemma, so guarantees rest on those idealizations (p.9, §6).
- Interpretation: efficiency evidence rests on MIRACL timings on one desktop CPU rather than constrained IoT hardware or field deployment, so real-device behavior is untested (p.11–12, §7).

## Related Work

- Direct cryptanalysis lineage is He, Gong, Yeh, Wang, Jia, Du, Xiang, Ma, and Feng PF-CLS repairs each broken in turn, reviewed as the break-fix chain motivating the new attack (p.2–3, §1.1).
- The four in-scope targets are Xiang, Du, Karati, and Pakniat–Vanda PF-CLS schemes reviewed over six algorithms and broken by the common-factor attack including the Shim-hardened variant (p.4–8, §3–4).
- Vault neighbours for follow-up (navigation only, not paper claims): [[gong2023]] and [[iqbal2023]] and [[han2022]] (pairing-free CLS/CLAS comparators in vault).

## Provenance

- Database + endpoint + params: MDPI Sensors via DOI 10.3390/s25175224; publisher PDF; local full-text dump at research/clas-vanet-audit/sources/wei2025.txt
- Access date: 2026-09-22
- Coverage: Full-text verified, 14 pages, frontmatter metadata matching title block and citation Sensors 2025, 25, 5224 (p.1)

Mode: Full-text
