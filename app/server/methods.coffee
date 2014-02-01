Meteor.methods
  call_url: (url) ->
    this.unblock()
    Meteor.http.get url
