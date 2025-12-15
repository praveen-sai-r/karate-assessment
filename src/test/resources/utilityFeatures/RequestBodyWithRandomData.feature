Feature: RequestBody builder with Random Data
  Scenario: Add item with non-existent id = <id>
    * karate.log('---Inside request body builderwith randomly generated data---')
    * def requestbody = read('classpath:payload/takeHomeMenu_requestBody.json')
    * def randomDataGenerator = Java.type('utilities.RandomDataGenerator')
    * set requestbody.id = randomDataGenerator.generateRandomId()
    * set requestbody.price = randomDataGenerator.generateRandomPrice()
    * set requestbody.name = randomDataGenerator.generateRandomName()
    * set requestbody.image = randomDataGenerator.generateRandomImage()
    * karate.log('Request body with randomly generated data:', requestbody)
    * karate.log('---Randomly generated data Scenario completed---')