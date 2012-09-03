Feature: Coachee Creates Profile

  In order to be able to find a suitable Coach
  as a Coachee
  I create a profile

  The profile describes my personal details, such as age, gender, language and home location. The purpose of this
  information is to provide data that the system can use to match me with a Coach.

  Scenario: I am signed in with Facebook and I give permission for the system to retrieve my profile information

    Given I have signed in with Facebook
    Then  I given permission for the system to retrieve my Facebook profile information
    Then  I see the new Profile page
    Then  I see my name on the page
    Then  I see my language is populated from my Facebook profile
    Then  I see my age is populated from my Facebook profile
    Then  I see my country is populated from my Facebook profile
    When  I choose Next
    Then  I see the describe issue page

  Scenario Outline:

    Given I have signed in with my email address and password
    Given I have not created a Profile
    Then  I see the new Profile page
    Then  I see my name on the page
    When  I choose <Age> as my age
    When  I choose <Gender> as my gender
    When  I choose <Country> as my location
    When  I choose <Language> as my preferred language
    When  I choose Next
    Then  I see the describe issue page

  Examples:

    |Age  |Gender|Country     |Language|
    |<18  |Male  |South Africa|English |
    |18-25|Female|India       |Hindi   |
    |26-35|Female|Afghanistan |Urdu    |


  Scenario: I am signed in with Facebook and I not give permission for the system to retrieve my profile information

    Given I have signed in with Facebook
    Then  I have not given permission for the system to retrieve my Facebook profile information
    Then  I see the new Profile page
    Then  I see my name on the page
    Then  I correctly complete the Coachee Profile form
    Then  I see the describe issue page




