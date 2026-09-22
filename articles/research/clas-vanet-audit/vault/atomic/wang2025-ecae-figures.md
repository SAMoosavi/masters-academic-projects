---
title: ECAE efficiency figures and NDN-IoT scope
aliases: [ECAE performance figures, ECAE NDN-IoT evaluation numbers]
tags: [ecae, wang2025, figures, performance, ndn-iot]
source:: [[wang2025-ecae-en]]
pages:: p.1
---
# ECAE efficiency figures and NDN-IoT scope
- Scope is NDN-IoT producer/consumer authentication, explicitly not VANET, so figures must not be cited as VANET results (p.1).
- Total computation overhead is reduced by up to 46.18% against state-of-the-art comparators (p.1, p.20).
- Communication overhead is reduced by 55.56% with signature length 2S_M equal to 640 bits (p.1, p.22-p.23).
- Aggregate signature sigma=(U,V) stays constant-size regardless of the number of terminal devices (p.4-p.5, p.13-p.14).
- Pairing-free design removes bilinear pairings at about 20 times point-multiplication cost plus map-to-point hashes in favor of general hashes (p.4).
- Evaluation testbed uses Raspberry Pi 3B+ with BCM2837B0 and Intel J1900 with Curve25519 under 256-bit parameter (p.18-p.19).
- Gains are conditional on aggregation window, hardware parallelism, topology and KGC distribution, and proofs hold in the random oracle model only (p.23).
## Links
- [[wang2025-ecae-construction]]
- [[wang2025-ecae-proofs]]
## Source
- source:: [[wang2025-ecae-en]] p.1, p.20, p.22-p.23
