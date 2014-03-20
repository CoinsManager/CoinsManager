# Core
Accounts.createUser = ->
  _id: 0


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
Template.stub "addAddress"
Template.stub "addressItem"
Template.stub "mainLayout"
Template.stub "coinsManager"
Template.stub "emptyForm"
Template.stub "meteorErrors"
Template.stub "notifications"
Template.stub "pageFooter"
Template.stub "totalAssetSelect"
Template.stub "totalAssetUl"
Template.stub "userAddresses"
