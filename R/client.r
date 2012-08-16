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

      if (!is.null(subresource)) {
        uri <- str_c(uri, '/', subresource)
      }

      content(GET(uri, sign()))
    },

    post = function(resource, object = NULL, subresource = NULL) {
      uri <- str_c(endpoint, resource)

      if (!is.null(object)) {
        uri <- str_c(uri, '/', object)
      }

      if (!is.null(subresource)) {
        uri <- str_c(uri, '/', subresource)
      }

      content(POST(uri, sign()))
    },

    delete = function(resource, object = NULL, subresource = NULL) {
      uri <- str_c(endpoint, resource)

      if (!is.null(object)) {
        uri <- str_c(uri, '/', object)
      }

      if (!is.null(subresource)) {
        uri <- str_c(uri, '/', subresource)
      }

      DELETE(uri, sign())
    }
  )
)
