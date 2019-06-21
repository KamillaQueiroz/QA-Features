@Funcionalidade
Feature: Preferências
  Com ID e Pass de rede
  Ter executado previamente LoginPlantao.feature

  Scenario Outline: Preferências - Primeiro acesso
    Given executo Login Plantão - Primeiro acesso
    When visualizo tela PREFERÊNCIAS DE USUÁRIO
    And informo campo COMARCA '<comarca>'
    And aciono ação SALVAR
    Then visualizo tela PETIÇÕES DE PLANTÃO

    Examples:
      | comarca      |
      | Porto Alegre |

   #Ponto de Verificação: Validar que ao informar valor para o campo COMARCA e salvar esse, ao retornar para tela de PETIÇÕES DE PLANTÃO, sejam apresentados
   # o valor salvo no campo COMARCA e a listagem apresente somente valores relacionados ao mesmo

  Scenario Outline: Preferências - Alterar valore
    Given executo Preferências - Primeiro acesso
    When aciono ação PREFERÊNCIAS
    And informo campo COMARCA '<comarca>'
    And aciono ação SALVAR
    Then visualizo tela PETIÇÕES DE PLANTÃO

    Examples:
      | comarca      |
      | Feliz        |

   #Ponto de Verificação: Validar que seja possivel alterar preferências de usuário e que ao retornar tela de PETIÇÕES DE PLANTÃO, sejam apresentados
   # o valor salvo no campo COMARCA e a listagem apresente somente valores relacionados ao mesmo

  Scenario: Preferências - Ação Voltar
    Given executo Preferências - Primeiro acesso
    When aciono ação PREFERÊNCIAS
    And aciono ação VOLTAR
    Then visualizo tela PETIÇÕES DE PLANTÃO

   #Ponto de Verificação: Validar que seja possivel  retornar para tela de PETIÇÕES DE PLANTÃO sem que sejam sofridas alterações quanto as preferências
   # cadastradas anteriormente e que a listagem apresente somente valores relacionados ao mesmo