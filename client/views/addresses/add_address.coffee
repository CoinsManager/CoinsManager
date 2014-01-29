Template.addAddress.helpers
  codes: ->
    _.keys cryptoClassesList

Template.addAddress.events
  'submit form': (e) ->
    post =
      address: $(e.target).find('[name=address]').val()
      code: $(e.target).find('[name=code]').val()

    Meteor.call 'post', post, (error, id) ->
      if error
        # Display the error
        Errors.throw error.reason
