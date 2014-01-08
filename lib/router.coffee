Router.configure
  #layoutTemplate: 'layout'
  layoutTemplate: 'alpha'
  loadingTemplate: 'loading'


Router.map ->
  #@route 'comingSoon', path: '/', data: ->
      #do GAnalytics.pageview
  @route 'alpha',
    path: '/',
    waitOn: ->
      Meteor.subscribe 'coins'
