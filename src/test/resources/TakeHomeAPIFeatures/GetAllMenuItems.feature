Feature: Take Home API Test - Get all menu items

  Background:
    * url baseUrl
    #current APIs does not have any authentication nor additional headers, if present those can be added here

  @getItem
  Scenario: Get all menu items
    Given path 'inventory'
    When method get
    Then status 200
    And assert response.data.length >= 9
    And karate.log('Number of menu items: ', response.data.length)
    #Verifies that each item in the response contains the expected fields
    And match each response.data contains { id: '#notnull', name: '#notnull', price: '#notnull', image: '#notnull' }
