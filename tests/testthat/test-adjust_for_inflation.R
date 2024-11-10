test_that("adjust_for_inflation works during inflation", {
  expect_equal(adjust_for_inflation(100, 100, 200), 200)
})

test_that("adjust_for_inflation works during deflation", {
  expect_equal(adjust_for_inflation(100, 100, 50), 50)
})
