Template.alphaLayout.helpers
  loggedIn: ->
    Meteor.user()
  errors: ->
    Errors.collection.find()

Template.alphaLayout.rendered = () ->

  ZeroClipboard.config
    moviePath: '/swf/ZeroClipboard.swf'
    debug: false
  clientText = new ZeroClipboard $(".copy")
  clientText.on "load", (clientText) ->
    clientText.on 'datarequested', (clientText) ->
      client.setText(this.innerHTML)
