Feature: Casos de Prueba del Metodo POST

  Background:
    * configure ssl = true
    Given url baseURLPetStore

  Scenario: Actualizar nombre y estado de la mascota: Resultado Exitoso
    * def schema = {code:'#number', message:'#string', type:'#string'}
    * def petID = 21
    * path '/v2/pet/'+petID
    And form field name = "Tyson"
    And form field status = "pending"
    When method POST
    Then status 200
    And print response
    * assert response.code == 200
    * assert response.message == petID
    * match response == schema

  Scenario: Actualizar nombre y estado de la mascota: Resultado No exitoso
    * def schema = {code:'#number', message:'#string', type:'#string'}
    * def petID = 9999
    * path '/v2/pet/'+petID
    And form field name = "Tyson"
    And form field status = "pending"
    When method POST
    Then status 404
    And print response
    * assert response.code == 404
    * assert response.message == "not found"
    * match response  == schema