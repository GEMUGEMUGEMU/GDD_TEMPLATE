#
#        ~_
#     ~_ )_)~_
#     )_))_))_)
#     _!__!__!_
#   ~~\t  Gemu/~~
#
#  File Name: makefile
#  Purpose: make Mechanics document
#  Creation Date: 15-12-20
#  Created By: Andrea Andreu Salvagnin
#

include ../Utils/global_variables.makefile

#Final name of the concept document
DOC_NAME=$(PRJCT_NAME)_Mechanics

WRAPPER_FILE=mechanics_wrapper.tex
CONTENT_FILE=mechanics.tex

DOCUMENT_COMPONENTS=$(WRAPPER_FILE) $(CONTENT_FILE)


$(DOC_NAME).pdf: $(DOCUMENT_COMPONENTS)
	$(MAKE) print_logo ACTION=BUILD_MECHANICS
	$(MAKE) pdf_build
	$(MAKE) print_logo ACTION=BUILDING_GLOSSARY
	$(MAKE) glss_build
	$(MAKE) print_logo ACTION=PUTTING_GLOSSARY
# Putting glossary also put table of contents implicitly
	$(MAKE) pdf_build


.PHONY: clean
clean:
	$(MAKE) print_logo ACTION=CLEAN_MECHANICS
	$(MAKE) clean_files

include ../Utils/makefile
