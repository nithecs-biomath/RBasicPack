# install needed helper packages if you don’t have them
# install.packages(c("usethis","devtools","roxygen2","testthat"))
# (re)install from source so it’s built under your R version
install.packages("usethis", type = "source")

library(usethis)
library(devtools)

# 2.1 Create DESCRIPTION (fills in authors—you can adjust email, etc)
use_description(fields = list(
  Title       = "R Package Basics: a minimal example",
  Description = "A toy package to demonstrate GitHub, CI and Binder.",
  `Authors@R` = 'person("Sandra", "MacFadyen", email = "sandra.macfadyen@nithecs.ac.za", role = c("aut", "cre"))',
  License     = "MIT"
))

# 2.2 Initialize NAMESPACE
use_namespace()

# 2.3 Add a simple function
use_r("hello")   # creates R/hello.R

## --- edit R/hello.R to read: ---
## #' Say Hello
## #'
## #' @param name A character string: the name to greet.
## #' @return A greeting like "Hello, name!"
## #' @export
## hello <- function(name = "World") {
##   paste0("Hello, ", name, "!")
## }
## -------------------------------

# 2.4 Generate documentation and NAMESPACE
document()

# 2.5 Set up testing with testthat
use_testthat()
use_test("hello")  # creates tests/testthat/test-hello.R

## --- edit tests/testthat/test-hello.R to read: ---
## test_that("hello works", {
##   expect_equal(hello(),           "Hello, World!")
##   expect_equal(hello("Sandra"),   "Hello, Sandra!")
## })
## -------------------------------------------------------

# 2.6 Run tests locally to check
devtools::test()


## --- Enable GitHub Actions CI: ---
# adds .github/workflows/R-CMD-check.yaml
# use_github_action_check_standard() #>> deprecated in usethis 2.2.0
# instead of use_github_action_check_standard(), do
usethis::use_github_action(name = "check-standard")
## -------------------------------------------------------


## --- If you also want the badge inserted into your README, follow that up with: ---
usethis::use_github_actions_badge(name = "R-CMD-check.yaml")
## --- this will generate the Markdown badge you can commit into README.md ---
## -------------------------------------------------------

# ## --- Add a Binder badge for online RStudio
# ## --- In your repo root, create a file named runtime.txt containing:
# r-4.2
#
# ## --- Open README.md (or create it with usethis::use_readme_md()), and add at the top:
usethis::use_readme_md()
# [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/nithecs-biomath/R_package_basics/master?urlpath=rstudio)
#
# ## --- Also in README.md include:
# ## Installation
#
# ```r
# # install.packages("devtools")
# devtools::install_github("nithecs-biomath/R_package_basics")
# library(R_package_basics)
# hello("Sandra")
# ```
# ## -------------------------------------------------------

## --- Verify everything
## --- Locally:
devtools::install_github("nithecs-biomath/RBasicPack")
library(RBasicPack)
hello("World")
hello("NITheCS Repo")
## -------------------------------------------------------

## --- On GitHub:
## >> Check that CI passes under Actions.
## >> See your badges in README.
## -------------------------------------------------------

## --- In the cloud:
## >> Click the Binder badge in your README;
## >> it will spin up an RStudio instance with your package repo mounted.
## >> There you can run the same install_github() or even
## >> devtools::load_all() and see your function work without installing anything locally.
## -------------------------------------------------------


## --- When you’re done, you can Knit the document back to GitHub‐flavored Markdown
## --- via the Knit button or
rmarkdown::render("README.Rmd", output_format = "github_document")
## -------------------------------------------------------

## >> Add a docs/ site with pkgdown:
usethis::use_pkgdown()

## --- Scaffold the vignette template
## --- In your R console (or in an R script), run:
usethis::use_vignette("getting-started")
devtools::build_vignettes()
## -------------------------------------------------------

## --- Static hosting with pkgdown + GitHub Pages
## --- If you just want a nicer documentation site (still not executable):

## >> Build site with pkgdown:
# Install latest pkgdown if needed
install.packages("pkgdown")

# From the package root, in a fresh R session:
devtools::install()                       # installs RBasicPack
pkgdown::build_site(new_process = TRUE)   # builds docs in a new R process
## -------------------------------------------------------

# OR Manual install then build
# 1. Install the package
devtools::install()

# 2. (Optionally restart R to unload any dev version)
.rs.restartR()

# 3. Build the site
pkgdown::build_site()
## -------------------------------------------------------

## >> Enable GitHub Pages from the docs/ folder.
## >> Readers browse your functions and vignettes at https://nithecs-biomath.github.io/RBasicPack/.
