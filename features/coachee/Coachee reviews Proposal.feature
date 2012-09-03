Feature: Coachee reviews Proposal
  In order to engage with the Coach of my choice in a coaching Program
  As a Coachee
  I want to review a Proposal and Accept, Reject or negotiate it

Background:

  * I am logged in
  * I have received a Proposal from a Coach
  * I am on my Coachee home page

  Scenario: I receive one Proposal and I accept it

    Given I see an acceptable Proposal
    Given The acceptable Proposal status is new
    When  I choose the acceptable Proposal
    Then  I see the Proposal details
    Then  I see the Payment Plan details
    When  I accept the acceptable Proposal
    Then  I see the Proposal Feedback form
    When  I correctly complete the Proposal Feedback form
    Then  I see confirmation that the Proposal has been accepted
    Then  I see confirmation that the unsuccessful Coaches have been informed
    Then  I see confirmation that the successful Coach has been informed
    Then  I am on my Coachee home page
    Then  I see an acceptable Proposal
    Given The acceptable Proposal status is accepted

  Scenario: I receive one Proposal and I reject it

    Given I see an unacceptable Proposal
    Given The unacceptable Proposal status is new
    When  I choose the unacceptable Proposal
    When  I reject the unacceptable Proposal
    Then  I see the Proposal Feedback form
    When  I correctly complete the Proposal Feedback form
    Then  I see confirmation that the Proposal has been rejected
    Then  I see confirmation that my Feedback has been sent
    Then  I am on my Coachee home page
    Then  I do not see the unacceptable Proposal


  Scenario: I receive one Proposal and request changes to it

    Given I see an unacceptable Proposal
    Given The unacceptable Proposal status is new
    When  I choose the unacceptable Proposal
    When  I choose to request changes to the Proposal
    Then  I see a new Message form
    When  I complete the new Message form correctly
    Then  I see confirmation that my Message has been sent
    Then  I am on my Coachee home page
    Then  I see the unacceptable Proposal
    Then  The unacceptable Proposal status is change requested


  Scenario: I receive multiple Proposals and accept one of them

    Given I see an acceptable Proposal
    Given I see an unacceptable Proposal
    Given The acceptable Proposal status is new
    Given The unacceptable Proposal status is new
    When  I choose the acceptable Proposal
    When  I accept the acceptable Proposal
    Then  I see the Proposal Feedback form
    When  I correctly complete the Proposal Feedback form
    Then  I see confirmation that the Proposal has been accepted
    Then  I see confirmation that the unsuccessful Coaches have been informed
    Then  I see confirmation that the successful Coach has been informed
    Then  I am on my Coachee home page
    Then  I see an acceptable Proposal
    Then  The acceptable Proposal status is accepted
    Then  I do not see the unacceptable Proposal
