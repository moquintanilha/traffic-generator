# language: en
Feature: Create a new rule or route drop

Scenario: Create a new rule to successfully drop 70% traffic coming from scope categorized as 'medium'
    Given that of the traffic-generator app is sending requests to app-test
    When a new rule is commited to drop 70% of the requests whose origin is the traffic generator
    And the requets coming from scope categorized as 'medium' in X-SCOPE-CRITICALY header
    Then the control-plane must drop 70% of requests and  value close to 70% of the requests drop will be displayed in the 'http_request_failed' metric in the traffic-generator results