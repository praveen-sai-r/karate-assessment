Feature: Take Home API Test - Add item with existing id

  Background:
    * url baseUrl
  #current APIs does not have any authentication nor additional headers, if present those can be added here

  @addItem
  Scenario Outline: Add item with existing id = <id> again
    * def requestbody = read('classpath:payload/takeHomeMenu_requestBody.json')
    Given path 'inventory/add'
    And request requestbody
    And karate.log('Request body: ', requestbody)
    When method post
    Then status 400
    Examples:
      | id | name     | image        | price |
      | 10 | Hawaiian | hawaiian.png | $14   |