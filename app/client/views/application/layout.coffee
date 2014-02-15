Template.alphaLayout.helpers
  loggedIn: ->
    Meteor.user()
  errors: ->
    Errors.collection.find()
