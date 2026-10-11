# AGENTS.md

Masters academic project: certificateless aggregate signatures for VANETs. All content is in Persian (RTL).

## Repository structure

- `seminar/seminar.tex` — Seminar topic form (student info + bibliography list). Simple 67-line document, not the article.
- `seminar/articles/` — Full seminar article (793 lines, fancy headers, hyperref, 1.5 spacing). `report.tex` is the active source; `report_fixed.tex` is an unused variant — edit `report.tex` unless told otherwise.
- `seminar/articles/presentation.typ` — Typst slides (4:3 dark theme). References `images/amirkabir_logo-1.png`.
- `proposal/proposal.typ` — Research proposal (Typst + RTL). Uses `proposal/refrence.bib`.
- `proposal/summaries/` — 27 markdown paper summaries generated from papers (see `proposal/prompt.md` for workflow).
- `gantt-chart/generate_gantt.py` — Persian RTL Gantt chart generator (Pillow).
- `articles/` — **Obsidian vault for the CLAS literature study.** Structure (see `articles/MOC.md`):
  - `articles/MOC.md` — content map / index of the whole vault.
  - `articles/مقالات/` — 31 paper reports (summary + math structure merged per paper).
  - `articles/امضاها/` — signature-category nexus (CLAS, CLS, Signcryption, Pairing-Free, Standard-Model, Type-III, Detect-Invalid, Cryptanalysis).
  - `articles/حملات/` — attacks (KGC, replacement, coalition, rogue-key, forgery), each referencing paper reports.
  - `articles/دفاع/` — defenses (Type-III-resistance, standard-model, hash-binding, verifier-key), each referencing paper reports.
  - `articles/تشخیص/` — detection of invalid/malicious signatures in aggregates (binary-search, identity-tracing, level3-kgc).
  - `articles/refs.bib` — bibliography.

## articles/ vault conventions

- Every note is Obsidian-flavored Markdown: YAML frontmatter (`title`, `authors`, `year`, `doi`, `tags`), wikilinks `[[...]]`, callouts `> [!type]`.
- **No duplication**: one fact lives in one file; other files link to it. Do not copy-paste content between `مقالات/`, `حملات/`, `دفاع/`, `تشخیص/` — link instead.
- Paper files in `مقالات/` use key = `author+year` (e.g. `zhang2014.md`, `guo2024-drclas.md`). Link by filename: `[[zhang2014]]`.
- Two papers are **Abstract-only** (no verified full text): `han2022`, `wu2025-collusion` — never invent equations for them.
- Supplementary detection papers (`cao2025`, `guo2024-drclas`, `wang2022-clasrm`, `kabil2024-cham-clas`, `li2023-relclas`, `zhao2023-level3-cls`, `li2026-level3-cls`) came from the earlier malicious-signer-reports pass and are **not yet fully audited** — verify against PDFs before citing.

## Editing the seminar report

Before editing `seminar/articles/report.tex`, read `seminar/articles/EDITING_RULES.md` (rules for expanding sections into prose; source notes are in `seminar/sam-work/source-review/`).

## Build commands

### Seminar article (the main one)
```bash
cd seminar/articles && bash build.sh
```
Runs: `xelatex` → `biber` → `xelatex` → `xelatex`. Outputs `report.pdf`.

### Seminar topic form
```bash
cd seminar && xelatex -interaction=nonstopmode seminar.tex && biber seminar && xelatex -interaction=nonstopmode seminar.tex && xelatex -interaction=nonstopmode seminar.tex
```

### Presentation
```bash
cd seminar/articles && typst compile presentation.typ
```

### Proposal
```bash
cd proposal && typst compile proposal.typ
```

### Gantt chart
```bash
cd gantt-chart && python3 generate_gantt.py
```
Requires: `Pillow` (`pip install Pillow`). Outputs `gantt_full.png`.

## Font dependencies

All builds require **Vazirmatn** font installed system-wide at `/usr/share/fonts/vazirmatn-fonts/`. Without it, XeLaTeX and the Gantt script will fail. Latin text uses Liberation Serif (seminar form) or Libertinus Serif (article).

## Gotchas

- **`hyperref` load order**: In `report.tex`, `hyperref` MUST be loaded before `xepersian` (line 5 before line 6). Reordering breaks the build.
- **Two `.bib` files**: `seminar/articles/report.bib` (article, 356 lines) vs `seminar/seminar.bib` (topic form). They are separate. `proposal/refrence.bib` is a third file for the proposal.
- **Build artifacts everywhere**: `.aux`, `.bbl`, `.log`, `.bcf`, `.run.xml`, `.toc`, `.xdv` files sit alongside sources. No `.gitignore` — these are not meaningful content.
- **Pre-generated images**: `seminar/articles/images/` has ~198 files including PNG frame sequences (`did_arch-*.png`, `iota_arch-*.png`, `vanet_arch-*.png`). These are presentation assets, not source files to regenerate.

## Conventions

- Persian (RTL) text throughout — `xepersian` for LaTeX, `dir: rtl` for Typst.
- Bibliography: BibTeX via `biber` (IEEE style).
- Proposal summaries are generated markdown (not hand-written) — see `proposal/prompt.md` for the template.
- No Makefile or CI — builds are manual.
