World = (ready) ->
  Webdriver = require("../../rtd/webdrivers/cucumber-webdriver.js")(
    "chrome", 2000, 2000
  )
  Actions = require("./actions.coffee") @

  world = @

  Webdriver.getBrowser (browser) ->
    world.webdriver = Webdriver.driver
    world.browser = browser
    world.actions = Actions
    ready()


exports.World = World
