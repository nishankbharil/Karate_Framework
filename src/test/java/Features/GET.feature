Feature: Get Request Demo

  Background:
    * url 'https://reqres.in/api/'
    * header Accept = 'application/json'

  # This is simple Get request
  @GetRequest1
  Scenario: Get Request Demo 1
    * print "Simple Get request"
    Given url 'https://reqres.in/api/users?page=2'
    When method GET
    Then status 200
    And print response
    And print responseStatus
    And print responseTime
    And print responseHeaders
    And print responseCookies

  # This is get request with background
  @GetRequest2
  Scenario: Get Request Demo 2
    * print "GET request with background keyword"
    Given path '/users?page=2'
    When method GET
    Then status 200

  # This is Get request with Path parameter and Query Parameter
  @GetRequest3
  Scenario: Get Request Demo 3
    * print "Get request with Path parameter and Query Parameter"
    Given path '/users'
    And param page = 2
    When method GET
    Then status 200

  # Get request with Assertions
  @GetRequest4
  Scenario: Get Request Demo 4
    * print "Get request with Assertions"
    Given path '/users'
    And param page = 2
    When method GET
    Then status 200
    And print response
    And match response.data[0].first_name != null
    And assert response.data.length == 6
    And match response.data[3].id == 10

  # Get request without Gherkin keywords
  @GetRequest5
  Scenario: Get Request Demo 5
    * print "Get request without Gherkin keywords"
    * path '/users'
    * param page = 2
    * method GET
    * status 200
    * print response
    * match response.data[0].first_name != null
    * assert response.data.length == 6
    * match response.data[3].id == 10

  # Get request with query param and headers
  @GetRequest6
  Scenario: Get Request Demo 6
    * print "Get request with query param and headers"
    * def query = {status: 'active'}
    Given url 'https://gorest.co.in/public/v1/users'
    And header content-type = 'application/json'
    And header connection = 'keep-alive'
    And params query
    When method GET
    Then status 200
    And print response
    And def userCount = response.data.length
    And print userCount

# Get request headers in different format
  @GetRequest7
  Scenario: Get Request Demo 7
    * print "Get request headers in different format"
    * def headers1 = {content-type : 'application/json', connection : 'keep-alive' }
    Given headers headers1
    When url 'https://gorest.co.in/public/v1/users'
    And path '30'
    When method GET
    Then status 200
    And print response

# Get request headers format2
  @GetRequest8
  Scenario: Get Request Demo 8
    * print "Get request headers format2"
    * configure headers = {content-type : 'application/json', connection : 'keep-alive' }
    Given url 'https://gorest.co.in/public/v1/users'
    And path '30'
    When method GET
    Then status 200
    And print response

 # Get request with authentication token
#  @GetRequest9
#  Scenario: Get Request Demo 9
#    * print taokenId
#    Given header Authorization = 'Bearer' + tokenId
#    Given url 'https://gorest.co.in/public/v1/users'
#    And path '30'
#    When method GET
#    Then status 200


