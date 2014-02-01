###
Base Class for Crypto Currencies
###


class @BaseCrypto
  constructor: (@address) ->
    @keys =
      balance: "Processing..."
    @deps = {}

  printInfo: ->
    "Address: #{@address}"

  ensureDeps: (key) ->
    if not @deps[key]
      @deps[key] = new Deps.Dependency()
      @set_balance()

  get_balance: ->
    @ensureDeps "balance"
    @deps.balance.depend()
    return @keys.balance

  set_balance: (url, lambda_balance) ->
    cls = this
    Meteor.call "call_url", url, (error, result) ->
      if error
        throw new Meteor.Error 605, error.reason
      else
        cls.keys.balance = lambda_balance result
        cls.deps.balance.changed()


@cryptoClassesList = {}
