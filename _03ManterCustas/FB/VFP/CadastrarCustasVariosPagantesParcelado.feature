#Author: Sheila Lopes
#Date: 14/08/2017
#Keywords Summary : Custas Iniciais, Pagante, Rateio, Parcelas, Gerar Custas, Emitir Guia.
#Feature: CadastrarCustasVariosPagantesParcelado
#Description: Essa feature tem a finalidade de validar emissão de guia de custas para mais de um pagante com
#parcelamento.

@Funcionalidade
Feature: Cadastrar Custas Varios Pagantes Parcelado
  Como usuário de perfil SERVIDOR
  Com atuação de COMARCA DE PORTO ALEGRE - VFP

  Background:
    Given acesso site eThemis
    Given uso processo basico VFP

  @Scenario1
  Scenario: Selecionar Tipo de Custas e Pagantes com Parcelamento
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
    And seleciono combo DADOS COMPLEMENTARES - TIPO DISTRIBUICAO "Sorteio"
    And clico aba FINALIZACAO
    And clico botao FINALIZAR
    And pesquiso comarca
    And deslogo eThemis
    Given efetuo login eThemis "et1g-servidor"
    And acesso tela PROCESSO
    And seleciono combo HOME ATUACAO
    And informo campo NUMERO "<NUMERO>"
    And clico botao PESQUISAR
    And clico botao Verificar Providências
    When clico botao CUSTAS
    Then grid Custas é exibida
    Given clico botao NOVAS CUSTAS
    And visualizo modal NOVAS CUSTAS
    When seleciono combo Tipo de Custas "Custas Iniciais"
    And visualizo grid ITENS DE CUSTAS
    And visualizo campo TOTAL
    And seleciono pagante combo Pagante
    And clico botao ADICIONAR
    And informo campo RATEIO "50"
    And informo campo PARCELAS "3"
    And seleciono segundo pagante combo Pagante
    And clico botao ADICIONAR
    When informo campo RATEIO segundo pagante "50"
    And informo campo PARCELAS "2"
    Then valido campo RATEIO TOTAL
    And valido campo VALOR TOTAL

# Ponto de Verificação 1, campo RATEIO TOTAL = '100'
# Ponto de Verificação 2, campo VALOR TOTAL = campo TOTAL grid ITENS DE CUSTAS

  @Scenario3
  Scenario: Gerar Custas e Emitir Guia para Pagantes com Parcelamento
    Given visualizo campo PARCELAS '3'
    And valido campo VALOR
    And visualizo campo PARCELAS '2'
    And valido campo VALOR
    And clico botao EMITIR GUIA
    And visualizo mensagem 'Deseja emitir as guias?'
    When clico botao OK
    Then verifico BANCO DE DADOS
    And valido grid CUSTAS


# Ponto de Verificação 1, campo VALOR = 50% campo TOTAL grid ITENS DE CUSTAS
# Ponto de Verificação 2, campo VALOR = 50% campo TOTAL grid ITENS DE CUSTAS
# Executar o select abaixo para verificar como os dados foram salvos na tabela GUIAS
# select DT_EMISSAO, NOME_PAGADOR, COD_COMARCA, NUM_GUIA,
# NRO_PARCELA, QTD_PARCELAS, COD_TIPO_CUSTAS, VALOR,
# GUIA_PAGA, IMPRESSA, PROPORCAO, GUIA_EMITIDA
# from   CUSTAS.GUIAS
# where NUM_PETICAO_INICIAL = '<número CNJ Processo>';
# O banco de dados deve gravar um registro para cada pagante, conforme o número de parcelas. Nesse cenário
# devem ser gravados 3 registros para PAGANTE1 e 2 registros para PAGANTE2
# campo DT_EMISSAO = data em que guia de custa foi emitida no formato DD/MM/AAAA
# campo NOME_PAGADOR = Nome do Pagante selecionado no cenário Scenario2.
# campo QTD_PARCELAS = '3'
# campo COD_TIPO_CUSTAS = '700'
# campo VALOR = (campo PROPORCAO * campo TOTAL grid ITENS DE CUSTAS)/100
# campo GUIA_PAGA = 'N', campo IMPRESSA = 'S', GUIA_EMITIDA = 'S'

# Validar grid CUSTAS, conforme o resultado do select
# Grid CUSTAS exibe um registro para cada PAGANTE, adicionados no cenário Scenario2, conforme o número de parcelas
# campo TIPO = 'Guia'
# campo DATA EMISSÃO = campo DT_EMISSAO
# campo PAGANTE =  campo NOME_PAGADOR
# campo AJG = Não
# campo Nº DA GUIA = campo COD_COMARCA + '.' + campo NUM_GUIA
# campo PARCELA = campo NRO_PARCELA 'de' campo QTD_PARCELAS
# campo FINALIDADE = 'Custas Iniciais'
# campo VALOR = campo VALOR de cada PAGANTE
# campo SITUACAO = 'Aberta'
# campo ACOES = botões VISUALIZAR GUIA, IMPRIMIR GUIA, EXCLUIR CUSTAS

