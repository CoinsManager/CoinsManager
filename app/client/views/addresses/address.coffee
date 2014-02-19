Template.addressItem.helpers
  code: ->
    """
    If the coin hasn't been implemented, return the code from the mongo document
    Else, return the class variable code
    """
    this.code or this.constructor.code
  name: ->
    name = this.name or this.constructor.name
    return name if name isnt 'Object'
