#Author: Sheila Lopes
#Date: 16/08/2017
#Keywords Summary : Custas Iniciais,
#Feature: EditarCustasExcluirPagante
#Description: Essa feature tem o objetivo de validar

@Funcionalidade
Feature: Editar Custas Excluir Pagante
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
  Scenario: Editar Custas Excluir Pagante
    When clico botao CUSTAS
    Given clico botao NOVAS CUSTAS
    And seleciono combo Tipo de Custas "Custas Iniciais"
    And seleciono pagante combo PAGANTE
    And clico botao ADICIONAR
    And clico botao GERAR CUSTAS
    Then mensagem Custas geradas com sucesso é exibida
    When clico botao SAIR
    Given clico botao EDITAR CUSTAS
    And clico botao EXCLUIR PAGANTE Edicao Custas
    When clico botao GERAR CUSTAS
    Then visualizo mensagem de obrigatoriedade do pagante "É necessário informar pelo menos um pagante."


