#Author: Martina Santos
#Date: xx/xx/2017
#Keywords Summary:
#Feature: AssinaturaRPV_JEFP
#Description:

@Funcionalidade
Feature: Assinatura de RPV Eletronico
  Como usuario de perfil Magistrado
  Com atuacao de COMARCA DE PORTO ALEGRE - JEFP

  @Scenario1
  Scenario: Assinatura de RPV Eletronico - Acessar tela mantermodulodecisao
    Given acesso site eThemis
    And preencho campo LOGIN USUARIO
    And preencho campo LOGIN SENHA
    And clico botao LOGIN ACESSAR
    And seleciono combo HOME ATUACAO
    And clico aba DCCUMENTOS
    And clico pasta RPV ELETRONICO
    And verifico grid DOCUMENTOS PARA ASSINATURA
    And marco radio DOCUMENTO
    When clico botao ASSINAR
    Then verifico documento ser removido grid documentos para assinatura
    #Ponto de Verificacao, garantir que o documento de RPV Eletronico foi assinado e emcaminhado para o cartório


  @Scemnario2
  Scenario: Assinatura de RPV eletrônico - Pesquisar
    #COMPLETAR
