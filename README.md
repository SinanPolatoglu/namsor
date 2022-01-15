
<!-- README.md is generated from README.Rmd. Please edit that file -->

# namsor

<!-- badges: start -->
<!-- badges: end -->

The goal of `namsor` is to provide some functionality to use some
endpoints for namsor’s name checking API service. One can use this to
for retrieve best estimations for a name’s gender and/or ethnicity.

## Installation

You can install the development version of `namsor` like so:

``` r
require(remotes)
remotes::install_github('SinanPolatoglu/namsor')
```

## Usage

Obtain an API key via namsor.com

``` r
library(namsor)

## SET API KEY
# Sys.setenv(NAMSOR_API_KEY='your api key')
```

Supported endpoints currently are

-   `namsor_gender`
-   `namsor_origin`
-   `namsor_country`
-   `namsor_diaspora`

Result in case of a succesful call will be as list with the retrieved
output. For example:

``` r
str(namsor_origin('Sinan', 'Polatoglu'))
#> List of 13
#>  $ script                  : chr "LATIN"
#>  $ id                      : chr "00990bbd-391b-43df-bb65-97b7a1d5e605"
#>  $ firstName               : chr "Sinan"
#>  $ lastName                : chr "Polatoglu"
#>  $ countryOrigin           : chr "TR"
#>  $ countryOriginAlt        : chr "AZ"
#>  $ countriesOriginTop      :List of 10
#>   ..$ : chr "TR"
#>   ..$ : chr "AZ"
#>   ..$ : chr "ID"
#>   ..$ : chr "RO"
#>   ..$ : chr "BD"
#>   ..$ : chr "LK"
#>   ..$ : chr "IL"
#>   ..$ : chr "MU"
#>   ..$ : chr "IR"
#>   ..$ : chr "KH"
#>  $ score                   : num 33.7
#>  $ regionOrigin            : chr "Asia"
#>  $ topRegionOrigin         : chr "Asia"
#>  $ subRegionOrigin         : chr "Western Asia"
#>  $ probabilityCalibrated   : num 0.968
#>  $ probabilityAltCalibrated: num 0.99
```
