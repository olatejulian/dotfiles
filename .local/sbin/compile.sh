#!/bin/zsh

BASE="${1%.*}"
subfolder="capitulos"

# pdflatex -interaction=nonstopmode $1
# bibtex -interaction=nonstopmode $1.aux
# pdflatex -interaction=nonstopmode $1
# pdflatex -interaction=nonstopmode $1
rm *.aux *.dvi *.bbl *.blg *.brf *.idx *.lof *.log *.loq *.lot *.toc *.out.ps 2>/dev/null 1>&2
rm ./$subfolder/*.aux ./$subfolder/*.bbl ./$subfolder/*.blg ./$subfolder/*.brf ./$subfolder/*.idx ./$subfolder/*.lof ./$subfolder/*.log ./$subfolder/$1.loq ./$subfolder/$1.lot ./$subfolder/$1.toc ./$subfolder/$1.out.ps 2>/dev/null 1>&2

exit 0
