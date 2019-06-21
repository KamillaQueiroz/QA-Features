#Author: Sheila Lopes
#Date: 10/08/2017
#Keywords Summary :
#Feature: EditarCustas
#Description: Essa feature valida a edição de custas, alteração do número de parcelas e impressão da guia de custas.

@Funcionalidade
Feature: Editar Custas
  Como usuário de perfil SERVIDOR
  Com atuação de COMARCA DE PORTO ALEGRE - FP

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

  @Scenario1
  Scenario: Validação Edição de Custas Iniciais
    When clico botao CUSTAS
    Given clico botao NOVAS CUSTAS
    And visualizo modal NOVAS CUSTAS
    When seleciono combo Tipo de Custas "Custas Iniciais"
    And seleciono pagante combo Pagante
    And clico botao ADICIONAR
    And clico botao GERAR CUSTAS
    Then mensagem Custas geradas com sucesso é exibida
    #And coleto os dados gravados na Modal Novas custas
    When clico botao SAIR
    And valido campo TIPO "Custas"
    And valido campo SITUACAO "Pendente"
    And valido campo DATA EMISSAO
    And valido campo PAGANTE GRID
    And valido campo AJG "Não"
    And valido campo Nº DA GUIA
    And valido campo PARCELA "1 de 1"
    And valido campo FINALIDADE "Custas Iniciais"
    And valido campo VALOR
    And valido campo AÇÕES com botões Editar Custas, Emitir Guia, Excluir Custas
    And clico botao EDITAR CUSTAS
    Then visualizo modal NOVO CALCULO DE CUSTAS
    And valido campo TIPO DE CUSTAS
    And visualizo grid ITENS DE CUSTAS
    And valido campo DESCRICAO
    And valido campo VALOR INDEXADO
    And valido campo VALOR
    And valido campo TOTAL
    And valido check PROPORCAO
    And valido campo PAGANTE
    And valido campo POLO
    And valido campo RATEIO
    And valido campo VALOR
    And valido campo PARCELAS
    And visualizo campo ACOES
    And valido campo RATEIO TOTAL
    And valido campo VALOR TOTAL

# Ponto de Verificação 1, campo TIPO DE CUSTAS = Custas Iniciais

# Ponto de Verificação 2, executar select abaixo para validar se esta exibindo os dados corretos

# select VALORIND_TOTAL
# from   CUSTAS.CUSTAS
# where  NUM_PETICAO_INICIAL = '<CNJ Processo>'
# and    COD_TIPO_DESPESA = '500' -- Custas Iniciais;

# select NOME_PAGADOR, PROPORCAO, VALOR, QTD_PARCELAS, IMPRESSA
# from   CUSTAS.GUIAS
# where  NUM_PETICAO_INICIAL = '<CNJ Processo>';

# Campos da grid ITENS DE CUSTAS
# campo DESCRIÇÃO = 'Taxa Única de Serviços Judiciais (Lei 14.634/14)'
# campo VALOR INDEXADO = campo VALORIND_TOTAL da tabela CUSTAS
# campo VALOR = campo VALOR tabela GUIAS
# campo TOTAL = campo VALOR tabela GUIAS

# Campos da grid Pagante
# campo PAGANTE = campo NOME_PAGADOR tabela GUIAS
# campo RATEIO = '100', campo VALOR = campo VALOR tabela GUIAS
# campo PARCELAS = '1', campo RATEIO TOTAL = campo VALOR tabela GUIAS
# campo VALOR TOTAL = campo VALOR tabela GUIAS

  @Scenario4
  Scenario: Alterar NroParcelas
    When clico botao CUSTAS
    Given clico botao NOVAS CUSTAS
    And visualizo modal NOVAS CUSTAS
    When seleciono combo Tipo de Custas "Custas Iniciais"
    And seleciono pagante combo PAGANTE
    And clico botao ADICIONAR
    And clico botao GERAR CUSTAS
    Then mensagem Custas geradas com sucesso é exibida
    When clico botao SAIR
    And clico botao EDITAR CUSTAS
    Given visualizo modal NOVO CALCULO DE CUSTAS
    And altero campo PARCELAS "2"
    When clico botao GERAR CUSTAS
    Then mensagem Custas geradas com sucesso é exibida
    When clico botao SAIR
    And clico checkbox GUIA
    And clico botao EMITIR GUIAS GRID
    And visualizo modal EMITIR GUIA com mensagem Deseja emitir as guias? e botoes OK e Cancelar
    When clico botao OK Emissao Guia
    And valido no BANCO DE DADOS a guia gravada corretamente GUIA PAGA: "N", IMPRESSA: "S", PROPORCAO: "100", CODIGO TIPO CUSTAS: "700", QTD PARCELAS: '5', NRO PARCELA: "1", GUIA EMITIDA: "S"
    Then visualizo grid CUSTAS
    And valido campo TIPO "Guia"
    And valido campo DATA EMISSAO
    And valido campo PAGANTE
    And valido campo AJG "Não"
    And valido campo Nº DA GUIA
    And valido campo PARCELA "1 de 2"
    And valido campo FINALIDADE "Custas Inicias"
    And valido campo VALOR
    And valido campo SITUACAO "Aberta"
    And valido campo ACOES


# campo GUIA_PAGA = 'N', campo IMPRESSA = 'S', campo QTD_PARCELAS = '2'
# campo NOME_PAGADOR = nome do PAGANTE exibido na grid CUSTAS
# campo PROPORCAO = '100', campo COD_TIPO_CUSTAS = '700'
# campo GUIA_EMITIDA = 'S', campo VALOR_INICIAL =  campo VALOR grid CUSTAS
# Select deve retornar quantidade de registros, conforme o número de parcelas, nesse caso 2 parcelas, 2 registros
# Campos VALOR, GUIA_PAGA, IMPRESSA, NOME_PAGADOR, PROPORCAO, COD_TIPO_CUSTAS, GUIA_EMITIDA, QTD_PARCELAS e VALOR__INICIAL devem ser iguais
# campo NRO_PARCELA = '1' para campo NUM_GUIA = campo Nº DA GUIA exibido na grid CUSTAS, sem os três primeiros dígitos
# campo NRO_PARCELA = '2', campo NUM_GUIA = campo Nº DA GUIA exibido na grid CUSTAS, sem os três primeiros dígitos da parcela 1 + 1.

# Validar campos da grid CUSTAS
# grid CUSTAS deve exibir um registro para cada parcela> Nesse caso, a grid CUSTAS deve ter 2 registros
# campo TIPO = 'Guia', campo DATA EMISSÃO = data em que guia foi emitida no formato DD/MM/AAAA, campo PAGANTE = campo NOME_PAGADOR tabela GUIAS
# campo AJG = 'Não', campo FINALIDADE = 'Custas Iniciais', campo VALOR = GUIAS.VALOR, campo SITUACAO = 'Aberta'
# campo AÇÕES exibe os botões Visualizar Guia, Imprimir Guia, Excluir Custas
# Campos TIPO, DATA EMISSÃO, PAGANTE, AJG, FINALIDADE, VALOR, SITUACAO, AÇÕES devem se repetir nos 2 registros
# campo PARCELA = '1' de NroParc ... NroParc de NroParc, onde NroParc = quantidade de parcelas.
# campo Nº DA GUIA = GUIAS.COD_COMARCA + GUIAS.NUM_GUIA. Nº DA GUIA deve ser incrementado de 1 para os demais registros exibidos.