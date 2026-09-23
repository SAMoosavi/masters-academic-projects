---
title: Malhi-Batra 2015 Performance and Comparison Figures
aliases: [malhi2015-figures]
tags: [clas, vanet, malhi2015, figures]
source:: malhi2015.pdf
pages:: p.335-336
---
# Malhi-Batra 2015 performance and comparison figures

- Bibliographic line: Malhi & Batra, "An Efficient Certificateless Aggregate Signature Scheme for Vehicular Ad-Hoc Networks", DMTCS 17(1), pp. 317-338 (2015), DOI 10.46298/dmtcs.2106, diamond OA (p.317).
- Cost metric counts scalar multiplications S in G1 and pairing operations P, treating pairing as the dominant cost to minimize (p.335, §7).
- Claimed costs for this scheme are 3S to sign, 3P + 3S to verify a single signature, and 3P + 3nS to verify an n-signature aggregate, with pre-computable terms such as ppi.PS2i excluded (p.335, §7).
- The constant-pairing claim is that aggregate verification needs just 3 pairings regardless of n, against (n + 3)P for Zhang-Zhang 2009, 5P + 2nS for Zhang et al. 2010, (2n + 1)P for Gong first scheme, and (n + 2)P + nS for Gong second scheme (p.335, §7).
- Comparison table rows list Zhang-Zhang 2009 (Sync, 3S, 4P, (n + 3)P), Zhang et al. 2010 (Sync, 5S, 5P + 2S, 5P + 2nS), Gong first scheme (Ad hoc, 2S, 3P, (2n + 1)P), Gong second scheme (Sync, 3S, 3P, (n + 2)P + nS), and this scheme (Ad hoc, 3S, 3P + 3S, 3P + 3nS) (p.335, §7).
- Signature size is claimed at about 160 bits via elliptic-curve groups with compression, roughly half the size of other CLAS schemes and BLS-like shortness, aimed at bandwidth-limited VANETs (p.335, §7).
- The design rationale accepts comparable signing cost because a vehicle signs once but verifies many messages, so verification savings dominate network efficiency (p.335, §7).
- The stated VANET payoff is verifying more signatures per time window with less message drop under high mobility (p.336, §8).

## Links

[[malhi2015-construction]]
[[malhi2015-proofs]]

## Source

source:: malhi2015.pdf (p.335-336, §7-§8)
