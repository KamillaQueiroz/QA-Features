#Author: Martina Santos
#Date: xx/xx/2017
#Keywords Summary:
#Feature: JobEnvioPV_JEFP
#Description:

@Funcionalidade
Feature: Execucao do Job de Envio do RPV Eletronico
  No SoupUI metodo APP_ENVIO_RPV_ELETRONICO

  @Scenario1
  Scenario: Exucucao do Job de Envio RPV Eletrônico - Acessar metodo no SoupUI
    Given acesso SoupUI
    And acesso metodo APP_ENVIO_RPV_ELETRONICO
    And informo url ambiente
    And informo tag nomeJob
    When submeto metodo
    Then verifico retorno metodo
    And verifico recebimento de e-mail
    #Ponto de Verificacao, garantir que o método é executado
    #Ponto de Verificação, garantir que o e-mail de notificação de envio do RPV foi recebido