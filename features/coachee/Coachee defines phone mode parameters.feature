Feature: Coachee defines parameters for being coached by phone

  In order to find Coaches who will be able to coach me by phone
  As a Coachee
  I want to define my contact numbers

  Background:

    * I am logged in with a Coachee Profile and Coaching Issue defined
    * I am on my Coachee home page
    * I choose to be coached by phone

  Scenario Outline: I want to be coached by phone and I have not yet defined phone mode parameters

    Given I see that the phone mode is unchecked
    When I choose to be coached by email
    Then I see a form to enter my phone details
    Then I enter <Number1> as <Location1> phone number
    Then The <Location1> phone number is marked as preferred
    Then I enter <Number2> as <Location2> phone number
    Then The <Location2> phone number is marked as preferred
    Then The <Location1> phone number is not marked as preferred
    When I select <Location1> as preferred
    Then The <Location1> phone number is marked as preferred
    Then The <Location2> phone number is not marked as preferred
    Then I choose to save my phone details
    Then I see options to be coached by different media
    Then I see the phone mode is checked

  Examples: I enter different combinations of numbers

    |Location1|Location2|Number1      |Number2      |
    |Home     |Work     |0217891622   |0217892065   |
    |Work     |Home     |0216895576   |0217832110   |
    |Mobile   |Home     |+441234560000|+371234567890|
    |Other    |Work     |0833000988   |0833993858   |