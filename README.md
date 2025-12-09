# Restaurant Item API Tests (Karate)

This repository contains automated API tests for a sample Restaurant
backend service, implemented using the Karate BDD framework in a Maven
project. The tests cover core operations for retrieving item details, and adding new items to the menu.

## Tech stack

-   Java (test runtime)
-   Karate (API test automation, BDD style)
-   Maven (build and test runner)
-   Docker (API container runtime)

------------------------------------------------------------------------

## Prerequisites

-   Docker installed and running(to host the API container locally)
-   Java 21
-   Maven (latest versions preferred)
-   Git (to clone this repository)

------------------------------------------------------------------------

## 1. Start the API using Docker

1.  Pull the docker image:  `docker pull automaticbytes/demo-app`

2.  Run the container, exposing the API port: `docker run -p 3100:3100 automaticbytes/demo-app`

    -   Once started, the API should be accessible at: `http://localhost:3100/api`

------------------------------------------------------------------------

## 2. Project structure

The project is structured as follows:
-   `src/test/java` - Contains the Karate tests
-   `src/test/resources/<FeatureName>` - Contains the Karate feature files which define the test scenarios
-   `src/test/resources/payload` - Contains the Karate payload files
-   `src/test/resources/karate-config.js` - Contains the Karate configuration file
-   `target/karate-reports` - Contains the Karate reports

## 3. Configurations

-   `pom.xml` - Maven build configuration
-   `src/test/resources/karate-config.js` - It is used to define global and environment-specific variables and configurations that can be accessed and utilized across feature files.
-   Project is configured to have features files in either `src/test/java` or `src/test/resources` and currently the feature file is in `src/test/resources/TakeHomeAPIFeatures`.
-   The runner file should be in `src/test/java` and named should end with "Test.java"
-   Project is configured to handle multiple environments using the `karate-env` property in the `karate-config.js` file. The default environment is `local`, had a placeholder for `dev`, `qa` and `uat` environments.

------------------------------------------------------------------------

## 4. Implemented test scenarios

### getItemDetails

-   Fetch all menu items and validate response
-   Fetch item details by ID and validate response
-   Fetch recently added item to confirm persistence
    

### addNewItem

-   Add new item and validate response
-   Add existing item and validate response
-   Negative case: missing mandatory fields
     - For all the POST requests, scenario outline is used and is implemented by reading the payload from a file and assigning the values from examples.

------------------------------------------------------------------------

## 5. Running the tests   

1.  Clone the repository: `git clone https://github.com/praveen-sai-r/karate-assessment.git`
2.  Navigate to the project directory: `cd karate-assessment`
3.  Build the project/Install dependencies
4.  Run the tests:
     - Run all tests: ```mvn clean test```
     - Run a specific test: `mvn clean test -Dtest=<TestClassName>`
     - Run test with specific tags: `mvn clean test -Dkarate.options="--tags @<tagName>` (getItem - for GET requests,addItem - for POST requests are custom tags defined in the feature files)

Reports generated under: 
- target/surefire-reports
- target/karate-reports

------------------------------------------------------------------------

## 6. Notes and assumptions

-   Tests align with the API contract from the Docker image.
-   Only requested endpoints and scenarios are automated.
-   Focus is test design + Karate usage.
