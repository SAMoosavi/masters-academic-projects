# AGENTS.md

Masters academic project: certificateless aggregate signatures for VANETs. All content is in Persian (RTL).

## Repository structure

- `seminar/seminar.tex` — Seminar topic form (student info + bibliography list). Simple 67-line document, not the article.
- `seminar/articles/` — Full seminar article (793 lines, fancy headers, hyperref, 1.5 spacing). `report.tex` is the active source; `report_fixed.tex` is an unused variant — edit `report.tex` unless told otherwise.
- `seminar/articles/presentation.typ` — Typst slides (4:3 dark theme). References `images/amirkabir_logo-1.png`.
- `proposal/proposal.typ` — Research proposal (Typst + RTL). Uses `proposal/refrence.bib`.
- `proposal/summaries/` — 27 markdown paper summaries generated from papers (see `proposal/prompt.md` for workflow).
- `gantt-chart/generate_gantt.py` — Persian RTL Gantt chart generator (Pillow).

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
