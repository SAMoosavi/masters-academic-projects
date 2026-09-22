---
title: "7Tsm and 640-bit Efficiency Figures in Zhang 2024"
aliases: []
tags: [clas, iomt, zhang2024]
source:: [[zhang2024-en]]
pages:: p.4359
---
# 7Tsm and 640-bit Efficiency Figures

- IoMT scope: figures target wearable-device energy limits for physiological data (heart rate, blood oxygen) sent sensor-to-cloud-to-doctor, measured with Raspberry Pi 4B as the IoMT device (p.4359)
- Evaluation runs Charm-Crypto 0.50 in Python on a Dell laptop plus Raspberry Pi 4B at 80-bit security, counting computation in T_sm units with no pairings (p.4358)
- Computation is 3T_sm signcrypt plus 4T_sm unsigncrypt for 7T_sm total, the lowest among the compared schemes, all general-ECC scalar multiplication (p.4359)
- Ciphertext is 640 bits at 160-bit message length, equal to schemes [27]–[28] and only 57.14% of Chen et al. [29] at 1120 bits, far below pairing-based 1344 and 3392 bits (p.4359)
- Comparators are Gong et al. [5], Chen et al. [26], Dai-Xu [27], Du et al. [28], and Chen et al. [29], compared on computation, ciphertext size, and Type I and Type II resistance (p.4359)
- Only the proposed scheme is both pairing-free and secure against Type I and Type II attacks among the six compared, while [5], [26], [27], [29] fail Type I and [28] fails Type II (p.4360)

## Links

- [[zhang2024-theta-v-signcrypt-public-verification]] — figures price that theta-V construction (p.4359)
- [[zhang2024-square-dh-proofs]] — figures pair with the tight Square-DH proof claim (p.4359)

## Source

source:: [[zhang2024-en]] p.4359-4360
