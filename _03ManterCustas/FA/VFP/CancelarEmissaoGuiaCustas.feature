#Author: Sheila Lopes
#Date: 16/08/2017
#Keywords Summary : Custas Iniciais, Emitir Guia, Cancelar
#Feature: CancelarEmissaoGuiaCustas
#Description: Essa feature tem a finalidade de validar o cancelamento da emissão da guia de custas.

@Funcionalidade
Feature: Cancelar Emissao Guia Custas
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
  Scenario: Cancelar Emissao de Guia
    Given valido campo PARCELA
    And marco check
    And clico botao EMITIR GUIA
    And visualizo modal EMITIR GUIAS
    And visualizo mensagem 'Deseja emitir a guia de custas?'
    When clico botao CANCELAR
    Then valido campo TIPO
    And valido campo SITUACAO
    And valido campo ACOES

# Ponto de Verificação 1, selecionar check box campo PARCELA = '1 DE 1'
# Ponto de Verificação 2, após cancelar a emissão da guia, modal Emitir Guias é fechada
# check box continua sendo exibida para a parcela
# campo TIPO = 'Custas', campo SITUACAO = 'Pendente', campo ACOES exibe os botões Editar Custas,
# Emitir Guia, Excluir Custas
