---
title: Wang2025 detectable pairing-based CLAS construction
aliases: [detectable CLAS pairing construction, Wang2025 signing and aggregate verification]
tags: [clas, vanet, wang2025-detectable, construction]
source:: [[wang2025-detectable-en]]
pages:: p.4–5
---
# Wang2025 detectable pairing-based CLAS construction
- Setup builds prime-order groups G1, G2 with pairing e: G1 x G1 -> G2 and generator P in G1, picking t with Tpub=tP, k with Kpub=kP, y with Ypub=yP, and seven hashes H0,4,5,6 to Zq* and H1,2,3 to G1 (p.4, §3).
- TRA picks random ui and issues pseudonym PIDi=(PIDi,1, PIDi,2, TPi) with PIDi,1=H0(t) xor ui and PIDi,2=IDi xor H0(ui || TPi) (p.4, §3).
- KGC computes Qi=H1(PIDi) and partial key di=kQi over a secure channel, while the vehicle picks secret xi and sets public key Xi=xiP (p.4, §3).
- The vehicle picks ri with Ri=riP and forms W=H2(Kpub||P), U=H3(Tpub||P), gi=H4(PIDi||mi||Xi||Kpub||Ti||Ri), hi=H5(PIDi||mi||Xi||Tpub||Ti||Ri) with Si=riW+gi xiU+hi di and sigma_i=(Ri, Si) (p.4–5, §3).
- RSU checks timestamps Ti, sums S=sum Si and R=sum Ri, and AS checks the aggregate equation e(S,P)=e(R,W)e(sum giXi,U)e(sum hiQi,Kpub) with 4 pairings plus a correctness derivation (p.5, §3).
- TRA traces by recovering ui=H0(t) xor PIDi,1 and IDi=H0(ui || TPi) xor PIDi,2 for accountability (p.5, §3).
## Links
- [[wang2025-detectable-detection-mechanism]]
- [[wang2025-detectable-proofs-cost]]
## Source
- source:: [[wang2025-detectable-en]] p.4–5
