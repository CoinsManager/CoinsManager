###
Base class for Exchanges
###


class @BaseExchange
  @keys = {}
  @deps = {}

  @ensureDeps = (key) ->
    if not @deps[key]
      @deps[key] = new Deps.Dependency()
      @set_value()

  @get_value = (key) ->
    @ensureDeps key
    @deps[key].depend()
    return @keys[key]

  @set_value = (url, key, lambda_value) ->
    cls = this
    Meteor.call "call_url", url, (error, result) ->
      if error
        throw error
      cls.keys[key] = lambda_value(result)
      cls.deps[key].changed()


exports.BaseExchange = BaseExchange unless Meteor?
