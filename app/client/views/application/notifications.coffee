Template.notifications.rendered = ->
  $(".notifications").fadeOut 3000


Template.notifications.helpers
  notification: -> Session.get "notification"
