_setNewFiat = (fiat)->
  """Refactored method to call in templates event"""
  if Meteor.user()
    Meteor.call "setFiatPreference", fiat, (error, id) ->
      if error
        Errors.throw error.reason


Template.totalAssetSelect.events
  "change select": (e, t) ->
    _setNewFiat t.find("option:selected").value


Template.totalAssetUl.helpers
  selectedClass: (code) ->
    user = Meteor.user()
    if user and "fiat" of user and code is user.fiat
      return "selected"
    else
      return "unselected"


Template.totalAssetUl.events
  "click .fiat-value": (e) ->
    $(".fiat-list").toggleClass "is_active"
  "click .fiat-list li": (e) ->
    $selectedValue = $(e.target)
    if $selectedValue.prop("tagName") is "SPAN"
      $selectedValue = $selectedValue.parent()
    $selectedValue.siblings().removeClass "is_active"
    $selectedValue.addClass "is_active"
    _setNewFiat $selectedValue.data("value")
    $(".fiat-list").toggleClass "is_active"
