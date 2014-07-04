module.exports = ->

  @World = require("../support/world.coffee").World

  @Given /^I have logged in$/, (callback) ->
    @actions.authenticate().then ->
      callback()

  @Given /^I click on the icon "([^"]*)"$/, (cssclass, callback) ->
    callback.pending()

  @When /^I fill in "([^"]*)" with "([^"]*)"$/, (field, value, callback) ->
    callback.pending()

  @When /^I submit the form$/, (callback) ->
    callback.pending()

  @Then /^I can see the new address in the page$/, (callback) ->
    callback.pending()
