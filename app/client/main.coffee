# This is a simple benchmark.
# Uconmment code bellow for testing JS performance.

# renderStart = new Date().getTime()
# window.onload =  () ->
#   elapsed = new Date().getTime() - renderStart
#   console.log("Rendered in #{elapsed} ms")

Meteor.startup ->
  $("html").attr "lang", "en"