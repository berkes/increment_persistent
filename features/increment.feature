Feature: increment
  In order to use incrementing numbers on my system
  As a commandline user
  I want to recieve an incremented number

  Scenario: After a clean installation
    Given there is no file to store the numbers
    When I run increment
    Then a new '.increment' file must be created in users' home.
    And the number 1 is returned

  Scenario: Increment number
    Given there is a store with number 42
    When I run increment
    Then the number 43 is returned

  Scenario: Increment number 10 times
    Given there is a store with number 42
    When I run increment 10 times
    Then the number 52 is returned

  Scenario: Only read the number
    Given there is a store with number 42
    When I run the runner with '-n'
    Then the number 42 is returned
