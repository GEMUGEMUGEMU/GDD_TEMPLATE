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

include ./Utils/global_variables.makefile

#Folders
CNCPT=./Concept
TRGT=./Target
USP=./USP
MCHNCS=./Mechanics
DYNMCS=./Dynamics
AEST=./Aesthetics
GLSSRY=./Glossary
GDD=./GDD
MDA=./MDA
UTILS=./Utils

#Document components
CONC_COMP=$(CNCPT)/concept.tex
CONC_WRA=$(CNCPT)/concept_wrapper.tex
CONC_DOC_NAME=$(PRJCT_NAME)_Concept.pdf

TRGT_COMP=$(TRGT)/target.tex
TRGT_WRA=$(TRGT)/target_wrapper.tex
TRGT_DOC_NAME=$(PRJCT_NAME)_Target.pdf

USP_COMP=$(USP)/usp.tex
USP_WRA=$(USP)/usp_wrapper.tex
USP_DOC_NAME=$(PRJCT_NAME)_USP.pdf


MCHNCS_COMP=$(MCHNCS)/mechanics.tex
MCHNCS_WRA=$(MCHNCS)/mechanics_wrapper.tex
MCHNCS_DOC_NAME=$(PRJCT_NAME)_Mechanics.pdf

DYNMCS_COMP=$(DYNMCS)/dynamics.tex
DYNMCS_WAR=$(DYNMCS)/dynamics_wrapper.tex
DYNMCS_DOC_NAME=$(PRJCT_NAME)_Dynamics.pdf

EAST_COMP=$(AEST)/aesthetics.tex
EAST_WAR=$(AEST)/aesthetics_wrapper.tex
EAST_DOC_NAME=$(PRJCT_NAME)_Aesthetics.pdf

GLSSRY_COMP=$(GLSSRY)/glossary.tex
GLSSRY_WAR=$(GLSSRY)/glossary_wrapper.tex
GLSSRY_DOC_NAME=$(PRJCT_NAME)_Glossary.pdf

GDD_COMP=$(GDD)/GDD.tex
GDD_DOC_NAME=$(PRJCT_NAME)_GDD.pdf

MDA_COMP=$(MDA)/MDA.tex
MDA_DOC_NAME=$(PRJCT_NAME)_MDA.pdf


$(GDD)/$(GDD_DOC_NAME): $(GDD_COMP) $(CNCPT)/$(CONC_DOC_NAME) \
		$(TRGT)/$(TRGT_DOC_NAME) $(USP)/$(USP_DOC_NAME) \
		$(MDA)/$(MDA_DOC_NAME) $(GLSSRY)/$(GLSSRY_DOC_NAME)
	$(MAKE) make_doc FOLDER=$(GDD)
	find -type f -name "$(GDD_DOC_NAME)" -exec cp -n {} ./ \;

$(CNCPT)/$(CONC_DOC_NAME): $(CONC_COMP) $(CONC_WRA)
	$(MAKE) make_doc FOLDER=$(CNCPT)
	find -type f -name "$(CONC_DOC_NAME)" -exec cp -n {} ./ \;

$(TRGT)/$(TRGT_DOC_NAME): $(TRGT_COMP) $(TRGT_WRA)
	$(MAKE) make_doc FOLDER=$(TRGT)
	find -type f -name "$(TRGT_DOC_NAME)" -exec cp -n {} ./ \;

$(USP)/$(USP_DOC_NAME): $(USP_COMP) $(USP_WRA)
	$(MAKE) make_doc FOLDER=$(USP)
	find -type f -name "$(USP_DOC_NAME)" -exec cp -n {} ./ \;

$(GLSSRY)/$(GLSSRY_DOC_NAME): $(GLSSRY_COMP) $(GLSSRY_WAR)
	$(MAKE) make_doc FOLDER=$(GLSSRY)
	find -type f -name "*.pdf" -exec cp -n {} ./ \;

$(MDA)/$(MDA_DOC_NAME): $(MDA_COMP) $(MCHNCS)/$(MCHNCS_DOC_NAME) \
		$(DYNMCS)/$(DYNMCS_DOC_NAME) \
		$(AEST)/$(EAST_DOC_NAME)
	$(MAKE) make_doc FOLDER=$(MDA)
	find -type f -name "$(MDA_DOC_NAME)" -exec cp -n {} ./ \;

$(MCHNCS)/$(MCHNCS_DOC_NAME): $(MCHNCS_COMP) $(MCHNCS_WRA)
	$(MAKE) make_doc FOLDER=$(MCHNCS)
	find -type f -name "$(MCHNCS_DOC_NAME)" -exec cp -n {} ./ \;

$(DYNMCS)/$(DYNMCS_DOC_NAME): $(COMP_DYNMCS) $(DYNMCS_WAR)
	$(MAKE) make_doc FOLDER=$(DYNMCS)
	find -type f -name "*.pdf" -exec cp -n {} ./ \;

$(AEST)/$(EAST_DOC_NAME): $(EAST_COMP) $(EAST_COMP)
	$(MAKE) make_doc FOLDER=$(AEST)
	find -type f -name "*.pdf" -exec cp -n {} ./ \;


.PHONY: c_concept c_target c_usp c_mechanics c_dynamics c_aesthetics \
	c_glossary c_gdd c_mda

c_concept:
	$(MAKE) clean_doc FOLDER=$(CNCPT)

c_target:
	$(MAKE) clean_doc FOLDER=$(TRGT)

c_usp:
	$(MAKE) clean_doc FOLDER=$(USP)

c_mechanics:
	$(MAKE) clean_doc FOLDER=$(MCHNCS)

c_dynamics:
	$(MAKE) clean_doc FOLDER=$(DYNMCS)

c_aesthetics:
	$(MAKE) clean_doc FOLDER=$(AEST)

c_glossary:
	$(MAKE) clean_doc FOLDER=$(GLSSRY)

c_gdd:
	$(MAKE) clean_doc FOLDER=$(GDD)

c_mda:
	$(MAKE) clean_doc FOLDER=$(MDA)


.PHONY: make_doc clean_doc
make_doc:
	cd $(FOLDER) && $(MAKE)

clean_doc:
	cd $(FOLDER) && $(MAKE) clean

.PHONY: clean

clean: c_concept c_target c_usp c_mechanics c_dynamics c_aesthetics \
	c_glossary c_gdd c_mda
	- rm -v *.pdf


