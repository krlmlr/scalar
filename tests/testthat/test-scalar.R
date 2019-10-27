test_that("can create and coerce", {
  expect_equal(vec_c(scalar(1), .ptype = numeric()), 1)
  expect_error(vec_c(scalar(1), .ptype = character()))
})

test_that("can find common type", {
  expect_equal(vec_ptype2(scalar(1), scalar(2)), numeric())
  expect_equal(vec_ptype2(scalar(1), 2:3), numeric())
  expect_equal(vec_ptype2(0:1, scalar(2)), numeric())
})

test_that("can concatenate", {
  expect_equal(vec_c(scalar(1), scalar(2)), 1:2)
  expect_equal(vec_c(scalar(1), 2:3), 1:3)
  expect_equal(vec_c(0:1, scalar(2)), 0:2)
})
