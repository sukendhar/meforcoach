Feature: Coachee describes Coaching Issue

  In order to communicate my requirements to potential Coaches
  As a Coachee
  I want to be able to describe my Coaching Issue

  Background:
    Given I am logged in
    And I have created a Coachee profile
    And I have not yet described my Coaching Issue


  Scenario:	I successfully describe my Coaching Issue

    Given I am on my Coachee home page
    Then I see an option to create my Coaching Issue
    When I choose to describe my Coaching Issue
    Then I see the New Coaching Issue page
    When I correctly complete the New Coaching Issue form
    Then I see a message confirming that I have created a Coaching Issue
    Then I see the define communication modes page

  Scenario:	I start to describe my Coaching Issue and then change my mind

    Given I am on my Coachee home page
    Then I see an option to create my Coaching Issue
    When I choose to describe my Coaching Issue
    Then I see the New Coaching Issue page
    #TODO create the cancel button
    When I choose to cancel the New Coaching issue process
    Then So I am on my Coachee home page
    Then I see an option to create my Coaching Issue