context('Token')

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

test_that('`current_token` retrieves current token.', {
  expect_equal(app.net$current_token()$user$username, 'allen')
})
