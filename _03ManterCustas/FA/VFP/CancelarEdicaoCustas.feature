#Author: Sheila Lopes
#Date: 16/08/2017
#Keywords Summary : Custas Iniciais, Editar Custas, Sair, Fechar
#Feature: CancelarEdicaoCustas
#Description: Essa feature tem a finalidade de validar o cancelamento da edição da custas, após
#aumentar o número de parcelas e clicar nos botões sair e fechar, respectivamente.

@Funcionalidade
Feature: Cancelar Edicao Custas
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
  Scenario: Gerar Custas com Unico Pagante
    Given clico botao NOVAS CUSTAS
    And seleciono combo TIPO DE CUSTAS 'Custas Iniciais'
    And seleciono PAGANTE
    And clico botao ADICIONAR
    And clico botao GERAR CUSTAS
    And visualizo mensagem 'Custas geradas com sucesso.'
    When clico botao SAIR
    Then visualizo grid CUSTAS

  @Scenario3
  Scenario: Cancelar Edicao de Custas
    Given visualizo grid CUSTAS 'Ver 1-1 de 1'
    And clico botao EDITAR CUSTAS
    And informo campo PARCELAS '2'
    When clico botao SAIR
    Then visualizo grid CUSTAS 'Ver 1-1 de 1'

  @Scenario4
  Scenario: Fechar Edicao de Custas
    Given clico botao EDITAR CUSTAS
    And informo campo PARCELAS '2'
    When clico botao FECHAR
    Then visualizo grid CUSTAS 'Ver 1-1 de 1'

# Ponto de Verificação 1, após clicar botao SAIR, modal Novo Cálculo de Custas é fechada e grid CUSTAS
# é exibida com apenas um registro.

# Ponto de Verificação 2, após clicar botao fechar, modal Novo Cálculo de Custas é fechada e grid CUSTAS
# é exibida com apenas um registro.
