# load the source code of the functions to be tested
source("../functions/range-value.R")


# context with one test that groups expectations
context("Test for range value") 


test_that("range value for numeric vectors", {
  x <- c(1, 2, 3, 4, 5)
  
  expect_equal(range_value(x, T), 4)
  expect_length(range_value(x, T), 1)
  expect_type(range_value(x, T), 'double')
})


test_that("range value for numeric vectors with NAs", {
  y <- c(1, 2, 3, 4, NA)
  
  expect_equal(range_value(y, T), 3)
  expect_length(range_value(y, T), 1)
})


test_that("range value for logical vectors", {
  z <- c(TRUE, FALSE, TRUE)
  
  expect_equal(range_value(z, T), 1L)
  expect_length(range_value(z, T), 1)
  expect_type(range_value(z, T), 'integer')
})


test_that("range value stops for character vectors", {
  w <- letters[1:5]
  
  expect_error(range_value(w, T))
})
