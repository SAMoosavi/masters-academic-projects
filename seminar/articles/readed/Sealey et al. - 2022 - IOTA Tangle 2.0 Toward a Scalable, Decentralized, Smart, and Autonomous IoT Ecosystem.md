# IOTA Tangle 2.0: Toward a Scalable, Decentralized, Smart, and Autonomous IoT Ecosystem

## Metadata
- **Authors:** Nathan Sealey, Adnan Aijaz, Ben Holden
- **Affiliation:** Bristol Research and Innovation Laboratory, Toshiba Europe Ltd., Bristol, United Kingdom
- **Venue:** 2022 International Conference on Smart Applications, Communications and Networking (SmartNets)
- **Year:** 2022
- **DOI:** [10.1109/SMARTNETS55823.2022.9994016](https://doi.org/10.1109/SMARTNETS55823.2022.9994016)
- **Publisher:** IEEE (978-1-6654-8758-0/22)

## Motivation
- IoT ecosystems relying on centralized architectures suffer from control by a single trusted third party, high system costs, and trust/security concerns.
- DLT addresses these issues via decentralization, immutability, auditability, and cryptographic security:
  - **Decentralization:** P2P exchange without a central authority → lower cost, no trust in a central server.
  - **Immutability:** Tamper-proof records with full history tracking.
  - **Auditability:** Every device can store a full ledger copy; timestamped records are verifiable.
  - **Security:** Protocol-specific crypto (some schemes are quantum-resistant; RSA/ECC are not).
- Blockchain (the most well-known DLT) is poorly suited to IoT due to mining fees, high energy consumption, and limited throughput.
- DAG-based DLTs store transactions directly in the ledger instead of blocks, enabling asynchronous parallel attachment → higher throughput and feeless, low-energy, lightweight operation.

## What is IOTA Tangle 2.0?
- IOTA Tangle is a DAG-based DLT designed specifically for IoT networks and the machine economy.
- Launched in 2016, the original IOTA relied on the **coordinator** (bootstrap solution) — a centralization point that also limited scalability.
- The **coordicide** development arc aims to remove the coordinator; in 2021 the first fully decentralized network (**Nectar**, on the devnet) was released, supporting up to **1000 TPS** with **10–12 s** average confirmation times.
- IOTA 2.0 is developed modularly on the devnet; a mainnet migration is planned. The paper recommends industry switch from legacy to the decentralized network.
- The paper is a technical overview of IOTA 2.0 modules plus simulations-based performance evaluation, IoT relevance, and future research directions.

## DAG Structure vs Blockchain
- Blockchain: transactions batched into a single chain of blocks → serial bottleneck, limited throughput.
- Tangle: DAG topology — each new message (tip) must approve **two previous messages**; transactions attach asynchronously in parallel.
- Network nodes propagate messages via P2P, each maintaining its own local view of the ledger.
- As TPS increases, confirmation time decreases (approvals multiply).
- More approvals (up to 8) are used during congestion to keep the Tangle healthy.

## Removal of the Coordinator & Decentralized Consensus
### Adaptive Proof-of-Work
- Legacy: fixed-difficulty PoW (minimum weight magnitude, MWM) per transaction.
- IOTA 2.0: **adaptive PoW** — difficulty rises with a node's message rate over a time interval, eventually becoming computationally impossible to spam.
- Protects against burst transactions, spam, and DoS while keeping PoW easy for honest, rate-respecting nodes.

### Fast Probabilistic Consensus (FPC)
- Leaderless, probabilistic binary voting protocol replacing the coordinator.
- A node queries a subset (quorum k) of peers and adopts the majority opinion, iterating over rounds until a stable opinion or max round threshold.
- Opinions weighted by a node's **mana**; random thresholds prevent meta-stable situations; random thresholds generated via a decentralized RNG (dRNG).
- Simulations (IOTA Foundation's fpc-sim) show:
  - **Scalability:** agreement rate and termination rounds essentially unchanged from N=0 to 10,000 nodes.
  - **Quorum size:** low k can mask adversarial attacks; k = network size gives best healthy agreement but very high communication overhead.
  - **Adversarial robustness:** protocol remains robust even with up to half the network maliciously controlled (q=0.5).

### Tip Selection
- Tip selection no longer contributes to consensus (decoupled from it); it only grows the Tangle stably/secure.
- **Restricted Uniform Random Tip Selection (RURTS):** uniform random selection from eligible tips.
- Approvals variable from 2 up to a maximum of 8 (higher during congestion).
- Complexity drops from O(n²) MCMC (weighted Markov Chain Monte Carlo) to **O(n)** for RURTS; faster, more lightweight, fewer orphaned messages.

### Mana
- Reputation system securing against **Sybil and Eclipse attacks**.
- Each node holds decaying mana, recorded as an extension of the Tangle ledger.
- Gained by pledging to value transactions (access mana), participating in FPC (consensus mana), holding tokens, or renting from high-mana nodes; decays over time.
- Uses:
  - Access mana limits data attachment (congestion control, proportional to mana share).
  - Consensus mana weights FPC opinions and probabilities of being queried in FPC/dRNG.
  - Auto-peering connects nodes with similar mana → protects high-mana nodes from Eclipse attacks.

### UTXO Ledger Model
- Switch to an **unspent transaction output (UTXO)** model for real-time transaction validation.
- Balances tied to transaction outputs (not addresses) → addresses are **reusable** without loss of security.
- **Reality-based ledger state** models possible ledger realities to detect double spends and unmergeable branches, taking the healthiest reality.
- Enables quick double-spend detection and initial-opinion determination without walking the Tangle.

### Message Layout
- Data objects renamed from transactions to **messages**: header (version, parents, timestamp, node ID, PoW nonce) + payload (data, value transaction, or custom types) + signature (makes the message unalterable).
- Atomic messages shrink transaction size from ~**1700 bytes** to as small as **100 bytes** — better for lightweight IoT devices and lower communication overhead.
- Applications can define their own payload types.

## Smart Contracts (ISCP)
- **IOTA Smart Chain Protocol (ISCP)** adds smart contract support — the key missing feature for industry adoption.
- Off-chain / layer-2: contracts run on **sub-chains** connected to the main Tangle, maintained by a subset of nodes (the **committee**).
- Committee handles consensus/execution and posts signed state updates to the main Tangle → very low, forecastable transaction costs; no stress on the main network.
- Security is variable — proportional to committee size (larger committee = more decentralization/security).
- Supports an **Ethereum Virtual Machine (EVM)** so existing Solidity smart contracts can run on IOTA, benefiting from feeless transactions and faster execution.
- Owners configure/deploy contracts and can set a variable reward to incentivize committee nodes.

## Digital Assets
- Legacy IOTA did not support digital assets; IOTA 2.0 does.
- Feeless transactions → free digital twinning/tokenization of any system or asset (physical or otherwise), secured by the main Tangle.
- Basis for the **machine economy** (e.g., NFTs representing IoT devices or industrial machinery with proof of authentication and ownership).

## Tokenomics / Fee Model
- IOTA is **feeless** (no transaction fees, no mining/staking).
- Fees for smart contracts are flexible, dependent on chain, contract, and owner; incentivization via micro-transactions or variable committee rewards.
- Mana acts as the reputation/access resource (congestion control), not a monetary fee.
- IOTA vs Ethereum smart contracts (Table II): very low/feeless forecastable fees vs higher fees + gas with no micro-transactions; committee-only network utilization vs whole network; variable security vs always-high; layer-2 off-chain vs layer-1 on-chain; parallel + very fast vs serial + slower; high vs poor scalability.

## IOTA 1.5 (Chrysalis) vs IOTA 2.0
Key differences summarized in Table I:
| Feature | IOTA 2.0 | Legacy IOTA |
|---|---|---|
| Smart contracts | Supported | Not supported |
| Digital asset support | Yes | No |
| Transaction size | 100 bytes | 1700 bytes |
| Decentralization | Fully decentralized | Coordinator as point of centralization |
| Sybil protection | Mana reputation system | None |
| Spam prevention | Lightweight adaptive PoW | PoW |
| Address types | Reusable | One-time use |
| Consensus | FPC binary voting | Weighted MCMC tip selection + coordinator |
| Scalability | Very scalable (TPS grows with network size) | Limited (coordinator & milestones) |
| Approval finality | Based on consensus mana approval weight — no orphans | Based on MCMC weight magnitude — orphans possible |

## IOTA 2.0 for IoT — Benefits
- **Consensus:** FPC is energy-efficient, lightweight, stake-free, and highly scalable; adaptive PoW is lighter for resource-constrained devices (honest behavior keeps difficulty low).
- **Tip selection:** RURTS is faster and lighter (O(n) vs O(n²)); fewer orphaned messages and re-attachments.
- **Mana:** nullifies Sybil-style identity multiplication attacks; better congestion control and consensus robustness.
- **IoT-centric implementations:** UTXO model avoids walking the Tangle (past cone) and solidification costs; atomic 100-byte messages suit lightweight devices; custom payload types per application.
- **Smart contracts:** feeless contracts + micro-transaction incentives enable IoT networks too resource-poor for Ethereum.
- **Asset digitalization:** feeless, encrypted, immutable, verifiable data + tokenization → full digital twinning of systems with all data flows mapped by the Tangle.

## Performance / Scalability Claims
- Nectar (devnet): up to **1000 TPS** with **10–12 s** average confirmation.
- FPC simulations: constant agreement rate and mean termination rounds as node count grows to 10,000; robust to 50% adversarial nodes.
- Scalability of IOTA 2.0 scales with network size (unlike coordinator-limited legacy).
- O(n) tip selection; minimal communication overhead via atomic messages.

## Limitations
- FPC direct-query **communication overhead** can be a concern for some IoT implementations.
- Smart contract security is only as good as committee size — contracts of high value need appropriately large committees.
- Low quorum (k) can mask adversarial attacks; tuning k to network size is required but costly.
- All IOTA 2.0 modules remain under continuous review; protocol is still in devnet (Nectar) with mainnet migration pending.

## Future Directions
1. **Consensus — On-Tangle FPC (OTFPC):** combines FPC with a virtual voting protocol using **approval weight (AW)** (percent of active consensus mana referencing a message). Conflicts resolved by heaviest branch; only the double-spend payload is rejected so other messages merge (fewer orphans); removes P2P communication during consensus → lower overhead, faster confirmations.
2. **Oracles:** from-source data issuing (e.g., IoT sensors attach data directly to the Tangle without PoW), increasing data trust; **oracle distributed networks (ODNs)** with an aggregator oracle using a "truth finding algorithm" to validate and eliminate inconsistencies; oracles can also pull web feeds or enable cross-DLT interoperability.
3. **Sharding:** subsets of nodes process messages within their shard in parallel → higher throughput; hierarchical sharding with **stamp messages** to parent shards (recursive, multi-level) giving proof of inclusion for any message; permissioned shards give privacy of private networks plus public-network benefits; **fluid sharding** (every node its own shard, interactions within a perception radius) aims to infinitely scale to support any device.

## Conclusions
- Removing the coordinator is the key objective: greater scalability, no single point of failure, no trust in a central authority.
- Mana improves Sybil protection; smart contracts and digital assets improve functionality versus industry adoption leaders.
- Consensus is now more scalable and faster; reduced Tangle-walking and adaptive PoW make the protocol more lightweight and accessible for IoT.
- IOTA Tangle 2.0 is positioned as a highly attractive DLT for the IoT industry.
