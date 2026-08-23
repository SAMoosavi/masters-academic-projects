# Pseudonym Changing at Social Spots: An Effective Strategy for Location Privacy in VANETs

**Authors:** Rongxing Lu, Xiaodong Lin, Tom H. Luan, Xiaohui Liang, Xuemin (Sherman) Shen
**Venue:** IEEE Transactions on Vehicular Technology, Vol. 61, No. 1, January 2012 (pp. 86–96)
**DOI:** 10.1109/TVT.2011.2162864
**Presented in part at:** IEEE ICC 2011

---

## Abstract

Frequent pseudonym changing is a promising technique for location privacy in vehicular ad hoc networks (VANETs), but it fails if pseudonyms are changed at an improper time or location, because an adversary can still link the old and new pseudonyms. This paper proposes an effective **Pseudonym Changing at Social Spots (PCS)** strategy that achieves *provable* location privacy. Social spots are places where several vehicles gather (e.g., a road intersection when the traffic light turns red, or a free parking lot near a shopping mall). Using the **anonymity set size (ASS)** as the location privacy metric, the paper develops two anonymity set analytic models to quantitatively investigate the privacy achieved by PCS, and uses game-theoretic techniques to prove the strategy's feasibility in practice. Performance evaluations show that better location privacy is achieved when vehicles change pseudonyms at highly social spots, and that PCS helps vehicles change pseudonyms intelligently at the right moment and place.

---

## 1. Motivation

- VANETs let vehicles communicate via onboard units (OBUs) over **V2V** (vehicle-to-vehicle) and **V2R** (vehicle-to-roadside) links, enabling applications from safety (collision warning, emergency reporting, pothole detection) to nonsafety (infotainment).
- **Location privacy is a fundamental quality-of-privacy (QoP)** requirement: vehicle locations are tightly tied to the citizens who drive them, so without privacy guarantees the public will not accept VANET deployment.
- The popular approach is to periodically change **pseudonyms**: each safety message is a 4-tuple {Time, Location, Velocity, Content} authenticated with a signature bound to a pseudonym, so pseudonym unlinkability should protect privacy.
- **The key problem:** changing pseudonyms at an improper time/place is useless. If only one of three vehicles changes its pseudonym during an interval Δt, the adversary can still link old/new pseudonyms. Even if all vehicles change simultaneously, the Location and Velocity embedded in messages provide clues that link them.
- Formally, a pseudonym changing (PC) process is characterized by factor vectors **F** = {Time, Location, Velocity, …}. An adversary observes a subset and uses **cosine similarity** between two vehicles' PC character vectors to decide whether they are indistinguishable (indistinguishable when |1 − cos| ≤ ε for a small confusion value ε > 0).
- **Conclusion:** a vehicle should change its pseudonym in a scenario where *as many indistinguishable PC processes as possible take place simultaneously* — i.e., at social spots, which naturally become **mix zones**.

---

## 2. Problem Definition

### 2.1 Network Model
- Urban VANET with a large number of vehicles, each equipped with an OBU. Pseudonym changing is confined to **V2V mode**; RSUs support V2R but are excluded from the model.
- **Social spots:** places where vehicles gather, of two kinds:
  - **Small social spots** — road intersections when the traffic light turns red (red-light session is short, ~30 or 60 s).
  - **Large social spots** — free parking lots near shopping malls (malls operate all day, so many vehicles stop for long periods).
- If all gathered vehicles change their pseudonyms indistinguishably, a social spot naturally becomes a **mix zone**.

### 2.2 Threat Model
- A **global external adversary A** with radio devices (plus special eavesdropping infrastructure) that monitors and collects **all** safety messages network-wide.
  - **Global:** A tracks vehicles in a *spatial–temporal* way, primarily via Time, Location, and Velocity (Pseudonym is unlinkable, Content can be set irrelevant).
  - **External:** A only passively eavesdrops; it does not actively compromise vehicles.
- Camera-based global eavesdropping is considered too costly and is out of scope.

### 2.3 Location Privacy Requirements
- **R-1 Identity privacy:** vehicles use a pseudonym instead of a real identity to broadcast messages.
- **R-2 Periodic changing:** vehicles periodically change pseudonyms to break the relation between former and later locations, and changing must happen at the appropriate time and location.
- **R-3 Conditional privacy:** if a safety message is disputed, the trusted authority (TA) can disclose the real identity / the location where a specific vehicle broadcast the disputed message.

