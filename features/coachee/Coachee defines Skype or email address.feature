Feature: Coachee defines parameters for being coached by Skype

  In order to find Coaches who will be able to coach me by Skype
  As a Coachee
  I want to define my Skype or email address

  Background:

    * I am logged in with a Coachee Profile and Coaching Issue defined
    * I am on my Coachee home page


  Scenario Outline: I have not yet defined my Skype or email addresses

    When I see that the <Mode> mode is unchecked
    When I choose to be coached by <Mode>
    Then I see a form to enter my <Mode> details
    When I enter a valid <Mode> address
    Then I choose to save my <Mode> details
    Then I see options to be coached by different media
    Then I see the <Mode> mode is checked

  Examples:

    |Mode |
    |Skype|
    |email|