Feature: Coachee pays Invoice
  In order to meet my financial obligations
  As a Coachee
  I want to pay an Invoice

Background:

  * I am logged in
  * I am on my Coachee home page

  Scenario: I pay my invoice with Paypal

    Given I see an Invoice
    When  I choose the Invoice
    Then  I see the Invoice details
    When  I choose to pay the Invoice with Paypal
    Then  I see the Paypal payment form
    When  I complete the Paypal transaction
    Then  I see the thank you page
    When  I close the thank you page
    Then  I am on my Coachee home page
    Then  I do not see an Invoice


  