---

## 3. Proposed Scheme

### 3.1 Key-Insulated Pseudonym Self-Delegation (KPSD) Model
Technical preliminary enabling PCS: a practical key-insulated model that securely generates on-demand **short-life keys**.

- The TA gives the authorized anonymous key **ASKi = (si, Ai = g1^(1/(si+u)))** to the *user/owner*, who stores it in a secure environment (e.g., at home), **not in the vehicle**. Before a trip (like filling fuel), the user generates a batch of short-life keys and installs them in the OBU.
- **Theft mitigation:** since the authorized key is not stored in the vehicle, a thief who steals the car cannot generate new valid short-life keys (unlike prior schemes, e.g., Calandriello et al.). More than 170,000 vehicles are stolen each year in Canada, so this matters.
- **Construction** (bilinear pairing, based on the Boneh–Boyen short signature + conditional privacy-preserving authentication): system initialization → key generation → pseudonym self-delegated generation → conditional tracking.
  - Self-delegation: user picks l random short-life private keys xj, computes public keys Yj = g^xj and anonymous self-delegated certificates Certj = {Yj, TU, TV, c, sα, sx, sδ}.
  - Message signing: msg = (M, σ, Yj, Certj) with σ = g2^(1/(xj+H(M))).
  - Verification: check the certificate (Schnorr-style proofs) and then e(Yj · g1^H(M), σ) = e(g1, g2) (e(g1,g2) can be precomputed).
  - Conditional tracking: TV^u / TU^v = Ai^u, looked up in the TA's tracking list to reveal the real identity IDi.
- **Security:** provides anonymous authentication with conditional tracking and mitigates vehicle-theft hazards (key-insulated ASKi).
- **Performance:** verifying n messages from one source costs (3+n)·Tpair + (4+n)·Texp1 + 5·Texp2, vs. pure group-signature-based (GSB) at 3n·Tpair + 4n·Texp1 + 5n·Texp2 — far more efficient when n is large (important for the ~300 ms verification budget).

### 3.2 The PCS Strategy (Algorithm 1)
- **Case 1 — Small social spot:** a vehicle Vi stops at a road intersection when the light turns red; when the light turns green, Vi changes its pseudonym.
- **Case 2 — Large social spot:** a vehicle Vi stops at a free parking lot near a shopping mall; when leaving the lot, Vi changes its pseudonym.
- After changing, the first broadcast safety message carries indistinguishable info: Location = social spot, Velocity = 0, and an unlinkable pseudonym — making the spot a mix zone.

### 3.3 Anonymity Set Analytic Models (privacy metric: ASS)

**Small social spots** (Poisson vehicle arrivals, rate λ; red-light stop period Ts = t = 30/60 s):
- Probability of x arrivals: Pr[X = x | Ts = t] = (λt)^x / x! · e^(−λt).
- Expected ASS: **ASS = Sa = E[X | Ts = t] = λt** (all vehicles follow PCS).
- Footnote: if waiting vehicles exceed a threshold, some must wait for the next green; then the initial ASS is ASS = Nv + λt.

