# Declare phony targets
.PHONY: help build refgen

# Default target
.DEFAULT_GOAL := help

# HELP Target
help:
	@cat ./docbuilder/general_help.md


help_refgen:
	@cat ./docbuilder/refgen_help.md


# BUILDALL Target
buildall:
	@echo "Building all sources in all formats..."


# BUILD Target
#
# This is in the form build_$SOURCE_$TARGET
# Pattern rule for 'build_*_*' targets
build_%:
	#SOURCE=
	@echo "build"
	@echo "cuvant1: $(word 1, $(subst _, ,$@))"
	@echo "cuvant2: $(word 2, $(subst _, ,$@))"
	@echo "cuvant3: $(word 3, $(subst _, ,$@))"
	@echo "cuvant4: $(word 4, $(subst _, ,$@))"


#refgen:
#	@echo "refgen: no arguments provided but is ok"

# REFGEN Target
# This will generate reference style sheet
refgen_%:
	@DESTINATION=$(word 2, $(subst _, ,$@)); \
	REFSTYLE=$(word 3, $(subst _, ,$@)); \
	bash ./docbuilder/generate_refstyle.sh $$DESTINATION $$REFSTYLE

#	@echo "refgen"
#	@echo "source: $(word 2, $(subst _, ,$@))"
#	@echo "target: $(word 3, $(subst _, ,$@))"