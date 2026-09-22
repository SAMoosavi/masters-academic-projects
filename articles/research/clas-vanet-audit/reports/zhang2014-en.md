# Notes on the Security of Certificateless Aggregate Signature Schemes (Zhang, Shen, Wu 2014)

## Bibliographic

- Authors: Futai Zhang, Limin Shen, Ge Wu | Year: 2014 | Venue: Information Sciences 287 (2014) 32–37 | DOI: 10.1016/j.ins.2014.07.019 | Publisher page: www.elsevier.com/locate/ins (p.32)
- Affiliations: Jiangsu Engineering Research Center of Information Security and Privacy Protection Technology, School of Computer Science and Technology, Nanjing Normal University, Nanjing, China (p.32, header)
- Article history: received 14 December 2012, revised 20 March 2014, accepted 20 July 2014, available online 28 July 2014, Elsevier (p.32, Article Info)
- Length and keywords: pp. 32–37; Aggregate signature, Certificateless aggregate signature, Unforgeability, Bilinear map (p.32)

## Problem

Xiong et al. (2013) claimed an efficient certificateless aggregate signature (CLAS) with unsynchronized signers, proven secure in the random oracle model under the computational Diffie–Hellman assumption, but this paper finds that conclusion wrong and the scheme insecure (p.32, §Abstract; p.33, §1).

A secure CLAS must provide unforgeability such that nobody can generate a valid aggregate without full possession of all valid individual signatures, requiring both an existentially unforgeable basic CLS and an Aggregate algorithm resistant to coalition attacks (p.33, §2.2).

In CL-PKC a malicious-but-passive KGC may embed trapdoors from setup and prior CLS schemes were already broken by such KGC attacks, so the paper states three conditions: basic CLS unforgeable against Type I adversary and malicious KGC, Aggregate resistant to insider collusion, and Aggregate resistant to signer-plus-malicious-KGC collusion (p.32–p.33, §1–§2.2).

## Method

- The paper revisits Xiong et al.'s nine-algorithm CLAS (Setup, PartialPrivateKeyExtract, SetSecretValue, SetSecretKey, SetPublicKey, Sign, Verify, Aggregate, AggregateVerify) with groups G1, G2 of prime order q, pairing e^: G1 × G1 → G2, P, Q ∈ G1, Ppub = sP, and hashes H1: {0,1}* → G1 and H2: {0,1}* → Zq* (p.33–p.34, §3.1).
- It reproduces the signing form Vi = pskIDi + hi · ri · Ppub + hi · xIDi · Q with Ui = riP and hi = H2(mi, IDi, upkIDi, Ui), the Verify equation e^(Vi, P) = e^([QIDi + hi · Ui], Ppub) e^(hi · upkIDi, Q), and aggregation V = ΣVi with the corresponding AggregateVerify equation (p.34, §3.1).
- It then demonstrates four concrete forgery/collusion attacks in staged procedures: honest-but-curious KGC (§3.2.1), malicious-but-passive KGC (§3.2.2), colluding inside signers (§3.2.3), and insider signer plus malicious KGC (§3.2.4) (p.33–p.35, §3.2).
- It proposes a new CLAS whose basic signature is the Chen et al. short signature, with Setup over additive G1 and multiplicative GT, bilinear pairing e: G1 × G1 → GT, master secret s, master public key P0 = sP, verifier key Y = yP, and hashes H0: {0,1}* → Zq*, H1: {0,1}* → G1, H2: {0,1}* → G1, H: {0,1}* → {0,1}^l (p.35–p.36, §4).
- In the new scheme PartialPrivateKeyExtract picks random x and sets dID = x + sH0(ID, pkID,2, P0) with pkID,2 = xP, SetSecretValue picks rID, SetPublicKey sets pkID = (pkID,1, pkID,2) with pkID,1 = rIDP, Sign sets T1 = H1(m, ID, pkID, P0) and T2 = H2(m, ID, pkID, P0) and outputs S = rIDT1 + dIDT2, and Verify checks e^(S, P) = e^(pkID,1, T1)e^(pkID,2 + hP0, T2) with h = H0(ID, pkID,2, P0) (p.36, §4).
- It defines aggregation as r = H(e^(r1, Y), …, e^(rn, Y)) using the verifier public key Y and AggregateVerify recomputing hj, TIDj,1, TIDj,2 and checking r against H(e^(ypkID1,1, TID1,1)e^(pkID1,2 + h1P0, yTID1,2), …) (p.36, §4).
- It proves Theorem 1 that, assuming H collision-resistant, the aggregate is valid if and only if every individual signature is valid, by expanding e^(rj, Y) = e^(rj, yP) both directions (p.36, §4).

