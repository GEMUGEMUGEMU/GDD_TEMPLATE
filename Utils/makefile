#
#        ~_
#     ~_ )_)~_
#     )_))_))_)
#     _!__!__!_
#   ~~\t  Gemu/~~
#
#  File Name: makefile
#  Purpose: make accesible from all makefiles:
#		- latex
#		- print logo
#		- clean util
#  Creation Date: 16-12-20
#  Created By: Andrea Andreu Salvagnin
#
#Used to produce pdf
LATEX_PDF=pdflatex
#Used to produece glossaries
LATES_GLSS=makeindex


#Glossary components
GLSS_C=$(DOC_NAME).glo
GLSS_STYLE=$(DOC_NAME).ist
GLSS_LOG=$(DOC_NAME).glg
GLSS_OUT=$(DOC_NAME).gls

.PHONY: pdf_build gls_build print_logo clean_files

pdf_build:
	$(LATEX_PDF) -jobname $(DOC_NAME) $(WRAPPER_FILE)


#Produce glossary
#-s specify style
#-t specify where to log
#-o specify where to output
glss_build:
	$(LATES_GLSS) $(GLSS_C) -s $(GLSS_STYLE) -t $(GLSS_LOG) -o $(GLSS_OUT)

print_logo:
	@echo "        ~_"
	@echo "     ~_ )_)~_"
	@echo "     )_))_))_) $(ACTION)"
	@echo "     _!__!__!_"
	@echo "   ~~\   Gemu/~~"

clean_files:
	- rm -v *.pdf *.glg *.glo *.gls *.ist *.log *.toc *.aux
