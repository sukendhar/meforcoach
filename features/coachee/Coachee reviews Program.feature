Feature: A Coachee reviews the Coaching Program prepared by a Coach
  In order to receive a coaching service that best meets my needs
  As a Coachee
  I want to review a Program that has been prepared by my chosen Coach and Accept, Reject or negotiate it

  Background:

    * I am logged in
    * I have received a Program from my chosen Coach
    * I am on my Coachee home page

  Scenario: I accept the Program

    Given I see a Program
    Given I choose the Program
    Given I see the Program details
    When  I choose to accept the Program
    Then  I see confirmation that the Program is accepted
    Then  I am on my Coachee home page
    Then  I see a link to my active Program

  Scenario: I reject the Program

    Given I see a Program
    Given I choose the Program
    Given I see the Program details
    When  I choose to reject the Program
    Then  I see a Program feedback form
    When  I complete the Program feedback form correctly
    Then  I see confirmation that my Feedback has been sent
    Then  I am on my Coachee home page
    Then  I do not see a link to my active Program


  Scenario: I request changes to the Program

    Given I see a Program
    Given I choose the Program
    Given I see the Program details
    When  I choose to request changes to the Program
    Then  I see a Program feedback form
    When  I complete the Program feedback form correctly
    Then  I see confirmation that my Feedback has been sent
    Then  I am on my Coachee home page
    Then  I do not see a link to my active Program