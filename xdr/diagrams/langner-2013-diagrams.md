# Diagrams — Langner (2013) "To Kill a Centrifuge"

Mermaid diagrams redrawn from the technical content of
*To Kill a Centrifuge: A Technical Analysis of What Stuxnet's Creators Tried to Achieve*,
Ralph Langner, The Langner Group (Arlington | Hamburg | Munich), November 2013. 37 pages, 13 numbered
figures, no tables.

> **Attribution caution.** This document is an *attack-vector and plant-intelligence* study, **not** an
> IOC/forensic catalogue. It contains no certificate names, no mutexes, no registry keys, no C2 domains,
> and does **not** mention WinStux, Stuxnet.RT, the four-component decomposition, PROFINET/ProfiSAFE,
> PCS 7, or the "121 rotor variables". Those belong to other analyses. Everything below is sourced from
> this document.

---

## 1. The three layers of a cyber-physical attack (Figure 1)

Stuxnet is Langner's "textbook example" of a cyber-physical attack: each layer has its own
vulnerability, and damage requires traversing all three.

```mermaid
flowchart TB
    subgraph IT["IT Layer — Networks, Operating systems, IT applications"]
        IT1["Role: <b>PROPAGATION</b><br/>spread the malware"]
    end
    subgraph ICS["Industrial Control System Layer — industrial controllers,<br/>sub-controllers (frequency converters, pressure controllers)"]
        ICS1["Role: <b>MANIPULATION</b><br/>manipulate, but not disrupt, process control"]
    end
    subgraph PHY["Physical Layer — Valves, electrical drives"]
        PHY1["Role: <b>DAMAGE</b><br/>damage by exploiting physical vulnerabilities"]
    end
    IT -->|"infection reaches the control network"| ICS
    ICS -->|"fake process values; interlocks never trigger"| PHY

    style IT fill:#e0f0ff,stroke:#06c
    style ICS fill:#fff4d0,stroke:#b80
    style PHY fill:#ffe0e0,stroke:#c00
```

**Why this matters for defence:** conventional infosec controls (air gaps, anti-virus, patching, IDS)
address **layer 1 only**. Langner's complaint is that post-Stuxnet mitigation advice "all indications
[of] a failure to understand how the attack actually worked."

---

## 2. The two attack payloads (Figure 2)

Both destroy centrifuge rotors, but by different physical vulnerabilities — and the complex one came
**first**.

```mermaid
flowchart TB
    S["Stuxnet malware<br/><b>two strikingly different attack routines</b>"]

    S --> A["<b>OVERPRESSURE ATTACK</b> — the 'forgotten' routine<br/><i>Silent Hijack of the Crown Jewels</i><br/>~an order of magnitude MORE COMPLEX"]
    S --> B["<b>ROTOR SPEED ATTACK</b> — the widely reported routine<br/><i>Pushing the Envelope</i><br/>comparatively SIMPLE"]

    A --> A1["Target: <b>Cascade Protection System (CPS)</b><br/>on <b>Siemens S7-417</b><br/>up to 6 cascades = 984 centrifuges"]
    A --> A2["Trigger: 'a combination of highly specific<br/>process conditions' constantly monitored"]
    A --> A3["Fakes data by <b>replaying 21 seconds</b> of real sensor values"]
    A --> A4["Era: <b>2007 – 2009</b> (the EARLIER attack)"]

    B --> B1["Target: <b>Centrifuge Drive System (CDS)</b><br/>on <b>Siemens S7-315</b><br/>one controller = 164 drives"]
    B --> B2["Trigger: periodic, <b>about once per month</b><br/>No fake data at all — code is simply suspended"]
    B --> B3["Era: <b>from 2009</b> (the LATER attack)"]

    A1 --> R["<b>Same physical result</b><br/>centrifuge rotors break early"]
    A2 --> R
    A3 --> R
    B1 --> R
    B2 --> R
    B3 --> R

    style A fill:#ffe0e0,stroke:#c00
    style B fill:#e0f0ff,stroke:#06c
    style R fill:#fff4d0,stroke:#b80
```

