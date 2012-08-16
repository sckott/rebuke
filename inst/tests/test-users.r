context('Users')

test_that('a user is retrieved', {
  expect_equal(app.net$user('3496')$username, 'allen')
})

test_that('a user is followed', {
  app.net$follow('1')
  
  expect_true(app.net$user('1')$you_follow)
})

test_that('a user is unfollowed', {
  app.net$unfollow('1')

  expect_false(app.net$user('1')$you_follow)
})

test_that("users a user is following are retrieved", {
  expect_equal(app.net$followers('1306')[[5]]$username, 'allen')
})

test_that("users following a user are retrieved", {
  expect_equal(app.net$following('3496')[[1]]$username, 'collin')
})
