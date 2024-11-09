test_that("rate_of_change returns expected value", {
  start_value <- 100
  end_value <- 200
  time_delta <- 31
  rate <- rate_of_change(start_value, end_value, time_delta)
  expect_equal(start_value * (1 + rate) ^ time_delta, end_value)
})
