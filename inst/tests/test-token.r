context("Token Resource")

test_that('a user is retrieved', {
  expect_equal(token()$user$username, 'allen')
}
