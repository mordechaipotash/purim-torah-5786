#!/bin/bash
# Build the GRA Esther PDF with XeLaTeX
export PATH="/Library/TeX/texbin:$PATH"
cd "$(dirname "$0")"

# Install missing packages if needed
tlmgr install mdframed zref needspace polyglossia bidi fontspec microtype titlesec fancyhdr enumitem hyperref xcolor etoolbox 2>/dev/null

# Build (run twice for TOC)
xelatex -interaction=nonstopmode gra-esther.tex
xelatex -interaction=nonstopmode gra-esther.tex

# Copy to parent
cp gra-esther.pdf "../The_Vilna_Gaon_on_Megillas_Esther.pdf"
echo "Done: $(wc -c < gra-esther.pdf) bytes"
