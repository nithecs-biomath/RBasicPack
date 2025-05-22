[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/nithecs-biomath/RBasicPack/master?urlpath=rstudio)

# RBasicPack

RBasicPack is a minimal R package demonstrating the core steps of package development, including installation from GitHub, automatic testing, documentation, and cloud-based use via Binder.

---

## Installation

Install the development version directly from GitHub:

```r
# install.packages("devtools")
devtools::install_github("nithecs-biomath/RBasicPack")
```

## Quick Start

```r
library(RBasicPack)

# Default greeting
greeting1 <- hello()
#> "Hello, World!"

# Personalized greeting
greeting2 <- hello("Sandra")
#> "Hello, Sandra!"
```

## Functions

### `hello(name = "World")`

* **Description**: Returns a simple greeting.
* **Arguments**:

  * `name`: Character string. Name to greet. Default is `"World"`.
* **Value**: A character string of the form "Hello, `<name>`!".

## Testing & Continuous Integration

* Unit tests are written with **testthat** in `tests/testthat/`.
* GitHub Actions workflow runs `R CMD check` on Linux, macOS, and Windows for each push/PR. See the **Actions** tab for details.

## Binder (Optional)

Launch an interactive RStudio session in your browser without local setup:

[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/nithecs-biomath/RBasicPack/master?urlpath=rstudio)

Once in Binder, run:

```r
devtools::install_github("nithecs-biomath/RBasicPack")
library(RBasicPack)
hello()
```

## Contributing

Contributions are welcome:

1. Fork the repository
2. Create a branch: `git checkout -b feature/YourFeature`
3. Commit your changes: `git commit -m "Add feature"`
4. Push to GitHub: `git push origin feature/YourFeature`
5. Open a pull request

## License

MIT © Sandra MacFadyen

