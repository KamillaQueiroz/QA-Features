#Author: Sheila Lopes
#Date: 15/08/2017
#Keywords Summary : Custas Iniciais, Tipo de Custas, Consultar por Pagante,
#Consultar por Finalidade, Consultar por Situação, Sair, Pesquisar
#Feature: PesquisarCustasTodosFiltros
#Description: Essa feature tem a finalidade de validar a pesquisa de Custas usando todos filtros.

@Funcionalidade
Feature: Pesquisar Custas Todos Filtros
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

  @ManterCustas @Done
  Scenario: Pesquisar usando Todos Filtros
    When clico botao CUSTAS
    Given clico botao NOVAS CUSTAS
    When seleciono combo Tipo de Custas "Custas Iniciais"
    And seleciono pagante combo PAGANTE
    And clico botao ADICIONAR
    And informo campo PARCELAS "2"
    And clico botao GERAR CUSTAS
    Then mensagem Custas geradas com sucesso é exibida
    When clico botao SAIR
    Then visualizo grid CUSTAS
    Given valido campo PARCELA "1 de 2"
    And clico checkbox GUIA
    And clico botao EMITIR GUIAS GRID
    And visualizo modal EMITIR GUIA com mensagem Deseja emitir as guias? e botoes OK e Cancelar
    When clico botao OK Emissao Guia
    Then valido campo TIPO "Guia"
    And valido campo SITUACAO "Aberta"
    Given seleciono combo TIPO DE CUSTAS "Guia"
    And seleciono combo CONSULTAR POR PAGANTE
    And seleciono combo CONSULTAR POR FINALIDADE "Custas Iniciais"
    And seleciono combo CONSULTAR POR SITUACAO "Aberta"
    When clico botao PESQUISAR
    Then valido campo TIPO "Guia"
    Then valido PAGANTE resultado da grid
    Then valido resultado da grid combo FINALIDADE "Custas Iniciais"
    Then valido campo SITUACAO "Aberta"
    Then visualizo parcelas no rodapé da grid de custas "Ver 1 - 2 de 2"
  
