#Author: Sheila Lopes
#Date: 15/08/2017
#Keywords Summary : Custas Iniciais, Gerar Custas, Botão Emitir Guia, Botão Emitir Guias
#Feature: EmitirGuiaUmaCustasGrid
#Description: Essa feature tem a finalidade de validar a emissão de guia para uma custas, selecionada na grid,
#através do botão EMITIR GUIAS e botão EMITIR GUIA do campo ACOES.

@Funcionalidade
Feature: Emitir Guia Uma Custas Grid
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
  Scenario: Gerar Custas com Unico Pagante Parcelado -  Imprimir uma Guia Botao Emitir Guias
    When clico botao CUSTAS
    Given clico botao NOVAS CUSTAS
    And visualizo modal NOVAS CUSTAS
    When seleciono combo Tipo de Custas "Custas Iniciais"
    And seleciono pagante combo PAGANTE
    And clico botao ADICIONAR
    And informo campo PARCELAS "10"
    And clico botao GERAR CUSTAS
    Then mensagem Custas geradas com sucesso é exibida
    When clico botao SAIR
    Then visualizo grid CUSTAS
    And valido campo PARCELA "1 de 10"
    And clico checkbox GUIA
    And clico botao EMITIR GUIAS GRID
    And visualizo modal EMITIR GUIA com mensagem Deseja emitir as guias? e botoes OK e Cancelar
    When clico botao OK Emissao Guia
    Then valido campo TIPO "Guia"
    And valido campo SITUACAO "Aberta"
    And valido campo AÇÕES com botões Visualizar Guia, Imprimir Guia, Excluir Custas

