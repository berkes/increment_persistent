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

  Scenario: Increment a number named "invoice"
    Given there is a store with number 42 named "invoice"
    When I run increment on "invoice"
    Then the number 43 for "invoice" is returned

  Scenario: Increment numbers named "invoice" and "quotation"
    Given there is a store with number 42 named "invoice"
    And there is a store with number 1337 named "quotation"
    When I run increment on "invoice"
    And I run increment on "quotation"
    Then the number 43 for "invoice" is returned
    And the number 1338 for "quotation" is returned

  Scenario: List all numbers
    Given there is no file to store the numbers
    And there is a store with number 3 named "foo"
    And there is a store with number 7 named "bar"
    And there is a store with number 11 named "baz"
    When I request the list
    Then the list returns "foo:3", "bar:7" and "baz:11"


