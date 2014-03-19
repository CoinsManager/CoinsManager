class @DigiByte extends @BaseCrypto
  """
  This class define all the informations needed for DigiByte
  """
  @address_format = "1E"
  @api_url = "http://cryptexplorer.com/chain/DigiByte/q/"
  @code = "DGB"

  constructor: ->
    super
    @name = "DigiByte"
    @foundation_msg = "This is a tweet-like message from the foundation"
    @total_coin = "21 billion"

  setBalance: ->
    url = "#{@constructor.api_url}addressbalance/#{@address}"
    lambda_balance = (result) -> +result.content
    super url, lambda_balance
