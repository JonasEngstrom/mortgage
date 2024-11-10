test_that("minimum_monthly_payment returns expected value when loan to value ratio is over 70%", {
  expect_equal(minimum_monthly_payment(100, 0.75, 0.4), 2 / 12)
})

test_that("minimum_monthly_payment returns expected value when loan to value ratio is over 50%", {
  expect_equal(minimum_monthly_payment(100, 0.55, 0.4), 1 / 12)
})

test_that("minimum_monthly_payment returns expected value when debt ratio is over 450%", {
  expect_equal(minimum_monthly_payment(100, 0.3, 4.6), 1 / 12)
})

test_that("minimum_monthly_payment returns expected value when loan to value ratio is under 50% and debt ratio is under 450%", {
  expect_equal(minimum_monthly_payment(100, 0.3, 0.4), 0)
})