**Large social spots** (parking lot near a mall):
- Ts (mall opening → vehicle V's departure) is exponentially distributed with density f(t), mean 1/μ, Laplace transform f*(s) = μ/(μ+s). Arrivals are Poisson with rate λ. The time a vehicle stays (arrival → departure) has density fu(·), mean 1/ω, Laplace transform fu*(s).
- Let X = vehicles arriving during Ts, Y = vehicles leaving the lot before V. The expected ASS for V's change is **ASS = E[X] − E[Y]**, and with exponentially distributed stay times (fu*(μ) = ω/(ω+μ)) this simplifies to a closed form: **ASS = λ/(ω+μ)**.
- Intuition: the larger the arrival rate λ and the longer vehicles stay (larger 1/ω), the bigger the anonymity set and the better the mix-zone obfuscation of arriving vs. leaving vehicles.

### 3.4 Game-Theoretic Feasibility Analysis
- At a social spot with ASS N = n+1 (n ≥ 0), each vehicle Vj chooses action **C** (change pseudonym, probability pj) or **K** (keep, probability 1−pj).
  - Keep: still tracked; normalized privacy-loss payoff −dj (dj ∈ (0,1) is Vj's self-evaluation of location privacy importance).
  - Change: tracked only with probability 1/S; payoff −(dj/S) − cj, where cj is the normalized cost of changing and S = npm + 1 is a lower bound on the average anonymity set (pm = minimum change probability among the other n vehicles).
- Vj changes iff −dj/(npm+1) − cj > −dj, i.e., **cj < npm·dj/(npm+1)**. With KPSD the cost of changing is very low, so the condition holds whenever npm > 0; when npm = 0 (no neighbor changes), a vehicle also does not change.
- **Location Privacy Gain (LPG):** LPGj = dj − dj/(npm+1) = (npm/(npm+1))·dj, increasing in pm. When all vehicles change (pm = 1), LPGj reaches its maximum ((N−1)/N)·dj — a **win–win situation**, proving the feasibility of PCS.

---

## 4. Performance Evaluation (Simulation Setup & Results)

- **Setup:** discrete-event simulator written in C++; two scenarios (small spot, large spot); each case repeated **100 times with different random seeds**, results averaged with **95% confidence intervals**; simulation (Sim) results are compared against the analytical (Ana) models to validate them.
- **Small social spot (intersection, Ts = 30/60 s for low/high traffic):** as the mean inter-arrival time 1/λ grows (2→10 s), both ASS and LPG **decrease** — fewer vehicles gather at the red light. A larger Ts has a positive effect. So high-traffic, long-red intersections are the best small spots (matches intuition).
- **Large social spot (parking lot near mall, 1/μ = 4 h):**
  - As the mean stay time 1/ω increases, ASS and LPG increase (more vehicles parked); smaller 1/λ also yields larger ASS and higher LPG. Hence a **prosperous mall** (small 1/λ, large 1/ω) guarantees high privacy. Sim and Ana match very well.
  - As 1/μ increases (except the first two hours), ASS and LPG grow smoothly — changing pseudonyms **during the daytime** is best at large social spots. Simulation–analysis gaps are small and shrink with more runs.

---

## 5. Related Work

- **Context mix (Gerlach):** a vehicle changes pseudonyms only when it detects k vehicles with similar direction in a confusion radius; intuitive, but detection and guaranteed similar reaction of neighbors are open issues.
- **Swing & swap (Li et al.):** user-centric mitigation — swing loosely synchronizes updates on velocity changes; swap exchanges identifiers between vehicles.
- **Buttyan et al.:** model of pseudonym-changing effectiveness with an adversary tracking model and a privacy metric, evaluated by simulation.
- **Freudiger et al.:** cryptographic mix zones at intersections combined into vehicular mix networks; also optimal mix-zone placement via combinatorial optimization.
- **Beresford & Stajano:** location privacy measured as the entropy of the anonymity set, H(PC) = −Σ Pi→PC · log2 Pi→PC, maximized at log2 N for N uniformly likely vehicles.
- **Freudiger et al. (game theory):** analysis of non-cooperative, self-interested nodes that may skip changing pseudonyms in mix zones.
- **Positioning of PCS:** prior works gauge privacy mainly by simulation; this paper provides the first **analytic anonymity-set models** for social-spot-based pseudonym changing, and uses game theory to show that (thanks to cheap KPSD pseudonyms) cooperation is individually rational.

---

## 6. Limitations & Conclusions

- **Conclusions:** the PCS strategy enables location privacy by changing pseudonyms at social spots (which act as natural mix zones); two ASS analytic models formally quantify the achieved privacy; a game-theoretic analysis proves feasibility (all-change is a win–win); and the practical KPSD scheme provides cheap, theft-resistant pseudonyms. To the authors' knowledge, this is the first *analytical* treatment of mix-zone-based pseudonym changing, shedding light on a research line previously dominated by simulations.
- **Limitations / future work:**
  - The threat model only considers **spatial–temporal tracking** (Time, Location, Velocity); a stronger adversary using more character factors is left for future work.
  - **Camera-based global tracking** is explicitly out of scope.
  - Pseudonym changing is confined to **V2V mode**; RSUs are excluded from the network model.
  - The analysis assumes idealized Poisson/exponential arrival & stay processes; when no neighbor changes a pseudonym (npm = 0), no vehicle changes — the scheme relies on sufficient vehicle density/cooperation.
  - More field experiments are planned to verify the strategy's effectiveness in practice.

---

*Full text extracted from: Pseudonym Changing at Social Spots - An Effective Strategy for Location Privacy in VANETs.pdf*
