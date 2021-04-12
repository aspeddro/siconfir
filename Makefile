R = Rscript

doc:
	$(R) -e 'devtools::document()'

readme:
	$(R) -e 'library(rmarkdown); rmarkdown::render("README.Rmd", output_format = "github_document"); rmarkdown::render("README_pt-br.Rmd", output_format = "github_document")'

check:
	$(R) -e 'devtools::check(run_dont_test = TRUE, error_on = c("error")); devtools::check_man(); devtools::check_rhub();'

datasets:
	$(R) utils/build_datasets.R

build:
	$(R) -e 'devtools::build(path = ".")'

install:
	$(R) -e 'devtools::install()'

remove:
	$(R) -e 'remove.packages("siconfir")'

release:
	$(R) -e 'devtools::release()'