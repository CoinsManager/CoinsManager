global = @


Meteor.startup ->
  Meteor.call "implementedWebsites", (err, result) ->
    global.implementedWebsites = result


@OnlineWallets = new Meteor.Collection "websites",
  transform: (doc) ->
    # Retrieve class from code, and pass it the address
    if doc.name in global.implementedWebsites
      obj = new global[doc.name] doc
      return obj
