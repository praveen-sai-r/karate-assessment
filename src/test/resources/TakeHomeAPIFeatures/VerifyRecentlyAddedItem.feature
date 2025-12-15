Feature: Take Home API Test - Verify recently added item

  Background:
    * url baseUrl
  #current APIs does not have any authentication nor additional headers, if present those can be added here


  @getItem
  Scenario: Verify recently added item is persistent
    #Adding a new item
    * karate.log('-----Starting AddItemWithNonExistentId.feature-----')
    * def recetlyAddedItem = karate.call('classpath:TakeHomeAPIFeatures/AddItemWithNonExistentId.feature').requestbody
    * karate.log('-----AddItemWithNonExistentId.feature Ends-----')
    #Verifying recently added item is persistent
    Given path 'inventory/filter'
    And param id = recetlyAddedItem.id
    When method get
    Then karate.log('Response data: ', response)
    And status 200
    #Verifies that each item in the response contains the expected values
    And match response contains { id: '#(recetlyAddedItem.id)', name: '#(recetlyAddedItem.name)', image: '#(recetlyAddedItem.image)', price: '#(recetlyAddedItem.price)' }
