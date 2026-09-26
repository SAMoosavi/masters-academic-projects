---
title: "Case Study: The NotPetya Campaign"
authors: "Csaba Krasznay"
year: 2022
container: "Cyber Diplomacy from the European Perspective"
publisher: "Ludovika University Press (National University of Public Service), Budapest"
pages: "109-127"
doi: "10.36250/01039_05"
pdf: "papers/krasznay-2020-case-study-the-notpetya-campaign.pdf"
diagrams: "diagrams/krasznay-2020-notpetya-diagrams.md"
fa: "summaries/fa/krasznay-case-study-the-notpetya-campaign-fa.md"
tags: [notpetya, cyber-attack, attribution, international-law, deterrence, ICS, supply-chain, ransomware, ukraine, cyber-diplomacy]
---

# Case Study: The NotPetya Campaign — Csaba Krasznay

> **Citation note.** This chapter is frequently cited as *"Információ és kiberbiztonság (2020): 485–499"*.
> That journal could not be verified in Crossref or OpenAlex, and no 2020 journal article by Krasznay at
> pages 485–499 exists. The authoritative, open-access version of this exact title is the Ludovika
> University Press book chapter recorded here (DOI `10.36250/01039_05`, pp. 109–127). See
> [[xdr/README|Source verification notes]].

## Bibliographic metadata

