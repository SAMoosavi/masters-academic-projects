# Diagrams — Krasznay "Case Study: The NotPetya Campaign"

Mermaid diagrams redrawn from *Case Study: The NotPetya Campaign*, Csaba Krasznay,
in *Cyber Diplomacy from the European Perspective*, Ludovika University Press / National
University of Public Service, pp. 109–127, DOI 10.36250/01039_05.

The chapter contains **no printed figures or tables**; the diagrams below are built from its
chronology, its technical narrative, and the three enumerated lists it cites.

---

## 1. Chronology: from preparation to coordinated attribution

```mermaid
timeline
    title NotPetya — key dates
    section Preparation
        24 Apr 2017 : Talos — MEDoc update released containing a backdoor, "so in principle it allowed the attack to be carried out"
    section Attack
        13 May 2017 : WannaCry outbreak — "a month before NotPetya"; the comparison baseline
        27 Jun 2017 : Campaign starts, afternoon, last working hours before the Ukrainian Constitution Day holiday
        27 Jun 2017 : Same day — explosive device in a vehicle kills a Special Forces member in Kiev
        28 Jun 2017 : Andy Greenberg, Wired — "Petya Ransomware Epidemic May Be Spillover From Cyberwar"
        29 Jun 2017 : CrowdStrike technical analysis
        5 Jul 2017 : Talos Intelligence — "The MeDoc Connection"
        16 Aug 2017 : Maersk quarterly report — $200–300 m damage from a two-day shutdown
    section Attribution
        15 Feb 2018 : Joint attribution day — White House, UK (Lord Ahmad), Estonia (FM Mikser)
        16 Feb 2018 : Australia (Angus Taylor), New Zealand (GCSB, Andrew Hampton)
        11 Apr 2018 : Stilgherrian, ZDNet — "coordinated diplomatic action"
    section Response
        11 Jun 2018 : US Treasury OFAC designates 5 Russian entities + 3 individuals under E.O. 13694
        17 May 2019 : EU Council establishes the Cyber Diplomacy Toolbox sanctions framework
        Jun 2019 : US discloses cyberattacks on the Russian power grid
        11 Jun 2020 : Merkel seeks EU sanctions over the 2015 Bundestag attack — first real test of the Toolbox
```

**Why the date matters:** choosing a prominent national holiday as the start was "a signal
message", and it also meant "the majority of IT operators would be on leave, so the defence
would work with lower resources."

---

## 2. The NotPetya kill chain

```mermaid
flowchart TB
    A["<b>1. Supply-chain foothold</b><br/>Attacker gains administrative privileges on a<br/>MEDoc update server<br/><i>(MEDoc = officially approved Ukrainian tax-return<br/>software, present in many Ukrainian companies)</i>"]
    A --> B["<b>2. Malicious update</b><br/>A backdoored update is pushed to users.<br/>Users install it WITHOUT QUESTION — the social-engineering<br/>hinge: 'if a software update is available, it should be<br/>installed as soon as possible'"]
    B --> C["<b>3. Initial compromise</b><br/>Malware installed on Ukrainian business machines"]
    C --> D["<b>4. Credential theft</b><br/>Administrator password harvested from<br/><b>machine memory</b> (Mimikatz — originally a 2011 proof of<br/>concept by Benjamin Delpy)"]
    D --> E["<b>5. Lateral movement</b><br/>SMBv1 exploitation via <b>EternalBlue</b><br/>(an NSA-origin vulnerability) on unpatched hosts;<br/>UNC write to <b>admin$</b> + remote execution;<br/>network node enumeration"]
    E --> F["<b>6. Destructive payload</b><br/><b>MBR ransomware</b> — overwrites the master boot record<br/><b>MFT encryption</b>, file encryption,<br/>physical drive manipulation"]
    F --> G["<b>7. Anti-forensics &amp; shutdown</b><br/>Evidence destroyed, system shut down"]
    G --> H["<b>8. Ransom note — the deception</b><br/>Screen demands <b>300 USD in bitcoin</b>.<br/>But the contact email was DEAD: 'there was no chance of<br/>recovering the lost data'"]

    B -.->|"ORDER MATTERS:<br/>spread across the network FIRST,<br/>then make the machine unusable"| E
    style A fill:#fff4d0,stroke:#b80
    style H fill:#ffe0e0,stroke:#c00
    style F fill:#ffe0e0,stroke:#c00
```

**The "spread first, destroy later" ordering is the tell.** A financially motivated actor needs the
machine alive and a working decryption channel. Here the machine is destroyed and the mailbox is
dead — so the ransom demand was camouflage, not a business model.

