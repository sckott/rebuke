context('Users Resource')

test_that('a user is retrieved', {
  expect_equal(user('1')$username, 'dalton')
}

test_that('a user is followed', {
  expect_true(follow('1')$is_follower)
}

test_that('a user is unfollowed', {
  expect_false(unfollow('1')$is_follower)
}

test_that("users a user is following are retrieved", {
  expect_equal(followers('3496')[[1]]$username, 'collin')
}

test_that("users following a user are retrieved", {
  expect_equal(following('3496')[[1]]$username, 'collin')
}
