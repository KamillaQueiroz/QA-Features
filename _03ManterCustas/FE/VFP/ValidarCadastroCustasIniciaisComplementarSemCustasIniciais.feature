#Author: Sheila Lopes
#Date: 05/10/2017
#Keywords Summary : Custas Iniciais, Custas Iniciais Complementar, Tipo Custas, Novas Custas
#Feature: ValidarCadastroCustasIniciaisComplementarSemCustasIniciais
#Description: Essa feature tem o objetivo de validar o cadastro de custas iniciais complementar,
#sem o cadastro de custas iniciais.

@Funcionalidade
Feature: Validar Cadastro Custas Iniciais Complementar Sem Custas Iniciais
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
  Scenario: Validar Cadastro Custas Iniciais Complementar
    When clico botao CUSTAS
    Given clico botao NOVAS CUSTAS
    When seleciono combo Tipo de Custas "Custas Iniciais - Complementar"
    Then visualizo mensagem erro cadastro custas complementar "Não há registros ativos de Custas Iniciais, portanto, não é possível inserir 'Custas Iniciais - Complementar'."