**The two payloads are entirely independent:** different PLC families, different control systems, and
"**no linkage whatsoever**" between them. Langner's team first assumed the rotor-speed attack would
disable the CPS to protect itself; "no coordination between the two attacks can be found in code."

> **A popular myth this document corrects:** most accounts claim the rotor-speed attack replays fake
> process values. It does **not**. The 21-second record/replay "is only used in the overpressure
> attack" and "wouldn't even work on the smaller controller for technical reasons."

---

## 3. Natanz enrichment plant hierarchy (Section C)

```mermaid
flowchart TB
    FEP["<b>Fuel Enrichment Plant (FEP), Natanz</b><br/>Iran's low-tech, cascade-based enrichment"]
    FEP --> PFEP["<b>Pilot FEP (PFEP)</b><br/>also uses cascades of six"]
    FEP --> CU["<b>Cascade Unit = 18 cascades</b><br/>sub-units of SIX cascades share<br/>one feed, one product, one tails station"]

    CU --> C1["<b>Cascade = 164 centrifuges</b><br/>4 lines × 43 columns · 15 enrichment stages<br/><b>stage 10 = the FEED stage</b><br/>layout provided by A. Q. Khan"]
    C1 --> CF["<b>IR-1 centrifuge</b><br/>own motor at the base<br/>stable drive up to <b>100,000 rpm</b><br/>constant torque on accel/decel<br/><i>normal running speed: 63,000 rpm</i>"]

    C1 --> X["Later (2012) cascades of 164 or 174<br/>centrifuges are also referenced"]

    style C1 fill:#fff4d0,stroke:#b80
    style CF fill:#ffe0e0,stroke:#c00
```

