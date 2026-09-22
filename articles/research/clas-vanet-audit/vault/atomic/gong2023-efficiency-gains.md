---
title: PCAS Efficiency Gains
aliases: [gong2023-efficiency-gains]
tags: [clas, vanet, pcas, efficiency, evaluation]
source:: [[gong2023-en]]
pages:: p.13-15
---
# PCAS efficiency gains

- Transmission overhead falls 25 percent for one message, 480 bit versus 640 bit, at equal security level (p.13, §6.1, Tables 4–5).
- Transmission overhead falls 25 percent for 2000 messages at fixed aggregate size under equal security level (p.13, §6.1, Tables 4–5).
- Computation overhead falls 16.56 percent for one message with sign 0.1706 ms plus verify 0.6690 ms (p.14–15, §6.1–6.2, Tables 7–9).
- Computation overhead falls 25.34 percent for 2000 messages at identical O(1) sign and verify with O(n) aggregate complexity (p.14–15, §6.1–6.2, Tables 7–9).
- Timings use MIRACL with T_ecsm = 0.1652 ms and Table 7 operation counts, with Veins plus OMNeT++ plus SUMO simulation agreeing with the analysis (p.13–15, §6.1–6.2).
- Veins delay is about 25 percent below [18] at 500 messages, confirming the analytic gain in simulation (p.14–15, §6.1–6.2, Tables 7–9).

## Links

[[gong2023-liclas-forgery]]
[[gong2023-pcas-construction]]

## Source

source:: [[gong2023-en]] (p.13-15)
