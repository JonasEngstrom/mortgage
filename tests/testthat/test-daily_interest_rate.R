test_that("daily_interest_rate works for normal years", {
  yearly_interest_rate <- 0.05
  calendar_year <- 2001
  expect_equal(100 * (1 + daily_interest_rate(yearly_interest_rate, calendar_year)) ^ 365, 100 * (1 + yearly_interest_rate))
})

test_that("daily_interest_rate works for leap years", {
  yearly_interest_rate <- 0.05
  calendar_year <- 2000
  expect_equal(100 * (1 + daily_interest_rate(yearly_interest_rate, calendar_year)) ^ 366, 100 * (1 + yearly_interest_rate))
})
