#Author: Sheila Lopes
#Date: 14/08/2017
#Keywords Summary : Custas Iniciais, Rateio, Parcelas, Total, Cancelar Guia, Editar Custas, Sair, Gerar Custas
#Feature: ExcluirPaganteCustas
#Description: Essa feature tem a finalidade de excluir o pagante de custas, validar a atualização da grid CUSTAS
#assim como, validar a atualização dos dados no banco de dados.

@Funcionalidade
Feature: Excluir Pagante Custas
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

  @Done @ManterCustas
  Scenario: Gerar Custas para Pagantes com Parcelamento - Cancelar Guia de Pagante
    When clico botao CUSTAS
    Given clico botao NOVAS CUSTAS
    When seleciono combo Tipo de Custas "Custas Iniciais"
    And seleciono pagante combo PAGANTE
    And clico botao ADICIONAR
    And informo campo RATEIO "80"
    And informo campo PARCELAS "10"
    And seleciono segundo pagante combo Pagante
    And clico botao ADICIONAR
    And informo campo RATEIO segundo pagante "20"
    And informo campo PARCELAS segundo pagante "6"
    And clico botao GERAR CUSTAS
    Then mensagem Custas geradas com sucesso é exibida
    When clico botao SAIR
    Then visualizo parcelas no rodapé da grid de custas "Ver 1 - 10 de 16"
    Given valido campo AÇÕES com botões Editar Custas, Emitir Guia, Excluir Custas
    And clico botao EDITAR CUSTAS
    And visualizo modal NOVO CALCULO DE CUSTAS
    And valido valores TOTAL
    And clico botao EXCLUIR SEGUNDO PAGANTE
    And informo campo RATEIO "100" Edição
    And clico botao GERAR CUSTAS
    Then mensagem Custas geradas com sucesso é exibida
    Given coleto os dados informados
    When clico botao SAIR
    Then visualizo parcelas no rodapé da grid de custas "Ver 1 - 10 de 10"
   #   Then valido no BANCO DE DADOS a guia gravada corretamente GUIA PAGA: "N", IMPRESSA: "N", PROPORCAO: "100", CODIGO TIPO CUSTAS: "700", QTD PARCELAS: "10", NRO PARCELA: "1", GUIA EMITIDA: "N"
    Then visualizo grid CUSTAS
    And valido campo TIPO "Custas"
    And valido campo DATA EMISSAO
    And valido campo PAGANTE GRID
    And valido campo AJG "Não"
    And valido campo Nº DA GUIA
    And valido campo PARCELA "1 de 10"
    And valido campo FINALIDADE "Custas Iniciais"
    And valido campo VALOR
    And valido campo SITUACAO "Pendente"
    And valido campo AÇÕES com botões Editar Custas, Emitir Guia, Excluir Custas