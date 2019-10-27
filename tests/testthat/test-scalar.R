test_that("can create and concatenate", {
  expect_equal(vec_c(scalar(1), .ptype = numeric()), 1)
  expect_error(vec_c(scalar(1), .ptype = character()))
})
