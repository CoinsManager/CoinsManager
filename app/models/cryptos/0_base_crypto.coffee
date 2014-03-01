class @BaseCrypto
  """
  Base Class for Crypto Currencies

  This class needs to be inherited by specific coins classes, and following
  methods should be overrided:

    * get_value
    * set_balance
    * verify_address
    * get_exchange_rate (TODO: not implemented yet)
  """
  @keys = {}
  @deps = {}

  constructor: (@address) ->
    @name = @constructor.name
    @code = @constructor.code

  ensureDeps: (address, key) ->
    if not BaseCrypto.deps[@name]
      BaseCrypto.deps[@name] = {}
      BaseCrypto.deps[@name][address] = {}
    if not BaseCrypto.keys[@name]
      BaseCrypto.keys[@name] = {}
      BaseCrypto.keys[@name][address] = {}
    if not BaseCrypto.deps[@name][address][key]
      BaseCrypto.deps[@name][address][key] = new Deps.Dependency()
      switch key
        when 'balance' then @set_balance()
        #when 'value' then @set_value()
        when 'btc2usd' then @set_btc2usd()

  get_balance: ->
    """Retrieve value set from @set_balance()"""
    @ensureDeps @address, "balance"
    BaseCrypto.deps[@name][@address].balance.depend()
    return BaseCrypto.keys[@name][@address].balance

  get_btc2usd: ->
    """Retrieve price for 1 bitcoin in US dollar"""
    @ensureDeps @address, "btc2usd"
    BaseCrypto.deps[@name][@address].btc2usd.depend()
    return BaseCrypto.keys[@name][@address].btc2usd

  get_name: ->
    if @name then @name else @constructor.name

  get_value: ->
    """
    Override this method from a specific coin class, to calculate the value of
    an address using the balance and exchange rate.
    Should look like this:

      get_value: ->
        balance = @get_balance()
        rate = @get_exchange_rate()
        return balance * rate

    """
    @ensureDeps @address, "value"
    BaseCrypto.deps[@name][@address].value.depend()
    if @name is "D6ascim4uwAbRD7ySqEiJYJKtkW4oSvQDN"
      debugger
    result = undefined
    if BaseCrypto.keys[@name][@address].value and @get_btc2usd()
      result = BaseCrypto.keys[@name][@address].value * @get_balance() * @get_btc2usd()
    else if BaseCrypto.keys[@name][@address].total_value?
      result = BaseCrypto.keys[@name][@address].total_value
    if result?
      return result.toFixed 2

  set_btc2usd: ->
    cls = @

    url = 'https://api.bitcoinaverage.com/ticker/USD/'
    Meteor.call "call_url", url, (err, result) ->
      if err
        throw new Meteor.Error err.error, err.reason
      else
        BaseCrypto.keys[cls.name][cls.address].btc2usd = result.data["24h_avg"]
        BaseCrypto.deps[cls.name][cls.address].btc2usd.changed()

  set_balance: (url, lambda_balance) ->
    """
    create a method with the same name but without arguments in the coin class.
    Method should look like this:

      set_balance: ->
        url = @api_url + @address
        super url, @lambda_balance

    """
    cls = @

    Meteor.call "call_url", url, (err, result) ->
      if err
        throw new Meteor.Error err.error, err.reason
      else
        BaseCrypto.keys[cls.name][cls.address].balance = lambda_balance result
        BaseCrypto.deps[cls.name][cls.address].balance.changed()

  @verify_address: (address, url_base) ->
    """
    Override this method from a specific coin class, to verify if the input
    correspond to a correct address (good algorith, correct size, hash check
    pass). Omit the "url_base" argument.

    If your api returns the same results as provided in the switch statement,
    you can simply call back this method:

      @verify_address: (address) ->
        url_base = "#{@api_url}checkaddress/"
        super address, url_base
    """
    if url_base
      result = Meteor.call "call_url", "#{url_base}#{address}"
      switch result.content
        when "X5" then throw new Meteor.Error 601, "Address not base58"
        when "CK" then throw new Meteor.Error 603, "Failed hash check"
        when "SZ"
        then throw new Meteor.Error 602, "Address not the correct size"
        else return false
    return "Verification for #{@name} has not been implemented yet"
