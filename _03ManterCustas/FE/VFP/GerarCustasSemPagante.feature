#Author: Sheila Lopes
#Date: 16/08/2017
#Keywords Summary : Custas Iniciais, Pagante, Adicionar, Gerar Custas
#Feature: GerarCustasSemPagante
#Description: Essa feature tem o objetivo de validar a obrigatoriedade do campo Pagante ao Gerar Custas,
#assim como, validar o comportamento do sistema, após, tentar gerar custas sem selecionar ou adicionar
#pelo menos um pagante.

@Funcionalidade
Feature: Gerar Custas Sem Pagante
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
  Scenario: Gerar Custas sem Adicionar Pagante
    When clico botao CUSTAS
    Given clico botao NOVAS CUSTAS
    And seleciono combo Tipo de Custas "Custas Iniciais"
    When clico botao GERAR CUSTAS
    Then visualizo mensagem de obrigatoriedade do pagante "É necessário informar pelo menos um pagante."
    Given seleciono pagante combo PAGANTE
    When clico botao GERAR CUSTAS
    Then visualizo mensagem de obrigatoriedade do pagante "É necessário informar pelo menos um pagante."
