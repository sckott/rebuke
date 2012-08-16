Authorization <- setRefClass(
  Class     = 'Authorization',
  fields    = list(
    application_name  = 'character',
    client_id         = 'character',
    client_secret     = 'character',
    scope             = 'character'
  ),
  methods   = list(
    endpoint = function() {
      oauth_endpoint(
        request   = NULL,
        authorize = 'authorize',
        access    = 'access_token',
        base_url  = 'https://alpha.app.net/oauth'
      )
    },

    # `oauth_app` uses http://localhost:1410 as the callback URI
    application = function() {
      oauth_app(
        appname = application_name,
        key     = client_id,
        secret  = client_secret
      )
    },

    token = function() {
      oauth2.0_token(
        endpoint  = endpoint(),
        app       = application(),
        scope     = scope
      )
    } 
  )
)
