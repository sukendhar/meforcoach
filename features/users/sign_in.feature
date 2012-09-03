Feature: Sign in
  In order to get access to protected sections of the site
  A user
  Should be able to sign in

  Scenario: User is not signed up
    Given I do not exist as a user
    When I sign in with valid credentials
    Then I see an invalid login message
    And I should be signed out

  Scenario: User signs in successfully
    Given I exist as a user
    And I am not logged in
    When I sign in with valid credentials
    Then I see a successful sign in message
    When I return to the site
    Then I should be signed in

  Scenario: User enters wrong email
    Given I exist as a user
    And I am not logged in
    When I sign in with a wrong email
    Then I see an invalid login message
    And I should be signed out

  Scenario: User enters wrong password
    Given I exist as a user
    And I am not logged in
    When I sign in with a wrong password
    Then I see an invalid login message
    And I should be signed out

  Scenario: User sign-in with my Facebook account for the first time, when User not logged in to Facebook
    Given I am not logged-in to Facebook
    Given I choose to sign-in using Facebook
    When I enter a valid Facebook Credentials
    Then I see a success message from Facebook
    And I see a Coachee Profile Creation Form
    When I submit the form, I see message, Coachee Profile created successfully
    Then I see my Coachee home page

  Scenario: User sign-in with my Facebook account when User have already created my Coachee Profile
    Given I have a Coachee account
    Given I am not logged-in to Facebook
    Given I choose to sign in using Facebook
    When I enter a valid Facebook id
    And   I enter a valid Facebook password
    Then Facebook authorizes me as a valid user
    Then I see my Coachee home page
      