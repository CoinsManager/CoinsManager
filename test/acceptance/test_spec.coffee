webdriver = require '../rtd/node_modules/selenium-webdriver'

authenticate = (email, password) ->
  deferred = webdriver.promise.defer()
  @driver.findElement(webdriver.By.id 'login-sign-in-link').click()
  @driver.findElement(webdriver.By.id 'login-email').sendKeys(email)
  @driver.findElement(webdriver.By.id 'login-password').sendKeys(password)
  @driver.findElement(webdriver.By.id 'signup-link').click()
  @driver.findElement(webdriver.By.id 'login-buttons-password').click()
  @driver.findElement(webdriver.By.id 'login-name-link').getText()
    .then (value) ->
      if value.indexOf(email) isnt 0
        deferred.rejected(value + " did not contain " + email)
      else
        deferred.resolve()
  return deferred.promise

resetApp = ->
  deferred = webdriver.promise.defer()
  @driver.get('http://localhost:8000/reset').then ->
    deferred.resolve()
  return deferred.promise

setupUsers = ->
  Accounts.createUser
    email: 'a@example.com'
    password: 'test123'

openApp = ->
  deferred = webdriver.promise.defer()
  @driver.get('http://localhost:8000').then ->
    deferred.resolve()
  return deferred.promise

findOwnAddresses = (email) ->
  ->
    mainDefer = webdriver.promise.defer()
    @driver.getPageSource().contains "Your addresses"
    return mainDefer.promise


describe 'login', ->

  beforeEach ->
    @driver = require("../rtd/webdrivers/selenium-server.js")(webdriver,
      browserName: "chrome"
    )
    @driver.manage().timeouts().setScriptTimeout(5000)
    @driver.manage().timeouts().implicitlyWait(5000)

    resetApp()
      .then setupUsers
      .then openApp

  it "allows someone to login", (done) ->
    email = "a@example.com"
    password = "test123"
    authenticate(email, password)
      .then findOwnAddresses(email)
      .then (-> done()), error
