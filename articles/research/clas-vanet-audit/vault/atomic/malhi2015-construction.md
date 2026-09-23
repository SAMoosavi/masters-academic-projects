---
title: Malhi-Batra 2015 Pairing-Based CLAS Construction
aliases: [malhi2015-construction]
tags: [clas, vanet, malhi2015, construction]
source:: malhi2015.pdf
pages:: p.322-325
---
# Malhi-Batra 2015 pairing-based CLAS construction

- Bibliographic line: Malhi & Batra, "An Efficient Certificateless Aggregate Signature Scheme for Vehicular Ad-Hoc Networks", DMTCS 17(1), pp. 317-338 (2015), DOI 10.46298/dmtcs.2106, diamond OA (p.317).
- Pairing-family verdict: this is a pairing-based (not pairing-free) CLAS, built explicitly "based on bilinear pairings" with verification expressed through the pairing e (p.322, §4).
- System model has one KGC per RTA region plus RSUs under that RTA and vehicles carrying pseudo-identities, and it assumes KGC and RTA/RSUs do not collude (p.322-323, §4).
- Setup picks additive group G1 and multiplicative group G2 of prime order q with pairing e: G1 x G1 -> G2 and generator P, master key s with Ppub = s.P, hashes H2, H3, per-RSU keys yi with Prsui = yi.P, and params = {G1, G2, e, P, Ppub, H2, H3, Prsu1, ..., Prsun} (p.322-323, §4).
- Registration maps each real identity IDi to a pseudo-identity QIDi = H1(IDi) in G1 via hash H1: {0,1}* -> G1, reusable across communications and re-issued on entering a new RTA region (p.323, §4).
- PartialKeyGen outputs ppi = s.QIDi for each vehicle once per RTA region, and the vehicle checks it via e(ppi, P) = e(QIDi, Ppub) (p.323, §4).
- UserKeyGen lets the vehicle pick secret xi in Z*q with public key Pi = xi.P, refreshed on each new RTA region alongside the new QIDi (p.323-324, §4).
- PseudonymGen is run by the covering RSU (grouped into autonomous networks of 4 RSUs in sparse and 2 in dense areas), picking aj and setting PS1j = aj.QIDi, Tj = H3(PS1j), PS2j = aj.Tj, and PSj = PS1j + PS2j (p.324, §4).
- Sign picks random ri with Ui = ri.P, hashes hijk = H2(mk, PS1j, Pi, Ui), and outputs sigma_ijk = (Ui, Vijk) with Vijk = ppi.PS2j + hijk.ri.Ppub + hijk.xi.Prsui (p.324, §4).
- The ppi.PS2j term can be pre-computed at pseudonym issuance to save one scalar multiplication at signing time (p.324, §4).
- Aggregate sums n same-RSU signatures as V = sum Vi with output sigma = (U1, ..., Un, V) (p.332, §6.1).
- Single Verify recomputes hijk and Tj and accepts iff e(Vijk, P) = e(PS1j.Tj + hijk.Ui, Ppub) e(hijk.Pi, Prsui) (p.325, §4).
- AggregateVerify recomputes hi = H2(mi, PS1i, Pi, Ui) and Ti = H3(PS1i) and accepts iff e(V, P) = e(sum [PS1i.Ti + hi.Ui], Ppub) e(sum hi.Pi, Prsu) (p.332, §6.1).

## Links

[[malhi2015-proofs]]
[[malhi2015-figures]]

## Source

source:: malhi2015.pdf (p.322-325, §4; p.332, §6.1)
