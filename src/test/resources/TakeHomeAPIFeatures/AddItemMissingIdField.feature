Feature: Take Home API Test - Add item missing id field

  Background:
    * url baseUrl
  #current APIs does not have any authentication nor additional headers, if present those can be added here


  @addItem
  Scenario Outline: Add item missing id field
    * def requestbody = read('classpath:payload/takeHomeMenu_requestBody.json')
    Given path 'inventory/add'
    And karate.log('Request body before removal of id field: ', requestbody)
    And remove requestbody.id
    And request requestbody
    And karate.log('Request body after removal of id field: ', requestbody)
    When method post
    Then status 400
    #Verifies that the response contains the expected text
    And match response contains "Not all requirements are met"
    Examples:
      | name   | image      | price |
      | Veggie | veggie.png | $12   |