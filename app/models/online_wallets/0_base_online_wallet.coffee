###
Base class for Online wallets
###


class @BaseWebsite
  @keys = {}
  @deps = {}

  constructor: (options) ->
    @api_key = options.api_key
    @api_secret = options.api_secret

  @ensureDeps = (key) ->
    if not @deps[key]
      @deps[key] = new Deps.Dependency()
