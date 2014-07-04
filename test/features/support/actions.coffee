_getById = (world, id) ->
  world.browser.findElement world.webdriver.By.id(id)


Actions = (world) ->
  authenticate: ->
    email = "user@example.com"
    password = "test123"
    deferred = world.webdriver.promise.defer()
    _getById(world, "login-sign-in-link").click()
    _getById(world, "login-email").sendKeys(email)
    _getById(world, "login-password").sendKeys(password)
    _getById(world, "signup-link").click()
    _getById(world, "login-buttons-password").click()
    _getById(world, "login-name-link").getText()
      .then (value) ->
        if  value.indexOf(email) isnt 0
          deferred.rejected("#{value} did not contain #{email}")
        else
          deferred.fulfill()

    deferred.promise


module.exports = (world) ->
  new Actions(world)
