#Author: Sheila Lopes
#Date: 11/08/2017
#Keywords Summary : Adicionar Pagante, Rateio, Gerar Custas, Emitir Guia
#Feature: CadastrarCustasVariosPagantes
#Description: Essa feature tem a finalidade de validar o cadastro de custas e a emissão de guia de custas
#para vários pagantes.

@Funcionalidade
Feature: Cadastrar Custas Varios Pagantes
  Como usuário de perfil SERVIDOR
  Com atuação de COMARCA DE PORTO ALEGRE - VFP
  Com processo que possui 3 partes

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
    And adiciono OUTRO PARTICIPANTE
    And clico aba DADOS COMPLEMENTARES
    And seleciono combo DADOS COMPLEMENTARES - TIPO DISTRIBUICAO "Sorteio"
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


  Scenario: Emitir Guia Diversos Pagantes
    When clico botao CUSTAS
    Given clico botao NOVAS CUSTAS
    When seleciono combo Tipo de Custas "Custas Iniciais"
    And seleciono pagante combo PAGANTE
    And clico botao ADICIONAR
    And informo campo RATEIO "50"
    And seleciono segundo pagante combo Pagante
    And clico botao ADICIONAR
    And informo campo RATEIO segundo pagante "40"
    And seleciono terceiro pagante combo Pagante
    And clico botao ADICIONAR
    And informo campo RATEIO terceiro pagante "10"
    #And valido campo RATEIO TOTAL "100"
    And valido campo VALOR
    And clico botao EMITIR GUIA
    And clico botão OK  na modal Emitir Guia
    #And verifico BANCO DE DADOS

# Ponto de Verificação 1, campo RATEIO TOTAL = '100'
# Ponto de Verificação 2, campo VALOR TOTAL = campo TOTAL grid ITENS DE CUSTAS

# Executar o select para verificar como os dados foram salvos na tabela GUIAS:
# select DT_EMISSAO, NOME_PAGADOR, COD_COMARCA, NUM_GUIA,
# NRO_PARCELA, QTD_PARCELAS, COD_TIPO_CUSTAS, VALOR,
# GUIA_PAGA, IMPRESSA, PROPORCAO, GUIA_EMITIDA
# from   CUSTAS.GUIAS
# where NUM_PETICAO_INICIAL = '<número CNJ Processo>';
# campo DT_EMISSAO = data em que guia de custa foi emitida no formato DD/MM/AAAA
# campo NOME_PAGADOR = Nome do Pagante selecionado nos cenários Scenario2 e Scenario3.
# campos NRO_PARCELA e QTD_PARCELAS = '1'
# campo COD_TIPO_CUSTAS = '700'
# campo VALOR = (campo PROPORCAO * campo TOTAL grid ITENS DE CUSTAS)/100
# campo GUIA_PAGA = 'N', campo IMPRESSA = 'S', GUIA_EMITIDA = 'S'

# Validar grid CUSTAS, conforme o resultado do select
# Grid CUSTAS exibe um registro para cada PAGANTE, adicionados nos cenários Scenario2 e Scenario3, respectivamente.
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