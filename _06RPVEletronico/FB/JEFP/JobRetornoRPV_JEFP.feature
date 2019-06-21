#Author: Martina Santos
#Date: xx/xx/2017
#Keywords Summary:
#Feature: JobRetornoRPV_JEFP
#Description:

@Funcionalidade
Feature: Execucao do Job de Retorno do RPV Eletronico
  No SoupUI metodo APP_RETORNO_RPV_ELETRONICO

  @Scenario1
  Scenario: Exucucao do Job de Retorno do RPV Eletronico - Acessar metodo no SoupUI
    Given acesso SoupUI
    And acesso metodo APP_RETORNO_RPV_ELETRONICO
    And informo url ambiente
    And informo nomeJob
    When submeto metodo
    Then verifico retorno metodo
    And verifico recebimento de e-mail
    And verifico documento xml consunido

    #Ponto de Verificacao, garantir que metodo executou
    #Ponto de Verificacao, garantir que foi exibido retorno apos execucao do metodo
    #Ponto de Verificacao, garantir que o e-mail com informacoes contidas no xml do RPV foi recebido
    #Ponto de Verificacao, garantir que apos execucao do metodo o xml foi consumido da pasta de retorno no trocadoc
