#
#        ~_
#     ~_ )_)~_
#     )_))_))_)
#     _!__!__!_
#   ~~\t  Gemu/~~
#
#  File Name: makefile
#  Purpose: Organize all GDD documents production
#  Creation Date: 15-12-20
#  Created By: Andrea Andreu Salvagnin
#

# Macro GEN_DOC
#Used to produece glossaries
#-s specify style
#-t specify where to log
#-o specify where to output
# $(1) document name
# $(2) latex compiler
# $(3) output directory
# $(4) wrapper_file
# $(5) dependencies
# Macro generate final pdf
define GEN_DOC
$(1).pdf: $(5)
	@echo "        \e[0;31m~\e[0m\e[1;33m_\e[0m"
	@echo "     \e[1;34m~\e[1;33m_ )_)\e[1;34m~\e[1;33m_\e[0m"
	@echo "     \e[1;33m)_))_))_) \e[1;36mMake $(1)\e[0m"
	@echo "     \e[1;34m_!__!__!_\e[1m"
	@echo "   \e[1;36m~~\e[1;34m\   \e[1;33mGemu\e[1;34m/\e[1;36m~~\e[0m"
	@echo "    \e[1;36m~\e[1;35mGEAR\e[1;36m~\e[1;35mGEAR\e[1;36m~\e[0m"
	$(2) --output-directory $(3) -jobname $(1) -draftmode $(4)
	makeindex $(3)$(1).glo -s $(3)$(1).ist -t $(3)$(1).glg -o $(3)$(1).gls
	$(2) --output-directory $(3) -jobname $(1) $(4)
	find -type f -wholename "$(3)$(1).pdf" -exec cp {} ./ \;
endef

# Macro DEP_RULE
# Genrate dependencies rules
# $(1) Dependent file
define DEP_RULE
$(1):
endef

# Macro WRAPPER2PDF
# From a .wrapper.tex get its .pdf
# $(1) Source file
define WRAPPER2PDF
$(patsubst %.wrapper.tex,%.pdf,$(1))
endef

# Macro WRAPPER2NAME
# From a .wrapper.tex get its document name
# $(1) Source file
define WRAPPER2NAME
$(notdir $(patsubst %.wrapper.tex,%,$(1)))
endef

# Macro WRAPPER2PATH
# From a .wrapper.tex get its path
# $(1) Source file
define WRAPPERPATH
$(patsubst %.wrapper.tex,%,$(1))
endef

# Macro GET_TEX_DEP
# Get dependencies of a tex file
# $(1) Test file name
define GET_TEX_DEP
$(if $(1),$(patsubst \input{%},%,$(shell grep "\input{" $(1))),)
endef



LATEX=pdflatex
PRJCT_NAME:=GDD_TEMPLATE

ALL_TEX_FILES:=$(shell find ./ -type f -iname *.tex)
ALL_WRAPPERS:=$(shell find ./ -type f -iname *.wrapper.tex)
ALL_PDF:=$(foreach file,$(ALL_WRAPPERS),$(PRJCT_NAME)_$(notdir $(call WRAPPER2PDF,$(file))))
ALL_DOC_NAME:=$(foreach file,$(notdir $(ALL_WRAPPERS)),$(call WRAPPER2NAME,$(file)))

.PHONY: make_docs

make_docs: $(ALL_PDF)
	$(call print_lodo)

# Generate and evaluate rules
$(foreach FILE,$(ALL_WRAPPERS),$(eval $(call GEN_DOC,$(PRJCT_NAME)_$(call WRAPPER2NAME,$(FILE)),$(LATEX),$(dir $(FILE)),$(FILE),$(call GET_TEX_DEP,$(FILE)))))

# Generate and evaluate rules
$(foreach FILE,$(ALL_TEX_FILES),$(eval $(call DEP_RULE,$(FILE))))

.PHONY: info
info:
	$(info $(call GET_TEX_DEP,))
	$(info $(ALL_TEX_FILES))

