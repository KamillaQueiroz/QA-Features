#Author: Martina Santos
#Date: xx/xx/2017
#Keywords Summary:
#Feature: JobRetornoRPV_DocXML_JEFP
#Description:

@Funcionalidade
Feature: Arquivo xml no trocadoc
  Editar xnl no trocadoc para executar metodo APP_RETORNO_RPV_ELETRONICO

  @Scenario1
  Scenario: Xml de envio do RPV Eletronico - Acessar pasta trocadoc
    Given acesso pasta TROCADOC
    And acesso pasta ENVIAR
    And edito respectivo arquivo RPV ELETRONICO
    And informo tags SITUACAO e MSGERRO
    And informo (_r) final nome documento
    When salvo documento xml na pasta receber
    And removo documento xml antigo pasta enviar
    Then verifico documento pasta retorno

    #Ponto de Verificacao, garanti que o xml foi salvo na pasta retorno com as tags situacao e msgerro de cada RPV Eletronico
    #Ponto de Verificação, garantir que o xml antido foi removido da pasta enviar