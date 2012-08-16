Client <- setRefClass(
  Class   = 'Client',
  fields  = list(    
    configuration = 'Configuration',
    authorization = 'Authorization',
    endpoint      = 'character',
    token         = 'list'
  ),
  methods = list(
    initialize = function(configuration, authorization, token) {
      endpoint <<- configuration$endpoint()

      token <<- authorization$token()
    },

    sign = function() {
      sign_oauth2.0(token$access_token)
    },

    get = function(resource, object = NULL, subresource = NULL) {
      uri <- str_c(endpoint, resource)

      if (!is.null(object)) {
        uri <- str_c(uri, '/', object)
      }

      content(GET(uri, sign()))
    },

    user = function(user) {
      get('users', user)
    },

    followers = function(user) {
      get('users', user, 'followers')
    },

    following = function(user) {
      get('users', user, 'following')
    },

    token = function() {
      get('token')
    }
  )
)
