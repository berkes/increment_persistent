Feature: increment
  In order to use incrementing numbers on my system
  As a commandline user
  I want to recieve an incremented number

  Scenario: After a clean installation
    Given there is no file to store the numbers
    When I run increment
    Then a new '.increment' file must be created in users' home.
