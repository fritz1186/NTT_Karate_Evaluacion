Feature: Casos de Prueba del metodo Get
  Background:
    * configure ssl = true
    Given url baseURLPetStore

  Scenario: Listar las mascotas con estado 'available'
    * path '/v2/pet/findByStatus?'
    * param status = 'available'
    When method get
    Then status 200
    And print response
    * match each response contains {status : 'available'}


  Scenario: Listar las mascotas con estado 'pending'
    * path '/v2/pet/findByStatus?'
    * param status = 'pending'
    When method get
    Then status 200
    And print response
    * match each response contains {status : 'pending'}


  Scenario: Listar las mascotas con estado 'sold'
    * path '/v2/pet/findByStatus?'
    * param status = 'sold'
    When method get
    Then status 200
    And print response
    * match each response contains {status : 'sold'}


  Scenario Outline: Listar las mascotas y verificar por cada tipo de Estado
    * path '/v2/pet/findByStatus?'
    * param status = estados
    When method get
    Then status 200
    And print response
    * match each response contains {status : "#(resultado)"}
    Examples:
      | estados   | resultado |
      | available | available |
      | pending   | pending   |
      | sold      | sold      |
