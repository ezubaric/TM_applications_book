
2017_fntir_tm_applications.pdf: 2017_fntir_tm_applications.tex chapters/building.tex chapters/introduction.tex chapters/conclusion.tex chapters/ir.tex chapters/css.tex chapters/multi_ling.tex chapters/nonfiction.tex chapters/fiction.tex chapters/science.tex chapters/viz.tex bib/clean.bib
	pdflatex 2017_fntir_tm_applications
	bibtex 2017_fntir_tm_applications
	makeindex 2017_fntir_tm_applications
	pdflatex 2017_fntir_tm_applications
	pdflatex 2017_fntir_tm_applications