**Why the cascade shape matters:** Iranian inter-stage piping was originally cut and welded (a "fixed
configuration"), so the shape could not change "without a major pipe job." The reduced cascade shapes
observed later can instead be made "simply by closing isolation valves, **as Stuxnet demonstrated**"
(Figure 6) — which raises the question of whether IAEA inspectors could detect temporary
reconfiguration between visits.

---

## 4. Iran's low-tech pressure control and the dump system

The design the attackers had to abuse. Understanding it is the key to the overpressure attack.

```mermaid
flowchart LR
    UF6["UF₆ feed enters<br/>the cascade"] --> ST["Enrichment stage"]
    ST --> PROD["Product take-off<br/>(enriched)"]
    ST --> TAILS["Tails take-off<br/>(depleted) → next stage's feed"]
    ST --> PS["<b>Pressure transducer</b> 'PT-'<br/>MKS Baratron (or clone)<br/>= the MEASURED value"]
    PS --> PC["<b>Pressure controller</b> MKS PR-4000<br/>one per enrichment stage<br/>compares measured vs. SETPOINT"]
    PC -->|"if above setpoint,<br/>opens the valve"| EV["<b>Stage exhaust valve</b> 'EP-41xx'<br/>= the ACTUATED device"]
    EV --> DUMP["<b>Dump system</b><br/>'never used in production mode'<br/>backup for cascade trips"]
    DUMP -.->|"relieves overpressure<br/>back into the stage"| ST

    style PS fill:#e0f0ff
    style PC fill:#e0f0ff
    style EV fill:#ffe0e0
    style DUMP fill:#fff4d0,stroke:#b80
```

This is "**basic downstream control**" — crude compared with the high-tech pressure-control cascades
other states use, but it gave Iran a working overpressure-relief path, which is precisely what the
attackers needed to neutralise.

**Likely built 2003–2006** (Langner: "It can be speculated"), after the EU3 requested an enrichment
suspension in October 2003. Probably **not** from the Khan network: PROFIBUS was first published in
**1993**, the S7-417 entered the market "not earlier than **1999**", fieldbus adoption takes "around
ten years", and "there is no evidence of a close relation between Iran and the Khan network after 1994."

---

## 5. Overpressure attack — how the rotors were destroyed

```mermaid
flowchart TB
    S0["<b>0. Take over the S7-417 completely</b><br/>'Immediately after infection the payload of this early<br/>Stuxnet variant takes over control completely.'<br/>Legitimate logic is <b>decoupled from electrical I/O</b><br/>— a man-in-the-middle on the signals.<br/>When the attack is NOT running, the malware restores<br/>legitimate access — replicating a controller OS function."]

    S0 --> S1["<b>1. Wait for the trigger</b><br/>'a combination of highly specific process conditions<br/>that are constantly monitored by the malicious code'"]
    S1 --> S2["<b>2. Record 21 seconds of real sensor values,<br/>then replay them in a constant loop</b><br/>→ SCADA screens and alarm routines see<br/><b>perfectly normal operation</b>"]
    S2 --> S3["<b>3. Isolate centrifuges</b><br/>Close the isolation valves of stages<br/><b>1, 2, 14 and 15</b> → blocks product and<br/>tails outflow.<br/>Then isolate MORE centrifuges everywhere<br/><b>EXCEPT the feed stage</b>."]
    S3 --> S4["<b>4. UF₆ in, nothing out</b><br/>UF₆ keeps entering via the feed but cannot escape<br/>→ operating pressure rises <b>continuously</b>"]
    S4 --> S5["<b>5. De-calibrate the pressure sensors</b><br/><i>(author's stated assumption)</i><br/>Overwrite the sensor linearisation so the controller<br/>'interpret[s] all analog pressure readings as perfectly<br/>normal pressure no matter how high or low'.<br/>→ the stage exhaust valves <b>never open</b>.<br/><b>Also compromised: feed-header, product take-off and<br/>tails take-off sensors</b>, plus the extra transducers<br/><b>numbered 16 to 21</b> in the plant and in the attack code."]
    S5 --> S6["<b>6. Rotor stress rises</b><br/>'rotor wall pressure is a function of velocity<br/>(rotor speed) and operating pressure'.<br/>UF₆ solidifies at about <b>100 millibar</b> at room temperature."]
    S6 --> S7["<b>7. Abort on status</b><br/>'based on monitoring centrifuge status,<br/><b>most likely vibration sensors</b>, which suggests<br/>a mission abort before the matter hits the fan'"]
    S7 --> S8["<b>Intent: increase rotor stress so rotors break early —<br/>'but not necessarily during the attack run'</b>"]

    style S2 fill:#e0f0ff
    style S5 fill:#ffe0e0,stroke:#c00
    style S8 fill:#fff4d0,stroke:#b80
```

**Why this is the hard attack — and why the intermittency is the smoking gun.** Solidification of UF₆
would have destroyed "hundreds of centrifuges per infected controller," but "would also have blown
cover since its cause would have been detected fairly easily by Iranian engineers in post mortem
analysis." Langner's reading: the goal was **"low-yield by purpose"** — shorten centrifuge lifetime
and demoralise engineers, rather than cause visible catastrophe.

**Why the exhaust valves must stay closed but the feed valves open (Figure 8):** the stage exhaust
valves (`EP-4108`–`EP-4112`) stay closed throughout, "while at least one of the feed valves
(`EP-4118`–`EP-4120`) must stay open." Otherwise critical-high feed with low product and tails would
auto-close the master feed valves and raise an alarm.

---

## 6. Rotor speed attack — the simple, loud attack

```mermaid
flowchart TB
    R0["<b>0. Inject at the top of the S7-315 main executive</b><br/>(Figure 10 — visible in the engineering software)"]
    R0 --> R1["<b>1. Suspend ALL legitimate control code</b><br/>A conditional <b>BLOCK END (BEB)</b> directive tells the<br/>runtime to jump back to the top of the main executive,<br/>which loops on the single-tasking controller —<br/>re-iterating the attack and skipping all later code."]
    R1 --> R2["<b>2. No fake data is needed</b><br/>Rotor speed 'is simply set and then held constant<br/>by the frequency converter' and is <b>not a controlled<br/>variable</b>. SCADA reads stale controller memory,<br/>so it shows the exact pre-attack values —<br/>which look normal, because speed IS constant."]
    R2 --> R3["<b>3. Sequence A — over-speed</b><br/>63,000 rpm → <b>84,600 rpm</b><br/>(+ about one third) held for <b>15 minutes</b><br/>including a multi-minute acceleration"]
    R3 --> R4["<b>4. Sequence B — next consecutive run</b><br/>brought 'basically to a stop (<b>120 rpm</b>)',<br/>then sped up again — <b>50 minutes</b> total.<br/>The converter 'smoothly decelerates just like in an<br/>isolation / run-down event'."]
    R4 --> R5["<b>5. Why it breaks rotors</b><br/>The IR-1 is a <b>supercritical design</b>: it runs ABOVE<br/>critical speeds that make the rotor vibrate.<br/>'Every time a rotor passes through these critical<br/>speeds, also called <b>harmonics</b>, it can break.'<br/>Decelerating and re-accelerating sweeps every rotor<br/>back through them."]
    R5 --> R6["<b>6. Cadence: about once per month</b>"]

    R6 --> R7["<b>7. Loud — and no attempt to hide the CPS</b><br/>'no attempts had been made to disable the Cascade<br/>Protection System during the rotor speed attack'<br/>— which 'would only have required a very small piece<br/>of attack code from the overpressure attack'.<br/>Blocking control code for up to an hour is detectable by<br/>an experienced engineer; 164 centrifuges swinging from<br/>63,000 to 120 rpm is audible — 'if experienced staff<br/>had been cautious enough to remove protective headsets'."]

    style R2 fill:#e0f0ff
    style R5 fill:#fff4d0,stroke:#b80
    style R7 fill:#ffe0e0,stroke:#c00
```

**The absence of CPS interference is itself evidence.** Langner reads it as proof that catastrophic
destruction was not the intent — the attackers had the code and chose not to use it.

---

## 7. The control architecture and the attack surface

```mermaid
flowchart TB
    subgraph SCADA["SCADA — Siemens WinCC (monitoring only)"]
        W["WinCC instance<br/>services a total of <b>six cascades</b><br/><b>probes controllers every 5 seconds</b><br/>for data outside the legitimate control blocks<br/><i>(unconfirmed at Natanz from footage)</i>"]
    end

    subgraph MAIN["Main control — S7-417 (per cascade unit)"]
        M["<b>S7-417 / S7-417H</b><br/>Cascade Protection System<br/>controls valves + pressure sensors of<br/>up to <b>6 cascades (984 centrifuges)</b><br/><b>OVERPRESSURE ATTACK RUNS HERE</b>"]
    end

    subgraph DRIVE["Drive control — S7-315 (per cascade)"]
        D["<b>S7-315</b><br/>Centrifuge Drive System<br/><b>1 controller → 164 drives</b>, one per centrifuge<br/><b>ROTOR SPEED ATTACK RUNS HERE</b>"]
    end

    subgraph FIELD["Field level"]
        VFD["<b>Frequency converters</b><br/>programmable power supplies;<br/>set speed by AC frequency.<br/>'cannot be accessed directly by a controller'"]
        BUS["<b>six PROFIBUS segments</b><br/>(one segment could not serve all converters)<br/>each ending at a communication processor (CP)<br/>on the S7-315 backplane"]
        PC2["<b>Pressure controllers</b> MKS PR-4000<br/>one per enrichment stage,<br/>closed-loop valve control,<br/>reached via a PROFIBUS-to-serial gateway"]
        V["<b>Stage exhaust valves</b> → dump system"]
        IV["<b>Isolation valves</b> — 3 fast-acting per centrifuge<br/>(feed, product, tails)"]
        VS["<b>Vibration sensors</b> — drive the CPS to isolate<br/>and run down a faulty centrifuge"]
        M --> PC2
        PC2 --> V
        M --> IV
        M --> VS
    end

    D --> BUS
    BUS --> VFD
    VFD --> MOT["164 centrifuge motors"]

    W --- M
    W --- D

    style M fill:#ffe0e0,stroke:#c00
    style D fill:#e0f0ff,stroke:#06c
    style W fill:#fff4d0,stroke:#b80
```

**Forensic tell (Figure 11):** the infected WinCC polls every **five seconds** for data outside the
legitimate control blocks. "In a proper forensic lab setup this produces traffic that simply cannot be
missed."

**SCADA is not the target.** Langner is explicit that SCADA "does not directly interfere with actuator
devices" — all process manipulation happened on the controllers.

---

## 8. How Stuxnet got in — indirect infiltration via soft targets

Attacking "fifteen firewalls, three data diodes, and an intrusion detection system" is pointless.
The attackers used trusted third parties instead.

```mermaid
flowchart LR
    A["<b>Attacker</b>"] --> B["<b>Contractor</b><br/>a soft target with legitimate<br/><i>physical</i> access to the site"]
    B --> C["<b>Mobile computers &amp; USB sticks</b><br/>'cybersecurity posture of contractors…<br/>certainly was not at par with the Natanz<br/>Fuel Enrichment facility'"]
    C --> D["<b>Carried on site unchallenged</b><br/>connected to 'the FEP's most critical systems,<br/>unchallenged by any guards'"]

    D --> E["<b>Patient Zero</b><br/>the Natanz engineering laptop<br/>(Field PG / SIMATIC Manager)"]
    E --> F["<b>Patient One</b><br/>'let's say a cement plant' —<br/>downstream, whose network is now infected"]
    F --> G["<b>Other contractors</b> carrying infected laptops in"]
    G --> H["<b>VPN remote access</b><br/>'the virus to travel over continents… not because<br/>of the Internet, but because trusted network<br/>connections are tunneled through the Internet'"]
    H -.->|"this is the intended explanation for the legend of<br/>'roughly 100,000 infected computer systems worldwide'"| I["Scale"]

    style C fill:#fff4d0,stroke:#b80
    style H fill:#ffe0e0,stroke:#c00
```

**Two infection models, by era:**
- **Early (2007) variant** — had to be *physically installed*, "most likely a portable engineering
  system," or passed on "a **USB stick** carrying an infected configuration file for Siemens
  controllers." No engineering software to open the malicious file, so no propagation.
- **Rotor-speed variant** — added real self-replication "within trusted networks and via USB sticks
  even on computers that did not host the engineering software application."

**Propagation is deliberately narrow:** "propagation can only occur between computers that are attached
to the same logical network or that exchange files via USB sticks. The propagation routines never make
an attempt to spread to random targets."

**There is no kill switch** — "there is no logic implemented in the malware which could actively
disable the malicious code on infected controllers." A simple filename search for **`s7otbxsx.dll`**
would have found it.

---

## 9. Timeline

```mermaid
flowchart LR
    subgraph P1["Preparation"]
        A1["<b>2007</b><br/>An unidentified person submits a sample<br/>to <b>Virustotal</b>. No AV company<br/>understands it."] --> A2["<b>Campaign begins 27 June 2007</b><br/>at Natanz.<br/>The overpressure payload is<br/><b>dormant in every infected controller</b>."]
    end
    subgraph P2["Campaign"]
        B1["<b>2007 – 2009</b><br/>Overpressure attack runs.<br/>Rotor-speed routine sits dormant in the payload."] --> B2["<b>2009</b><br/>'the attackers decided to try<br/>something different' — the rotor-speed variant"]
    end
    subgraph P3["Discovery"]
        C1["<b>2010</b><br/>Belarusian AV firm <b>VirusBlokAda</b><br/>'practically stumbled over the malware'.<br/>The rotor-speed variant 'travelled at least<br/>a year in the wild'.<br/>A Stuxnet-infected WinCC observed in<br/>Langner's lab."] --> C2["<b>August 2010</b><br/>Iran's telecom provider blocks the<br/>attackers' C2 servers → Stuxnet<br/>'was all on its own, executing autonomously'"]
    end
    subgraph P4["Aftermath"]
        D1["<b>2011</b><br/>Langner's group publishes that enrichment-stage<br/>borders were visible in Natanz's own screenshots."] --> D2["<b>June 2012</b><br/>David Sanger reporting in the<br/><i>New York Times</i> (Figure 13)"]
    end
    A2 --> B1
    B2 --> C1
    C2 --> D1

    style A2 fill:#ffe0e0,stroke:#c00
    style C1 fill:#fff4d0,stroke:#b80
```

Alleged operational code name: **"Operation Olympic Games."**
(Duqu and Flame are named in the document but explicitly "outside the scope of this paper.")

---

## 10. Was Stuxnet a success? — the "low-yield by purpose" argument

```mermaid
flowchart TB
    Q["<b>Why not cause visible catastrophe?</b>"] --> A1["Catastrophic damage 'would have been<br/><b>by accident</b> rather than by purpose'"]
    A1 --> A2["'The attackers were in a position where they could<br/>have broken the victim's neck, but they chose<br/><b>continuous periodical choking</b> instead.'"]

    A2 --> B1["<b>The stockpile defence</b><br/>Summer 2010: Iran ran ~<b>4,000</b> centrifuges<br/>while keeping another ~<b>5,000</b> in stock —<br/>'a stockpile of at least 50% spare centrifuges'"]
    B1 --> B2["A one-time wipeout 'would not have jeopardized<br/>that strategy' — just as the catastrophic<br/>destruction of 4,000 centrifuges by an<br/><b>earthquake back in 1981</b> did not stop Pakistan"]

    A2 --> C1["<b>Author's estimate of the impact</b><br/>'the <b>two years</b> setback that I have estimated<br/>for Stuxnet'"]
    C1 --> C2["Contrast: Pakistan went from zero to successful<br/>LEU production <b>within just two years</b>;<br/>Iran took <b>over ten years</b>"]

    A2 --> D1["<b>The hidden cost of stealth</b><br/>'I estimate that well over <b>50%</b> of Stuxnet's<br/>development cost went into efforts to hide the attack'"]

    style A2 fill:#ffe0e0,stroke:#c00
    style C1 fill:#fff4d0,stroke:#b80
```

---

## 11. Why OPSEC decayed — the pivot Langner infers

```mermaid
flowchart TB
    O1["<b>The problem the overpressure routine created</b><br/>The routines 'were still contained in the payload,<br/>but <b>no longer executed</b> — a fact that must be<br/>viewed as deficient OPSEC'"] --> O2["But paradoxically this<br/>'provided us by far the best forensic evidence<br/>for identifying Stuxnet's target'"]

    O2 --> P1["<b>Suggested explanation (speculation)</b><br/>Priorities shifted between 2008 and 2009.<br/>'the circle seems to have gotten much wider,<br/>with a <b>new center of gravity in Maryland</b>'<br/>Possibly the original crew was 'taken out of command<br/>by a casual \"we'll take it from here\" by people<br/>with higher pay grades'."]

    P1 --> P2["<b>Consequence: the envelope was pushed</b>"]
    P2 --> Q1["Added 'the latest and greatest MS Windows exploits<br/>and <b>stolen digital certificates</b>', letting the malware<br/>pose as legitimate driver software"]
    P2 --> Q2["Dropped evasion — control code blocked for up to an hour"]
    P2 --> Q3["Ran <b>audibly</b> at 63,000 → 120 rpm"]
    P2 --> Q4["WinCC probed controllers <b>every 5 seconds</b>"]
    Q1 --> R["'they were certainly <b>pushing the envelope<br/>and accepting the risk</b>'"]
    Q2 --> R
    Q3 --> R
    Q4 --> R

    style P1 fill:#fff4d0,stroke:#b80
    style R fill:#ffe0e0,stroke:#c00
```

**Why they might not have cared:** "Digital weapons work", they are stealthy and "dirt cheap";
"Nuclear proliferators come and go, but cyber warfare is here to stay"; uncovering Stuxnet ends the
operation but not its utility as a "deterrent display of cyber power"; and it avoids "another Sputnik
moment."

---

## 12. What Stuxnet teaches future attackers (Section B)

Langner's central argument: these are **generic techniques**, not target-specific tricks.

```mermaid
mindmap
  root((Stuxnet lessons<br/>for attackers))
    Take over the controller
      Inject code on realtime controllers
      Hijack a driver DLL
      Talk directly to networked controllers without the engineering workstation
      Seize control from a still-running legitimate program
      Disable legitimate code with a simple jump directive
      Hijack and modify controller library functions
    Deceive the operator
      Fake sensor data with a memory write to the input process image
      Disable cycle-time monitoring via a BLOCK END in the interrupt handler
    Reach the sub-controllers
      Compromise sub-controllers by reconfiguration
      Interface directly to field equipment over PROFIBUS
      Blindfold sensors by de-calibration
    No zero-days needed
      "In the ICS space, the worst vulnerabilities are not bugs, they are features"
      Flaws are not patched overnight by a vendor
      Stuxnet used no zero-days, no buffer overflows
    Find the target
      Study HAZOP and safety analyses
      Look for protection and safety systems
      Reach a plant-level vulnerability
    Get inside
      Infiltrate indirectly via soft targets and contractors
    Replicate the outcome
      A full clone needs a UF6 test bed = nation-state
      But realistic copycats need only abundant standardised infrastructure
      power plants, electrical substations, chemical plants
      Prefer a simultaneous low-key attack on many targets over one costly strike
      Exploits get packaged into point-and-click tools
```

**The "no zero-days" point, in Langner's words:** "At the control system level, Stuxnet did not
exploit any zero-day vulnerabilities, buffer overflows or other fancy geek stuff, but **legitimate
product features**. In the industrial control system space, the worst vulnerabilities are not bugs,
they are features." Advantage: "They will not be fixed over night by a vendor releasing a 'patch'."

**Important nuance on resources:** a *faithful* Stuxnet clone **would** need nation-state capability,
because testing "must have involved a fully-functional mockup IR-1 cascade operating with real uranium
hexafluoride." But a *realistic copycat* does not — adversaries will go where critical infrastructure
is "plentiful, accessible, and standardised."

---

## 13. Why conventional defences do not work

```mermaid
flowchart TB
    subgraph C1["Air gaps"]
        A1["Refuted: 'air gaps of high-value targets can be<br/>jumped, namely by compromising <b>mobile computers<br/>of contractors</b>'"]
    end
    subgraph C2["Anti-virus"]
        A2["No signature can exist for custom malware.<br/>The 2007 sample took <b>six years</b> to be named;<br/>the 2010 variant at least <b>one year</b>."]
    end
    subgraph C3["Patching"]
        A3["OS zero-days were patched quickly, but the ICS<br/>vendor '<b>initially disputed any vulnerabilities</b>'.<br/><b>CVE-2012-3015</b> was filed <b>two years later</b>.<br/>Still unpatched: faking sensor values via the input<br/>process image; hijacking a driver DLL."]
    end
    subgraph C4["IDS / IPS"]
        A4["'the intriguing idea to detect sophisticated<br/>cyber-physical attacks in network traffic is<br/><b>completely unvalidated</b>'.<br/>'Defending against them cannot be done in milliseconds,<br/>it requires <b>years of organizational and<br/>architectural changes</b>.'"]
    end
    C1 --> Z
    C2 --> Z
    C3 --> Z
    C4 --> Z
    Z["<b>Langner's conclusion</b><br/>The attack 'was highly specific, but attack tactics and<br/>technology are not; they are generic and can be used<br/>against other targets as well.'<br/>'roughly <b>30 nations</b> employ offensive cyber programs,<br/>including North Korea, Iran, Syria, and Tunisia.'"]

    style Z fill:#ffe0e0,stroke:#c00
```

**And the warning:** "It should be take[n] for granted that every serious cyber warrior will copy
techniques and tactics used in history's first true cyber weapon."
