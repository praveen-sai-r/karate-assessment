Feature: Take Home API Test

  Background:
    * url baseUrl

  @getItem
  Scenario: Get all menu items
    Given path 'inventory'
    When method get
    Then status 200
    And assert response.data.length >= 9
    #Verifies that each item in the response contains the expected fields
    And match each response.data contains { id: '#notnull', name: '#notnull', price: '#notnull', image: '#notnull' }

  @getItem
  Scenario: Filter by id = 3
    Given path 'inventory/filter'
    And param id = 3
    When method get
    Then status 200
    And match response == { id: "3", name: "Baked Rolls x 8", image: "roll.png", price: "$10" }

  @addItem
  Scenario Outline: Add item with non-existent id = <id>
    * def requestbody = read('classpath:payload/takeHomeMenu_requestBody.json')
    Given path 'inventory/add'
    And request requestbody
    When method post
    Then status 200

    # change body details after every test, increase id
    Examples:
      | id | name     | image        | price |
      | 10 | Hawaiian | hawaiian.png | $14   |

  @addItem
  Scenario Outline: Add item with existing id = <id> again
    * def requestbody = read('classpath:payload/takeHomeMenu_requestBody.json')
    Given path 'inventory/add'
    And request requestbody
    When method post
    Then status 400
    Examples:
      | id | name     | image        | price |
      | 10 | Hawaiian | hawaiian.png | $14   |

  @addItem
  Scenario Outline: Add item missing id field
    * def requestbody = read('classpath:payload/takeHomeMenu_requestBody.json')
    Given path 'inventory/add'
    And remove requestbody.id
    And request requestbody
    When method post
    Then status 400
    And match response contains "Not all requirements are met"
    Examples:
      | name   | image      | price |
      | Veggie | veggie.png | $12   |

  @getItem
  Scenario: Verify recently added item (id=10) is present
    Given path 'inventory'
    When method get
    Then status 200
    And match response.data contains { id: "10", name: "Hawaiian", image: "hawaiian.png", price: "$14" }