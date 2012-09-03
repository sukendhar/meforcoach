Feature: A Coachee responds to a message from a Coach
  In order to receive a coaching service that best meets my needs
  As a Coachee
  I want to respond to messages from a Coach

Background:

  * I am logged in
  * I am on my Coachee home page

  Scenario: I see a message from a Coach I respond to it

    Given I see a message from a Coach
    Given I open the message
    Then  I see the details of the message
    When  I choose to respond to the message
    When  I send my response
    Then  I see a message from a Coach
    Then  The message is marked as responded

  Scenario: I see a message from a Coach and choose not to respond

    Given I see a message from a Coach
    Given I open the message
    Then  I see the details of the message
    Then  I close the message
    Then  I see a message from a Coach
    Then  The message is marked as read