---

## 3. WannaCry vs. NotPetya — why the chapter contrasts them

```mermaid
flowchart LR
    subgraph W["WannaCry — May 2017"]
        W1["Monetisation:<br/><b>financial</b>"] --> W2["Contact channel:<br/><b>WORKED</b><br/>'the victim only paid if there<br/>was a chance for the decryption'"]
        W2 --> W3["Behaviour:<br/>encrypt, then ask"]
    end
    subgraph N["NotPetya — June 2017"]
        N1["Stated purpose:<br/><b>DESTRUCTION</b>"] --> N2["Contact channel:<br/><b>DEAD</b><br/>no chance of recovery"]
        N2 --> N3["Behaviour:<br/><b>spread first</b>, then destroy;<br/>MBR + MFT wipe"]
    end
    W -.->|"one month apart"| N
    style W fill:#e0f0ff,stroke:#06c
    style N fill:#ffe0e0,stroke:#c00
```

**Two further asymmetries the chapter stresses:**
- **Update vector** — WannaCry had *no* hidden code and *no* "kill switch". NotPetya's backdoor had
  been sitting in MEDoc since 24 April 2017, so the attackers "started preparing for the action
  months earlier." The attacker "was clearly after the largest, geographically most localised
  destruction."
- **Infrastructure** — no massive pre-infected botnet. "There was not a complex network
  infrastructure with millions of previously infected computers in the botnet, as the attack was
  targeted, originated from the MEDoc update server."

---

## 4. International law: the three obligations (after Schmitt & Biller)

Krasznay adopts the Schmitt–Biller analysis, which anchors accountability in attribution.

```mermaid
flowchart TB
    Q{"Was the attack<br/><b>state-backed</b>?<br/><i>armed forces, intelligence<br/>services, or a state actor<br/>directing a non-state attacker</i>"}
    Q -->|"If yes, three obligations are presumed breached"| O

    subgraph O["Presumed breach"]
        direction LR
        O1["<b>1. Sovereignty</b>"]
        O2["<b>2. Non-interference</b>"]
        O3["<b>3. Prohibition of use of force</b>"]
    end

    O1 --> O1a["<b>Territorial integrity: BREACHED</b><br/>Beyond a normal DDoS: key data lost,<br/>systems had to be REPLACED, not just disrupted<br/>→ 'damage to physical facilities'"]
    O1 --> O1b["<b>Core government activities: NOT breached</b><br/>Banks were hit, but they do not<br/>support basic government functionality"]

    O2 --> O2a["<b>NOT breached</b><br/>No evidence of coercive intent to change the<br/>political/economic/social order or influence policy.<br/>Purpose was destruction, not influence.<br/><i>(Had it truly been ransomware, coercion<br/>would in principle have been possible.)</i>"]

    O3 --> O3a["<b>Debated — threshold undefined</b><br/>Cyber acts usually have little physical impact,<br/>but 'the long-term outage of a cyber infrastructure<br/>… could be classified as unauthorised use of force'.<br/>Economic destabilisation may fall in this category —<br/>as the Ukrainian Government argued.<br/><b>Where is the line? mid-2017 practice gave no clear answer.</b>"]

    style O1a fill:#ffe0e0,stroke:#c00
    style O1b fill:#e8f8e8,stroke:#2a2
    style O2a fill:#e8f8e8,stroke:#2a2
    style O3a fill:#fff4d0,stroke:#b80
```

### 4b. If an armed conflict is presumed: IHL and the war-crime framing

```mermaid
flowchart TB
    A["<b>Condition for IHL to apply</b><br/>An international armed conflict exists if one state<br/><b>occupies</b> the other's territory, or<br/><b>supports a non-state group</b> engaging in hostilities"]
    A --> B["<b>Presumption asserted by the authors</b><br/>Support of the <b>Crimean Peninsula</b> and the<br/><b>uprisings in eastern Ukraine</b><br/>→ 'a legitimate presumption of an armed conflict'"]
    B --> C["Consequence: examine NotPetya under IHL<br/>(though 'in the UN GGE there is no full agreement')"]

    C --> D["<b>Targeting cited:</b><br/>Kiev Airport · Chernobyl power plant ·<br/>Ukrainian healthcare system"]
    D --> E["If intentional (not spillover) → <b>an 'attack'</b><br/>per the Tallinn Handbook, which counts indirect<br/>effects and unavailability of infrastructure"]
    E --> F["Most cyber infrastructure is <b>clearly civilian</b><br/>(some targets, e.g. the airport, may be dual-use)"]
    F --> G["<b>→ 'the act could even fall into the category<br/>of a war crime'</b>"]
    E --> H["Third-country impact →<br/><b>'their neutrality was violated by the attacker'</b>"]

    G --> I["<b>Author's own caution</b><br/>'All of these are… only the scientific thinking of<br/>researchers' — war-crime language carries serious<br/>diplomatic risk if used by a politician"]
    style G fill:#ffe0e0,stroke:#c00
    style I fill:#e8f8e8,stroke:#2a2
```

