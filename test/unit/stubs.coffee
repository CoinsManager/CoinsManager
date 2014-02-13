# Core
Meteor.users.find = ->
  count: ->
  fetch: ->
  observeChanges: ->

Deps =
  autorun: (func) ->
    func()
  autosubscribe: (func) ->
    func()
  afterFlush: ->
  Dependency: ->
    depend: ->

Meteor.Error = (error, reason) ->
  throw reason


# templates
Template.stub 'addAddress'
Template.stub 'addressItem'
Template.stub 'alphaLayout'
Template.stub 'coinsManager'
Template.stub 'userAddresses'
Template.stub 'pageFooter'
