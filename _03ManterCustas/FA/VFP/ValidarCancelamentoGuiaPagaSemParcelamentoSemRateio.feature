#Author: Sheila Lopes
#Date: 05/09/2017
#Keywords Summary : Cancelar, Guia, Paga
#Feature: ValidarCancelamentoGuiaPagaSemParcelamentoSemRateio
#Description: Essa feature tem o objetivo de validar o cancelamento de guia paga sem parcelamento
#e sem rateio

@Funcionalidade
Feature: Validar Cancelamento Guia Paga Sem Parcelamento Sem Rateio
  Como usuário de perfil SERVIDOR
  Com atuação de COMARCA DE PORTO ALEGRE - VFP

  @Cenario1
  Scenario: EMITIR GUIA SEM PARCELAMENTO SEM RATEIO
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
    And clico botao EMITIR GUIA
    When clico botao OK
    Then visualizo grid CUSTAS 'Ver 1 - 1 de 1'

# ALTERAR A SITUACAO DE UMA DAS GUIAS DE ABERTA PARA PAGA
# update CUSTAS.GUIAS
# set  GUIA_PAGA = 'S' ,
#      DT_PAGTO = 'DD/MM/AAA' , informar data do dia
# where  NUM_GUIA = '<número da guia>';

  @Cenario2
  Scenario: PESQUISAR GUIA PAGA
    Given seleciono combo CONSULTA POR SITUACAO 'Paga'
    When clico botao PESQUISAR
    Then valido campo SITUACAO
    And valido campo ACOES

# Ponto de Verificação, campo SITUACAO = 'Paga', campo ACOES = Visualizar Guia, botão Excluir Custas não deve ser exibido.