test_that("Check that is_first_weekday returns expected value", {
  expect_true(as.Date('2024-11-01') |> is_first_weekday())
  for (i in seq(as.Date('2024-11-02'), as.Date('2024-12-01'), by = 'day')) {
    expect_false(as.Date(i) |> is_first_weekday())
  }

  expect_false(as.Date('2024-06-01') |> is_first_weekday())
  expect_false(as.Date('2024-06-02') |> is_first_weekday())
  expect_true(as.Date('2024-06-03') |> is_first_weekday())
  for (i in seq(as.Date('2024-06-04'), as.Date('2024-06-30'), by = 'day')) {
    expect_false(as.Date(i) |> is_first_weekday())
  }

  expect_false(as.Date('2024-12-01') |> is_first_weekday())
  expect_true(as.Date('2024-12-02') |> is_first_weekday())
  for (i in seq(as.Date('2024-12-03'), as.Date('2024-12-31'), by = 'day')) {
    expect_false(as.Date(i) |> is_first_weekday())
  }
})
