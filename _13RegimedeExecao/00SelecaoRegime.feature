@Funcionalidade
Feature: Seleção de Regime
  Como usuário de perfil COORDENADOR CORREGEDORIA (et1g-coordenador_cgj)
  Com atuação de COMARCA DE PORTO ALEGRE - JEC

  @Scenario1
  Scenario: Acessa Tela Regime de Exceção
    Given efetuo login APLICACAO
    When aciono opcao REGIME DE EXCECAO
    Then visualizo tela REGIME DE EXECAO

#Ponto de verificação:
#(1) Validar que ao acionar a opção de MENU REGIME DE EXCEÇÃO seja exibida tela de Regime de Exceção com seus FILTROS DE CONSULTA, opção NOVO REGIME e grid com RESULTADO DA PESQUISA
#(2) Validar que ao ser carregada a listagem devem ser exibidos APENAS os Regimes de Exceção ATIVOS

  @Scenario2
  Scenario: Realizar Pesquisa de Regime de Exceção
    Given visualizo tela REGIME DE EXECAO
    And prencho campo LISTAGEM DE REGIMES DE EXCECÃO
    When aciono botao PESQUISA NOS REGIMES DE EXCEÇÃO
    Then visualizo resultado

#Ponto de verificação:
#(1) Validar que resultado da pesquisa apresente valores válidos apra o filtro aplicado

  @Scenario3
  Scenario: Pesquisar Regimes de Exceção Inativos
    Given visualizo tela REGIME DE EXECAO
    And prencho campo LISTAGEM DE REGIMES DE EXCECÃO
    And desmarco campo LISTAR APENAS REGIMES DE EXCEÇÃO ATIVOS
    When aciono botao PESQUISA NOS REGIMES DE EXCEÇÃO
    Then visualizo resultado

#Ponto de verificação:
#(1) Validar que resultado da pesquisa apresente valores válidos apra o filtro aplicado
#(2) Validar que sejam exibidos resultado considerando os REGIMES DE EXCEÇÃO INATIVOS