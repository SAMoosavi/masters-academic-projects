# xdr — Two landmark cyber-attack case studies

Read, summarised, translated into Persian, and diagrammed.

| | Paper 1 | Paper 2 |
|---|---|---|
| **Title** | *To Kill a Centrifuge: A Technical Analysis of What Stuxnet's Creators Tried to Achieve* | *Case Study: The NotPetya Campaign* |
| **Author** | Ralph Langner | Csaba Krasznay |
| **Year** | 2013 (Nov) | 2022 (written 2020) |
| **Venue** | The Langner Group — technical report, 37 pp., 13 figures | *Cyber Diplomacy from the European Perspective*, Ludovika University Press / NKE, pp. 109–127 |
| **Focus** | The technical anatomy of an OT/ICS attack | The legal, diplomatic and strategic aftermath of a destructive cyber campaign |
| **Topic** | Stuxnet @ Natanz uranium enrichment | NotPetya @ Ukraine, June 2017 |

They form a deliberate pair: **Stuxnet** is the weapon that made cyber-physical attack real, and
**NotPetya** is the campaign that forced states to write the rules for responding to one.

## Layout

```
xdr/
├── README.md                    ← this file
├── refs.bib                     ← BibTeX for both papers
├── papers/                      ← source PDFs (downloaded)
│   ├── langner-2013-to-kill-a-centrifuge.pdf              4.15 MB
│   └── krasznay-2020-case-study-the-notpetya-campaign.pdf  485 KB
├── raw-text/                    ← extracted plain text + the extractor used
│   ├── langner-2013-to-kill-a-centrifuge.txt             4,744 lines / 37 pp.
│   ├── krasznay-case-study-the-notpetya-campaign.txt     1,006 lines / 19 pp.
│   └── extract_pdf_text.py                               ← see "PDF extraction" below
├── summaries/                   ← English summaries
│   ├── langner-to-kill-a-centrifuge.md
│   ├── krasznay-case-study-the-notpetya-campaign.md
│   └── fa/                     ← Persian translations (RTL)
│       ├── langner-to-kill-a-centrifuge-fa.md
│       └── krasznay-case-study-the-notpetya-campaign-fa.md
└── diagrams/                    ← Mermaid diagrams
    ├── langner-2013-diagrams.md                          13 diagrams
    ├── krasznay-2020-notpetya-diagrams.md                 8 diagrams
    └── fa/                     ← Persian diagram sets
        ├── langner-2013-diagrams-fa.md
        └── krasznay-2020-notpetya-diagrams-fa.md
```

## Start here

| If you want… | Open |
|---|---|
| A fast overview of Stuxnet's two payloads | `diagrams/langner-2013-diagrams.md` §2, §5, §6 |
| Why NotPetya was not ransomware | `diagrams/krasznay-2020-notpetya-diagrams.md` §2, §3 |
| The international-law analysis | `diagrams/krasznay-2020-notpetya-diagrams.md` §4 |
| Everything, in Persian | `summaries/fa/` then `diagrams/fa/` |
| The full Stuxnet technical picture | `summaries/langner-to-kill-a-centrifuge.md` |
| The full NotPetya legal/diplomatic picture | `summaries/krasznay-case-study-the-notpetya-campaign.md` |

All diagrams are Mermaid, so they render directly in Obsidian, GitHub, and the OpenCode review pane.

## Source verification notes

Two things about the supplied citations needed checking. Both are recorded in the summaries.

**1. The Krasznay citation does not exist as given.** The supplied reference was
*"Információ és kiberbiztonság (2020): 485–499"*. Checks performed:

- Crossref journal registry, query `Información és kiberbiztonság` → **0 results**
- Crossref journal registry, query `kiberbiztonság` → **0 results**
- OpenAlex sources search → **0 results**
- OpenAlex: all 26 works by Csaba Krasznay (2019–2023) → **no 2020 journal article, no pages 485–499**

The paper itself is real, and the authoritative open-access version is the Ludovika University Press
book chapter, which is what was downloaded:

> Krasznay, C. *Case Study: The NotPetya Campaign.* In *Cyber Diplomacy from the European Perspective.*
> Budapest: Ludovika University Press (National University of Public Service), pp. 109–127.
> DOI [10.36250/01039_05](https://doi.org/10.36250/01039_05). CC BY-NC-ND 4.0.

The PDF's own running heads read 110–127, confirming pp. 109–127. The chapter was written in 2020
(its latest citation is June 2020) and deposited on 2022-09-07 — which likely explains a "2020"
date in a secondary bibliography. The journal name and page range in the supplied citation appear
to be fabricated.

**2. Langner's document is authentic and current.** `langner.com` now redirects to `otbase.com`; the
PDF was fetched from the successor site's own upload path. An independent mirror exists at
`archive.org/details/to-kill-a-centrifuge`. The report is a 2013 Langner Group publication, 37 pages,
with 13 numbered figures — matching the supplied citation.

**3. A caution carried into both summaries.** Langner 2013 is an *attack-vector and plant-intelligence
study*, not an IOC catalogue. It contains **no** certificate names, mutexes, registry keys or C2
domains, and does **not** mention WinStux, Stuxnet.RT, the four-component decomposition,
PROFINET/ProfiSAFE, PCS 7, or "121 rotor variables". Those belong to other analyses. The summaries
are explicit about this so the notes are not later mis-cited.

One point worth flagging because it inverts the usual telling: the **overpressure attack is the
earlier** one (2007) and the rotor-speed attack is the later one (from 2009) — the reverse of the
common assumption. Most public accounts also wrongly claim the rotor-speed attack replays fake
process values; it does not. The 21-second record/replay belongs to the overpressure attack only.

## PDF extraction

No `pdftotext`, no `pip`, and no root were available in this environment, so
`raw-text/extract_pdf_text.py` is a small pure-stdlib PDF text extractor written for this task
(`truetype.py`-style `cmap` parsing is inlined in it). It handles FlateDecode streams, object
streams, ToUnicode CMaps, and — importantly — falls back to the **embedded font program's own `cmap`
table** when a producer's ToUnicode CMap is broken.

That fallback was necessary: Langner's italic text initially extracted as garbage such as
`;tt;?k routinI th;t` because the PDF's Identity-H ToUnicode CMaps map glyph IDs to wrong
characters. Reading the TrueType `cmap` from the embedded `FontFile2` fixes it, and the sentence
then reads correctly:

> "attack routine that changes the speeds of centrifuge rotors, the 'forgotten' routine is about an
> order of magnitude more complex"

Both extractions verify clean (no garbled runs). Re-extract with:

```bash
python3 raw-text/extract_pdf_text.py papers/langner-2013-to-kill-a-centrifuge.pdf
```

## Suggested next steps

- The two summaries cross-reference each other; the Krasznay chapter treats Stuxnet as a prior
  "red line" event, and the Langner report supplies the technical substrate Krasznay assumes.
- For an XDR/detection framing, the most directly reusable artefacts are the CrowdStrike forensic
  checklist in `diagrams/krasznay-2020-notpetya-diagrams.md` §8 and Langner's two forensic tells:
  the **5-second WinCC polling** and the **BLOCK END directive disabling the control cycle**.
- Both chapters' own limitation sections are preserved in the summaries — useful for an academic
  write-up, since each paper is careful about what it does *not* establish.
