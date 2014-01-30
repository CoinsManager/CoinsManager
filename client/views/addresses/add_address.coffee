Session.set 'show_complete_form', false


Template.addAddress.helpers
  codes: ->
    _.keys cryptoClassesList
  coin_recognized: ->
    not Session.get 'show_complete_form'


Template.addAddress.events
  'submit form': (e) ->
    e.preventDefault()
    code = $(e.target).find('[name=code-alpha]').val()
    if not code
      code = $(e.target).find('[name=code]').val()

    data =
      address: $(e.target).find('[name=address]').val()
      code: code
      name: $(e.target).find('[name=name]').val()
      nb_coin: $(e.target).find('[name=nb_coin]').val()
      value: $(e.target).find('[name=value]').val()

    Meteor.call 'add_address', data, (error, id) ->
      if error
        # Display the error
        Errors.throw error.reason
  'click .fa-plus-square': (e) ->
    Session.set 'show_complete_form', true
