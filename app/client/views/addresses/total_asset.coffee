setNewFiat = (fiat)->
  if Meteor.user()
    Meteor.call "setFiatPreference", fiat, (error, id) ->
      if error
        Errors.throw error.reason

Template.totalAssetSelect.events
  "change select": (e, t) ->
    setNewFiat t.find("option:selected").value

Template.totalAssetUl.events
  "click .fiat-value": (e) ->
    $(".fiat-list").toggleClass "is_active"
  "click .fiat-list li": (e) ->
    $selectedValue = $(e.target)
    if $selectedValue.prop("tagName") is "SPAN"
      $selectedValue = $selectedValue.parent()
    $selectedValue.siblings().removeClass "is_active"
    $selectedValue.addClass "is_active"
    setNewFiat $selectedValue.data("value")
    $(".fiat-list").toggleClass "is_active"