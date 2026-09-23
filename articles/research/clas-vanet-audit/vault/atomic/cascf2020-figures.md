---
title: "Throughput Delay Energy Memory Figures in CASCF 2020"
aliases: []
tags: [clas, vanet, iot, signcryption, cascf2020]
source:: cascf2020.pdf
pages:: p.94752-94754
---
# CASCF Performance Figures

- IoT testbed uses two Raspberry Pi boards plus three minicomputers plus five mobile phones plus one desktop with DHT-11 and MQ-135 sensors on the client Pi (p.94750, §II-C)
- Experiment runs 5000 messages with KGC memory of 8GB RAM plus 1GB ROM reserved for aggregate signcryption and message sizes from 10KB to 2MB at 1000KB average (p.94753, §III-B)
- Throughput is defined as messages delivered per unit time in bits per second measured only over signcryption functions at fixed network throughput (p.94752-94753, §III-A)
- Delay is defined as round-trip time with only processing delay compared after subtracting static queuing, transmission and propagation delays over a congestion-free channel (p.94753, §III-A)
- Energy is defined as average residual energy over end devices in percent with lower consumption preferred for constrained IoT devices (p.94753, §III-A)
- Memory is defined as kilobytes for keys plus intermediate values plus certificates where rivals use certificates (p.94753, §III-A)
- Complexity is compared per-operation for sender, aggregator and receiver computation plus communication cost using the notation of prior work [29] (p.94753-94754, §III-B)
- CASCF throughput beats prior art by 28.3% against [27] and 43.6% against [28] and 17.9% against [29] with slower degradation as message count grows (p.94753, §III-B)
- CASCF delay is 25% lower than the compared algorithms because certificateless handling avoids certificate creation and verification delays (p.94753, §III-B)
- Rival algorithms [27] and [28] consume about 45% of total energy on average with [28] worse early and [27] degrading faster after 3000 messages (p.94753, §III-B)
- CASCF energy use is lower by 48% against [27] and 49.7% against [28] and 15.6% against [29] through certificateless handling plus changed key generation (p.94753, §III-B)
- Rival memory use exceeds CASCF by 25% for [27] and 36% for [28] and 18% for [29] so CASCF is the least memory-hungry option tested (p.94753-94754, §III-B)
- Communication complexity of CASCF is lower than [27] and [28] and similar to [29] while sender-side computation is higher for CASCF and receiver-side plus aggregator computation are the lowest overall (p.94754, §III-B)

## Links

- [[cascf2020-framework]] — figures cost that framework with throughput and delay facts (p.94753)
- [[cascf2020-proofs]] — figures sit beside proof claims with throughput and delay facts (p.94754)

## Source

source:: cascf2020.pdf p.94752-94754
