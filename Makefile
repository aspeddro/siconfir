R = Rscript

namespace:
	$(R) -e 'devtools::document()'

readme:
	$(R) -e 'library(rmarkdown); render("README.Rmd", output_format = "github_document")'
	rm README.html

check:
	$(R) -e 'devtools::check()'

datasets:
	$(R) utils/build_dataset.R

install:
	$(R) -e 'devtools::document()'
	$(R) -e 'devtools::install()'

remove:
	$(R) -e 'remove.packages("siconfir")'