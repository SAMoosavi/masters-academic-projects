---
title: "CDH DBDH GDH Security Claims in CASCF 2020"
aliases: []
tags: [clas, vanet, iot, signcryption, cascf2020]
source:: cascf2020.pdf
pages:: p.94754-94755
---
# CASCF Security Claims

- Security validation reuses the challenger adversary model with a challenge-response game from prior work [29] and gives an intuitive discussion rather than numbered theorems (p.94754, §III-C)
- Standalone signcryption security gets no explicit proof here and is delegated to prior work [32] since aggregation sits on top of a signcryption base (p.94754, §III-C)
- CDH is stated for a cyclic group G of order q where from (g, g^a, g^b) it is intractable to compute g^ab (p.94750, §II-B)
- DBDH is stated as distinguishing g^abc-type tuples with advantage Adv(A) = |P(Adv(g, g^a, g^b, g^ab) - P(Adv(g, g^a, g^b, g^c)| over random a, b, c (p.94754, §III-C)
$$
Adv(A) = |P(Adv(g, g^a, g^b, g^{ab}) - P(Adv(g, g^a, g^b, g^c)|
$$
- CDH reduction sketch runs adversary A n times on (u, v, u.v) and combines outputs into n-th-root form with success probability P^n, validating intractability under CDH (p.94753-94754, §III-C)
- DBDH discussion claims the polynomial-time advantage becomes zero so CASCF cannot solve DBDH and hence is safe (p.94754, §III-C)
- GDH validation extends CDH with a random oracle per [29] where attacker A-dot queries H1 up to qH1 times and a forged aggregate ciphertext C* lets A-dot compute g^ab (p.94754, §III-C)
- Correctness is proved by the pairing equality e(W, g) = e(sum Qi, mpk) e(Hi, Ui) e(H_Delta0, sum Puui) labelled as equation (3) (p.94754, §III-C)
$$
e(W,g) = e(\sum Q_i, mpk)\sum e(H_i, U_i)e(H_{\Delta 0}, \sum Puu_{ui})
$$
- Unforgeability claims resistance against adaptive chosen-message attacks via a challenger that bars partial-key extraction and public-key replacement on the target identities (p.94754-94755, §III-C)
- Intractability of CASCF is discussed through CDH and GDH assumptions with no separate Type-I/Type-II adversary split stated (p.94755, §III-C)
- Forward secrecy holds because a compromised msk reveals only the partial key while the user private key also needs the secret user random ru plus a freshness timestamp (p.94755, §III-C)

## Links

- [[cascf2020-framework]] — claims argue safety of that framework under CDH/DBDH/GDH plays (p.94754)
- [[cascf2020-figures]] — runs sit beside these claims with throughput and delay facts (p.94753)

## Source

source:: cascf2020.pdf p.94754-94755
