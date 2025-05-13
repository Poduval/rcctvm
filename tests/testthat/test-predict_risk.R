test_that("predict risk works for both input vector and data.frame", {
  expect_equal(
    predict_risk(sex = c("female", "male"),
                 wbc = c(2.1, 4.3),
                 treatment = c("new", "standard")),
    predict_risk(x = data.frame(
      sex = c("female", "male"),
      wbc = c(2.1, 4.3),
      treatment = c("new", "standard"))))})
