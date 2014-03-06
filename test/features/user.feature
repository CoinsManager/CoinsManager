Feature: User operations

    As a User
    I want to perform a minimum of actions
    So that my addresses can be easily added
    And their balance/asset managed

    Scenario:
        Given I have logged in
        And I click on the icon "add_address"
        When I fill in "address" with "16sVbwiEZo47CSdvc7utB1g5X7fd2CWtc5"
        # TODO: Remove step filling name-alpha
        And I fill in "name-alpha" with "Bitcoin"
        And I submit the form
        Then I can see the new address in the page