---

## 5. Coordinated attribution, February 2018

The chapter calls this the real breakthrough: attribution used *jointly* for the first time.

```mermaid
flowchart TB
    subgraph ATT["Attributed Russia — 7 states, jointly"]
        direction LR
        A1["United States"] --- A2["United Kingdom"] --- A3["Denmark"]
        A3 --- A4["Lithuania"] --- A5["Estonia"] --- A6["Canada"] --- A7["Australia"]
    end
    subgraph SUP["Officially supported — 5 states"]
        direction LR
        S1["New Zealand"] --- S2["Norway"] --- S3["Latvia"] --- S4["Sweden"] --- S5["Finland"]
    end
    R["<b>Russia</b>"] ---|"DENIED:<br/>'We categorically reject such accusations.<br/>We consider them unsubstantiated and groundless.'<br/>— Dmitry Peskov, Kremlin spokesman"| ATT
    ATT --> SUP
    ATT --> K["<b>Why it mattered</b><br/>'Never before have several countries used the<br/>means of attribution together.'<br/>Attribution is a POLITICAL decision —<br/>'without political will, they are not worth much'"]
    style K fill:#fff4d0,stroke:#b80
    style R fill:#ffe0e0,stroke:#c00
```

### 5b. Who spoke, and what that reveals about priorities

```mermaid
flowchart LR
    subgraph HIGH["High-level — foreign / cyber ministers"]
        H1["White House, 15 Feb<br/>'the most destructive and costly<br/>cyber-attack in history'"]
        H2["UK — Lord Ahmad, 15 Feb<br/>'specifically the Russian military'"]
        H3["Australia — Angus Taylor, 16 Feb<br/>'Russian state sponsored actors'"]
        H4["Estonia — FM Sven Mikser<br/>'disrespected Ukrainian sovereignty'"]
    end
    subgraph LOW["Lower-ranked officials — supporting states"]
        L1["New Zealand — GCSB Dir-Gen<br/>Andrew Hampton<br/>'masqueraded as a criminal<br/>ransomware campaign'"]
        L2["Latvia — MFA<br/>one tweet:<br/>'#Latvia is deeply concerned'"]
    end
    HIGH --> NOTE["<b>Author's reading of the motives</b><br/>Australia is 'more exposed to Chinese cyberattacks,<br/>therefore it rarely deals with Russian originated attacks'<br/>→ a 'polite gesture for the United States'.<br/>New Zealand is far from Russia → low priority.<br/>Latvia has 27% native Russians → 'even a tweet can be<br/>a strong support towards its NATO allies'."]
    LOW --> NOTE
    style NOTE fill:#fff4d0,stroke:#b80
```

---

## 6. Deterrence in cyberspace (after Taddeo)

```mermaid
flowchart TB
    D["<b>Three elements must all be present</b>"] --> D1["<b>1. Attribution</b><br/>identify the opponent"]
    D --> D2["<b>2. Deterrence strategies</b><br/>defence AND retaliation"]
    D --> D3["<b>3. Credible signalling</b><br/>capacity to signal threats that will be believed"]

    D1 --> D1a["<b>Hard in cyberspace</b><br/>Anonymity + global Internet → hard evidence is scarce.<br/>Defenders see only IoCs: files, OS artefacts,<br/>source/destination IPs.<br/><b>No 'smoking gun' was ever found for NotPetya</b> —<br/>yet states attributed with high confidence,<br/>implying undisclosed human intelligence (Carr)."]

    D3 --> D3a["<b>General signalling</b><br/>open statements about strategy,<br/>commitments, capabilities"]
    D3 --> D3b["<b>Tailored signalling</b><br/>threat aimed at a specific offender.<br/><b>Problematic:</b> only works if attribution is certain —<br/>misattribution is counterproductive; and it risks<br/>exposing your own capabilities and assets."]

    D2 --> R["<b>The chapter's conclusion</b><br/>'believing solely in deterrence by defence is not a real option' —<br/>attackers can create a previously non-existent path,<br/>and one weak link in the defence chain is enough.<br/>→ rely more on <b>defence by retaliation</b>, while still<br/>improving defence."]
    style R fill:#ffe0e0,stroke:#c00
    style D1a fill:#fff4d0,stroke:#b80
```

