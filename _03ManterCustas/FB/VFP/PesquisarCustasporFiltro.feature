#Author: Sheila Lopes
#Date: 15/08/2017
#Keywords Summary : Custas Iniciais, Tipo de Custas, Consultar por Pagante,
#Consultar por Finalidade, Consultar por Situação
#Feature: PesquisarCustasporFiltro
#Description: Essa feature tem a finalidade de validar a pesquisa de custas pelos filtros
# Tipo de Custas, Consultar por Pagante, Consultar por Finalidade, Consultar por Situação,
# separadamente.

@Funcionalidade
Feature: Pesquisar Custas por Filtro
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
    Given clico botao CUSTAS

  @ManterCustas @Done
  Scenario: Gerar Custas com mais de um Pagante
    Given clico botao NOVAS CUSTAS
    And seleciono combo Tipo de Custas "Custas Iniciais"
    And seleciono pagante combo PAGANTE
    And clico botao ADICIONAR
    And informo campo RATEIO "50"
    And seleciono segundo pagante combo Pagante
    And clico botao ADICIONAR
    And informo campo RATEIO segundo pagante "50"
    And valido campo RATEIO em branco
    And clico botao GERAR CUSTAS
    And mensagem Custas geradas com sucesso é exibida
    When clico botao SAIR
    Then visualizo grid CUSTAS

  @ManterCustas @Done
  Scenario: Pesquisar pelo filtro Tipo de Custas
    Given clico botao NOVAS CUSTAS
    And seleciono combo Tipo de Custas "Custas Iniciais"
    And seleciono pagante combo PAGANTE
    And clico botao ADICIONAR
    And clico botao GERAR CUSTAS
    Then mensagem Custas geradas com sucesso é exibida
    When clico botao SAIR
    Given valido campo TIPO "Custas"
    And clico checkbox GUIA
    And clico botao EMITIR GUIAS GRID
    And visualizo modal EMITIR GUIA com mensagem Deseja emitir as guias? e botoes OK e Cancelar
    When clico botao OK Emissao Guia
    Given valido combo TIPO DE CUSTAS "Selecione"
    And seleciono combo TIPO DE CUSTAS "Guia"
    When clico botao PESQUISAR
    Then valido campo TIPO "Guia"
    And valido campo SITUACAO "Aberta"

  @ManterCustas @Done
  Scenario: Pesquisar pelo filtro Consultar Por Pagante
    Given clico botao NOVAS CUSTAS
    And seleciono combo Tipo de Custas "Custas Iniciais"
    And seleciono pagante combo PAGANTE
    And clico botao ADICIONAR
    And clico botao GERAR CUSTAS
    Then mensagem Custas geradas com sucesso é exibida
    When clico botao SAIR
    Given valido campo TIPO "Custas"
    And clico checkbox GUIA
    And clico botao EMITIR GUIAS GRID
    And visualizo modal EMITIR GUIA com mensagem Deseja emitir as guias? e botoes OK e Cancelar
    When clico botao OK Emissao Guia
    Given valido combo CONSULTAR POR PAGANTE "Selecione"
    Given valido os pagantes exibidos na combo CONSULTAR POR PAGANTE
    And seleciono combo CONSULTAR POR PAGANTE
    When clico botao PESQUISAR
    Then valido PAGANTE resultado da grid

  @ManterCustas @Done
  Scenario: Pesquisar pelo filtro Consultar Por Finalidade
    Given clico botao NOVAS CUSTAS
    And seleciono combo Tipo de Custas "Custas Iniciais"
    And seleciono pagante combo PAGANTE
    And clico botao ADICIONAR
    And clico botao GERAR CUSTAS
    Then mensagem Custas geradas com sucesso é exibida
    When clico botao SAIR
    Given valido campo TIPO "Custas"
    And clico checkbox GUIA
    And clico botao EMITIR GUIAS GRID
    And visualizo modal EMITIR GUIA com mensagem Deseja emitir as guias? e botoes OK e Cancelar
    When clico botao OK Emissao Guia
    Given valido combo CONSULTAR POR FINALIDADE "Selecione"
    Given valido opções da combo CONSULTAR POR FINALIDADE "[Selecione]-Condução Intermediária-Custas Finais-Custas Iniciais-Custas Iniciais - Complementar-Impugnação ao cumprimento de sentença-Preparo de Recurso-Reconvenção"
    And seleciono combo CONSULTAR POR FINALIDADE "Custas Iniciais"
    When clico botao PESQUISAR
    Then valido resultado da grid combo FINALIDADE "Custas Iniciais"

  @ManterCustas @Done
  Scenario: Pesquisar pelo filtro Consultar por Situacao - Aberta
    Given clico botao NOVAS CUSTAS
    And seleciono combo Tipo de Custas "Custas Iniciais"
    And seleciono pagante combo PAGANTE
    And clico botao ADICIONAR
    And clico botao GERAR CUSTAS
    Then mensagem Custas geradas com sucesso é exibida
    When clico botao SAIR
    Given valido campo TIPO "Custas"
    And clico checkbox GUIA
    And clico botao EMITIR GUIAS GRID
    And visualizo modal EMITIR GUIA com mensagem Deseja emitir as guias? e botoes OK e Cancelar
    When clico botao OK Emissao Guia
    Given valido combo CONSULTAR POR SITUACAO "Selecione"
    Given valido opções da combo CONSULTAR POR SITUACAO "[Selecione]-Aberta-Cancelada-Estornada-Paga-Pendente-Vencida"
    And seleciono combo CONSULTAR POR SITUACAO "Aberta"
    When clico botao PESQUISAR
    Then valido campo SITUACAO "Aberta"

  @ManterCustas @Done
  Scenario: Pesquisar pelo filtro Consultar por Situacao - Pendente
    Given clico botao NOVAS CUSTAS
    And seleciono combo Tipo de Custas "Custas Iniciais"
    And seleciono pagante combo PAGANTE
    And clico botao ADICIONAR
    And clico botao GERAR CUSTAS
    Then mensagem Custas geradas com sucesso é exibida
    When clico botao SAIR
    Given valido combo CONSULTAR POR SITUACAO "Selecione"
    And seleciono combo CONSULTAR POR SITUACAO "Pendente"
    When clico botao PESQUISAR
    Then valido campo SITUACAO "Pendente"
