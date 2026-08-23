#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"

run() {
  if ! "$@" >/dev/null 2>&1; then
    echo "FAILED: $*" >&2
    for f in report.log report.blg; do
      [ -f "$f" ] && tail -n 15 "$f" >&2 && break
    done
    exit 1
  fi
}

run xelatex -interaction=nonstopmode report.tex
run biber report
run xelatex -interaction=nonstopmode report.tex
run xelatex -interaction=nonstopmode report.tex
rm -rf report.{aux, bbl*,blg,fdb*,fls,log,out,run*,toc,xdv,bcf*}
echo "OK: report.pdf"
