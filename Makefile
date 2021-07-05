R = R
.PHONY: tests

doc:
	$(R) -e -q 'devtools::document()'

readme:
	$(R) -e -q 'library(rmarkdown); rmarkdown::render("README.Rmd", output_format = "github_document"); rmarkdown::render("README_pt-br.Rmd", output_format = "github_document")'

check:
	$(R) -e -q 'devtools::check(run_dont_test = FALSE, error_on = c("error")); devtools::check_man();'

tests:
	$(R) -e -q 'devtools::test()'

datasets:
	Rscript utils/build_datasets.R

build:
	$(R) -e -q 'devtools::build(path = ".")'

install:
	$(R) -e -q 'devtools::install()'

remove:
	$(R) -e -q 'remove.packages("siconfir")'

release:
	$(R) -e -q 'devtools::release(check = TRUE)'