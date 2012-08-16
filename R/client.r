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

    construct = function(resource, object = NULL, subresource = NULL, parameters = NULL) {
      uri <- str_c(endpoint, resource)

      if (!is.null(object)) {
        uri <- str_c(uri, '/', object)
      }

      if (!is.null(subresource)) {
        uri <- str_c(uri, '/', subresource)
      }

      if (!is.null(parameters)) {
        uri <- modify_url(url = uri, query = parameters)
      }

      uri
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

    post = function(resource, object = NULL, subresource = NULL, parameters = NULL) {
      uri <- str_c(endpoint, resource)

      if (!is.null(object)) {
        uri <- str_c(uri, '/', object)
      }

      if (!is.null(subresource)) {
        uri <- str_c(uri, '/', subresource)
      }

      POST(url = construct(resource, object, subresource), body = parameters, sign())
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
