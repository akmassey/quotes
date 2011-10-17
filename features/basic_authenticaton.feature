Feature: Basic Authentication

  Scenario Outline: Creating a new account
    Given I am not authenticated
    When I register as "<name>" 
    And "<email>" as my email address 
    And "<password>" as my password
    And "<password>" as my password confirmation
    And I press "Sign up"
    # Then I should see "logged in as <email>"
    Then I should see "Signed in successfully."

    Examples:
       | name    | email           | password   | 
       | Testing | testing@man.net | secretpass | 
       | Foo Bar | foo@bar.com     | fr33z3     | 

  Scenario: Editing a new account
    Given I am a new, authenticated user
    When I want to edit my account
    Then I should see the account initialization form
    And I should see "Your account has not been initialized yet. Do it now!"
    # And more view checking stuff

    # Added to this file since redirects don't work otherwise
    # Then /^I am redirected to "([^\"]*)"$/ do |url|
    #   assert [301, 302].include?(@integration_session.status), "Expected status to be 301 or 302, got #{@integration_session.status}"
    #   location = @integration_session.headers["Location"]
    #   assert_equal url, location
    #   visit location
    # end
