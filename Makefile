R = Rscript

namespace:
	$(R) -e 'devtools::document()'

readme:
	$(R) -e 'library(rmarkdown); render("README.Rmd", output_format = "github_document"); render("README_pt-br.Rmd", output_format = "github_document")'

check:
	$(R) -e 'devtools::check()'

datasets:
	$(R) utils/build_datasets.R

install:
	$(R) -e 'devtools::install()'

remove:
	$(R) -e 'remove.packages("siconfir")'