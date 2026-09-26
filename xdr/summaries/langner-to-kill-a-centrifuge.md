---
title: "To Kill a Centrifuge: A Technical Analysis of What Stuxnet's Creators Tried to Achieve"
authors: "Ralph Langner"
year: 2013
month: nov
publisher: "The Langner Group (Arlington | Hamburg | Munich)"
type: "technical report"
pages: 37
figures: 13
pdf: "papers/langner-2013-to-kill-a-centrifuge.pdf"
diagrams: "diagrams/langner-2013-diagrams.md"
fa: "summaries/fa/langner-to-kill-a-centrifuge-fa.md"
tags: [stuxnet, cyber-physical, centrifuge, natanz, uranium-enrichment, ICS, PLC, siemens-s7, overpressure, rotor-speed, OT-security, Natanz]
---

# To Kill a Centrifuge — Ralph Langner (2013)

> **Attribution caution.** This document is an **attack-vector and plant-intelligence study, not an
> IOC/forensic catalogue.** It contains no certificate names, no mutexes, no registry keys and no C2
> domains, and it does **not** mention WinStux, Stuxnet.RT, the four-component decomposition,
> PROFINET/ProfiSAFE, PCS 7, or "121 rotor variables". Those come from other analyses. Everything below
> is sourced from this document. See [[xdr/README|Source verification notes]].

## Bibliographic metadata

| Field | Value |
|---|---|
| Author | Ralph Langner |
| Title | *To Kill a Centrifuge: A Technical Analysis of What Stuxnet's Creators Tried to Achieve* |
| Publisher | The Langner Group — Arlington \| Hamburg \| Munich |
| Date | November 2013 |
| Length | 37 pages · 13 numbered figures · **no tables** |
| Cover blurb | "The definitive analysis of Stuxnet" — Bruce Schneier |
| Acknowledgements | Andreas Timm, Olli Heinonen, Richard Danzig, R. Scott Kemp |
| PDF | `papers/langner-2013-to-kill-a-centrifuge.pdf` (4.15 MB) |

**Structure:**

- **Executive Summary** (p. 3)
- **Prologue: A Textbook Example of Cyber Warfare** (p. 4)
- **A. Exploring the Attack Vector** (pp. 5–17)
  - Overpressure Attack: *Silent Hijack of the Crown Jewels* (p. 5)
  - Rotor Speed Attack: *Pushing the Envelope* (p. 10)
  - Analysis: *The Dynamics of a Cyber Warfare Campaign* (p. 15)
- **B. Misconceptions about Stuxnet's Operation and Impact** (pp. 18–23) — six Q&A subsections
- **C. Inside Natanz: A Guided Tour of Plant Systems, Instrumentation, and Control** (pp. 24–37)
  - SCADA Software (24) · Plant Design (28) · Sensors and Valves (29) · Industrial Controllers (35) ·
    Non-Proliferation Concerns (37)

Running sidebar boxes: "What's a centrifuge cascade?", "What's a protection system?",
"What's a fieldbus?", "What's SCADA?", "What's an Engineering System?"

## Executive summary

Stuxnet contained **two strikingly different attack routines**, and public literature focused almost
exclusively on the simpler, better-known rotor-speed routine. The "forgotten" overpressure routine —
"about an order of magnitude more complex" — is this document's real contribution.

Both destroy centrifuge rotors but through different physical vulnerabilities: one over-pressurizes
the cascade (manipulating the **Cascade Protection System** on Siemens **S7-417** controllers), the
other over-speeds and de-speeds rotors (manipulating the **Centrifuge Drive System** on **S7-315**
controllers). Combining code reverse engineering with plant-design intelligence, Langner concludes the
campaign was a **"low-yield weapon by purpose"** — designed to shorten centrifuge lifetime and
demoralise Iranian engineers, not to cause visible catastrophe, since catastrophe would have been
quickly diagnosed in post-mortem.

He further argues that between 2008 and 2009 the attackers' priorities shifted (implying changed
stakeholders, with "a new center of gravity in Maryland"), so OPSEC loosened and the malware became
detectable. Finally he dismantles the post-Stuxnet security consensus: air gaps, anti-virus, patching
and IDS are insufficient, nation-state resources are *not* required for realistic copycat attacks
against standardised critical infrastructure, and "flaws rather than bugs" — legitimate product
features — are the durable attack surface in ICS.

**Stated purpose of publication:** "There is only one reason why we publish this analysis: To help
asset owners and governments protect against sophisticated cyber-physical attacks as they will almost
definitely occur in the wake of Stuxnet."

