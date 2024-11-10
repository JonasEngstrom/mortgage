test_that("standard_sum returns the expected value", {
  expect_equal(as.Date('2024-01-01') |> standard_sum(3.62/100, 200000) + as.Date('2024-01-01') |> standard_sum(3.62/100, 50000) + as.Date('2024-07-01') |> standard_sum(3.62/100, 50000), 2986.5)
})
