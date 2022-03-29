# language: en
Feature: Create a new rule or route drop

Scenario: Create a new rule to successfully drop 100% traffic by source type
    Given that of the traffic-generator app is sending requests to app-test
    When a new rule is commited to drop 100% of the requests whose origin is the traffic generator
    And and the value 'web' is found in the 'X-SCOPE-TYPE' header of the requests
    Then the control-plane must drop 100% of requests and  value close to 100% of the requests drop will be displayed in the 'http_request_failed' metric in the traffic-generator results