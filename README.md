siconfir
================

[README 🇧🇷](README_pt-br.md)

R package to access tax and accounting data of Brazilian states and
municipalities provided by the Brazilian Public Sector Accounting and
Tax Information System (SICONFI/[National
Treasure](https://www.gov.br/tesouronacional/en?set_language=en))

This package is available for
[**Python**](https://github.com/pedrocastroo/siconfipy)

## Installation

``` r
# install.packages("devtools")
devtools::install_github("pedrocastroo/siconfir")
```

## Using

-   [get\_fiscal()](#get_fiscal): Fiscal management report
-   [get\_budget()](#get_budget): Budget execution summary report
-   [get\_annual\_acc()](#get_annual_acc): Annual statement of accounts
-   [msc\_budget()](#msc_budget): Budget accounts, accounting balances
    matrix
-   [msc\_control()](#msc_control): Control accounts, accounting
    balances matrix
-   [msc\_equity()](#msc_equity): Equity accounts, accounting balances
    matrix
-   [report\_status()](#report_status): Report status
-   [get\_annex()](#get_annex): Attachments of reports by sphere of
    government
-   [get\_info()](#get_info): Basic information of the federation
    entities
-   [find\_cod()](#find_cod): Find state or municipality information

Datasets:

-   [`br_cods`](#br_cods)

## Examples

``` r
library(siconfir)
```

### get\_fiscal()

Fiscal management report for the state of Sao Paulo (`35`) for the first
four months of 2020:

``` r
siconfir::get_fiscal(year = 2020, period = 1, cod = 35)
```

    ## # A tibble: 1,052 x 14
    ##    exercicio periodo periodicidade instituicao cod_ibge uf    co_poder populacao
    ##        <int>   <int> <chr>         <chr>          <int> <chr> <chr>        <int>
    ##  1      2020       1 Q             Governo do…       35 SP    E         45919049
    ##  2      2020       1 Q             Governo do…       35 SP    E         45919049
    ##  3      2020       1 Q             Governo do…       35 SP    E         45919049
    ##  4      2020       1 Q             Governo do…       35 SP    E         45919049
    ##  5      2020       1 Q             Governo do…       35 SP    E         45919049
    ##  6      2020       1 Q             Governo do…       35 SP    E         45919049
    ##  7      2020       1 Q             Governo do…       35 SP    E         45919049
    ##  8      2020       1 Q             Governo do…       35 SP    E         45919049
    ##  9      2020       1 Q             Governo do…       35 SP    E         45919049
    ## 10      2020       1 Q             Governo do…       35 SP    E         45919049
    ## # … with 1,042 more rows, and 6 more variables: anexo <chr>,
    ## #   rotulo <chr>, coluna <chr>, cod_conta <chr>, conta <chr>,
    ## #   valor <dbl>

> `cod` is an id assigned to each city and state. See [IBGE, Cities and
> States](https://www.ibge.gov.br/en/cities-and-states.html?view=municipio),
> `find_cod()`, `get_info()` or `br_cods`

### get\_budget()

Summary of the budget execution report for the state of Rio de Janeiro
(`33`) of 2018 for the first two months:

``` r
siconfir::get_budget(year = 2018, period = 1, cod = 33)
```

    ## # A tibble: 3,309 x 14
    ##    exercicio demonstrativo periodo periodicidade instituicao      cod_ibge uf   
    ##        <int> <chr>           <int> <chr>         <chr>               <int> <chr>
    ##  1      2018 RREO                1 B             Governo do Esta…       33 RJ   
    ##  2      2018 RREO                1 B             Governo do Esta…       33 RJ   
    ##  3      2018 RREO                1 B             Governo do Esta…       33 RJ   
    ##  4      2018 RREO                1 B             Governo do Esta…       33 RJ   
    ##  5      2018 RREO                1 B             Governo do Esta…       33 RJ   
    ##  6      2018 RREO                1 B             Governo do Esta…       33 RJ   
    ##  7      2018 RREO                1 B             Governo do Esta…       33 RJ   
    ##  8      2018 RREO                1 B             Governo do Esta…       33 RJ   
    ##  9      2018 RREO                1 B             Governo do Esta…       33 RJ   
    ## 10      2018 RREO                1 B             Governo do Esta…       33 RJ   
    ## # … with 3,299 more rows, and 7 more variables: populacao <int>,
    ## #   anexo <chr>, rotulo <chr>, coluna <chr>, cod_conta <chr>,
    ## #   conta <chr>, valor <dbl>

### get\_annual\_acc()

Declaration of annual accounts of the municipality of Sao Paulo
(`3550308`) 2018:

``` r
siconfir::get_annual_acc(year = 2018, cod = 3550308)
```

    ## # A tibble: 3,714 x 11
    ##    exercicio instituicao   cod_ibge uf    anexo rotulo coluna cod_conta conta   
    ##        <int> <chr>            <int> <chr> <chr> <chr>  <chr>  <chr>     <chr>   
    ##  1      2018 Prefeitura M…  3550308 SP    DCA-… Padrão 31/12… P1.0.0.0… 1.0.0.0…
    ##  2      2018 Prefeitura M…  3550308 SP    DCA-… Padrão 31/12… P1.1.0.0… 1.1.0.0…
    ##  3      2018 Prefeitura M…  3550308 SP    DCA-… Padrão 31/12… P1.1.1.0… 1.1.1.0…
    ##  4      2018 Prefeitura M…  3550308 SP    DCA-… Padrão 31/12… P1.1.1.1… 1.1.1.1…
    ##  5      2018 Prefeitura M…  3550308 SP    DCA-… Padrão 31/12… P1.1.1.1… 1.1.1.1…
    ##  6      2018 Prefeitura M…  3550308 SP    DCA-… Padrão 31/12… P1.1.1.1… 1.1.1.1…
    ##  7      2018 Prefeitura M…  3550308 SP    DCA-… Padrão 31/12… P1.1.1.2… 1.1.1.2…
    ##  8      2018 Prefeitura M…  3550308 SP    DCA-… Padrão 31/12… P1.1.1.2… 1.1.1.2…
    ##  9      2018 Prefeitura M…  3550308 SP    DCA-… Padrão 31/12… P1.1.2.0… 1.1.2.0…
    ## 10      2018 Prefeitura M…  3550308 SP    DCA-… Padrão 31/12… P1.1.2.1… 1.1.2.1…
    ## # … with 3,704 more rows, and 2 more variables: valor <dbl>,
    ## #   populacao <int>

### msc\_budget()

Budget accounts, accounting balances matrix:

``` r
siconfir::msc_budget(year = 2020, month = 1, cod = 1, matrix_type = "MSCC", class = 5, value = "period_change")
```

    ## # A tibble: 21,884 x 20
    ##    tipo_matriz cod_ibge classe_conta conta_contabil poder_orgao ano_fonte_recur…
    ##    <chr>          <int>        <int> <chr>          <chr>                  <int>
    ##  1 MSCC               1            5 522220101      10101                      1
    ##  2 MSCC               1            5 522220101      10101                      1
    ##  3 MSCC               1            5 522220101      10101                      1
    ##  4 MSCC               1            5 522220101      10101                      1
    ##  5 MSCC               1            5 522220101      10101                      1
    ##  6 MSCC               1            5 522220101      10101                      1
    ##  7 MSCC               1            5 522220101      10101                      1
    ##  8 MSCC               1            5 522220101      10101                      1
    ##  9 MSCC               1            5 522220101      10101                      1
    ## 10 MSCC               1            5 522220101      10101                      1
    ## # … with 21,874 more rows, and 14 more variables: fonte_recursos <chr>,
    ## #   funcao <chr>, subfuncao <chr>, exercicio <int>,
    ## #   mes_referencia <int>, data_referencia <chr>, entrada_msc <int>,
    ## #   natureza_despesa <chr>, valor <dbl>, natureza_conta <chr>,
    ## #   tipo_valor <chr>, educacao_saude <chr>, ano_inscricao <int>,
    ## #   natureza_receita <chr>

### msc\_control()

Control accounts, accounting balances matrix:

``` r
siconfir::msc_control(year = 2020, month = 6, cod = 17, matrix_type = "MSCC", class = 7, value = "ending_balance")
```

    ## # A tibble: 113 x 14
    ##    tipo_matriz cod_ibge classe_conta conta_contabil poder_orgao exercicio
    ##    <chr>          <int>        <int> <chr>          <chr>           <int>
    ##  1 MSCC              17            7 712210100      10111            2020
    ##  2 MSCC              17            7 722900000      60611            2020
    ##  3 MSCC              17            7 712310200      30390            2020
    ##  4 MSCC              17            7 712310300      10111            2020
    ##  5 MSCC              17            7 722129900      30390            2020
    ##  6 MSCC              17            7 712310200      60611            2020
    ##  7 MSCC              17            7 712310100      30390            2020
    ##  8 MSCC              17            7 712310200      20211            2020
    ##  9 MSCC              17            7 722129900      10111            2020
    ## 10 MSCC              17            7 712310100      10111            2020
    ## # … with 103 more rows, and 8 more variables: mes_referencia <int>,
    ## #   data_referencia <chr>, entrada_msc <int>, valor <dbl>,
    ## #   natureza_conta <chr>, tipo_valor <chr>, ano_fonte_recursos <int>,
    ## #   fonte_recursos <chr>

### msc\_equity()

Equity accounts, accounting balances matrix:

``` r
siconfir::msc_equity(year = 2020, month = 12, cod = 1, matrix_type = "MSCE", class = 1, value = "beginning_balance") # cod = 1 is id of Brazil
```

    ## # A tibble: 3,721 x 15
    ##    tipo_matriz cod_ibge classe_conta conta_contabil poder_orgao financeiro_perm…
    ##    <chr>          <int>        <int> <chr>          <chr>                  <int>
    ##  1 MSCE               1            1 111110100      10101                      1
    ##  2 MSCE               1            1 111110100      10101                      1
    ##  3 MSCE               1            1 111110200      10101                      1
    ##  4 MSCE               1            1 111110200      10101                      1
    ##  5 MSCE               1            1 111110200      10101                      1
    ##  6 MSCE               1            1 111110200      10101                      1
    ##  7 MSCE               1            1 111110200      10101                      1
    ##  8 MSCE               1            1 111110200      10101                      1
    ##  9 MSCE               1            1 111110200      10101                      1
    ## 10 MSCE               1            1 111110200      10101                      1
    ## # … with 3,711 more rows, and 9 more variables:
    ## #   ano_fonte_recursos <int>, fonte_recursos <chr>, exercicio <int>,
    ## #   mes_referencia <int>, data_referencia <chr>, entrada_msc <int>,
    ## #   valor <dbl>, natureza_conta <chr>, tipo_valor <chr>

### report\_status()

Information on approved and corrected reports as well as matrices
delivered to SICONFI:

``` r
siconfir::report_status(year = 2020, cod = 43)
```

    ## # A tibble: 118 x 11
    ##    exercicio cod_ibge populacao instituicao     entregavel periodo periodicidade
    ##        <int>    <int>     <int> <chr>           <chr>        <int> <chr>        
    ##  1      2020       43  11377239 Assembleia Leg… MSC Agreg…       1 M            
    ##  2      2020       43  11377239 Assembleia Leg… MSC Agreg…       2 M            
    ##  3      2020       43  11377239 Assembleia Leg… MSC Agreg…       3 M            
    ##  4      2020       43  11377239 Assembleia Leg… MSC Agreg…       4 M            
    ##  5      2020       43  11377239 Assembleia Leg… MSC Agreg…       5 M            
    ##  6      2020       43  11377239 Assembleia Leg… MSC Agreg…       6 M            
    ##  7      2020       43  11377239 Assembleia Leg… MSC Agreg…       7 M            
    ##  8      2020       43  11377239 Assembleia Leg… MSC Agreg…       8 M            
    ##  9      2020       43  11377239 Assembleia Leg… MSC Agreg…       9 M            
    ## 10      2020       43  11377239 Assembleia Leg… MSC Agreg…      10 M            
    ## # … with 108 more rows, and 4 more variables: data_status <chr>,
    ## #   forma_envio <chr>, status_relatorio <chr>, tipo_relatorio <chr>

### get\_annex()

Attachments of reports by sphere of government:

``` r
siconfir::get_annex()
```

    ## # A tibble: 161 x 3
    ##    esfera demonstrativo anexo         
    ##    <chr>  <chr>         <chr>         
    ##  1 E      DCA           Anexo I-AB    
    ##  2 E      DCA           Anexo I-C     
    ##  3 E      DCA           Anexo I-D     
    ##  4 E      DCA           Anexo I-E     
    ##  5 E      DCA           Anexo I-F     
    ##  6 E      DCA           Anexo I-G     
    ##  7 E      DCA           Anexo I-HI    
    ##  8 E      DCA           DCA-Anexo I-AB
    ##  9 E      DCA           DCA-Anexo I-C 
    ## 10 E      DCA           DCA-Anexo I-D 
    ## # … with 151 more rows

### get\_info()

Acess basic information of the federation entities:

``` r
siconfir::get_info()
```

    ## # A tibble: 5,597 x 9
    ##    cod_ibge ente         capital regiao uf    esfera exercicio populacao cnpj   
    ##       <int> <chr>        <chr>   <chr>  <chr> <chr>      <int>     <int> <chr>  
    ##  1  1718659 Rio da Conc… "0  "   CO     TO    M           2021      2171 332625…
    ##  2  1718709 Rio dos Bois "0  "   CO     TO    M           2021      2856 374209…
    ##  3  1718758 Rio Sono     "0  "   CO     TO    M           2021      6488 000007…
    ##  4  1718808 Sampaio      "0  "   CO     TO    M           2021      4794 250868…
    ##  5  1718840 Sandolândia  "0  "   CO     TO    M           2021      3373 373443…
    ##  6  1718865 Santa Fé do… "0  "   CO     TO    M           2021      7595 250639…
    ##  7  1718881 Santa Maria… "0  "   CO     TO    M           2021      3486 374210…
    ##  8  1718899 Santa Rita … "0  "   CO     TO    M           2021      2386 016131…
    ##  9  1718907 Santa Rosa … "0  "   CO     TO    M           2021      4846 248515…
    ## 10  1719004 Santa Terez… "0  "   CO     TO    M           2021      2897 250868…
    ## # … with 5,587 more rows

### find\_cod()

Find state or municipality information:

``` r
siconfir::find_cod("distrito federal")
```

    ## # A tibble: 1 x 9
    ##   cod_ibge ente        capital regiao uf    esfera exercicio populacao cnpj     
    ##      <int> <chr>         <dbl> <chr>  <chr> <chr>      <int>     <int> <chr>    
    ## 1       53 Distrito F…       0 CO     BR    D           2021   3055149 00394601…

### br\_cods

Basic information of Brazilian municipalities and states. `br_cods`
provides results similar to `get_info()`, but with some corrections, see
[`utils/build_datasets.R`](utils/build_datasets.R)

``` r
siconfir::br_cods
```

    ## # A tibble: 5,597 x 9
    ##    cod_ibge ente         capital regiao uf    esfera exercicio populacao cnpj   
    ##       <int> <chr>          <dbl> <chr>  <chr> <chr>      <int>     <int> <chr>  
    ##  1  1718659 Rio da Conc…       0 NO     TO    M           2021      2171 332625…
    ##  2  1718709 Rio dos Bois       0 NO     TO    M           2021      2856 374209…
    ##  3  1718758 Rio Sono           0 NO     TO    M           2021      6488 000007…
    ##  4  1718808 Sampaio            0 NO     TO    M           2021      4794 250868…
    ##  5  1718840 Sandolândia        0 NO     TO    M           2021      3373 373443…
    ##  6  1718865 Santa Fé do…       0 NO     TO    M           2021      7595 250639…
    ##  7  1718881 Santa Maria…       0 NO     TO    M           2021      3486 374210…
    ##  8  1718899 Santa Rita …       0 NO     TO    M           2021      2386 016131…
    ##  9  1718907 Santa Rosa …       0 NO     TO    M           2021      4846 248515…
    ## 10  1719004 Santa Terez…       0 NO     TO    M           2021      2897 250868…
    ## # … with 5,587 more rows

## Resources

-   [Fiscal Statement Manual 9th Edition, National Treasure
    (pt-br)](https://conteudo.tesouro.gov.br/manuais/index.php?option=com_content&view=categories&id=560&Itemid=675)

## Contributing

Bugs or suggestions: open an
[issue](https://github.com/pedrocastroo/siconfir/issues) detailing the
problem/suggestion, be as reproducible as possible.

## License

This project is released under the MIT License.
