---
title: "IND-CCA2 and EUF-CMA Proofs in Dai 2022"
aliases: []
tags: [clas, vanet, dai2022]
source:: [[dai2022-en]]
pages:: p.5066-5070
---
# IND-CCA2 and EUF-CMA Proofs

- Work shows IND-CCA2 privacy under CDH in ROM facing both Type-I and Type-II foes (p.5067)
- Work shows EUF-CMA unforgeability under ECDL in ROM through Forking Lemma plays facing both foe groups (p.5069)
- ProVerif runs under Dolev-Yao rules affirm arrival of keys and payloads, with hits on arrival checks and on action-order checks (p.5069)
- A side review adds nonrepudiation, forward privacy, MITM and DoS and replay and ESL cover, plus alias-based tracking of bad actors (p.5070)
- Solo-signature validity turns on w_i P matching U_i plus h_i times the sum of K_IDi and h_IDi P_Pub, anchoring both proof plays (p.5066)
$$
w_iP=U_i+h_i(K_{ID_i}+h_{ID_i}P_{Pub})
$$

## Links

- [[dai2022-signcrypt-construction]] — proofs argue safety of that construction (p.5067)
- [[dai2022-performance-figures]] — runs back proof claims with timing facts (p.5071)

## Source

source:: [[dai2022-en]] p.5066-5070
