# siconfir

[README 🇧🇷](README_pt-br.md)

R package to access tax and accounting data of Brazilian states and municipalities provided by the Brazilian Public Sector Accounting and Tax Information System (SICONFI/[National Treasure](https://www.gov.br/tesouronacional/en?set_language=en))

This package is available for [**Python**](https://github.com/aspeddro/siconfipy)

## Installation

Install from [CRAN](https://cran.r-project.org/package=siconfir):

```r
install.packages("siconfir")
```

or the development version from GitHub:

```r
install.packages("remotes")
remotes::install_github("aspeddro/siconfir")
```

## Using

- [get_fiscal()](#get_fiscal): Fiscal management report
- [get_budget()](#get_budget): Budget execution summary report
- [get_annual_acc()](#get_annual_acc): Annual statement of accounts
- [msc_budget()](#msc_budget): Budget accounts, accounting balances matrix
- [msc_control()](#msc_control): Control accounts, accounting balances matrix
- [msc_equity()](#msc_equity): Equity accounts, accounting balances matrix
- [report_status()](#report_status): Report status
- [get_annex()](#get_annex): Attachments of reports by sphere of government
- [get_info()](#get_info): Basic information of the federation entities
- [find_cod()](#find_cod): Find state or municipality information

Datasets:

- [`br_cods`](#br_cods)

## Examples

```r
library(siconfir)
```

### get_fiscal()

Fiscal management report for the state of Sao Paulo (`35`) for the first four months of 2020:

```r
siconfir::get_fiscal(year = 2020, period = 1, cod = 35)
```

> `cod` is an id assigned to each city and state. See [IBGE, Cities and States](https://www.ibge.gov.br/en/cities-and-states.html?view=municipio), `find_cod()`, `get_info()` or `br_cods`

### get_budget()

Summary of the budget execution report for the state of Rio de Janeiro (`33`) of 2018 for the first two months:

```r
siconfir::get_budget(year = 2018, period = 1, cod = 33)
```

### get_annual_acc()

Declaration of annual accounts of the municipality of Sao Paulo (`3550308`) 2018:

```r
siconfir::get_annual_acc(year = 2018, cod = 3550308)
```

### msc_budget()

Budget accounts, accounting balances matrix:

```r
siconfir::msc_budget(year = 2020, month = 1, cod = 1, matrix_type = "MSCC", class = 5, value = "period_change")
```

### msc_control()

Control accounts, accounting balances matrix:

```r
siconfir::msc_control(year = 2020, month = 6, cod = 17, matrix_type = "MSCC", class = 7, value = "ending_balance")
```

### msc_equity()

Equity accounts, accounting balances matrix:

```r
siconfir::msc_equity(year = 2020, month = 12, cod = 1, matrix_type = "MSCE", class = 1, value = "beginning_balance") # cod = 1 is id of Brazil
```

### report_status()

Information on approved and corrected reports as well as matrices delivered to SICONFI:

```r
siconfir::report_status(year = 2020, cod = 43)
```
### get_annex()

Attachments of reports by sphere of government:

```r
siconfir::get_annex()
```

### get_info()

Acess basic information of the federation entities:

```r
siconfir::get_info()
```

### find_cod()

Find state or municipality information:

```r
siconfir::find_cod("distrito federal")
```

### br_cods

Basic information of Brazilian municipalities and states. `br_cods` provides results similar to `get_info()`, but with some corrections, see [`utils/build_datasets.R`](utils/build_datasets.R)

```r
siconfir::br_cods
```

## Resources

- [SICONFI API](http://apidatalake.tesouro.gov.br/docs/siconfi/)
- [Fiscal Statement Manual 9th Edition, National Treasure (pt-br)](https://conteudo.tesouro.gov.br/manuais/index.php?option=com_content&view=categories&id=560&Itemid=675)

## Contributing

Bugs or suggestions: open an [issue](https://github.com/aspeddro/siconfir/issues) detailing the problem/suggestion, be as reproducible as possible.

## License

This project is released under the MIT License.