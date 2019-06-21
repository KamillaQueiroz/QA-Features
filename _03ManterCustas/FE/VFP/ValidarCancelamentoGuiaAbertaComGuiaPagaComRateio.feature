#Author: Sheila Lopes
#Date: 05/09/2017
#Keywords Summary : Cancelar, Guia, Aberta, Paga, Rateio
#Feature: ValidarCancelamentoGuiaAbertaComGuiaPagaComRateio
#Description: Essa feature tem o objetivo de validar o não cancelamento de guia aberta quando há
#guia paga e rateio

@Funcionalidade
Feature: Validar Cancelamento Guia Aberta Com Guia Paga Com Rateio
  Como usuário de perfil SERVIDOR
  Com atuação de COMARCA DE PORTO ALEGRE - VFP

  @Cenario1
  Scenario: EMITIR GUIA COM RATEIO
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
    And informo campo RATEIO '50'
    And seleciono combo PAGANTE
    And clico botao ADICIONAR
    And informo campo RATEIO '50'
    And clico botao EMITIR GUIA
    When clico botao OK
    Then visualizo grid CUSTAS 'Ver 1 - 2 de 2'

# ALTERAR A SITUACAO DE UMA DAS GUIAS DE ABERTA PARA PAGA
# update CUSTAS.GUIAS
# set       GUIA_PAGA = 'S' ,
#             DT_PAGTO = 'DD/MM/AAA' , informar data do dia
# where  NUM_GUIA = '<número da guia>';

  @Cenario2
  Scenario: CANCELAR GUIA ABERTA COM RATEIO
    Given valido campo SITUACAO
    And valido campo PARCELA
    When clico botao EXCLUIR CUSTAS
    Then visualizo mensagem 'Não é possível a exclusão, pois há outras guias relacionadas a ela que possuem situação diferente de Pendente, Aberta ou Vencida'
    And clico botao OK
    And valido campo SITUACAO
    And valido campo PARCELA

# Ponto de Verificação 1, campo SITUACAO = 'Aberta', campo PARCELA = '1 de 1'
# Ponto de Verificação 2, campo SITUACAO = 'Paga', campo PARCELA = '1 de 1'