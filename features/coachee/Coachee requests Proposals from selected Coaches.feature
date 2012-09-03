Feature: Coachee requests Proposals from selected Coaches
  In order to receive Proposals from Coaches who match my requirements
  As a Coachee
  I want to select Coaches who will receive my RFP and request Proposals from them

Background:
  * I am logged in
  * I see the select Coaches for RFP page

Scenario Outline: I choose a number of Coaches from the list I am first presented with

  Given I see a list of Coaches who match my requirements
  When  I select <Number> Coaches from the list
  When  I choose to send the RFP
  Then  I see the RFP confirmation page
  Then  I see the details of the Coaches who will receive the RFP
  Then  I see the information that will be sent to the Coaches
  When  I confirm my request to send the RFP
  Then  I see the RFP sent page

Examples:

  |Number|
  |1     |
  |2     |
  |3     |
  |4     |
  |5     |


  