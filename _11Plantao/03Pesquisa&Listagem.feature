@Funcionalidade
Feature: Pesquisa e Listagem
  Com ID e Pass de rede
  Ter executado previamente LoginPlantao.feature

  Scenario: Pesquisa Padrão
    Given executo Login Plantão
    When visualizo tela PETIÇÕES DE PLANTÃO
    Then visualizo listagem de PETIÇÕES DE PLANTÃO

   #Ponto de Verificação: Validar que ao acessar aplicação, seja carregeado resultado de pesquisa com base no valor padrão para o campo COMARCA
   # bem como para as situações PROTOCOLADA e EM ATENDIMENTO para todas as competências

  Scenario Outline: Pesquisa alterar COMARCA
    Given executo Login Plantão
    When visualizo tela PETIÇÕES DE PLANTÃO
    And informo campo COMARCA '<comarca>'
    And aciono ação PESQUISAR
    Then visualizo listagem de PETIÇÕES DE PLANTÃO

    Examples:
      | comarca |
      | Viamão  |

   #Ponto de Verificação: Validar que após alteração de valores no campo COMARCA, o restulado da pesquisa continue sendo exibido com base no novo valor
   # bem como considerando os demais filtros de SITUAÇÃO e COMPETÊNCIA

  Scenario Outline: Pesquisa alterar SITUAÇÃO
    Given executo Login Plantão
    When visualizo tela PETIÇÕES DE PLANTÃO
    And informo campo SITUAÇÃO '<situacao>'
    And aciono ação PESQUISAR
    Then visualizo listagem de PETIÇÕES DE PLANTÃO

    Examples:
      | situacao   |
      | Finalizado |
      | Arquivada  |

   #Ponto de Verificação: Validar que após alteração de valores no campo SITUAÇÃO, o restulado da pesquisa continue sendo exibido com base no novo valor
   # bem como considerando os demais filtros de COMARCA e COMPETÊNCIA

  Scenario Outline: Pesquisa alterar COMPETÊNCIA
    Given executo Login Plantão
    When visualizo tela PETIÇÕES DE PLANTÃO
    And informo campo COMPETÊNCIA '<competencia>'
    And aciono ação PESQUISAR
    Then visualizo listagem de PETIÇÕES DE PLANTÃO

    Examples:
      | competencia |
      | JEC         |
      | JEFP        |
      | FP          |

   #Ponto de Verificação: Validar que após alteração de valores no campo COMEPTÊNCIA, o restulado da pesquisa continue sendo exibido com base no novo valor
   # bem como considerando os demais filtros de COMARCA e SITUAÇÃO

  Scenario Outline: Pesquisa Nome da Parte
    Given executo Login Plantão
    When visualizo tela PETIÇÕES DE PLANTÃO
    And informo campo COMARCA '<comarca>'
    And informo campo NOME DA PARTE '<nomeparte>'
    And aciono ação PESQUISAR
    Then visualizo listagem de PETIÇÕES DE PLANTÃO

    Examples:
      | comarca | nomeparte |
      | Todas   | tst001    |

   #Ponto de Verificação: Validar que após alteração de valores nos campos seja apresentado resultado de pesquisa com base no campo NOME DA PARTE

  Scenario Outline: Pesquisa Ano
    Given executo Login Plantão
    When visualizo tela PETIÇÕES DE PLANTÃO
    And informo campo ANO '<ano>'
    And aciono ação PESQUISAR
    Then visualizo listagem de PETIÇÕES DE PLANTÃO

    Examples:
      | ano  |
      | 2017 |

   #Ponto de Verificação: Validar que após alteração de valores nos campos seja apresentado resultado de pesquisa com base no campo ANO

  Scenario Outline: Pesquisa Número do Protocolo
    Given executo Login Plantão
    When visualizo tela PETIÇÕES DE PLANTÃO
    And informo campo NÚMERO DO PROTOCOLO '<numero>'
    And aciono ação PESQUISAR
    Then visualizo listagem de PETIÇÕES DE PLANTÃO

    Examples:
      | numero               |
      | ** INCLUIR NUMERO ** |

   #Ponto de Verificação: Validar que após alteração de valores nos campos seja apresentado resultado de pesquisa com base no campo NÚMERO DO PROTOCOLO

  Scenario: Pesquisa Ação Limpar
    Given executo Login Plantão
    When visualizo tela PETIÇÕES DE PLANTÃO
    And executo Pesquisa alterar COMARCA
    And aciono ação LIMPAR
    Then visualizo listagem de PETIÇÕES DE PLANTÃO

   #Ponto de Verificação: Validar ao acionar a ação LIMPAR os campos de COMARCA, SITUAÇÃO e COMPETÊNCIA voltam a apresentar seus valores padrões
   # e o resultado da pesquisa apresentado com base nesses padrões de filtros