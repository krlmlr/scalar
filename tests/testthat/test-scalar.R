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

test_that("can slice", {
  expect_equal(vec_slice(scalar(2), 1), scalar(2))
  expect_equal(vec_slice(scalar(2), c(0, 1)), scalar(2))
  expect_equal(vec_slice(scalar(2), c(1, 1)), c(2, 2))
})

test_that("can subset rows", {
  tbl <- data.frame(a = scalar(1), b = 1)
  expect_s3_class(tbl$a, "scalar")
  tbl2 <- tbl[c(1, 1), ]
  expect_identical(class(tbl2$a), "numeric")
  rownames(tbl2) <- NULL
  expect_equal(tbl2, data.frame(a = c(1, 1), b = c(1, 1)))
})

test_that("can bind", {
  tbl <- data.frame(a = scalar(1), b = 1)
  tbl2 <- vec_rbind(tbl, tbl)
  expect_identical(class(tbl2$a), "numeric")
  expect_equal(tbl2, data.frame(a = c(1, 1), b = c(1, 1)))
})
