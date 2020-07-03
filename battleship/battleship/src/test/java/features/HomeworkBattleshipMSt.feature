Feature: Battleships tests http://www.techhuddle.com/tests/battleships/v4test/index.php
  Background: Page is loaded
    Given user is on BattleShips Page


  Scenario: Enter two coordinates at once must not be accepted
    When I enter coordinate <coordinate>
    Then there must be a message <message>

  Example:
  | coordinate | message    |
  | A1B1       | ***Error***|

     # // there is a bug here, the expected result is "***Error***"; The actual result is"***Miss***"


  Scenario: Enter two coordinates at once that hit the ship must not be accepted
    When I enter coordinate <coordinate>
    Then there must be a message <message>

  Example:
  | coordinate | message    |
  | A5B5       | ***Error***|

    # // there is a bug here, the expected result is "***Error***"; The actual result is"***Hit***"

  Scenario: Enter blank coordinates must not be accepted
    When I enter coordinate <coordinate>
    Then there must be a message <message>

  Example:
  | coordinate | message    |
  | " "        | ***Error***|

    # // there is a bug here, the expected result is "***Error***"; The actual result is that nothing happened

  Scenario: Enter the same coordinates two times
    When I enter coordinate <coordinate>
    Then a message <message> is displayed
    When I entered the same coordinate <coordinate>
    Then a message <message 2> must be displayed

  Example:
  | coordinate | message    | message 2
  | A1         | ***Miss*** | *** Error ***

    # // there is a bug here, the expected result is "*** Error ***"; The actual result is that again the message is "***Miss***"

  Scenario: Can show a hit coordinate when we enter "show"
    When I enter  a hit coordinate <coordinate>
    Then a message <message> is displayed
    When I enter "show"
    Then all the ships are displayed including the hit coordinate <coordinate>

  Example:
  | coordinate | message
  | F1         | ***Hit***
  # // there is a bug here, the expected result is that all the coordinates where there is a ship(X) to be displayed; The actual result is that the hit coordinate is not displayed

  Scenario: When "sunk" a ship and enter the same coordinate this must not be allowed
    When I "sunk" a ship
    And enter the same coordinate <coordinate>
    Then a message <message> must be displayed

  Example:
  | coordinate | message
  | F1         | *** Error ***

    # // there is a bug here, the expected result is a message "*** Error ***". The actual result is "*** Miss ***"

  Scenario: When there is a "sunk" ship it must be displayed in the "show" display
    When I "sunk" a ship
    And enter the same "show"
    Then the sunk ship must be displayed

    # // there is a bug here, the expected result is that the hit ship must be displayed too. The actual result is that the hit ship is not displayed.

  Scenario: Can't use small letters for coordinate
    When I entered coordinate <coordinate> with small letters
    Then a message <message> must be displayed

  Example:
  | coordinate | message
  | a1         | *** Error ***

      # // there is a bug here, the expected result is that small letters must not be accepted. The actual result is that with Firefox small letters are accepted.


  Scenario: Enter zero(0) coordinate must not be accepted
    When I enter coordinate <coordinate>
    Then there must be a message <message>

  Example:
  | coordinate | message    |
  | 0          | ***Error***|

    # // there is a bug here, the expected result is "***Error***"; The actual result is that nothing happened