Router.configure
  layoutTemplate: 'alphaLayout'
  #layoutTemplate: 'comingSoonLayout'
  loadingTemplate: 'loading'


Router.map ->
  #@route 'comingSoon', path: '/', data: ->
      #do GAnalytics.pageview
  @route 'alpha',
    path: '/',
    waitOn: ->
      collections = ['users', 'donationAddresses']
      Meteor.subscribe collection for collection in collections
      if Meteor.user()
        Meteor.subscribe 'userAddresses', Meteor.user()._id
