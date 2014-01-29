Template.addAddress.helpers
  codes: ->
    _.keys cryptoClassesList
  coin_not_recognized: ->
    true

Template.addAddress.events
  'submit form': (e) ->
    e.preventDefault()
    data =
      address: $(e.target).find('[name=address]').val()
      code: $(e.target).find('[name=code]').val()

    Meteor.call 'add_address', data, (error, id) ->
      if error
        # Display the error
        Errors.throw error.reason
