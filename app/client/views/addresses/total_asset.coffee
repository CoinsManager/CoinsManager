Template.totalAsset.helpers
  totalValue: ->
    sum = 0
    for address in @
      value = address.get_value()
      if _.isNumber value
        sum += value
    return sum.toFixed 2
