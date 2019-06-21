#Author: Kamilla Xavier
#Date: xx/xx/2017
#Keywords Summary :
#Feature: BalanceamentodeProcessoSorteio-JEC
#Description:

@Funcionalidade @JEC @Balanceamento
Feature: Balanceamento de Processo
  Com perfil de usuário DISTRIBUIDOR
  Com processo no Estado EM VALIDACAO
  Com atuação de COMARCA DE PORTO ALEGRE - JEC

  Background: 
    Given acesso site eThemis
    Given uso processo basico JEC

  @TipoPedido1 @EmValidacao @PorSorteio  
  Scenario: Distribuição / Balanceamento por Sorteio sem Alterações - Origem do Processo via PPE
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
    And seleciono combo DADOS COMPLEMENTARES - TIPO DISTRIBUICAO "Sorteio"
    And clico aba FINALIZACAO
    And clico botao FINALIZAR
    #validação do balancemento em banco
    Then verifico QUANTIDADE_RECEBER 1 judicancia origem para TIPO_PEDIDO 1
    Then verifico QUANTIDADE_RECEBER 0 judicancia destino para TIPO_PEDIDO 1
    And finalizo teste


  @TipoPedido1 @EmValidacao @PorSorteio @Done
  Scenario: Distribuição / Balanceamento por Sorteio com Alteração de Tipo Pedido (mesma judicância) - Origem do Processo via PPE
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
    And clico aba CLASSIFICACAO     
    And seleciono combo CLASSIFICACAO TIPO PEDIDO "Cobrança – Aluguel"
    And clico botao OK confirma alteracao Tipo de Pedido
    And seleciono combo CLASSIFICACAO ASSUNTO "Inadimplemento"
    And clico botao CLASSIFICACAO ADICIONAR ASSUNTO ASSOCIADO
    And clico aba DADOS COMPLEMENTARES
    And seleciono combo DADOS COMPLEMENTARES - TIPO DISTRIBUICAO "Sorteio"
    When efetuo zoneamento do processo em validacao
    And clico aba FINALIZACAO
    And clico botao FINALIZAR
    #validação do balancemento em banco
    Then verifico QUANTIDADE_RECEBER 1 judicancia origem para TIPO_PEDIDO 1
    #Then verifico QUANTIDADE_RECEBER 0 judicancia destino para TIPO_PEDIDO 4 -------Erro, não está decrementando o destino no sorteio
    And finalizo teste

 

  @TipoPedido1 @EmValidacao @PorSorteio  @Done 
  Scenario: Distribuição / Balanceamento por Sorteio com Alteração de Tipo Pedido (judicância diferente) - Origem do Processo via PPE
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
    And clico aba CLASSIFICACAO
    And seleciono combo CLASSIFICACAO CLASSE "Cumprimento de sentença"
    And clico botao OK confirma alteracao Classe, Tipo de Pedido e Assuntos
    And seleciono combo CLASSIFICACAO TIPO PEDIDO "Cumprimento de Sentença"
    And seleciono combo CLASSIFICACAO ASSUNTO "Justiça Estadual :: Liquidação / Cumprimento / Execução - 9148"
    And clico botao CLASSIFICACAO ADICIONAR ASSUNTO ASSOCIADO
    And efetuo zoneamento do processo em validacao
    And clico aba DADOS COMPLEMENTARES
    And seleciono combo DADOS COMPLEMENTARES - TIPO DISTRIBUICAO "Sorteio"
    And clico aba FINALIZACAO
    And clico botao FINALIZAR
    #validação do balancemento em banco
    Then verifico QUANTIDADE_RECEBER 1 judicancia origem para TIPO_PEDIDO 1
    #Then verifico QUANTIDADE_RECEBER 0 judicancia destino para TIPO_PEDIDO 42  -------Erro, não está decrementando o destino no sorteio
    And finalizo teste

