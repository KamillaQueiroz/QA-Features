#Author: Sheila Lopes
#Date: 06/09/2017
#Keywords Summary : Cancelar, Guia, Aberta, Pendente, Parcelamento.
#Feature: CancelarGuiaAbertaComGuiaPendenteComParcelamento
#Description: Essa feature tem o objetivo de validar o cancelamento de guias quando há uma guia
#aberta e uma guia pendente com parcelamento.

@Funcionalidade
Feature: Cancelar Guia Aberta Com Guia Pendente Com Parcelamento
  Como usuário de perfil SERVIDOR
  Com atuação de COMARCA DE PORTO ALEGRE - VFP

  @Cenario1
  Scenario: GERAR CUSTAS COM PARCELAMENTO
    Given acesso site eThemis
    And acesso tela PROCESSO
    And seleciono combo HOME ATUACAO
    And informo campo NUMERO "<numero>"
    And clico botao PESQUISAR
    And clico botao VERIFICAR PROVIDENCIAS
    And clico grid CUSTAS
    And clico botao NOVAS CUSTAS
    And seleciono combo TIPO DE CUSTAS 'Custas Iniciais'
    And seleciono combo PAGANTE
    And clico botao ADICIONAR
    And informo campo PARCELAS '2'
    And clico botao GERAR CUSTAS
    When clico botao SAIR
    Then visualizo grid CUSTAS 'Ver 1 - 2 de 2'

  @Cenario2
  Scenario: EMITIR GUIA
    Given visualizo campo ACOES
    And clico botao EMITIR GUIA
    When clico botao OK
    Then valido campo TIPO
    And valido campo PARCELA
    And valido campo SITUACAO

# Ponto de Verificação 1, campo TIPO = 'Guia', campo PARCELA =  '1 de 2', campo SITUACAO = 'Aberta'

  @Cenario3
  Scenario: CANCELAR GUIA ABERTA COM PARCELAMENTO
    Given valido campo SITUACAO
    And valido campo PARCELA
    And clico botao EXCLUIR CUSTAS
    And visualizo mensagem 'Ao excluir esta guia também serão excluídas 1 guias que estão relacionadas a ela. Confirma a exclusão?'
    When clico botao OK
    Then valido campo SITUACAO
    And valido campo PARCELA

# Ponto de Verificação 1, campo SITUACAO = 'Aberta', campo PARCELA = '1 de 2'
# Ponto de Verificação 2, campo SITUACAO = 'Cancelada' para campo PARCELA = 1 e 2