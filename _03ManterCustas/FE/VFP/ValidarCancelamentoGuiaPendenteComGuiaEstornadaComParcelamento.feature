#Author: Sheila Lopes
#Date: 05/09/2017
#Keywords Summary: Cancelar, Guia, Pendente, Estornada, Parcelamento
#Feature: ValidarCancelamentoGuiaPendenteComGuiaEstornadaComParcelamento
#Description: Essa feature tem o objetivo de validar o não cancelamento de guia pendente quando há uma
#guia estornada com parcelamento.

@Funcionalidade
Feature: Validar Cancelamento Guia Pendente Com Guia Estornada Com Parcelamento
  Como usuário de perfil SERVIDOR
  Com atuação de COMARCA DE PORTO ALEGRE - VFP

  Background:
    Given acesso site eThemis
    Given uso processo basico VFP
    Given altero propriedade dto "classe" "Procedimento Ordinário"
    And altero propriedade dto "tipoPedido" "Outros"
    And altero propriedade dto "assunto" "Multas e demais Sanções"
    And altero propriedade dto "atuacao" "Porto Alegre - 1ª Vara da Fazenda Pública"
    And altero propriedade dto "perfilUsuario" "Distribuidor"
    And crio processo pelo servico PPE
    And acesso eThemis
    And seleciono combo HOME ATUACAO
    When seleciono combo HOME COMPETENCIA "VFP"
    When efetuo zoneamento do processo em validacao
    And clico aba DADOS COMPLEMENTARES
    And seleciono combo DADOS COMPLEMENTARES TIPO "Sorteio"
    And clico aba FINALIZACAO
    And clico botao FINALIZAR
    And pesquiso comarca
    And deslogo eThemis
    Given efetuo login eThemis "et1g-servidor"
    Given acesso tela PROCESSO
    And seleciono combo HOME ATUACAO
    And informo campo NUMERO "<NUMERO>"
    When clico botao PESQUISAR
    When clico botao Verificar Providências

  @Scenario1
  Scenario: GERAR CUSTAS COM PARCELAMENTO - CANCELAR GUIA PENDENTE COM PARCELAMENTO E GUIA ESTORNADA
    When clico botao CUSTAS
    Given clico botao NOVAS CUSTAS
    When seleciono combo Tipo de Custas "Custas Iniciais"
    And seleciono pagante combo PAGANTE
    And clico botao ADICIONAR
    And informo campo PARCELAS "2"
    And clico botao GERAR CUSTAS
    When clico botao SAIR
    Then visualizo parcelas grid CUSTAS "Ver 1 - 2 de 2"
    And clico checkbox GUIA
    And clico botao EMITIR GUIAS GRID
    And visualizo modal EMITIR GUIA com mensagem Deseja emitir as guias? e botoes OK e Cancelar
    When clico botao OK Emissao Guia
    Then valido campo TIPO "Guia"
    And valido campo SITUACAO "Aberta"
    Then valido campo TIPO "Custas"
    And valido campo SITUACAO "Pendente"
    And altero situacao para estornada
    And valido campo SITUACAO "Pagto. Estornado"
    When clico botao EXCLUIR CUSTAS
    Then visualizo mensagem "Não é possível a exclusão, pois há outras guias relacionadas a ela que possuem situação diferente de Pendente, Aberta ou Vencida"
    And clico botao OK






# Ponto de Verificação 1, campo TIPO = 'Guia', campo PARCELA =  '1 de 2', campo SITUACAO = 'Aberta'
# Ponto de Verificação 2, campo TIPO = 'Custas', campo PARCELA =  '2 de 2', campo SITUACAO = 'Pendente'

# ALTERAR A SITUACAO DE UMA DAS GUIAS DE ABERTA PARA ESTORNADA
# update CUSTAS.GUIAS
# set       GUIA_PAGA = 'S' ,
#             CHQ_SFUNDOS = 'S',
#             DT_PAGTO = 'DD/MM/AAA' , informar data do dia
# where  NUM_GUIA = '<número da guia aberta>';




# Ponto de Verificação 1, campo SITUACAO = 'Pendente', campo PARCELA = '2 de 2'
# Ponto de Verificação 2, campo SITUACAO = 'Pagto. Estornado', campo PARCELA = '1 de 2'