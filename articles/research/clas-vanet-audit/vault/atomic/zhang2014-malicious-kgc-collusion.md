---
title: Malicious KGC and Signer Collusion Attacks
aliases: [zhang2014-malicious-kgc-collusion]
tags: [clas, vanet, collusion]
source:: [[zhang2014-en]]
pages:: p.34-35
---
# Malicious-KGC and collusion attacks

- A malicious-but-passive KGC embeds a trapdoor at setup by setting Q = tP for a secret t it retains (p.34-35, §3.2.2).
- Since t · upkIDn = xIDn · Q, the KGC forges any signer's pair as Vn = pskIDn + hn · rn · Ppub + hn · t · upkIDn without the secret value xIDn, then aggregates with oracle signatures to a valid CLAS, giving universal forgery (p.34-35, §3.2.2).
- Two colluding inside signers exchange r1·Ppub and r2·Ppub and cross-bind the hashes in V1 = pskID1 + h2 · r2 · Ppub + h1 · xID1 · Q and V2 = pskID2 + h1 · r1 · Ppub + h2 · xID2 · Q (p.35, §3.2.3).
- Each resulting (Ui, Vi) pair is individually invalid, yet V1 + V2 satisfies the aggregate equation, so aggregate validity does not imply individual validity (p.35, §3.2.3).
- A dishonest signer Un publishes bP = aP − Σ^{n−1}_{i=1}upkIDi as its public key while colluding with a KGC knowing t with Q = tP (p.35, §3.2.4).
- The colluding pair outputs V = ΣpskIDi + Σhi · ri · Ppub + Σhi · t · upkIDi without the other signers' private keys and always satisfies verification, i.e. arbitrary CLAS forgery (p.35, §3.2.4).
- The paper concludes insider attacks apply beyond certificateless settings to identity-based and traditional PKC, while signer-plus-malicious-KGC collusion is certificateless-specific (p.37, §5).

## Links

[[zhang2014-honest-kgc-forgery]]
[[zhang2014-short-aggregate-scheme]]

## Source

source:: [[zhang2014-en]] (p.34-35)
