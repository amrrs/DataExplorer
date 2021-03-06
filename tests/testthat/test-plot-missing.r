context("plot missing values")

test_that("test data.table return object", {
  dt <- data.table(iris)
  for (j in 1:4) set(dt, i=sample(150, j * 30), j, value = NA_integer_)
  dt_missing <- plot_missing(dt)
  expect_is(dt_missing, "data.table")
  expect_equal(dim(dt_missing), c(5, 4))
})

test_that("test data.frame return object", {
  dt <- data.table(iris)
  for (j in 1:4) set(dt, i=sample(150, j * 30), j, value = NA_integer_)
  df <- as.data.frame(dt)
  df_missing <- plot_missing(df)
  expect_is(df_missing, "data.frame")
  expect_equal(dim(df_missing), c(5, 4))
})
