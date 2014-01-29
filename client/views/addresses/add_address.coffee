Template.addAddress.helpers
  codes: ->
    _.keys cryptoClassesList

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
      alert "adress " + id + " created !"
