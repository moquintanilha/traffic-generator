# language: en
Feature: Update rule or route drop

Scenario: Create a new rule to successfully drop 100% traffic by method
    Given that of the traffic-generator app is sending requests to an app-test
    When a new rule is commited to drop 100% of the requests whose origin is the traffic generator
    And requests with the POST method are sent
    Then the control-plane must drop 100% of requests and value close to 100% of the requests drop will be displayed in the 'http_request_failed' metric in the traffic-generator results