## The three layers of a cyber-physical attack (Figure 1)

| Layer | Contents | Role in the attack |
|---|---|---|
| **IT** | Networks, operating systems, IT applications | **Propagation** |
| **Industrial Control System** | Industrial controllers, sub-controllers (frequency converters, pressure controllers) | **Manipulation** — "manipulate, but not disrupt, process control" |
| **Physical** | Valves, electrical drives | **Damage** by exploiting physical vulnerabilities |

Langner's framing: a cyber-physical attack "involves three layers and their specific
vulnerabilities." The physical-layer vulnerability at Natanz was "the fragility of the fast-spinning
centrifuge rotors."

He also notes the "silhouette of a methodology for attack engineering that can be taught in school and
can ultimately be implemented in algorithms" — and warns that defensive forces failed because they
"lulled themselves in the theory that Stuxnet was so specifically crafted to hit just one singular
target." In fact "the attack was highly specific, but attack tactics and technology are not."

## The target: Natanz

| Aspect | Detail |
|---|---|
| **Facility** | Fuel Enrichment Plant (FEP), Natanz; also the Pilot FEP (PFEP) |
| **Centrifuge** | **IR-1** — "a European design of the late Sixties / early Seventies that was stolen by Pakistani nuclear trafficker **A. Q. Khan**"; "an obsolete design that Iran never managed to operate reliably" |
| **Cascade** | **164 centrifuges**, arranged in **4 lines × 43 columns**, **15 enrichment stages**, **stage 10 = the feed stage** |
| **Cascade unit** | **18 cascades**; sub-units of **six** share one feed, one product, one tails station |
| **Normal speed** | **63,000 rpm** (per A. Q. Khan's 2004 confession) |
| **Drive capability** | stable up to **100,000 rpm**, constant torque on acceleration and deceleration |
| **Later cascades** | 164 or 174 centrifuges referenced from 2012 |

**Iran's efficiency problem.** Problems likely began "as early as **1987**" with decommissioned **P-1**
centrifuges. Iran reduced operating pressure "in order to lower rotor wall pressure. But less pressure
means less throughput – and thus less efficiency," so the IR-1 "performs only half as well – best case –
as it could theoretically." Iran compensated by producing centrifuges "at industrial scale," accepting
"a constant breakup of centrifuges during operation because they could be manufactured faster than they
crashed."

**The CPS.** "A critical system component for Iran's nuclear program as without it, Iran would not be
capable of sustained uranium enrichment" — a crude fault-tolerance layer, since IR-1 centrifuges break
constantly. Three fast-acting shut-off valves per centrifuge; the monitoring screen shows each
centrifuge as a **green dot (running) or grey dot (isolated)**.

**Date format evidence.** "Surprisingly, date is shown **US format (MM/DD/YYYY)**" on the CPS monitor;
other labels are consistently English; the only Farsi text sits beside an English label reading
"**CASCADE**". Langner: "It appears far-fetched that Iranian engineers would deliberately use the date
format of the 'Big Satan' unless there is a compelling reason to do so, such as a development team
which is very familiar and used to a software development environment with a configuration that is
typical for the United States."

**How much insider knowledge this implies.** The pin-point manipulation of sub-controllers "indicate a
deep physical and functional knowledge of the target environment; whoever provided the required
intelligence may as well know the favorite pizza toppings of the local head of engineering."

## Attack 1 — Overpressure (the "forgotten" routine, 2007–2009)

**Target:** the Cascade Protection System on **Siemens S7-417** — "a top-of-the-line industrial
controller for big automation tasks", controlling "the valves and pressure sensors of up to six
cascades (or 984 centrifuges)."

**Mechanism.**

1. **Complete takeover.** "Immediately after infection the payload of this early Stuxnet variant takes
   over control completely." Legitimate logic is "completely decoupled from electrical input and output
   signals" — a **man-in-the-middle** placement. When the attack is not active, the malware restores
   legitimate access, "replicating a function of the controller's operating system."
2. **Trigger.** "a combination of highly specific process conditions that are constantly monitored by
   the malicious code."
3. **Fake process values.** "Process input signals (sensor values) are recorded for a period of
   **21 seconds**. Those **21 seconds** are then replayed in a constant loop during the execution of
   the attack" — so SCADA and alarm routines see normal operation.
4. **Isolation.** "all isolation valves for the first two and the last two enrichment stages are
   closed" — **stages 1, 2, 14 and 15** — "thereby blocking the product and tails outflow of process
   gas of each affected cascade." More centrifuges are then isolated "except in the **feed stage**", so
   UF₆ keeps entering but cannot escape.
5. **Interlock bypass by de-calibration.** "With some uncertainty left we assume that the manipulation
   didn't use direct valve close commands but a **de-calibration of the pressure sensors**." The
   pressure controller "can be told what the 'real' pressure is for given analog signals and then
   automatically linearize the measurement"; overwriting the linearisation makes it "interpret all
   analog pressure readings as perfectly normal pressure no matter how high or low their analog values
   are" → it "never" opens the stage exhaust valves.
6. **Additional sensors.** "The sensors for **feed header, product take-off and tails take-off** needed
   to be compromised as well", plus the extra transducers "**numbered from 16 to 21**" in the facility
   and in the attack code.
7. **Abort logic.** "The attack continues until the attackers decide that enough is enough, based on
   monitoring centrifuge status, **most likely vibration sensors**, which suggests a mission abort
   before the matter hits the fan."

**Physical outcome.** "The intent of the overpressure attack was more likely to **increase rotor
stress, thereby causing rotors to break early – but not necessarily during the attack run**." Rotor
wall pressure is "a function of velocity (rotor speed) and operating pressure"; UF₆ solidifies "at
about **100 millibar**" at room temperature. Solidification would have destroyed "hundreds of
centrifuges per infected controller" but "would also have blown cover."

**Valve classes that must be treated differently (Figure 8):** stage exhaust valves `EP-4108`–`EP-4112`
stay closed throughout, "while at least one of the **feed valves** (`EP-4118`–`EP-4120`) must stay
open"; pressure controllers at the product and tails take-offs must also be compromised so they do not
signal a low-pressure condition.

## Attack 2 — Rotor speed (the later variant, from 2009)

**Target:** the Centrifuge Drive System on **Siemens S7-315** — "much smaller" than the 417. "One
S7-315 controller is dedicated to the **164** drives of one cascade (one drive per centrifuge)."

**Why it is simpler — and the myth it replaces.** "The rotor speed attack is much simpler. During the
attack, legitimate control code is simply suspended. The attack sequence is executed, thereafter a
conditional **BLOCK END** directive is called which tells the runtime environment to jump back to the
top of the main executive that is constantly looped on the single-tasking controller, thereby
re-iterating the attack and suspending all subsequent code." Rotor speed "is simply set and then held
constant by the frequency converter" and "is not a controlled variable" — so SCADA, reading stale
controller memory, "would simply have seen the exact speed values from the time before the attack
sequence executes."

**Exact sequence parameters.**

| Step | Value |
|---|---|
| Normal speed | **63,000 rpm** |
| Sequence 1 — over-speed | raised "by a good one-third to **84,600 rpm** for **fifteen minutes**", including a multi-minute acceleration |
| Sequence 2 — next consecutive run | "brings all centrifuges in the cascade basically to a stop (**120 rpm**), only to speed them up again, taking a total of **fifty minutes**" |
| Cadence | "the new attack operates periodically, **about once per month**" |

**Why it breaks rotors.** The IR-1 is a "**supercritical design**", meaning it operates above certain
critical speeds that cause the rotor to vibrate. "**Every time a rotor passes through these critical
speeds, also called harmonics, it can break.**" A sudden brake-stop is unlikely — "it is unlikely that
the frequency converters would permit such a radical maneuver" — so the converter "smoothly
decelerates just like in an isolation / run-down event," an effect that is "**not deterministic** but
offers a good chance of creating damage."

**No attempt to disable the CPS.** "no attempts had been made to disable the Cascade Protection System
during the rotor speed attack, which would have been much easier than the delicate and elaborate
overpressure attack… It would only have required a very small piece of attack code from the
overpressure attack that was implemented already." Langner reads this as proof that catastrophic
destruction was not intended.

**Detection exposure.** "blocking control code from execution for up to an hour is something that
experienced control system engineers would sooner or later detect"; bringing "164 centrifuges or
multiples thereof from 63,000 rpm to 120 rpm and getting them up to speed again would have been
noticeable – if experienced staff had been cautious enough to remove protective headsets in the
cascade hall."

## Malware architecture and propagation

- **Payload-only on controllers.** "An infected controller contains only Stuxnet's payload and no
  dropper component whatsoever" — so the legend of Stuxnet "escaping" from a controller to a laptop
  "cannot be true."
- **Early (2007) delivery.** "Stuxnet's early version had to be physically installed on a victim
  machine, most likely a portable engineering system, or it could have been passed on a **USB stick**
  carrying an infected configuration file for Siemens controllers." The cover was "a legitimate or, worst
  case, pirated **Step7** software project" — the tell being that "a copyright notice and license terms
  were missing." No engineering software to open the file, so no propagation.
- **Self-replication** (added with the rotor-speed variant): spread "within trusted networks and via USB
  sticks even on computers that did not host the engineering software application."
- **Propagation is deliberately narrow.** "propagation can only occur between computers that are
  attached to the same logical network or that exchange files via USB sticks. The propagation routines
  never make an attempt to spread to random targets for example by generating random IP addresses."
- **No zero-days in the control layer.** "the new version arrived equipped with the latest and greatest
  MS Windows exploits and **stolen digital certificates** as the icing on the cake, allowing the
  malicious software to pose as legitimate driver software."
- **C2 and reporting.** Stuxnet "reported IP addresses and hostnames of infected systems back to its
  command-and-control servers, along with basic configuration data."
- **No kill switch.** "there is no logic implemented in the malware which could actively disable the
  malicious code on infected controllers." All that would have been needed: check for the presence of
  **`s7otbxsx.dll`** — "by a simple filename search, using nothing but software tools (Explorer)."
- **Infiltration via contractors.** Stuxnet "demonstrated how air gaps of high-value targets can be
  jumped, namely by compromising **mobile computers of contractors** who enjoy legitimate physical
  access." Chain: **Patient Zero** (Natanz engineering laptop) → "let's say a cement plant"
  (**Patient One**) → other contractors → "**remote access via VPN**, allowing the virus to travel over
  continents… not because of the Internet, but because trusted network connections are tunneled through
  the Internet these days." Offered as the explanation for the legend of "roughly **100,000**
  Stuxnet-infected computer systems worldwide."

## Timeline

| Date | Event |
|---|---|
| **2007** | An unidentified person submits a sample to **Virustotal**; no AV company understands it. Later "identified as malware not earlier than six years later." |
| **27 Jun 2007** | Campaign begins at Natanz. |
| **2007–2009** | Overpressure attack runs; the rotor-speed routine sits **dormant in the payload**. |
| **2009** | "the attackers decided to try something different" — the rotor-speed variant. |
| **2010** | Belarusian AV firm **VirusBlokAda** "practically stumbled over the malware and put it on the desk of the AV industry." The rotor-speed variant "travelled at least a year in the wild." A Stuxnet-infected WinCC observed in Langner's lab. |
| **Aug 2010** | Iran's national telecommunications provider blocks Internet communications to the attackers' C2 servers, after which "Stuxnet was all on its own, executing autonomously." |
| **2011** | Langner's group publishes that enrichment-stage borders were visible in Natanz's own screenshots. |
| **1 Jun 2012** | David Sanger reporting in the *New York Times* (Figure 13). |

Alleged operational code name: **"Operation Olympic Games."** Duqu and Flame are named but explicitly
"outside the scope of this paper."

## Section B — the misconceptions Langner dismantles

| Question | Langner's answer |
|---|---|
| **Did Stuxnet "break out" of Natanz due to a programming error?** | No. The rotor-speed variant manipulated a different control system from a different PLC family; "no coordination between the two attacks can be found in code." The overpressure routines were dormant but retained. |
| **Did the attackers have the capability to stop the campaign?** | There was no kill switch, and the C2 path was cut in August 2010. From then Stuxnet ran autonomously. |
| **Can Stuxnet be used as a blueprint for copycat attacks?** | Yes. "offensive cyber forces around the world will certainly learn from history's first true cyber weapon." ~30 nations run offensive cyber programs. |
| **Are nation-state resources required against the US or allies?** | Not for the *realistic* copycat scenario. A faithful clone would need a full IR-1 mockup running real UF₆ — "beyond the reach of organized crime and terrorists" — but adversaries will instead target infrastructure that is "plentiful, accessible, and standardised" (power plants, substations, chemical plants), preferring "a simultaneous low-key attack against multiple targets" that "can result in a cascading grid failure." |
| **Can technical security controls block Stuxnet-like attacks?** | No. Air gaps refuted by contractor laptops; AV cannot have signatures for custom malware; the ICS vendor "initially disputed any vulnerabilities" and **CVE-2012-3015** was filed two years later; IDS/IPS is "completely unvalidated". |
| **Is "active defense" sufficient?** | No. "Defending against them cannot be done in milliseconds, it requires years of organizational and architectural changes." |

## Was it a success? The "low-yield by purpose" argument

> "Catastrophic damage … would have been **by accident** rather than by purpose. The attackers were in a
> position where they could have broken the victim's neck, but they chose **continuous periodical
> choking** instead."

- **The stockpile defence.** In summer 2010 Iran ran "about **four thousand** centrifuges" while keeping
  "another **five thousand** in stock" — "a stockpile of at least 50% spare centrifuges" (Figure 12). A
  one-time wipeout "would not have jeopardized that strategy, just like the catastrophic destruction of
  4,000 centrifuges by an **earthquake back in 1981** did not stop Pakistan."
- **Author's estimate of impact:** "the **two years** setback that I have estimated for Stuxnet."
  Contrast: Pakistan went from zero to successful LEU production "within just two years"; Iran took "over
  ten years."
- **Hidden cost of stealth:** "I estimate that well over **50%** of Stuxnet's development cost went into
  efforts to hide the attack." Copycat attackers "may want the victim to know that they are under cyber
  attack, and perhaps even publicly claim credit."

## Figures in the document

| # | Page | Content |
|---|---|---|
| 1 | 4 | The three layers of a sophisticated cyber-physical attack (schematic) |
| 2 | 5 | Synopsis of the two different attacks implemented in Stuxnet (schematic) |
| 3 | 6 | Photo — Ahmadinejad at SCADA screens, Natanz 2008; two centrifuges isolated (grey dots) |
| 4 | 8 | Photo — the EU3 meeting in 2003 with Hassan Rowhani |
| 5 | 8 | Photo — operators in front of the Cascade Protection System SCADA displays |
| 6 | 9 | Schematic — modified cascade shape during the attack; stages 1 and 15 isolated |
| 7 | 9 | SCADA screenshot — control loops showing stage exhaust valves in a closed loop |
| 8 | 10 | SCADA screenshot — **the key diagram**: exhaust valves `EP-4108`–`4112` vs feed valves `EP-4118`–`4120` |
| 9 | 12 | Photo — Ahmadinejad holding an IR-2 carbon-fibre rotor |
| 10 | 14 | Engineering-software screenshot — attack entry point at the top of the S7-315 main executive; BEB directive |
| 11 | 15 | Packet capture — WinCC↔controller traffic **every five seconds** |
| 12 | 16 | **Chart** — centrifuge inventory at Natanz 2008–2010 (the only quantitative chart; values are in the image) |
| 13 | 17 | Clipping — David Sanger, *New York Times*, 1 June 2012 |

Section C also carries unnumbered photo plates: PFEP control room, the CPS monitoring screen (colour
code: **red = feed header, blue = product take-off, white = tails take-off, green = pressure
normalisation and dump system**), cascade piping diagrams, isolation and vibration sensors, stage
exhaust valves, **MKS Baratron** pressure transducers, the **Siemens Field PG**, and **MKS PR-4000**
pressure controllers.

## Identifiers named in this document

| Category | Identifiers |
|---|---|
| **File** | `s7otbxsx.dll` — the "malicious file" whose presence proves infection |
| **Directive** | `BLOCK END` (abbrev. `BEB`) — the jump directive |
| **Software** | `Step7` project file, `SIMATIC Manager`, `Siemens Field PG` ("PG" = *Programmiergerät*), `WinCC` |
| **Controllers** | `Siemens S7-417`, `S7-417H` (redundant), `S7-315` |
| **Fieldbus** | `PROFIBUS` (six segments; spec first published 1993), `RS-232`, `MS Windows` |
| **Instrument tags** | `PT-` = Pressure Transducer; `EP-4108`–`EP-4112` (stage exhaust valves), `EP-4118`–`EP-4120` (feed valves), `CASCADE`; transducers numbered 16–21 |
| **Instruments** | `MKS Baratron` (absolute pressure sensors, "maybe also MKS clones"), `MKS PR-4000` (pressure controller) |
| **CVE** | `CVE-2012-3015` |
| **Organisations** | `Virustotal`, `VirusBlokAda`, `Iran CERT`, `US Department of Energy`, `CIA` |
| **Codename** | `Operation Olympic Games` |
| **URLs** | `www.langner.com` (footer), `fergutec.com` (seller of the PR-4000) |

## Terminology

| Term | Meaning |
|---|---|
| **Cascade / stage / cascade unit** | Groupings of centrifuges maximising efficiency; one **cascade unit** = 18 cascades, sub-units of six sharing one feed/product/tails station |
| **Feed / product / tails** | The three take-offs: tails (depleted) → next stage's feed; product (enriched) → the other side |
| **Rotor** | The rotating cylinder holding UF₆ — "the major fragility in a gas centrifuge" |
| **Critical speed / harmonic** | Speed at which the rotor vibrates; IR-1 is *supercritical* (runs above them) and "every time a rotor passes through these critical speeds … it can break" |
| **CPS** | Iran's two-layer protection system: per-centrifuge isolation valves + per-stage exhaust valves into a dump system |
| **Dump system** | Shared collector venting process gas; "never used in production mode", a backup for cascade trips |
| **Frequency converter** | Programmable power supply driving a motor at a commanded speed; "cannot be accessed directly by a controller" |
| **Man-in-the-middle** | The malware's position between electrical I/O and legitimate program logic |
| **Input process image** | Controller memory holding sensor values; faking readings is "a simple memory write operation" |
| **De-calibration** | Overwriting sensor linearisation so the controller believes any reading is normal |
| **Protection vs. safety system** | Protection detects abnormalities; a *safety* system (where humans/environment are at risk) adds redundancy and fault tolerance per OSHA/NRC — "but all these features were never designed to withstand a cyber attack" |
| **Plant-level vulnerability** | Cyber manipulations that reliably exploit a physical vulnerability, found by viewing cyber and physical systems "in the context of the plant and its physical processes" |
| **Fixed configuration** | Inter-stage piping cut and welded; the shape cannot change "without a major pipe job — that would most likely be detected by IAEA inspectors" |
| **Breakout time** | "the time a proliferant needs to arrive at nuclear weapons capability after breaking out of the IAEA regime" |

## Diagrams

See **[[xdr/diagrams/langner-2013-diagrams|Langner — Stuxnet diagrams]]** (13 Mermaid diagrams): the
three layers, the two payloads, plant hierarchy, the dump-system workaround, the overpressure sequence,
the rotor-speed sequence, the control architecture, the contractor infiltration chain, the timeline, the
"low-yield" argument, the OPSEC-decay hypothesis, the lessons for attackers, and why conventional
defences fail.

## Limitations and scope

- **Not an IOC catalogue.** No certificates, mutexes, registry keys, C2 domains, exploit code, or
  reverse-engineering detail. Section B and the plant tour are the contribution.
- **Ground truth is unavailable.** "no information is available on how many controllers were actually
  infected with Stuxnet"; "The actual outcome at Ground Zero is unclear." Any 2009 IAEA-report anomaly
  at Natanz "could have had a completely different cause other than Stuxnet."
- **No Figure 12 data.** The chart's numeric values are inside the image; only ~4,000 operating and
  ~5,000 in stock appear in prose.
- **No absolute CPS setpoints** are given, only "about 100 millibar" for UF₆ solidification.
- **Explicitly out of scope:** Duqu and Flame.

### Claims the author himself hedges

- The de-calibration mechanism: "**With some uncertainty left** we assume that the manipulation didn't
  use direct valve close commands but a de-calibration of the pressure sensors."
- The abort signal: "most likely vibration sensors."
- The 2009 motive switch: "**That may have been motivated by** the fact that the overpressure attack
  was lethal just by accident… or – that somebody simply decided to check out something new and fresh."
- The stakeholder theory: "It **may** have involved a situation where…"; "a new center of gravity in
  Maryland."
- WinCC at Natanz: "it is unclear if the WinCC product is actually used to monitor the Centrifuge
  Drive System."
- Red-highlighted valves in photos: "**Although there is some uncertainty, we assume**…"
- Iran CERT's own testing in 2010: "**Maybe not**, as a then-staff member of Iran CERT told me…"
  (a single anonymous source).
- The "pizza" and "on drugs" lines are rhetorical, not evidentiary.
- The 50%-cost and two-years figures are the author's own estimates ("I estimate that…").
- The Patient One "cement plant" story is explicitly hypothetical: "**let's say** a cement plant."

## Related

- [[xdr/summaries/krasznay-case-study-the-notpetya-campaign|Krasznay — Case Study: The NotPetya
  Campaign]] — the successor-generation destructive campaign, treated through the lens of international
  law and deterrence. Krasznay cites Stuxnet as a prior "red line" event.
