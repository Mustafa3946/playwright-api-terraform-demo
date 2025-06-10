Feature: Status Check

  Scenario: Check service status
    Given the API is available
    When I call the /status endpoint
    Then the response code should be 200
