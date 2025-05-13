test_that("add2vars returns correct value", {
  expect_equal(add2vars(2, 5), 7)
  expect_equal(add2vars(-10, 2), -8)
})
