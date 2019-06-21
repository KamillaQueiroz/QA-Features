#Author: Sheila Lopes
#Date: 06/09/2017
#Keywords Summary : Cancelar, Guia, Vencida
#Feature: CancelarGuiaVencidaSemParcelamentoSemRateio
#Description: Essa feature tem o objetivo de validar o cancelamento de uma guia vencida
#sem parcelamento e sem rateio.

@Funcionalidade
Feature: Cancelar Guia Vencida Sem Parcelamento Sem Rateio
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

# ALTERAR A SITUACAO DE UMA DAS GUIAS DE ABERTA PARA VENCIDA
# update  CUSTAS.GUIAS
# set         DT_VENCIMENTO = 'DD/MM/AAAA' , informar data do dia - 1 dia
# where   NUM_GUIA = '<número da guia gerada para a parcela>';

  @Cenario2
  Scenario: CANCELAR GUIA VENCIDA SEM PARCELAMENTO SEM RATEIO
    Given valido campo SITUACAO
    And valido campo PARCELA
    And clico botao EXCLUIR CUSTAS
    And visualizo mensagem 'Confirma a exclusão da guia <número da guia completo>?'
    When clico botao OK
    Then valido campo SITUACAO
    And valido campo PARCELA

# Ponto de Verificação 1, campo SITUACAO = 'Vencida', campo PARCELA = '1 de 1'
# Ponto de Verificação 2, campo SITUACAO = 'Cancelada', campo PARCELA = '1 de 1'