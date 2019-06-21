@Funcionalidade
Feature: Detalhes da Petição
  Com ID e Pass de rede
  Ter executado previamente LoginPlantao.feature
  Ter executado previamente Pesquisa&Listagem.feature

  Scenario: Exibir Detalhes Petição - Situação PROTOCOLADA
    Given executo Pesquisa Padrão
    When visualizo resultado pesquisa
    And identifico petição SITUAÇÃO PROTOCOLADA
    And aciono petição
    Then visualizo tela DETALHES DA PETIÇÃO DE PLANTÃO
    And identifico ação INICIAR ATENDIMENTO

    #Ponto de Validação: verificar que ao acionar a petição seus detalhes sejam exibidos e que seja possivel iniciar o atendimento

  Scenario: Exibir Detalhes Petição - Situação EM ATENDIMENTO
    Given executo Pesquisa Padrão
    When visualizo resultado pesquisa
    And identifico petição EM ATENDIMENTO
    And aciono petição
    Then visualizo tela DETALHES DA PETIÇÃO DE PLANTÃO
    And identifico ação FINALIZAR

    #Ponto de Validação: verificar que ao acionar a petição seus detalhes sejam exibidos e que seja possivel finalizar o atendimento

  Scenario: Exibir Detalhes Petição - Situação FINALIZADA
    Given executo Pesquisa alterar SITUAÇÃO
    When visualizo resultado pesquisa
    And identifico petição FINALIZADA
    And aciono petição
    Then visualizo tela DETALHES DA PETIÇÃO DE PLANTÃO
    And identifico ação REABRIR ATENDIMENTO

    #Ponto de Validação: verificar que ao acionar a petição seus detalhes sejam exibidos e que seja possivel reabrir o atendimento

  Scenario: Exibir Detalhes Petição - Situação ARQUIVADA
    Given executo Pesquisa alterar SITUAÇÃO
    When visualizo resultado pesquisa
    And identifico petição ARQUIVADA
    And aciono petição
    Then visualizo tela DETALHES DA PETIÇÃO DE PLANTÃO

    #Ponto de Validação: verificar que ao acionar a petição seus detalhes sejam exibidos