## --- edit tests/testthat/test-hello.R to read: ---
## test_that("hello works", {
##   expect_equal(hello(),           "Hello, World!")
##   expect_equal(hello("Sandra"),   "Hello, Sandra!")
## })
## -------------------------------------------------------

test_that("hello works", {
  expect_equal(hello(),           "Hello, World!")
  expect_equal(hello("Sandra"),   "Hello, Sandra!")
})