### 6b. "Flashing their capabilities" — the four examples the chapter gives

```mermaid
flowchart LR
    F1["<b>Panama Papers</b><br/>1 Apr 2016 · Mossack Fonseca<br/>'John Doe' · Süddeutsche Zeitung / Navalny"]
    F2["<b>Dutch intelligence vs. Cozy Bear</b><br/>Jan 2018 · AIVD accessed the<br/>hacker's IT system"]
    F3["<b>Bellingcat &amp; the Skripal poisoners</b><br/>2018–2019 · identified the killers<br/>from open sources, back to high school"]
    F4["<b>US attacks on the Russian power grid</b><br/>disclosed Jun 2019 · John R. Bolton:<br/>'You will pay a price'"]

    F1 --> S["<b>Credible signalling</b><br/>Demonstrating offensive capability<br/>deters by raising the cost of attack"]
    F2 --> S
    F3 --> S
    F4 --> S
    style S fill:#fff4d0,stroke:#b80
```

---

## 7. The EU response toolbox — instruments available to states

The list Moret & Pawlak (EUISS, July 2017) give for answering a cyber attack.

```mermaid
flowchart TB
    subgraph DIP["Diplomatic / political"]
        direction LR
        D1["Statements &amp; demarches"] --- D2["EU demarches"] --- D3["Council conclusions"] --- D4["Political &amp; cyber dialogues"]
    end
    subgraph LAW["Legal"]
        direction LR
        L1["International agreements"] --- L2["Sanctions"] --- L3["Solidarity clause"] --- L4["Mutual Defence Clause"]
    end
    subgraph PROC["Procedural / capacity"]
        direction LR
        P1["Capacity building"] --- P2["Joint investigations"] --- P3["Formal request for assistance"] --- P4["Recalling diplomats"] --- P5["HR/VP statements"]
    end
    subgraph HARD["Hard response"]
        direction LR
        H1["Countermeasures"] --- H2["Military response"]
    end
    subgraph STRAT["Strategic"]
        S1["Strategic communication"]
    end
    P["Instrument menu<br/>(escalating severity)"] --> DIP
    P --> LAW
    P --> PROC
    P --> HARD
    P --> STRAT
    style H1 fill:#ffe0e0,stroke:#c00
    style H2 fill:#ffe0e0,stroke:#c00
```

### 7b. EU Cyber Diplomacy Toolbox, 17 May 2019 — scope and measures

```mermaid
flowchart LR
    subgraph SCOPE["An attack falls in scope if it has significant impact AND:"]
        direction TB
        C1["originates or is carried out<br/>from outside the EU"]
        C2["uses infrastructure outside the EU"]
        C3["is carried out by persons/entities<br/>established or operating outside the EU"]
        C4["is carried out with the support of<br/>persons/entities operating outside the EU"]
    end
    SCOPE --> M["<b>Restrictive measures available</b>"]
    M --> M1["Ban on travel to the EU"]
    M --> M2["Asset freeze on persons and entities"]
    M --> M3["EU persons and entities forbidden from<br/>making funds available to those listed"]
    M1 --> N["<b>Note:</b> attempted attacks with a<br/>potentially significant effect are<br/>ALSO covered"]
    style M fill:#fff4d0,stroke:#b80
```

---

## 8. Attribution evidence researchers were told to look for

The chapter reproduces CrowdStrike's forensic checklist — useful as a detection-oriented diagram.

```mermaid
flowchart TB
    subgraph A["Initial access & execution"]
        direction LR
        A1["Dropped files"] --- A2["Process hashes &amp;<br/>privilege checks"]
    end
    subgraph B["Credential & identity theft"]
        direction LR
        B1["Credential theft"] --- B2["Token impersonation"]
    end
    subgraph C["Discovery & lateral movement"]
        direction LR
        C1["Network node enumeration"] --- C2["SMB copy &amp; remote execution"] --- C3["SMBv1 exploitation via EternalBlue"] --- C4["UNC write to admin$"] --- C5["Remote execution"]
    end
    subgraph D["Impact"]
        direction LR
        D1["MBR ransomware"] --- D2["Physical drive manipulation"] --- D3["MFT encryption"] --- D4["File encryption"] --- D5["System shutdown"]
    end
    E["Anti-forensics"]
    A --> B --> C --> D --> E
    subgraph P["Propagation"]
        P1["Malware propagation"]
    end
    P -.-> C
    style D fill:#ffe0e0,stroke:#c00
    style E fill:#fff4d0,stroke:#b80
```
