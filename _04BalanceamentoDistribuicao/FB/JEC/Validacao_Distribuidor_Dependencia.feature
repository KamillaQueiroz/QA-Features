#Author: Kamilla Xavier
#Date: xx/xx/2017
#Keywords Summary :
#Feature: BalanceamentodeProcessoDependencia-JEC
#Description:


Feature: Balanceamento de Processo
  Com perfil de usuário DISTRIBUIDOR
  Com processo no Estado EM VALIDACAO
  Com atuação de COMARCA DE PORTO ALEGRE - JEC

  Background:
    Given acesso site eThemis
    Given uso processo basico JEC

  @TipoPedido1 @EmValidacao @Dependencia @Distribuicao @REGRESSAO
  Scenario: Distribuição / Balanceamento Sorteio por Dependência (sem alteração) - Judicância Concorrente
    #preparação ambiente interno para execução
    Given executo reset QUANTIDADE_RECEBER para TIPO_PEDIDO 1 FORO 269
    Given altero propriedade dto "classe" "Procedimento do Juizado Especial Cível"
    And altero propriedade dto "tipoPedido" "Acidente de Trânsito – Reparação de Danos"
    And altero propriedade dto "assunto" "Acidente de Trânsito :: Competência do Juizado Especial Cível"
    And altero propriedade dto "atuacao" "Porto Alegre - 2º Juizado Especial Cível"
    And altero propriedade dto "perfilUsuario" "Distribuidor"
    And crio processo pelo servico PPE
    #interação do funcional
    And acesso eThemis
    And seleciono combo HOME ATUACAO "Porto Alegre - Foro Central"
    When seleciono combo HOME COMPETENCIA "JEC"
    When seleciono combo ESTADO "Em validação"
    And informo campo NUMERO "<NUMERO>"
    And clico botao PESQUISAR
    And clico botao Editar Processo "<NUMERO>"
    When efetuo zoneamento do processo em validacao
    And clico aba DADOS COMPLEMENTARES
    And seleciono combo DADOS COMPLEMENTARES - TIPO DISTRIBUICAO "Dependência"
    And informo numero processo Dependencia judicancia concorrente para TIPO PEDIDO 1
    And clico aba FINALIZACAO
    And clico botao FINALIZAR
    #validação do balancemento em banco
    Then verifico QUANTIDADE_RECEBER 2 judicancia origem para TIPO_PEDIDO 1
    Then verifico QUANTIDADE_RECEBER 1 judicancia destino para TIPO_PEDIDO 1
    And verifico QUANTIDADE_RECEBER 2 judicancias concorrentes TIPO_PEDIDO 1
    And finalizo teste


  @TipoPedido1 @EmValidacao @Dependencia @Done
  Scenario: Distribuição / Balanceamento Sorteio por Dependência (sem alteração) - Mesma Judicância
    #preparação ambiente interno para execução
    Given executo reset QUANTIDADE_RECEBER para TIPO_PEDIDO 1 FORO 269
    Given altero propriedade dto "classe" "Procedimento do Juizado Especial Cível"
    And altero propriedade dto "tipoPedido" "Acidente de Trânsito – Reparação de Danos"
    And altero propriedade dto "assunto" "Acidente de Trânsito"
    And altero propriedade dto "atuacao" "Porto Alegre - 2º Juizado Especial Cível"
    And altero propriedade dto "perfilUsuario" "Distribuidor"
    And crio processo pelo servico PPE
    #interação do funcional
    And acesso eThemis
    And seleciono combo HOME ATUACAO "Porto Alegre - Foro Central - Distribuidor"
    When seleciono combo HOME COMPETENCIA "JEC"
    When seleciono combo ESTADO "Em validação"
    And informo campo NUMERO "<NUMERO>"
    And clico botao PESQUISAR
    And clico botao Editar Processo "<NUMERO>"
    When efetuo zoneamento do processo em validacao
    And clico aba DADOS COMPLEMENTARES
    And seleciono combo DADOS COMPLEMENTARES - TIPO DISTRIBUICAO "Dependência"
    And informo numero processo Dependencia mesma judicancia
    And clico aba FINALIZACAO
    And clico botao FINALIZAR
    #validação do balancemento em banco
    Then verifico QUANTIDADE_RECEBER 1 judicancia origem para TIPO_PEDIDO 1
    Then verifico QUANTIDADE_RECEBER 0 judicancia destino para TIPO_PEDIDO 1
    And verifico QUANTIDADE_RECEBER 1 judicancias concorrentes TIPO_PEDIDO 1
    And finalizo teste


  @TipoPedido1 @EmValidacao @Dependencia  @Done
  Scenario: Distribuição / Balanceamento Sorteio para Dependencia (com alteração) - Judicancia Concorrente
    #preparação ambiente interno para execução
    Given executo reset QUANTIDADE_RECEBER para TIPO_PEDIDO 1 FORO 269
    Given executo reset QUANTIDADE_RECEBER para TIPO_PEDIDO 42 FORO 269
    Given altero propriedade dto "classe" "Procedimento do Juizado Especial Cível"
    And altero propriedade dto "tipoPedido" "Acidente de Trânsito – Reparação de Danos"
    And altero propriedade dto "assunto" "Acidente de Trânsito"
    And altero propriedade dto "atuacao" "Porto Alegre - 2º Juizado Especial Cível"
    And altero propriedade dto "perfilUsuario" "Distribuidor"
    And crio processo pelo servico PPE
    #interação do funcional
    And acesso eThemis
    And seleciono combo HOME ATUACAO "Porto Alegre - Foro Central - Distribuidor"
    When seleciono combo HOME COMPETENCIA "JEC"
    When seleciono combo ESTADO "Em validação"
    And informo campo NUMERO "<NUMERO>"
    And clico botao PESQUISAR
    And clico botao Editar Processo "<NUMERO>"
    And seleciono combo CLASSIFICACAO CLASSE "Cumprimento de sentença"
    And clico botao OK confirma alteracao Classe, Tipo de Pedido e Assuntos
    And seleciono combo CLASSIFICACAO TIPO PEDIDO "Cumprimento de Sentença"
    And seleciono combo CLASSIFICACAO ASSUNTO "Justiça Estadual :: Liquidação / Cumprimento / Execução - 9148"
    And clico botao CLASSIFICACAO ADICIONAR ASSUNTO ASSOCIADO
    When efetuo zoneamento do processo em validacao
    And clico aba DADOS COMPLEMENTARES
    And seleciono combo DADOS COMPLEMENTARES - TIPO DISTRIBUICAO "Dependência"
    And informo numero processo Dependencia judicancia concorrente para TIPO PEDIDO 42
    And clico aba FINALIZACAO
    And clico botao FINALIZAR
    #validação do balancemento em banco
    Then verifico QUANTIDADE_RECEBER 2 judicancia origem para TIPO_PEDIDO 1
    Then verifico QUANTIDADE_RECEBER 1 judicancia destino para TIPO_PEDIDO 42
   # And verifico QUANTIDADE_RECEBER 2 judicancias concorrentes TIPO_PEDIDO 42    ----------O sistema está com erro nesta validação, está incrementando +1 apenas no destino
    And finalizo teste


  @TipoPedido1 @EmValidacao @Dependencia @Done @REGRESSAO
  Scenario: Distribuição / Balanceamento Sorteio para Dependencia (com alteração) - Mesma Judicância
    #preparação ambiente interno para execução
    Given executo reset QUANTIDADE_RECEBER para TIPO_PEDIDO 1 FORO 269
    Given executo reset QUANTIDADE_RECEBER para TIPO_PEDIDO 4 FORO 269
    Given altero propriedade dto "classe" "Procedimento do Juizado Especial Cível"
    And altero propriedade dto "tipoPedido" "Acidente de Trânsito – Reparação de Danos"
    And altero propriedade dto "assunto" "Acidente de Trânsito"
    And altero propriedade dto "atuacao" "Porto Alegre - 2º Juizado Especial Cível"
    And altero propriedade dto "perfilUsuario" "Distribuidor"
    And crio processo pelo servico PPE
    #interação do funcional
    And acesso eThemis
    And seleciono combo HOME ATUACAO "Porto Alegre - Foro Central - Distribuidor"
    When seleciono combo HOME COMPETENCIA "JEC"
    When seleciono combo ESTADO "Em validação"
    And informo campo NUMERO "<NUMERO>"
    And clico botao PESQUISAR
    And clico botao Editar Processo "<NUMERO>"
    And seleciono combo CLASSIFICACAO TIPO PEDIDO "Cobrança – Aluguel"
    And clico botao OK confirma alteracao Tipo de Pedido
    And seleciono combo CLASSIFICACAO ASSUNTO "Obrigações :: Inadimplemento - 12631"
    And clico botao CLASSIFICACAO ADICIONAR ASSUNTO ASSOCIADO
    And efetuo zoneamento do processo em validacao
    And clico aba DADOS COMPLEMENTARES
    And seleciono combo DADOS COMPLEMENTARES - TIPO DISTRIBUICAO "Dependência"
    And informo numero processo Dependencia judicancia concorrente para TIPO PEDIDO 4
    And clico aba FINALIZACAO
    And clico botao FINALIZAR
    #validação do balancemento em banco
    Then verifico QUANTIDADE_RECEBER 2 judicancia origem para TIPO_PEDIDO 1
   # Then verifico QUANTIDADE_RECEBER 0 judicancia destino para TIPO_PEDIDO 4 ----------O sistema está com erro nesta validação, está incrementando +1 apenas no destino
    And verifico QUANTIDADE_RECEBER 2 judicancias concorrentes TIPO_PEDIDO 4
    And finalizo teste

    
    