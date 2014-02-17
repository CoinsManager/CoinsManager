Template.addressItem.helpers
  code: ->
    """
    If the coin hasn't been implemented, return the code from the mongo document
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

Template.addressItem.rendered = () ->
  $( ".address .address_title" ).each (
    () ->
      cardHeaderWidth = $(this).width()
      codeWidth = $(this).find('.coin_code').width()
      addressWidth = cardHeaderWidth - codeWidth
      $(this).find('.coin_address').truncate
          width: addressWidth
          token: '...'
          side: 'center'
          multiline: false
  )