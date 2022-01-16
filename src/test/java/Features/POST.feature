Feature: POST Request Demo

  Background:
    * url 'https://reqres.in/api'
    * header Accept = 'application/json'
    * def expectedOutput = read('postResponse1.json')
    * def inputJson = read('postRequest1.json')

#    Post request with set keyword
  @PostRequest1
  Scenario: POST Request Demo 1
    * print "Post request with set keyword"
    Given url "https://reqres.in/api/users"
    And set inputJson.data.first_name = 'test'
    And print inputJson
    And request inputJson
    When method POST
    Then status 201
    And print response

#  Post request with background keyword
  @PostRequest2
  Scenario: POST Request Demo 2
    * print "Post request with background keyword"
    Given path "/users"
    And request inputJson
    When method POST
    Then status 201
    And print response

#  Post request with Assertions
  @PostRequest3
  Scenario: POST Request Demo 3
    * print "Post request with Assertions"
    Given path "/users"
    And request inputJson
    When method POST
    Then status 201
    And print response
    And print responseHeaders
    And match response ==  {  "createdAt": "#ignore",  "name": "morpheus", "id": "#string",  "job": "leader" }

#  Post request with expected output from json file
  @PostRequest4
  Scenario: POST Request Demo 4
    * print "Post request with expected output from json file"
    Given path "/users"
    And request inputJson
    When method POST
    Then status 201
    And print response
    And print responseHeaders
    And match response ==  expectedOutput
    And print expectedOutput
    And match $ ==  expectedOutput

#  Post request with request body from json file
  @PostRequest5
  Scenario: POST Request Demo 5
    * print "Post request with request body from json file"
    Given path "/users"
    And def requestBody = read('postRequest1.json')
    And print requestBody
    And request requestBody
    When method POST
    Then status 201
    And print response
    And match response ==  expectedOutput
    And match $ ==  expectedOutput
    And match response.name == 'morpheus'

#  POST Request with examples keyword
  @PostRequest6
  Scenario Outline: POST Request Demo 6
    * print "POST Request with examples keyword"
    Given path "/users"
    And def requestBody1 = { "name": <name>,  "job": "leader"  }
    And request requestBody1
    When method POST
    Then status 201
    And print response
    And match response ==  expectedOutput
    And match $ ==  expectedOutput

    Examples:
      | name  |  |
      | test1 |  |
      | test2 |  |
      | test3 |  |

#    Post request with Karate properties
  @PostRequest7
  Scenario: POST Request Demo 7
    * print "Post request with Karate properties"
    Given path "/users"
    And def pjtPath = karate.properties['user.dir']
    And print pjtPath
    And def filePath = pjtPath + '/src/test/java/tests/request1.json'
    And print filePath
    And def requestBody = filePath
    And request requestBody
    When method POST
    Then status 201
    And print response
    And match response ==  expectedOutput
    And match $ ==  expectedOutput
    And match response.name == 'morpheus'

#  Post request with presentkeyword
  @PostRequest8
  Scenario: POST Request Demo 8
    * print "Post request with presentkeyword"
    * def requestPayload =
    """
      {
          "name": "morpheus",
          "job": "leader"
      }
    """
    * url "https://reqres.in/api/users"
    * request requestPayload
    * method POST
    * status 201
    * match $.name == '#present'
    * match $.job == '#present'
    * match $.id == '#present'
    * print response

    #  Using Java Script function
  @PostRequest9
  Scenario: POST Request Demo 9
    * print "Using Java Script function"
    * def random_string =
    """
    function(s){
      var text = "";
      var pattern = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
      for(var i=0; i<s;i++)
      text +=pattern.charAt(Math.floor(Math.random() * pattern.length()));
      return text;
    }
    """
    * def randomString = random_string(10)
    * print randomString
