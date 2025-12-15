Feature: Take Home API Test - Filter by id

  Background:
    * url baseUrl
  #current APIs does not have any authentication nor additional headers, if present those can be added here

  @getItem
  Scenario Outline: Filter by id = <id>
    Given path 'inventory/filter'
    And param id = <id>
    When method get
    Then status 200
    And karate.log('Filtered menu item: ', response)
    #Verifies that the response contains the expected field values
    And match response == { id: <id>, name: <name>, image: <image>, price: <price> }

    Examples:
      | id  | name            | image         | price |
      | '3' | Baked Rolls x 8 | roll.png      | $10   |
      | '4' | Garlic Mix      | garlicmix.png | $9    |