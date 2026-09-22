---
title: PCAS Pairing-Free Construction
aliases: [gong2023-pcas-construction]
tags: [clas, vanet, pcas, construction, ecc]
source:: [[gong2023-en]]
pages:: p.7-8
---
# PCAS pairing-free construction

- TA picks s1 with $T_{pub} = s1*P$ and KGC picks s2 with $P_{pub} = s2*P$, publishing params with ECC group of prime order q and hashes H, H1–H4 (p.7, §5.2).
- KGC picks $r_i$, sets $R_i = r_i*P$, hashes the pseudonym to $h_{1i,j}$ and computes the partial secret $d_{i,j} = r_i + s2*h_{1i,j}$ with $psk_{i,j} = (d_{i,j}, R_i)$ (p.8, §5.2).
- Each vehicle picks its own secret $x_i$ with $X_i = x_i*P$, binds it via $\alpha_{i,j}$ and $D_{i,j} = R_i + \alpha_{i,j}*X_i$, keeping $SK_{i,j} = (d_{i,j}, x_i)$ secret with $PK_{i,j} = (D_{i,j}, R_i)$ (p.8, §5.2).
- Signing picks fresh $y_{1i}$, forms $Y_{1i} = y_{1i}*P$, hashes to $h_{3i}$ and $h_{4i}$, and computes the scalar $w_i = [h_{3i}(d_{i,j} + \alpha_{i,j} \cdot x_i) + y_{1i} \cdot h_{4i}] \mod q$ with $\sigma_i = (Y_{1i}, w_i)$ using only scalar multiplication and point addition (p.8, §5.2).
- The RSU aggregates by weighting each $Y_{1i}$ with its $h_{4i}$ and summing the scalars, outputting $\sigma = (Y, w)$ with $Y = \sum h_{4i} Y_{1i}$ and $w = \sum w_i$ (p.8, §5.2).
- Single check $w_i P - h_{4i} Y_{1i} = h_{3i} D_{i,j} + h_{1i,j} P_{pub}$ and aggregate check $wP - Y = \sum (h_{3i} D_{i,j} + h_{1i,j} P_{pub})$ use only ECC scalar multiplication and point addition (p.8, §5.2; p.13, Table 3 pairing-free row).

## Links

[[gong2023-liclas-forgery]]
[[gong2023-efficiency-gains]]

## Source

source:: [[gong2023-en]] (p.7-8)
