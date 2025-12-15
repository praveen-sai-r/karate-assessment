Feature: Add item with non-existent id
  Background:
    * url baseUrl
    #current APIs does not have any authentication nor additional headers, if present those can be added here

  Scenario: Add item with non-existent id
    # Using utility feature to generate random data
    * def requestbody = karate.call('classpath:utilityFeatures/RequestBodyWithRandomData.feature').requestbody

    Given path 'inventory/add'
    And request requestbody
    And karate.log('Request body: ', requestbody)
    When method post
    Then status 200