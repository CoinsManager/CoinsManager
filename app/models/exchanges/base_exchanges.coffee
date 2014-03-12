###
Base class for Exchanges
###


class @BaseExchange
  @keys = {}
  @deps = {}

  @ensureDeps = (key) ->
    if not @deps[key]
      @deps[key] = new Deps.Dependency()

  @get_value = (key) ->
    @ensureDeps key
    @deps[key].depend()
    return @keys[key]

  @set_value = (url, key, lambda_value) ->
    cls = this
    Meteor.call "callUrl", url, (error, result) ->
      if error
        throw error
      new_value = lambda_value(result)
      if EJSON.equals cls.keys[key], new_value
        return
      cls.keys[key] = new_value
      cls.deps[key].changed()


exports.BaseExchange = BaseExchange unless Meteor?
