test_that("months_until returns expected values", {
  expect_equal(months_until(Sys.Date() + lubridate::years(1)), 12)
  expect_equal(months_until(Sys.Date() + lubridate::years(25)), 300)
})
