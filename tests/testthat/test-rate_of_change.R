test_that("rate_of_change returns expected value", {
  start_value <- 100
  end_value <- 200
  time_delta <- 31
  rate <- rate_of_change(start_value, end_value, time_delta)
  expect_equal(start_value * (1 + rate) ^ time_delta, end_value)
})

test_that('rate_of_change does not allow division by zero in start_value', {
  expect_error(rate_of_change(0, 200, 31), 'Start value cannot be zero.')
})

test_that('rate_of_change does not allow division by zero in time_delta', {
  expect_error(rate_of_change(100, 200, 0), 'Time delta cannot be zero.')
})
