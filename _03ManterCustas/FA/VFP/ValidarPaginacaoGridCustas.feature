#Author: Sheila Lopes
#Date: 16/08/2017
#Keywords Summary : Custas Iniciais, Número de Registros, Página
#Feature: ValidarPaginacaoGridCustas
#Description: Essa feature tem a finalidade de validar a paginação da grid Custas, a medida que
#o número de registros é configurado na grid.

@Funcionalidade
Feature: Validar Paginacao Grid Custas
  Como usuário de perfil SERVIDOR
  Com atuação de COMARCA DE PORTO ALEGRE - VFP

  @Scenario1
  Scenario: Acessar Manter Custas
    Given acesso site eThemis
    And acesso tela PROCESSO
    And seleciono combo HOME ATUACAO
    And informo campo NUMERO "<numero>"
    And clico botao PESQUISAR
    And clico botao Verificar Providencias
    When clico grid CUSTAS
    Then visualizo filtro TIPO DE CUSTAS

  @Scenario2
  Scenario: Gerar Custas com um Pagante Parcelado
    Given clico botao NOVAS CUSTAS
    And seleciono como TIPO DE CUSTAS 'Custas Iniciais'
    And seleciono combo PAGANTE
    And clico botao ADICIONAR
    And informo campo PARCELAS '22'
    And clico botao GERAR CUSTAS
    And visualizo mensagem 'Custas geradas com sucesso.'
    When clico botao SAIR
    Then visualizo grid CUSTAS 'Ver 1-10 de 22'

# Ponto de Verificação, após clicar em SAIR, modal NOVAS CUSTAS é fechada e grid CUSTAS é exibida

  @Scenario3
  Scenario Outline: Configurar Quantidade de Registros
    Given visualizo grid CUSTAS 'Página 1 de 3'
    When seleciono combo NUMERO REGISTROS "<numeroregistros>"
    Then valido campo PAGINA
    And visualizo campo TIPO
    And visualizo campo DATA EMISSAO
    And visualizo campo PAGANTE
    And visualizo campo AJG
    And visualizo campo Nº DA GUIA
    And visualizo campo PARCELA
    And visualizo campo FINALIDADE
    And visualizo campo VALOR
    And visualizo campo SITUACAO
    And visualizo campo ACOES

# Ponto de Verificação 1, campo PAGINA = '20', exibe 20 registros na grid CUSTAS 'Ver 1-20 de 22',
# 2 páginas na grid
# Ponto de Verificação 2, campo PAGINA = '30', exibe 22 registros na grid CUSTAS 'Ver 1-22 de 22',
# 1 página na grid
# Ponto de Verificação 3, campo PAGINA = '10', exibe 10 registros na grid CUSTAS 'Ver 1-10 de 22',
# 3 páginas na grid

    Examples:
      | numeroregistros |
      | 20              |
      | 30              |
      | 10              |
