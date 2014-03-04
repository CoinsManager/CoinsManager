Template.totalAsset.helpers
  totalValue: ->
    sum = 0
    for address in @
      value = address.get_value()
      if value?
        sum += +value
    return sum.toFixed 2
