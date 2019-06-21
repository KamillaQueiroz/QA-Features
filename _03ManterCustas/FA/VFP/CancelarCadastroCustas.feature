#Author: Sheila Lopes
#Date: 11/08/2017
#Keywords Summary : Custas Iniciais, Tipo de Custas, Pagante, Sair
#Feature: CancelarCadastroCustas
#Description: Essa feature valida o cancelamento do cadastro de custas, após selecionar Tipo de Custas,
#Pagante e sair da tela do cadastro de custas sem gerar a custas.

@Funcionalidade
Feature: Cancelar Cadastro Custas
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
  Scenario: Selecionar Pagante e Sair
    When clico botao CUSTAS
    Given clico botao NOVAS CUSTAS
    When seleciono combo Tipo de Custas "Custas Iniciais"
    And visualizo campo TOTAL
    And seleciono pagante combo PAGANTE
    And clico botao ADICIONAR
    When clico botao SAIR
    Then visualizo grid CUSTAS
    Then validar grid de custas vazio





