DRAFT  = research/draft.md
PDF    = research/paper.pdf
HEADER = research/header.tex

# 依赖: pandoc + texlive-xetex + texlive-lang-chinese
# Ubuntu: sudo apt install pandoc texlive-xetex texlive-lang-chinese

.PHONY: pdf clean

pdf: $(PDF)

$(PDF): $(DRAFT) $(HEADER)
	pandoc "$(DRAFT)" -o "$(PDF)" \
		--pdf-engine=xelatex \
		-H "$(HEADER)" \
		-V documentclass=article \
		-V geometry:margin=2.5cm \
		-V fontsize=12pt \
		--toc \
		--number-sections

clean:
	rm -f "$(PDF)"
