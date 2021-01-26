RSCRIPT ?= Rscript
R = $(RSCRIPT) --slave

.PHONY: all

R_FILES := $(shell find R/)

NAMESPACE: $(R_FILES)
	$(R) -e 'devtools::document()'

README:
	$(R) -e 'library(rmarkdown); render("README.Rmd", output_format = "github_document")'
	rm README.html

datasets:
	$(R) utils/build_dataset.R

install:
	$(R) -e 'devtools::document()'
	$(R) -e 'devtools::install()'