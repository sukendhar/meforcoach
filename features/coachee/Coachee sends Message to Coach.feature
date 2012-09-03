Feature: A Coachee sends a message to a Coach
  In order to receive a proposal that best meets my needs
  As a Coachee
  I want to send a message to a Coach

  Background:

    * I am logged in
    * I have an active Program
    * I am on my Coachee home page

  Scenario: I write a message to a Coach

    Given I choose the link to send a message to my Coach
    When  I correctly complete the New Message form
    Then  I receive a message sent confirmation
    Then  I am on my Coachee home page