#Author: Sheila Lopes
#Date: 11/08/2017
#Keywords Summary : Novas Custas, Limpar
#Feature: LimparTelaCadastroCustas
#Description: Essa feature valida o funcionamento do botão Limpar na modal Novas Custas.

@Funcionalidade
Feature: Limpar Tela Cadastro Custas
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
  Scenario: Limpar Modal Novas Custas
    When clico botao CUSTAS
    Given clico botao NOVAS CUSTAS
    When seleciono combo Tipo de Custas "Custas Iniciais"
    When clico botao LIMPAR Custas
    Then valido exibicao combo Tipo de Custas


