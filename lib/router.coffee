Router.configure
  layoutTemplate: 'layout'
  loadingTemplate: 'loading'

Router.map ->
  @route 'comingSoon', path: '/', data: ->
      do GAnalytics.pageview
