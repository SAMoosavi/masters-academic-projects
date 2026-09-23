---
title: Rabie2023 Quantitative Figures
aliases: [rabie2023-figures]
tags: [clas, hwmsn, rabie2023, performance, numbers]
source:: rabie2023.pdf
pages:: p.51-77
---
# Rabie2023 quantitative figures

- Headline compute claim is a 93% reduction from aggregation technology in the abstract (p.51).
- Headline communication claim is 400 bits for the aggregated case in the abstract (p.51).
- Primitive timings on the MIRACL rig are TBPF 3.61 ms, T_MUL 1.63 ms, T_BPAO 1 ms, T_MPTH 1 ms, T_E-M 2.74 ms and T_Oh 1 ms (p.72).
- Group sizes are 128-byte $G1$ elements for pairing schemes versus 40-byte $G$ elements for ECC, with 20-byte $Zq$ elements and hashes plus 4-byte timestamps (p.72-73).
- Proposed signing costs one scalar multiplication, five point additions and one hash, about 3.753 ms (p.73).
- Proposed single verification costs three scalar multiplications, one point addition and one hash, about 7.013 ms (p.73).
- Proposed aggregation and aggregate verification cost about 7.013 ms per 100 messages, using $3n$ scalar multiplications, $n$ point additions and $n$ hashes (p.73).
- Slowest comparator Shen et al. needs about 9.54 ms to sign, 21.44 ms for single verification and 424 ms per 100 messages for aggregate verification (p.72-73).
- Execution table totals are Shen 847 ms, Shuai 30.321 ms, Zhang 7.87 ms, Ryu 14.123 ms, Peng 25.829 ms and proposed 7.013 ms, with stated increments of 83%, 23%, 89%, 50% and 27% (p.75).
- Communication derivation gives the proposed scheme $3 \times 40 + 20 + 20 = 160$ bytes $= 1280$ bits per single message against Shen 3552, Shuai 4320, Zhang 1504, Ryu 2240 and Peng 4480 bits (p.73-74).
- Text states 1280 bits per single transmission and 400 bits per $n$ aggregated messages, matching the abstract's 400-bit figure for the aggregated case only (p.74).
- Standalone communication table instead lists the proposed scheme at 520 bits against 1024–3872 bits for comparators (p.76).
- Verification-delay text reports about 7.013 ms per 1000 messages for the proposed scheme against 424, 30.321, 7.87, 14.123 and 25.829 ms for benchmarks (p.74).
- Timing rig is an Intel i8 Neon 3.20 GHz with 4 GB RAM on Windows 8 under MIRACL C++, Tate pairing on 80-bit super-singular curves and a 160-bit-prime Koblitz curve for the proposed scheme (p.72-73).
- Network simulation runs NS-3 on Ubuntu 18.04 LTS, Intel i3 with 8 GB RAM, over 400x200 m2 for 1200 s at 2 Mbps with IEEE 802.11p 2.4 GHz WiFi, across three medical-expert/patient/sensor scenarios with packets every five seconds at 320–680 bits (p.74).
- Network metrics are packet-delivery ratio Eq. (14), throughput Eq. (15) and end-to-end delay Eq. (16)/(17), plotted in Figs. 9–11 (p.76-77).
- Interpretation: the abstract's 93% headline sits above the table's best 89% increment, so the 93% reads as an abstract-level claim rather than the tabulated maximum (p.51).
- Interpretation: the three communication figures describe different cases — 1280 bits single, 400 bits per aggregated message, 520 bits in the summary table — and are not interchangeable (p.74).

## Links

- [[rabie2023-batch-construction]] — construction these numbers measure (p.73)
- [[rabie2023-privacy-model]] — security claims behind the comparison tables (p.77)

## Source

- source:: rabie2023.pdf (p.51-77)
