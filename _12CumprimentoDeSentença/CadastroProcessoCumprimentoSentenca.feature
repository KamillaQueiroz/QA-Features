@Funcionalidade
Feature: Cadastro de processo do tipo Cumprimento de Sentença
  Processo no Estado Em Validação PPE
  Processo com atuação JEFAZ, JEC, VFP

  @Done
  Scenario: Cadastrar Processo JEC - Cumprimento de Sentença - Processo no Estado Em Validação PPE
    Given acesso site eThemis
    Given uso processo basico JEC
    And altero propriedade dto "atuacao" "Santiago - Vara Adjunta do JEC"
    Given altero propriedade dto "classe" "Cumprimento de sentença"
    And altero propriedade dto "tipoPedido" "Cumprimento de Sentença"
    And altero propriedade dto "assunto" "Liquidação / Cumprimento / Execução"
    And altero propriedade dto "perfilUsuario" "Distribuidor"
    Given removo todas partes do processo dto
    And altero Tipo Participacao polo Ativo "Exequente"
    And altero Tipo Participacao polo Passivo "Executado"
    And crio processo pelo servico PPE
    And pesquiso comarca
    Then exibo processo e comarca
    Then valido status do processo "Em validação"

  @Done
  Scenario: Cadastrar Processo VFP - Cumprimento de Sentença - Processo no Estado Em Validação PPE
    Given acesso site eThemis
    Given uso processo basico VFP
    Given altero propriedade dto "classe" "Cumprimento de sentença"
    And altero propriedade dto "tipoPedido" "Cumprimento de Sentença"
    And altero propriedade dto "assunto" "Liquidação / Cumprimento / Execução"
    And altero propriedade dto "atuacao" "Porto Alegre - 12ª Vara da Fazenda Pública"
    And altero propriedade dto "tipoDistribuicao" "Dependência"
    And altero propriedade dto "perfilUsuario" "Distribuidor"
    Given removo todas partes do processo dto
    And altero Tipo Participacao polo Ativo "Exequente"
    And altero Tipo Participacao polo Passivo "Executado"
    And crio processo pelo servico PPE
    And pesquiso comarca
    Then exibo processo e comarca
    Then valido status do processo "Em validação"

  @Done
  Scenario: Cadastrar Processo JEFAZ - Cumprimento de Sentença - Processo no Estado Em Validação PPE
    Given acesso site eThemis
    Given uso processo basico JEFAZ
    Given altero propriedade dto "classe" "Cumprimento de sentença"
    And altero propriedade dto "tipoPedido" "Cumprimento de Sentença"
    And altero propriedade dto "assunto" "Liquidação / Cumprimento / Execução"
    And altero propriedade dto "atuacao" "Porto Alegre - 1º Juizado Especial da Fazenda Pública"
    And altero propriedade dto "tipoDistribuicao" "Dependência"
    And altero propriedade dto "perfilUsuario" "Distribuidor"
    Given removo todas partes do processo dto
    And altero Tipo Participacao polo Ativo "Exequente"
    And altero Tipo Participacao polo Passivo "Executado"
    And crio processo pelo servico PPE
    And pesquiso comarca
    Then exibo processo e comarca
    Then valido status do processo "Em validação"
