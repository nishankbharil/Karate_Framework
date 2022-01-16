Feature: PUT Request Demo

  @PUTRequest1
  Scenario Outline: POST Request Demo
    Given url 'https://reqres.in/api/users/2'
    And def requestBody =
    """
    {
        "name": <name>,
        "job": "zion resident"
    }
    """
    And request requestBody
    When method PUT
    Then status 200
    And print response
    And def response1 = read('putResponse1.json')
    And match response == response1
    Examples:
      | name  |  |
      | test1 |  |
      | test2 |  |
      | test3 |  |
