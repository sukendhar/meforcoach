Feature: Coachee provides Feedback on coaching Program
  In order to help my Coach to improve his skills and his Reputation
  As a Coachee
  I provide Feedback on the coaching Program that I have completed or terminated

Background:

  * I am logged in
  * I have an active Program

  Scenario: I terminate the Program

    Given I am on my Coachee home page
    Given I see a link to a Program
    Given I choose the Program
    Then  I see the Program details
    When  I choose to terminate the Program
    Then  I see the Program Feedback form
    When  I correctly complete the Program Feedback form
    Then  I see a Feedback confirmation message
    Then  I am on my Coachee home page
    Then  I do not see a link to a Program

  Scenario: The Program is complete

    Given I am on my Coachee home page
    Given I see a Program complete message
    Given I choose the Program complete message
    Then  I see the Program Feedback form
    When  I correctly complete the Program Feedback form
    Then  I see a Feedback confirmation message
    Then  I am on my Coachee home page
    Then  I do not see a link to a Program

  