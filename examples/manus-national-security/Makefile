DRAFT  = research/draft.md
PDF    = 从Manus案看中国外商投资安全审查制度的运行逻辑.pdf
HEADER = research/header.tex

.PHONY: pdf clean

pdf: $(PDF)

$(PDF): $(DRAFT) $(HEADER)
	pandoc "$(DRAFT)" -o "$(PDF)" \
		--pdf-engine=xelatex \
		-H "$(HEADER)" \
		-V documentclass=article \
		-V fontsize=28pt

clean:
	rm -f "$(PDF)" research/paper.pdf
