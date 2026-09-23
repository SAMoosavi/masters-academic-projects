---
title: Malhi-Batra 2015 CDH Security Proofs
aliases: [malhi2015-proofs]
tags: [clas, vanet, malhi2015, proofs]
source:: malhi2015.pdf
pages:: p.321-322, p.325-334
---
# Malhi-Batra 2015 CDH security proofs

- Bibliographic line: Malhi & Batra, "An Efficient Certificateless Aggregate Signature Scheme for Vehicular Ad-Hoc Networks", DMTCS 17(1), pp. 317-338 (2015), DOI 10.46298/dmtcs.2106, diamond OA (p.317).
- Hardness assumption is CDH in G1: given P, aP, bP for unknown a, b in Z*q, computing abP is infeasible (p.320, §3.1).
- Security target is existential unforgeability in the random oracle model against adaptive chosen-message attacks under CDH hardness (p.317, abstract).
- The model uses two adversaries: Type-I A1 without the KGC master key but with public-key replacement power, and Type-II A2 with the master key but no replacement power (p.321, §3.3).
- Six oracles are exposed: RevealPartialKey, RevealSecretKey, RevealPublicKey, RevealPseudonym, ReplacePublicKey, and Sign, with A2 denied RevealPartialKey and replacement queries since it already holds the master key (p.321-322, §3.3).
- Game I lets A1 query all six oracles and wins only with a valid forgery on an identity whose partial key was never revealed and whose message was never signed (p.322, §3.3).
- Game II gives A2 both params and master key, and A2 wins only with a valid forgery on an identity whose secret key was never revealed and whose message was never signed (p.322, §3.3).
- Definition 1 declares the scheme existentially unforgeable under adaptive chosen-message attack when both A1 and A2 succeed with only negligible probability (p.322, §3.3).
- Theorem 1 reduces a Type-I forger with advantage epsilon to a CDH solver running in t + phi(q1 + q2 + q3 + qk + qs + qp + qps + qsig) tm with success at least 1/((qk + 1).e) epsilon (p.325-326, §5).
- The Theorem 1 simulator embeds the CDH instance as Ppub = X = aP with Prsu = c.P, answers H1 by coin flip (ci = 0 gives Qi = alpha_i.Y, ci = 1 gives Qi = alpha_i.P), and aborts RevealPartialKey on ci = 0 identities (p.326-327, §5).
- Sign queries for ci = 0 identities are simulated without the partial key by setting Ui = ri.P - hi_jk^{-1}.PS1j.t1j so the forgery still verifies (p.327-328, §5).
- The reduction extracts abP via the forking lemma from two forgeries on the same randomness with distinct hashes, using (h*_ijk)^{-1} V*_ijk - (h0*_ijk)^{-1} V0*_ijk = [(h*_ijk)^{-1} - (h0*_ijk)^{-1}] alpha_i.abP.kj.t1j (p.328, §5).
- The success bound follows from three events (no abort on key queries, valid forgery, forgery on the embedded identity) with optimal zeta = 1/(qk + 1), giving zeta (1 - zeta)^{qk} epsilon converging to epsilon/((qk + 1).e) (p.329, §5).
- Theorem 2 reduces a Type-II forger to CDH in time t + phi(q2 + q3 + qs + qp + qps + qsig) tm with success at least 1/((qp + 1).e) epsilon, embedding the instance as Prsu = aP while the simulator holds a fresh master key lambda with Ppub = lambda.P (p.329-330, §5).
- The Theorem 2 simulator flips the coin on RevealPublicKey instead (ci = 1 gives Pi = gamma_i.Y), refuses RevealSecretKey on ci = 1, and recovers abP as (h*_ijk.gamma*_i)^{-1} [V* - lambda (kj.Q*_i.t1*_j + h*_ijk.U*_i)] (p.330-331, §5).
- Theorem 3 reduces aggregate forgery to basic-scheme forgery: from an n-user aggregate forgery with exactly one embedded identity (ck = 0, cj = 1 for j != k), the simulator strips the n - 1 known signatures and re-randomizes the target into a fresh single forgery (U0, V0) (p.332-334, §6.2).
- The aggregate-to-single reduction succeeds with at least 1/((qk + n).e) epsilon via zeta = 1/(qk + n) over the joint key-query and forgery-identity events (p.334, §6.2).
- Interpretation: the proofs claim EUF-CMA against both outsider-replacement (Type-I) and honest-but-curious-KGC (Type-II) adversaries, with the pseudonym layer cited as the extra barrier stopping a KGC that knows both partial and secret keys from forging (p.325, §4; p.325-331, §5).

## Links

[[malhi2015-construction]]
[[malhi2015-figures]]

## Source

source:: malhi2015.pdf (p.321-322, §3.3; p.325-334, §5-§6.2)
