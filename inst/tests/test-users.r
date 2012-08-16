context('Users')

app.net_configuration = Configuration$new(
  api_root    = 'https://alpha-api.app.net/stream/',
  api_version = '0'
)

app.net_authorization <- Authorization$new(
  application_name  = 'rebuke',
  client_id         = '3KYmEnmDxA5XxgV6wahS6a3REw4qttB4',
  client_secret     = 'wkuDojyQGUoQDvdacQmCiHtLxMHAkYPq',
  scope             = 'export'
)

app.net <- Client$new(
  configuration  = app.net_configuration,
  authorization  = app.net_authorization
)

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
