---
title: Wang2025 detectable invalid-signature detection mechanism
aliases: [Algorithm 1 binary-search detection, invalid-signature tracing]
tags: [clas, vanet, wang2025-detectable, detection]
source:: [[wang2025-detectable-en]]
pages:: p.5
---
# Wang2025 detectable invalid-signature detection mechanism
- On aggregate failure AS runs Algorithm 1 binary search that splits the group and verifies the left subgroup, recursing only where needed (p.5, §3).
- Algorithm 1 avoids the redundant right-subgroup re-aggregation and re-verification of Algorithm 2 from [20,23], which re-verifies the right subgroup unnecessarily (p.5, §3).
- Algorithm 1 detects invalid signatures and TRA outputs the corresponding real identities via ui=H0(t) xor PIDi,1 and IDi=H0(ui || TPi) xor PIDi,2 (p.5, §3).
- RSU checks timestamps Ti before aggregation while AS performs the aggregate check with a correctness derivation, so freshness gating precedes detection (p.5, §3).
- The two-layer system model places AS plus TAs (KGC and TRA) in the upper layer and RSUs plus OBU vehicles over DSRC in the lower layer, locating detection at AS (p.3, §2.4).
## Links
- [[wang2025-detectable-pairing-construction]]
- [[wang2025-detectable-proofs-cost]]
## Source
- source:: [[wang2025-detectable-en]] p.5
