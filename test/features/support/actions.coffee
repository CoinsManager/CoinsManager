Actions = (world) ->
  _getById: (id) ->
    world.browser.findElement world.webdriver.By.id(id)

  authenticate: ->
    email = "user@example.com"
    password = "test123"
    deferred = world.webdriver.promise.defer()
    _getById("login-sign-in-link").click()
    _getById("login-email").sendKeys(email)
    _getById("login-password").sendKeys(password)
    _getById("signup-link").click()
    _getById("login-buttons-password").click()
    _getById("login-name-link").getText()
      .then (value) ->
        if  value.indexOf(email) isnt 0
          deferred.rejected("#{value} did not contain #{email}")
        else
          deferred.fulfill()

    deferred.promise


module.exports = (world) ->
  new Actions(world)
