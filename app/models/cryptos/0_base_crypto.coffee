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

  constructor: (@address) ->
    @keys =
      balance: "Processing..."
    @deps = {}
    @name = ""

  ensureDeps: (key) ->
    if not @deps[key]
      @deps[key] = new Deps.Dependency()
      @set_balance()

  get_balance: ->
    """Retrieve value set from @set_balance()"""
    @ensureDeps "balance"
    @deps.balance.depend()
    return @keys.balance

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
    return "Value calculation has not been implemented for #{@constructor.name}"

  set_balance: (url, lambda_balance) ->
    """
    create a method with the same name but without arguments in the coin class.
    Method should look like this:

      set_balance: ->
        url = @api_url + @address
        super url, @lambda_balance

    """
    cls = this

    Meteor.call "call_url", url, (err, result) ->
      if err
        throw new Meteor.Error err.error, err.reason
      else
        cls.keys.balance = lambda_balance result
        cls.deps.balance.changed()

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
      console.log "#{url_base}#{address}"
      result = Meteor.call "call_url", "#{url_base}#{address}"
      console.log result.content
      switch result.content
        when "X5" then throw new Meteor.Error 601, "Address not base58"
        when "CK" then throw new Meteor.Error 603, "Failed hash check"
        when "SZ"
        then throw new Meteor.Error 602, "Address not the correct size"
        else return false
    return "Verification for #{@name} has not been implemented yet"
