@Funcionalidade
Feature: Login Plantão
  Com ID e Pass de rede

  Scenario Outline: Login Plantão - Primeiro acesso
    Given acesso PLANTÃO ELETRÔNICO
    When visualizo tela LOGIN
    And preencho campo USUÁRIO '<usuario>'
    And preencho campo SENHA '<senha>'
    And aciono botão ENTRAR
    Then realizo login
    And acesso aplicação
    And visualizo tela PREFERÊNCIAS DE USUÁRIO

    Examples:
      | usuario    | senha        |
      | Id de Rede | Pass de Rede |

  #Ponto de Verificação: validar que para o primeiro acesso, usuário seja encaminhado para tela de preferências

  Scenario Outline: Login Plantão
    Given acesso PLANTÃO ELETRÔNICO
    When visualizo tela LOGIN
    And preencho campo USUÁRIO '<usuario>'
    And preencho campo SENHA '<senha>'
    And aciono botão ENTRAR
    Then realizo login
    And acesso aplicação
    And visualizo tela PETIÇÕES DE PLANTÃO

    Examples:
      | usuario    | senha        |
      | Id de Rede | Pass de Rede |

   #Ponto de Verificação: validar que o usuário consiga realizar seu login com sucesso e seja encaminhado para tela de listagem de petições (Petição de Plantão)