Feature: Casos de Prueb Metodo Put

  Background:
    *  configure ssl = true
    Given url baseURLPetStore

  Scenario: Actualizar una mascota existente
    * def bodyRequest = read('classpath:data/ActualizacionUsuarioBody.json')
    * path '/v2/pet'
    * request bodyRequest
    When method PUT
    Then status 200
    And print response
    * assert response.name == "Bobi"
    * assert response.status == "sold"