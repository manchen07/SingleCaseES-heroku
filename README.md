[![Travis-CI Build
Status](https://travis-ci.org/jepusto/SingleCaseES.svg?branch=master)](https://travis-ci.org/jepusto/SingleCaseES)
[![Coverage
Status](https://img.shields.io/codecov/c/github/jepusto/SingleCaseES/master.svg)](https://codecov.io/github/jepusto/SingleCaseES?branch=master)
[![](http://www.r-pkg.org/badges/version/SingleCaseES)](https://CRAN.R-project.org/package=SingleCaseES)

SingleCaseES: A calculator for single-case effect size indices
==============================================================

This package provides R functions for calculating basic effect size
indices for single-case designs, including several non-overlap measures
and parametric effect size measures, and for estimating the gradual
effects model developed by [Swan and Pustejovsky
(2018)](https://doi.org/10.1080/00273171.2018.1466681). Standard errors
and confidence intervals are provided for the subset of effect sizes
indices with known sampling distributions. However, it is important to
note that all of the standard errors and confidence intervals are based
on the assumption that the outcome measurements are mutually
independent.

The available **non-overlap indices** are:

-   Percentage of non-overlapping data (PND)
-   Percentage of all non-overlapping data (PAND)
-   Robust improvement rate difference (IRD)
-   Percentage exceeding the median (PEM)
-   Non-overlap of all pairs (NAP)
-   Tau non-overlap (Tau)
-   Tau-U (including baseline trend adjustment)

The available **parametric effect sizes** are:

-   Within-case standardized mean difference
-   Log response ratio (decreasing and increasing)
-   Log odds ratio
-   The gradual effects model, which can be used to estimate log
    response ratios or log odds ratios in the presence of time trends
    during treatment and return-to-baseline phases.

The package also includes two graphical user interfaces (designed using
[Shiny](https://shiny.rstudio.com/)) for interactive use, both of which
are also available as web apps hosted through
[shinyapps.io](https://www.shinyapps.io/):

-   `SCD_effect_sizes()` opens an interactive calculator for the basic
    non-overlap indices and parametric effect sizes. It is also
    available at <https://jepusto.shinyapps.io/SCD-effect-sizes>
-   `shine_gem_scd()` opens an interactive calculator for the gradual
    effects model. It is also available at
    <https://jepusto.shinyapps.io/gem-scd>

***Please note that the web apps should only be used for demonstration
purposes***. For research purposes, please install the R package and run
the GUI through Rstudio.

Installation
============

The package is currently only available on Github. To install it, you
will first need to [install R](http://cran.r-project.org/) and
[RStudio](http://www.rstudio.com/products/rstudio/download/). Windows
users will also need to [install
Rtools](http://cran.r-project.org/bin/windows/Rtools/). All of these
programs are freely availble.

Once you have these programs installed, run the following commands at
the RStudio console prompt:

``` r
install.packages("devtools")
install.packages("sourcetools")
install.packages("shiny")
install.packages("markdown")
install.packages("ggplot2")
devtools::install_github("jepusto/SingleCaseES")
```

Basic usage
===========

After installing the package, you are ready to begin using it. Every
time you open a fresh R/RStudio session, you will need to start by
loading the package functionality as follows:

``` r
library(SingleCaseES)
```

The functions for calculating the non-overlap indices and parametric
effect size estimates all have the same basic structure. Each function
takes two inputs: a vector of outcome values for the baseline phase and
a vector of outcome values for the treatment phase. For example, the
following code creates an object `A` containing outcomes from a baseline
phase an an object `B` containing outcomes from a treatment phase:

``` r
A <- c(20, 20, 26, 25, 22, 23)
B <- c(28, 25, 24, 27, 30, 30, 29)
```

NAP
---

After inputing the data, non-overlap of all pairs can be calculated as
follows:

``` r
NAP(A, B, improvement = "increase")
```

    ##    ES       Est         SE  CI_lower  CI_upper
    ## 1 NAP 0.9166667 0.06900656 0.5973406 0.9860176

Because formulas are available for NAP, the function reports the
standard error and confidence interval in addition to the point estimate
of NAP. Note that these formulas assume that the outcome measurements
are mutually independent. In the presence of positive auto-correlation,
they may under-estimate the true sampling variability of NAP.

The `NAP` function assumes that increases in the value of the outcome
represent therapeutic improvements. For outcomes where decrease is
therapeutically desirable, set the optional argument `improvement` to
`"decrease"`:

``` r
NAP(A, B, improvement = "decrease")
```

    ##    ES        Est         SE   CI_lower  CI_upper
    ## 1 NAP 0.08333333 0.06900656 0.01398242 0.4026594

Type `?NAP` at the console prompt for further information about the
available options for NAP.

Other non-overlap indices
-------------------------

Other effect size calculation functions work very similarly. For
example, the robust improvement rate difference can be calculated as
follows:

``` r
IRD(A, B, improvement = "increase")
```

    ##    ES       Est
    ## 1 IRD 0.6904762

Note that only a point estimate is returned because (to the author’s
knowledge) there are not available methods for estimating the standard
error or confidence interval of IRD.

Parametric effect size indices
------------------------------

The function for calculating the within-case standardized mean
difference has similar arguments to the non-overlap indices:

``` r
SMD(A, B)
```

    ##    ES      Est        SE  CI_lower CI_upper
    ## 1 SMD 1.703734 0.6370139 0.4552097 2.952258

By default, the estimate is calculated using the standard deviation of
the baseline phase data only. To use the standard deviation pooled
across both phases, set the `std_dev` option to `"pool"`:

``` r
SMD(A, B, std_dev = "pool")
```

    ##    ES      Est        SE  CI_lower CI_upper
    ## 1 SMD 1.703734 0.6370139 0.4552097 2.952258

By default, the estimate is calculated using the small-sample correction
proposed by Hedges (1981) and often referred to as “Hedges’ *g*.” The
standard error and approximate confidence interval for the standardized
mean difference estimate are based on the assumption that the outcome
measurements are mutually independent.

The package can also calculate both versions of the log response ratio.
The log response ratio-increasing (LRRi) is defined so that therapeutic
improvements correspond to positive values. It can be calculated as
follows:

``` r
LRRi(A, B, scale = "count")
```

    ##     ES       Est         SE   CI_lower  CI_upper
    ## 1 LRRi 0.1953962 0.05557723 0.08646679 0.3043255

The log response ratio-decreasing (LRRd) is defined so that therapeutic
improvements correspond to negative values. The outcome data in the
example is defined so that increases are therapeutic improvements, so we
will need to specify the direction of improvement:

``` r
LRRd(A, B, scale = "count", improvement = "increase")
```

    ##     ES        Est         SE   CI_lower    CI_upper
    ## 1 LRRd -0.1953962 0.05557723 -0.3043255 -0.08646679

In this case, the LRRi and LRRd estimates have the same magnitude but
opposite sign. This will be true for outcomes measured as frequency
counts or rates. For outcomes measured as percentages or proportions,
LRRd and LRRi will differ in both sign and magnitude. See Pustejovsky
(2018) for further details and recommendations about how to choose
between LRRi and LRRd.

By default, the LRRi and LRRd estimates are calculated using a
small-sample correction proposed by Pustejovsky (2015). See `?LRR` for
further details. The standard error and approximate confidence interval
for the log response ratio estimate are based on the assumption that the
outcome measurements are mutually independent.

Multiple effect sizes for a single series
-----------------------------------------

The `calc_ES()` function can be used to calculate multiple effect size
indices for a single series with A and B phases:

``` r
calc_ES(A, B, ES = c("LRRd","LRRi","SMD","NAP"), improvement = "increase")
```

    ##     ES        Est         SE    CI_lower    CI_upper
    ## 1 LRRd -0.1953962 0.05557723 -0.30432554 -0.08646679
    ## 2 LRRi  0.1953962 0.05557723  0.08646679  0.30432554
    ## 3  SMD  1.7037340 0.63701390  0.45520971  2.95225831
    ## 4  NAP  0.9166667 0.06900656  0.59734061  0.98601758

Any optional arguments supplied are applied to the effect sizes for
which they are relevant.

Graphical user interface
------------------------

To use the graphical user interface for basic effect sizes, you must
first ensure that the `SingleCaseES` package is installed (following the
directions above). To start the calculator, type the following commands
at the RStudio console prompt:

``` r
library(SingleCaseES)
SCD_effect_sizes()
```

The calculator should then open in your default web browser.

To exit the calculator, close the window in which it appears and click
the red “Stop” icon in the upper right-hand corner of the RStudio
console window.

Gradual effects model
=====================

Graphical user interface
------------------------

To use the graphical user interface for the gradual effects model, type
the following commands at the RStudio console prompt:

``` r
library(SingleCaseES)
shine_gem_scd()
```

The calculator should then open in your default web browser.

To exit the calculator, close the window in which it appears and click
the red “Stop” icon in the upper right-hand corner of the RStudio
console window.

Citations
=========

Please cite this R package as follows:

> Pustejovsky, J. E. & Swan, D. M. (2017). SingleCaseES: A calculator
> for single-case effect size indices. R package version 0.3. Retrieved
> from <https://github.com/jepusto/SingleCaseES>

Please cite the web applications as follows:

> Pustejovsky, J. E. (2017). Single-case effect size calculator (Version
> 0.3.0) \[Web application\]. Retrieved from
> <https://jepusto.shinyapps.io/SCD-effect-sizes>

> Swan, D. M. & Pustejovsky, J. E. (2017). gem\_scd: A web-based
> calculator for the Gradual Effects Model (Version 0.1.0) \[Web
> application\]. Retrieved from: <https://jepusto.shinyapps.io/gem-scd>
