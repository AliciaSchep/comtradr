context("ct_commodities_table")

# All tests on the expected return data.
test_that("return has correct attributes, and fails when expected", {
  #skip_on_cran()
  #skip_on_travis()

  df <- ct_commodities_table(type = "HS")

  # Data type.
  expect_is(df, "data.frame")

  # Number of observations.
  expect_equal(nrow(df), 7916)

  # Col names and number of variables.
  expect_equal(colnames(df), c("code", "commodity", "parent"))

  # Number of unique values for variable "parent".
  expect_equal(length(unique(df$parent)), 1359)

  # Throw error with invalid input for param "type".
  expect_error(ct_commodities_table(type = "not_a_real_type"))
})
