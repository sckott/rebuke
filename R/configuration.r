Configuration <- setRefClass(
  Class     = 'Configuration',
  fields    = list(
    api_root    = 'character',
    api_version = 'character'
  ),
  methods   = list(
    endpoint = function() {
      str_c(api_root, api_version, '/')
    }
  )
)
