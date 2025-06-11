Feature: Status Check

  Scenario: API returns 200 OK
    Given the API is available
    When I call the endpoint "status/200"
    Then the response code should be 200
    And the response body should be empty
    And the Content-Type should be "text/html"

  Scenario: API returns 404 Not Found
    Given the API is available
    When I call the endpoint "status/404"
    Then the response code should be 404
    And the response body should be empty
    And the Content-Type should be "text/html"
