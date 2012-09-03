Feature: Coachee defines communication modes and locations

  In order to find Coaches who will be able to coach me via my preferred communication mode in a suitable location
  As a Coachee
  I define my preferred methods of communication and the locations where coaching could take place

Background:

  * I am logged in
  * I am logged in with a Coachee Profile and Coaching Issue defined
  * I am on my Coachee home page


Scenario Outline: I define the mode of coaching

  When I see that the <Mode> mode is unchecked
  When I choose to be coached via <Mode>
  When I correctly define the <Mode> parameters
  Then I choose to save my <Mode> details
  Then I see options to be coached by different media
  Then I see the <Mode> option is checked
  When I choose Next
  Then I see the define availability page

Examples:

  |Mode     |
  |email    |
  |Skype    |
  |in person|
  |phone    |

  