## Key findings

- Xiong et al.'s models cover no insider or coalition security and their proof uses an honest-but-curious KGC rather than a malicious-but-passive KGC (p.34, §3.2).
- An honest-but-curious KGC knowing master secret s can query the Sign oracle on m′n, recover xIDn · Q from V′n − pskIDn − h′nsU′n over h′n, forge (Un, Vn) on a new mn, combine with n − 1 oracle signatures, and pass AggregateVerify, giving universal forgery (p.34, §3.2.1).
- A malicious-but-passive KGC that sets Q = tP at setup can forge any signer's (Un, Vn) as Vn = pskIDn + hn · rn · Ppub + hn · t · upkIDn without the secret key since t · upkIDn = xIDn · Q, then aggregate with oracle signatures to a valid CLAS, giving universal forgery (p.34–p.35, §3.2.2).
- Two inside signers can exchange r1Ppub and r2Ppub, set V1 = pskID1 + h2 · r2 · Ppub + h1 · xID1 · Q and V2 = pskID2 + h1 · r1 · Ppub + h2 · xID2 · Q so each (Ui, Vi) is invalid yet V1 + V2 satisfies the aggregate equation, so aggregate validity does not imply individual validity (p.35, §3.2.3).
- A dishonest signer Un publishing bP = aP − Σ^{n−1}_{i=1}upkIDi as its public key, colluding with a KGC knowing t with Q = tP, can output V = ΣpskIDi + Σhi · ri · Ppub + Σhi · t · upkIDi without the other signers' private keys and always satisfy verification, i.e. arbitrary CLAS forgery (p.35, §3.2.4).
- The paper concludes all four attacks break unforgeability, insider attacks apply beyond certificateless settings to identity-based and traditional PKC, while signer-plus-malicious-KGC collusion is certificateless-specific (p.37, §5).
- The new scheme's aggregate validity is equivalent to every individual signature's validity by Theorem 1 under collision-resistant H, which the authors claim no prior CLAS in the literature achieved (p.36–p.37, §4–§5).

## Limitations

- The detailed CLAS security models are omitted for space limitation, so the formal Type I / malicious-KGC games are not reproduced in the paper (p.33, §2.2).
- The new aggregation assumes the generator knows or can easily obtain the receiver/verifier public key Y, either dedicated for aggregate verification or set as Y = pkID,1 of the receiver (p.36, §4).
- The authors leave as an open issue how to design a secure CLAS without using the verifier's public key in aggregating, calling it a challenging problem (p.37, §5).
- Interpretation: the claimed short-aggregate plus validity-equivalence benefit therefore depends on the extra verifier-key interaction assumed in §4 (p.36, §4).

## Related Work

- The paper positions Xiong et al. [18] CLAS with unsynchronized signers as the cryptanalysis target, alongside the Gong et al. two CLAS schemes [8] and other CLAS constructions [19,23,25] in a weak-model lineage (p.33, §1).
- The replacement scheme builds on the Chen et al. short signature [6], proved existentially unforgeable under the CDH assumption in the random oracle model, as its basic CLS (p.36, §4).
- Vault neighbours for follow-up (navigation only, not paper claims): [[gong2023]] and [[cahyadi2022-clas-scheme]] and [[wu2025-collusion]].

## Provenance

- Database + endpoint + params: Zotero local storage, key N7DC7UGX, file "Zhang et al. - 2014 - Notes on the security of certificateless aggregate signature schemes.pdf"; no remote API used; local dump at research/clas-vanet-audit/sources/zhang2014.txt
- Access date: 2026-09-22
- Coverage: 6 pages (pp.32–37), metadata matching header and Article Info (p.32)

Mode: Full-text
