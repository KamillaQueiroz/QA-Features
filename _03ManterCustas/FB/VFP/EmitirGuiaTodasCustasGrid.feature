#Author: Sheila Lopes
#Date: 15/08/2017
#Keywords Summary : Custas Iniciais, Gerar Custas, Emitir Guias
#Feature: EmitirGuiaTodasCustasGrid
#Description: Essa feature tem a finalidade de validar a emissão de guias para todas as custas na grid,
# através do botão EMITIR GUIAS.

@Funcionalidade
Feature: Emitir Guia Todas Custas Grid
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

  @Scenario1  
  Scenario: Gerar Custas com Unico Pagante Parcelado e Emitir Guia Todas Custas Selecionadas
    Given clico botao CUSTAS
    Given clico botao NOVAS CUSTAS
    And seleciono combo Tipo de Custas "Custas Iniciais"
    And seleciono pagante combo PAGANTE
    And clico botao ADICIONAR
    And informo campo PARCELAS "4"
    And clico botao GERAR CUSTAS
    Then mensagem Custas geradas com sucesso é exibida
    When clico botao SAIR
    Then visualizo grid CUSTAS
    Given valido campo PARCELA "1 de 4"
    And clico checkbox GUIA
    And valido campo PARCELA "2 de 4"
    And clico checkbox GUIA
    And valido campo PARCELA "3 de 4"
    And clico checkbox GUIA
    And valido campo PARCELA "4 de 4"
    And clico checkbox GUIA
    And clico botao EMITIR GUIAS GRID
    And visualizo modal EMITIR GUIA com mensagem Deseja emitir as guias? e botoes OK e Cancelar
    When clico botao OK Emissao Guia
    Then valido campo TIPO "Guia"
    And valido campo SITUACAO "Aberta"
    And valido campo AÇÕES com botões Visualizar Guia, Imprimir Guia, Excluir Custas
    Then valido campo TIPO "Guia"
    And valido campo SITUACAO "Aberta"
    And valido campo AÇÕES com botões Visualizar Guia, Imprimir Guia, Excluir Custas
    Then valido campo TIPO "Guia"
    And valido campo SITUACAO "Aberta"
    And valido campo AÇÕES com botões Visualizar Guia, Imprimir Guia, Excluir Custas
    Then valido campo TIPO "Guia"
    And valido campo SITUACAO "Aberta"
    And valido campo AÇÕES com botões Visualizar Guia, Imprimir Guia, Excluir Custas


# Ponto de Verificação 5, após confirmar a emissão da guia, check box deixa de ser exibido para a parcela
# emitida, campo TIPO = 'Guia', campo SITUACAO = 'Aberta', campo ACOES exibe os botões VISUALIZAR GUIA,
# IMPRIMIR GUIA, EXCLUIR CUSTAS. Conteúdo desses campos devem ser iguais para todas as custas que tiveram
# guias emitidas, nesse caso 4.

