Template.addressItem.helpers
  code: ->
    """
    If the coin hasn"t been implemented, return the code from the mongo document
    Else, return the class variable code
    """
    this.code or this.constructor.code
  name: ->
    name = this.name or this.constructor.name
    return name if name isnt 'Object'
  get_value: ->
    if 'value' of @
      return @value
    else if 'get_value' of this
      value = @get_value()
      if _.isNumber value
        return value.toFixed 2
  get_balance: ->
    if 'balance' of @
      return @balance
    else if 'get_balance' of @
      return @get_balance()
    name = this.constructor.name
    return name if name isnt "Object"

Template.addressItem.rendered = () ->

  # Truncate function
  truncate = (elem, fieldWidth, position) ->
    elem.truncate
      width: fieldWidth
      token: "..."
      side: position
      multiline: false

  # Truncate address
  $addressTitle = $(this.find(".address_title"))
  $coinAddress = $addressTitle.find ".coin_address"
  cardHeaderWidth = $addressTitle.width()
  codeWidth = $addressTitle.find(".coin_code").width()
  addressWidth = cardHeaderWidth - codeWidth
  truncate($coinAddress, addressWidth, "center")
  $addressTitle.parents(".address").find(".show_address").
    data "truncated", $coinAddress.text()

  # Truncate balance
  $coinBalance = $(this.find(".coin_balance"))
  $coinValue = $coinBalance.find ".coin_value"
  coinBalanceWidth = $coinBalance.width()
  nameWidth = $coinBalance.find(".coin_name").width()
  valueWidth = coinBalanceWidth - nameWidth
  # TODO: Investigate this 10px issue
  truncate($coinValue, valueWidth - 10, "right")

Template.addressItem.events

  # Click on element in functional panel
  "click .func_panel i": (e) ->
    $this = $(e.target)
    if $this.hasClass "show_address"
      message = "Read your address below"
    $addressCard = $this.parents ".address"
    $addressTitle =  $addressCard.find ".address_title"
    actualAddress = $addressCard.find(".copy").data "clipboard-text"
    $addressTitle.toggleClass "is_full"
    if $addressTitle.hasClass "is_full"
      $addressCard.find(".coin_address").text actualAddress
      $addressCard.find(".tip").text message
    else
      $addressCard.find(".coin_address").text $this.data("truncated")

  # Hover on element in functional panel
  "mouseenter .func_panel i": (e) ->
    $this = $(e.target)
    if $this.hasClass "copy"
      message = "Copy address to clipboard"
    else if $this.hasClass "show_address"
      message = "Show/Hide full address"
    $this.parents('.address').find(".tip").text message

  # Hover on any address card
  "mouseenter .address": (e) ->
    $this = $(e.target)
    $(".address.is_active").removeClass("is_active").
      find(".tip").text "You can click on icons below"
    $this.addClass "is_active"