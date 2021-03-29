R = Rscript

doc:
	$(R) -e 'devtools::document()'

readme:
	$(R) -e 'library(rmarkdown); render("README.Rmd", output_format = "github_document"); render("README_pt-br.Rmd", output_format = "github_document")'

check:
	$(R) -e 'devtools::check(); devtools::check_man();'

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