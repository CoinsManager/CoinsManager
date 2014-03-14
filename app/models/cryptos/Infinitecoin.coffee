class @Infinitecoin extends @BaseCrypto
  """
  This class define all the informations needed for Infinitecoin
  """
  @address_format = "66"
  @api_url = "http://exploretheblocks.com:2750/chain/Infinitecoin/q/"
  @code = "IFC"

  constructor: ->
    super
    @name = "Infinitecoin"
    @foundation_msg = "This is a tweet-like message from the foundation"
    @total_coin = "90.6 billion"
    @hash_algo = "scrypt"
    @protocol = "Proof-of-work"
    @cryptocoinchartsName = "InfiniteCoin"

  setBalance: ->
    url = "#{@constructor.api_url}addressbalance/#{@address}"
    lambda_balance = (result) -> +result.content
    super url, lambda_balance

  @verifyAddress: (address) ->
    url_base = "#{@api_url}checkaddress/"
    super address, url_base, @address_format
