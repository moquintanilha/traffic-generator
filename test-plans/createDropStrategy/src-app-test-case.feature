# language: en
Feature: Create a new rule or route drop

Scenario: Create a new rule to successfully drop 50% traffic by source application
    Given that of the traffic-generator app is sending requests to app-test
    When a new rule is commited to drop 50% of the requests whose origin is the traffic generator
    And the name of the application originating the request is present in the X-SOURCE-APPLICATION header
    Then the control-plane must drop 50% of requests and  value close to 50% of the requests drop will be displayed in the 'http_request_failed' metric in the traffic-generator results