test_that("insurance_cost rounds age up to twenty", {
  expect_equal(insurance_cost(15, 1000000/101*100), 0.7)
})

test_that("insurance_cost rounds age down to ninety", {
  expect_equal(insurance_cost(150, 1000000/101*100), 196.42)
})

test_that("insurance_cost returns expected value for age 20", {
  expect_equal(insurance_cost(20, 1000000/101*100), 0.7)
})

test_that("insurance_cost returns expected value for age 25", {
  expect_equal(insurance_cost(25, 1000000/101*100), 0.72)
})

test_that("insurance_cost returns expected value for age 30", {
  expect_equal(insurance_cost(30, 1000000/101*100), 0.56)
})

test_that("insurance_cost returns expected value for age 35", {
  expect_equal(insurance_cost(35, 1000000/101*100), 0.72)
})

test_that("insurance_cost returns expected value for age 40", {
  expect_equal(insurance_cost(40, 1000000/101*100), 1.05)
})

test_that("insurance_cost returns expected value for age 45", {
  expect_equal(insurance_cost(45, 1000000/101*100), 1.73)
})

test_that("insurance_cost returns expected value for age 50", {
  expect_equal(insurance_cost(50, 1000000/101*100), 2.94)
})

test_that("insurance_cost returns expected value for age 55", {
  expect_equal(insurance_cost(55, 1000000/101*100), 4.66)
})

test_that("insurance_cost returns expected value for age 60", {
  expect_equal(insurance_cost(60, 1000000/101*100), 7.42)
})

test_that("insurance_cost returns expected value for age 65", {
  expect_equal(insurance_cost(65, 1000000/101*100), 13.3)
})

test_that("insurance_cost returns expected value for age 70", {
  expect_equal(insurance_cost(70, 1000000/101*100), 21.1)
})

test_that("insurance_cost returns expected value for age 75", {
  expect_equal(insurance_cost(75, 1000000/101*100), 35.56)
})

test_that("insurance_cost returns expected value for age 80", {
  expect_equal(insurance_cost(80, 1000000/101*100), 63.94)
})

test_that("insurance_cost returns expected value for age 85", {
  expect_equal(insurance_cost(85, 1000000/101*100), 114.4)
})

test_that("insurance_cost returns expected value for age 90", {
  expect_equal(insurance_cost(90, 1000000/101*100), 196.42)
})
