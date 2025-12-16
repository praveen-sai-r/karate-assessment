Feature: Take Home API Test - Add item with non-existent id
  Background:
    * url baseUrl
    #current APIs does not have any authentication nor additional headers, if present those can be added here

    #Reading the js file that generates request body with random data
    * def requestBodyBuilder = read('classpath:payload/requestBodyWithRandomData.js')

  @addItem
  Scenario: Add item with non-existent id
    # Calling the js function to generate request body
    * def requestbody = requestBodyBuilder()

    Given path 'inventory/add'
    And request requestbody
    And karate.log('Request body: ', requestbody)
    When method post
    Then status 200