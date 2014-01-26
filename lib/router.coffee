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
      collections = ['coins', 'exchanges', 'fiats', 'users', 'addresses']
      Meteor.subscribe collection for collection in collections
