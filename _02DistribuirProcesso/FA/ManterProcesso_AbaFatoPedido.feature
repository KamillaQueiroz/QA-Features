#Author: Kamilla Xavier
#Review Date: 24/01/2018
#Keywords Summary:
#Feature: ManterProcesso_AbaFatoPedido
#Description:

@Funcionalidade
Feature: Manter Processo - Termo Entregue Aba Classificação
  Como usuário de perfil SERVIDOR
  Com atuação de COMARCA DE PORTO ALEGRE - JEFP / JEC
  Ter executado cenário de CadastroProcesso
  Ter executado cenário de PesquisaProcesso
  Processo com Estado 'Em Cadastramento'

  Scenario Outline: Informar Dados Fato-Pedido
    Given executo Scenario Editar Processo
    When visualizo página MANTER PROCESSO 1G
    And aciono aba FATO-PEDIDO
    And preencho campo FATO '<fato>'
    And preencho campo PEDIDO '<pedido>'
    And aciono botão SALVAR
    Then visualizo informações

    Examples:
      | fato           | pedido           |
      | FATO TESTE 001 | PEDIDO TESTE 001 |

#Ponto de Verificação, validar que as informações inseridas são salvas

  Scenario: Fato-Pedido Termo Entregue em Mãos
    Given executo Scenario Editar Processo
    When visualizo página MANTER PROCESSO 1G
    And aciono aba FATO-PEDIDO
    And assinalo campo TERMO ENTREGUE EM MÃOS PELA PARTE
    And aciono botão SALVAR
    Then visualizo campo FATO
    And visualizo campo PEDIDO

#Ponto de Verificação, validar que ao assinar a opção TERMO ENTREGUE EM MÃOS PELA PARTE, os campos são preenchidos automaticamente
#Ponto de Verificação, validar que que o valor na tela PROCESSO, coluna IN_TERMO_PARTE está de acordo com a opção escolhida (IN_TERMO_PARTE = S)

  Scenario: Validação Termo Entregue em Mãos
    Given executo Scenario Editar Processo
    When visualizo página MANTER PROCESSO 1G
    And aciono aba FATO-PEDIDO
    And desmarco campo TERMO ENTREGUE EM MÃOS PELA PARTE
    And aciono botão SALVAR
    Then visualizo campo FATO
    And visualizo campo PEDIDO
    And visualizo aba FINALIZAÇÃO

#Ponto de Verificação, validar que ao desmarcar a opção TERMO ENTREGUE EM MÃOS PELA PARTE, os campos perdem o preenchimento automaticamente
#Ponto de Verificação, validar que que o valor na tela PROCESSO, coluna IN_TERMO_PARTE está de acordo com a opção escolhida (IN_TERMO_PARTE = N)
#Ponto de Verificação, validar que na aba FINALIZAÇÃO seja exibida informação que os campos FATO e PEDIDO não foram informados
