context('Posts')

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

test_that('`create_post` creates a post.', {
  post <- content(app.net$create_post(list(text = URLencode('numb'))))

  print(post)

  expect_equal(post$text, 'numb')
})
