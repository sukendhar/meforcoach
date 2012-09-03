Feature: Coachee Requests Matching Coaches
  In order to invite suitable Coaches to respond to the RFP
  as a Coachee
  I request a list of Coaches that match my Coachee Profile and Coaching Issue

  Background:

    * I am logged in
    * I am on my Coachee home page
    * I see an option to select the number of Coaches to return
    * I see an option to request matching Coaches

  Scenario Outline: I request matching coaches and get a number of fully & partially matching Coaches in response

    When I select <NumberRequested> Coaches to return
    When I choose to request matching Coaches
    When <ExactMatches> Coaches match my criteria exactly
    When <PartialMatches> Coaches match my criteria partially
    Then I see a list of <CoachesReturned> Coaches
    Then I see <ExactMatches> exact matches
    Then I see <PartialMatches> partial matches

  Examples:

    |NumberRequested  |ExactMatches  |PartialMatches  |CoachesReturned  |
    |3                |3             |3               |3                |
    |5                |2             |2               |4                |
    |3                |1             |0               |1                |
    |3                |0             |1               |1                |
    |3                |0             |2               |2                |
    |3                |1             |1               |2                |

  Scenario:
    When I select "2" Coaches to return
    When I choose to request matching Coaches
    When "0" Coaches match my criteria exactly
    When "0" Coaches match my criteria partially
    Then I see a no coaches match message