| Field | Value |
|---|---|
| Author | Csaba Krasznay — University of Public Service (National University of Public Service), Hungary |
| Title | Case Study: The NotPetya Campaign |
| Book | *Cyber Diplomacy from the European Perspective* |
| Publisher | Ludovika University Press / National University of Public Service (`uni-nke.hu`) |
| DOI | [10.36250/01039_05](https://doi.org/10.36250/01039_05) |
| Pages | 109–127 (19 pages) |
| Published | 2022-09-07 (repository); the chapter is written in 2020 — the latest in-text citation is June 2020 |
| Licence | CC BY-NC-ND 4.0 |
| Figures/tables | **None** — the chapter contains no charts or numbered tables |
| Footnotes | 25 |

**Section structure (7 top-level headings, no numbered subsections):**
Introduction → The Technical Perspective → International Law Perspective → The States' Answer →
Deterrence in Cyberspace → Conclusion → References

## Core argument

NotPetya was "a turning point that explains the importance of international law and international
relations in connection to cyber events." The chapter places it alongside other "red line" reference
events — the 2007 Estonia attack, Stuxnet, the Snowden leaks — that forced a re-evaluation of
cyberspace. Its thesis: the incident demonstrated *in practice* why the Tallinn Manual and a proposed
"Digital Geneva Convention" were necessary, "because of the practice of some countries in
interpreting international norms freely."

Four sub-claims carry the chapter:

1. **Technically** — a destructive weapon disguised as ransomware, delivered through a software
   supply-chain update vector.
2. **Legally** — the first cyber incident that appears to be a *coordinated attack on a sovereign
   state in peacetime*, implicating sovereignty, non-interference and the prohibition of use of force.
3. **Diplomatically** — "a game changer," because it produced the first *joint, coordinated* state
   attribution (February 2018), turning attribution from a unilateral US tool into a collective instrument.
4. **Strategically** — it exposed the inadequacy of "deterrence by defence" alone, making
   "deterrence by retaliation" central.

## Chronology

| Date | Event |
|---|---|
| **24 Apr 2017** | Talos: a MEDoc update containing a **backdoor** was released. "The attackers started preparing for the action months earlier." |
| **13 May 2017** | WannaCry outbreak — "a month before NotPetya"; the comparison baseline. |
| **27 Jun 2017** | Campaign starts, afternoon, last working hours before the Ukrainian Constitution Day holiday. |
| **27 Jun 2017** | Same day: an explosive device in a vehicle kills a Special Forces member in Kiev. |
| **28 Jun 2017** | Andy Greenberg, *Wired* — "Petya Ransomware Epidemic May Be Spillover From Cyberwar." |
| **29 Jun 2017** | CrowdStrike technical analysis. |
| **5 Jul 2017** | Talos Intelligence — "The MeDoc Connection." |
| **16 Aug 2017** | Maersk quarterly report: **$200–300 m** damage from a two-day shutdown. |
| **15 Feb 2018** | Joint attribution day — White House, UK (Lord Ahmad), Estonia (FM Mikser). |
| **16 Feb 2018** | Australia (Angus Taylor), New Zealand (GCSB, Andrew Hampton). |
| **11 Apr 2018** | Stilgherrian, *ZDNet* — "coordinated diplomatic action." |
| **11 Jun 2018** | US Treasury OFAC designates **5 Russian entities + 3 individuals** under E.O. 13694. |
| **17 May 2019** | EU Council establishes the **Cyber Diplomacy Toolbox** sanctions framework. |
| **Jun 2019** | US discloses cyberattacks on the Russian power grid. |
| **11 Jun 2020** | Merkel seeks EU sanctions over the 2015 Bundestag attack — first real test of the Toolbox. |

**Why that date:** choosing a prominent national holiday as the start was "a signal message"; it also
meant "the majority of IT operators would be on leave, so the defence would work with lower resources."

**Geographic targeting:** "most of the infected machines were reported from Ukraine, so it is suspected
that the target was Ukraine as a state and not some companies were on the crosshairs." Germany, France,
Italy, Poland and the US suffered "only collateral damages."

## Technical perspective

**Vector — the MEDoc update mechanism.** MEDoc is "one of the officially approved tax return programs,
so it runs on a significant part of Ukrainian companies." It "indicated that it needed to be updated,
and then after the user allowed the patches to be installed, the infection began."

How the update server was compromised is unknown: "There is no information on how they could influence
the MEDoc update process… it is still not known who and how has hacked this server." What is certain is
that the attacker "gained administrative privileges on one of MEDoc's servers, which allowed him to
intervene in the update mechanism."

The chapter stresses the **social-engineering hinge**: for decades, users have been told to install
updates promptly, so "the attacker built the distribution on this foundation, believing that users would
install anything that appears to be an update as soon as possible, without question, so attacking the
update server and using it as a distribution point is a brilliant choice."

**Mechanism.** The malware infected "the computer's **master boot record**, the hard disk segment
responsible for loading the operating system, and began encrypting the file system after the machine was
started." Crucially, the ordering: "Before making the machine unusable, it tried to spread to the network
on which the infected machine was located." Propagation used the **EternalBlue** SMBv1 vulnerability and
harvested "the administrator password from the infected machine's memory."

**Ransom demand — the deception.** "asking for **300 USD in bitcoin** in exchange for unlocking the
machine. However, it soon became clear that the email address provided for the contact was not alive, so
there was no chance of recovering the lost data." The author's reasoning: a financially motivated actor
(as in WannaCry) "would have remained available and would have secured the return of the data in
exchange for a ransom, as the victim only paid if there was a chance for the decryption."

**Camouflage.** "the code showed similarities to the well-known Petya ransomware, but it was soon
discovered that it was intentional camouflage, so the name NotPetya, or Non Petya, became widespread
among cybersecurity experts." Australia likewise found it "masqueraded as ransomware"; New Zealand said
"its real purpose was to damage and disrupt systems."

**No kill switch.** "Against WannaCry, there was not any hidden code or so-called 'kill switch,' which
would have enabled the rapid shutdown of the infection. The attacker's goal was clearly the largest,
geographically most localised destruction."

**Tool provenance (attribution-relevant).** "the EternalBlue vulnerability, used for malware propagation
was originated from the **National Security Agency** in the United States. For credential theft, the
attackers used **Mimikatz**, originally created as a proof of concept by French security researcher
Benjamin Delpy in 2011."

**No botnet.** "There was not a complex network infrastructure with millions of previously infected
computers in the botnet, as the attack was targeted, originated from the MEDoc update server."

**What was *not* novel.** "neither the vulnerability exploited for network propagation nor the software
that was used to access the credentials of privileged users caused a surprise to professionals. However,
attack tactics were completely new, preceded by a thorough operational planning."

## Victims and damage

| Victim | Detail as stated |
|---|---|
| Ukrainian banks | critical infrastructure |
| Kiev Borispol Airport | named target |
| Kyivenergo, Ukrenergo | energy companies |
| Chernobyl power plant, Ukrainian healthcare | named targets (IHL discussion) |
| Merck (US, medical) | infected |
| Rosnyeft (Russia) | infected |
| OTP Bank Ukraine (Hungarian) | "ATMs displayed the images of the NotPetya infection for days" |
| **A. P. Moller–Maersk** (Denmark) | **558th** largest conglomerate per Forbes Global 2000; operations impossible for **two days**; cargo loading worldwide controlled **manually, "relying on paper and pencil"**; **$200–300 million** damage |

Aggregate claims: "thousands of Ukrainian companies were hit"; White House — "billions of dollars in
damage across Europe, Asia, and the Americas"; UK — "hundreds of millions of pounds"; Australia —
"hundreds of millions of dollars."

Note: the chapter gives **no CVE identifiers** for EternalBlue, and does **not** mention the Budapest
Convention on Cybercrime.

## International law perspective

Framing: NotPetya is "the first cyber incident that appears to be a **coordinated attack on a sovereign
state in peacetime**, attacking its critical infrastructures, civilian facilities, causing additional
damage to civilian companies operating in other countries as well. **Its purpose was clearly
destruction.**"

The chapter adopts **Schmitt and Biller** (EJIL:Talk!, 11 June 2017), linking accountability to
attribution: "the main question is whether the attack was backed by a country's armed forces,
intelligence agencies, or whether the instructions were given by a state actor in case of a non-state
attacker. Assuming that this has happened, a breach of three state obligations can be presumed."

Krasznay's one flagged addition to the literature: although "the malicious code was not reported to
have caused injury or death," "it cannot be excluded that non-functioning electronic information systems
in some healthcare facilities, especially in case of WannaCry, may have contributed indirectly to deaths
in the U.K. healthcare system."

### The three obligations

| Obligation | Finding | Reasoning as quoted |
|---|---|---|
| **1. Sovereignty** | **Partly breached** | |
| 1a. Territorial integrity | **BREACHED** | "in cyberspace can be imagined as an attack causing physical damage or personal injury, possibly death. In a broad interpretation, if a cyber infrastructure becomes unavailable for an extended period of time, a violation of territorial integrity can also be formulated." NotPetya "went beyond the effects of an average distributed denial of service attack, specifically involving the loss of key data and the need to deploy new machines instead of disrupted critical computer systems, this can be seen as damage to physical facilities." |
| 1b. Core government activities | **NOT breached** | "Although the IT systems that enable financial institutions to operate are damaged, they do not support basic government functionality, so this condition for violating sovereignty did not exist." |
| **2. Non-interference** | **NOT breached** | Requires "coercive actions… in order to change its political, economic, social and cultural order and to influence foreign policy." Schmitt and Biller "did not see evidence that the NotPetya malicious code was capable of achieving these purposes, given that its purpose was destruction and not influence." Counterfactual noted: "If the cyber weapon had indeed been a ransomware virus… coercion would in principle have been possible since the essence of ransom is to extort some decision from the other party." |
| **3. Prohibition of use of force** | **Debated — threshold undefined** | Defined as "a state engages in a violent activity that does not qualify as self-defence or collective defence without a UN mandate." Act "typically have little impact on the physical environment," but "the long-term outage of a cyber infrastructure… could be classified as unauthorised use of force. According to the authors, economic destabilisation may also fall into this category. According to the Ukrainian Government, the cyberattack has reached this level, but international practice in mid-2017 has not yet provided a clear answer as to where the threshold is." |

### IHL and the war-crime framing

IHL applies "if there were an international armed conflict between two states, namely Ukraine and,
suppose, Russia" — the condition being that one country "occupies the territory of another country or
supports a non-state group that engages in hostile activity." Given "the support of the Crimean Peninsula
and the uprisings in eastern Ukraine," the authors see "a legitimate presumption of an armed conflict,"
so NotPetya should be examined under IHL "despite the fact that in the UN GGE there is no full agreement."

Per the **Tallinn Handbook**, using such cyber weapons "is an attack even if it does not directly damage
the cyber infrastructure, only has indirect effects," and "the inaccessibility of such infrastructure"
also counts. If targeting the Kiev Airport, Chernobyl power plant and the healthcare system was
intentional, "this can be classified as an attack." But "most elements of cyber infrastructure are clearly
civilian, not serving military purposes, so **the act could even fall into the category of a war
crime**." Also, third-country impact meant "their neutrality was violated by the attacker."

**Author's caution:** "All of these are, of course, only the scientific thinking of researchers, as
mentioning war crimes in case of a cyberattack can have serious diplomatic implications, if it is done
by a politician in charge… states use moderate expressions, even if they have a strong diplomatic
reaction."

**NATO's position** (NATO CCD COE, Blumbergs, Minárik, van der Meij, Lindström, 2017), via Minárik:
"**If the operation is related to an international armed conflict, it is subject to the legislation on
armed conflict.**" Because NATO CCD COE commentary had "not visited the world press on such a delicate
matter," "it could be perceived that NotPetya weighed significantly more than any other previous case."

## The States' Answer

**The breakthrough (Feb 2018):** "7 countries, the United States, the United Kingdom, Denmark,
Lithuania, Estonia, Canada and Australia, jointly condemned Russia for the NotPetya attack, which was
officially supported by New Zealand, Norway, Latvia, Sweden and Finland. **Never before have several
countries used the means of attribution together.**"

**Attribution is political:** "Attribution is always a political decision that can be supported by
technical or intelligence evidence, but without political will, they are not worth much."

**Pre-2018 gap:** "At the time of NotPetya only the United States implemented unilateral cyber sanctions"
(Obama vs. North Korea over Sony Pictures, 2015). "Attribution, diplomatic or even military responses
were not part of the common diplomacy toolbox."

**Statements.** White House (15 Feb): "the Russian military launched the most destructive and costly
cyber-attack in history… a reckless and indiscriminate cyber attack that will be met with international
consequences." UK (Lord Ahmad): "the Russian Government, specifically the Russian military, was
responsible." Australia (Angus Taylor): "Russian state sponsored actors were responsible." Estonia
(Mikser): "demonstrated disrespect for Ukrainian sovereignty." New Zealand (Hampton): "While NotPetya
masqueraded as a criminal ransomware campaign, its real purpose was to damage and disrupt systems…
NotPetya's indiscriminate design caused it to spread around the world." Latvia: a single tweet.

**Russia's denial** — Dmitry Peskov, February 2018: "We categorically reject such accusations. We consider
them unsubstantiated and groundless. This is nothing but a continuation of a Russophobic campaign that
is not based on any evidence."

**Attribution machinery:** DHS CISA + FBI created **"Grizzly Steppe"** as "a separate investigation and
attribution stream to the Russian cyberattacks," analysing the "tactics, techniques and procedures
(TTPs)" of Russian state-sponsored actors.

**Author's reading of motives:** Australia is "more exposed to Chinese cyberattacks, therefore it rarely
deals with Russian originated attacks" — "We can treat this remark as a polite gesture for the United
States." New Zealand is far from Russia and "has much more problems in the cyberspace with China" → low
priority. Latvia, "a country with 27% of native Russians" — "even a tweet can be a strong support towards
its NATO allies."

## Deterrence in Cyberspace

**Taddeo's three elements:** "attribution; defence and retaliation as types of deterrence strategies;
and the capability of the defender to signal credible threats."

**Why attribution is hard:** "attribution needs both convincing technical evidence and reliable
intelligence sources. Due to the anonym and global nature of the Internet, collection of hard evidence
from computers and networks is struggling. What can be seen on the defenders' side is only a few
technical information or indicators of compromise (IoC)." Methodology note: "Source codes are similar to
fingerprints… But that is not true in case of sophisticated, state sponsored targeted attacks."

**No smoking gun:** "Neither governmental, nor industry sources have uncovered any 'smoking guns' that
underpins the role of Russia in this cyber attack. However, many countries attributed them with high
confidence. We can assume that the United States and maybe other countries had indisputable intelligence
information." Cites **Carr** on the need for "a long-term counter-intelligence campaign of infiltration"
and continued funding of human intelligence.

**Signalling (Taddeo):** "Signaling can be either general or tailored." General signalling conveys
strategy and capability openly. "Tailored signalling—the conveying of a threat to a specific offender
indicating the possible targets of retaliation—is more problematic… This kind of signalling is effective
if attribution is certain. If the defender has not identified the offender correctly, tailored signalling
can be counterproductive." It also "requires a careful finetuning in order not to expose the defender's
capabilities and assets."

**Capability-flashing examples:**
- **Panama Papers** (1 Apr 2016) — Mossack Fonseca, "John Doe," *Süddeutsche Zeitung* / Navalny.
- **Dutch intelligence vs. Cozy Bear** (Jan 2018) — AIVD accessed the hacker's IT system.
- **Bellingcat and the Skripal poisoners** (2018–2019) — identified from open sources, back to high school.
- **US attacks on the Russian power grid** (disclosed Jun 2019) — John R. Bolton: "You will pay a price."

## Conclusion

**"Deterrence by defence" alone is not a real option:** "the already developed tools, techniques and
procedures set is enormous, and attackers can easily create a previously non-existing attack path. From
their point of view, one weak link in the defence chain is enough for success. Therefore, countries should
rely more on **defence by retaliation**, not forgetting to improve their defence capabilities as well."

**EU Cyber Diplomacy Toolbox** (Council, 17 May 2019): enables "targeted restrictive measures to deter and
respond to cyber-attacks which constitute an external threat to the EU or its member states, including
cyber-attacks against third States or international organizations." In scope if the attack has significant
impact **and**: originates/carried out from outside the EU; uses infrastructure outside the EU; is carried
out by persons/entities established or operating outside the EU; or is carried out with the support of
persons/entities operating outside the EU. "Attempted cyber attacks with a potentially significant effect
are also covered." Measures: travel ban, asset freeze, and a ban on EU persons making funds available to
those listed.

**Why it was needed:** "The lack of EU reaction to NotPetya is a symptom why this Toolbox is necessary."
The first test is Merkel's push for sanctions over the 2015 Bundestag attack.

**Apparent success, unverifiable:** "since 2017 there was not any major cyberattack, attributed to Russia.
However, most of the actions on that field are covert and the public audience will get information decades
later." Healey & Jenkins: "We can't assess what we don't try to measure."

**Closing geopolitical warning:** as UNSC members, Russia and China "can be more independent from the
U.S. governed global Internet… they are able, and they are willing to influence where the cyberspace is
turning. As of 2020, we can see a clear intention from the Western countries to sustain the current
situation and remarkable steps from Russia and China towards changing it. Diplomats of the 2020s should
notice that what is happening today will have a fundamental effect for the next five decades."

## Diagrams

See **[[xdr/diagrams/krasznay-2020-notpetya-diagrams|Krasznay — NotPetya diagrams]]** (8 Mermaid
diagrams): chronology timeline, kill chain, WannaCry comparison, the three legal obligations, IHL /
war-crime path, coordinated attribution map, deterrence model, EU response toolbox, and the
CrowdStrike forensic checklist.

## Limitations and scope

- **The chapter contains no figures, tables or charts.** The diagrams here are reconstructions from
  its chronology and its three enumerated lists.
- It contains **no primary technical forensics of the author's own** and no CVE identifiers.
- It does **not** mention the **Budapest Convention on Cybercrime**; the "Digital Geneva Convention" is
  named once in the Introduction and never explained.
- The MEDoc supply-chain compromise is explicitly unexplained: "There is no information on how they
  could influence the MEDoc update process."
- Hedging language ("it is suspected that", "it can be assumed that", "we can assume that") marks
  several load-bearing claims as inference rather than confirmed fact.
- Two typographical errors are preserved in the source: footnote 5 "11 June **2107**" and footnote 13
  "16 February **2016**" (both should be 2017 and 2018 respectively).

## Key references cited

- Schmitt & Biller, "The NotPetya Cyber Operation as a Case Study of International Law," *EJIL:Talk!*
- Schmitt & Vihul, "International Cyber Law Politicized: The UN GGE's Failure to Advance Cyber Norms," *Just Security*
- Blumbergs, Minárik, van der Meij, Lindström, "NotPetya and WannaCry Call for a Joint Response," *NATO CCD COE*
- Taddeo, "The Limits of Deterrence Theory in Cyberspace," *Philosophy and Technology* 31(3), 2018, 339–355
- Carr, "Responsible Attribution: A Prerequisite for Accountability," *NATO CCD COE*, 2014
- Moret & Pawlak, "The EU Cyber Diplomacy Toolbox," *EUISS*, July 2017
- Sood & Hurley, "NotPetya Technical Analysis — A Triple Threat," *CrowdStrike*
- Maynor et al., "The MeDoc Connection," *Talos Intelligence*
- Healey & Jenkins, "Rough-and-Ready: A Policy Framework…," *11th ICC Cyber Conflict*, NATO CCD COE, 2019

## Related

- [[xdr/summaries/langner-to-kill-a-centrifuge|Langner — To Kill a Centrifuge (Stuxnet)]] — the
  predecessor OT campaign; Krasznay cites Stuxnet as a prior "red line" event.
