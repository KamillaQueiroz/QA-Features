#Author: Kamilla Xavier
#Date: xx/xx/2017
#Keywords Summary :
#Feature: BalanceamentodeProcessoDependencia-VFP
#Description:

@Funcionalidade  @Balanceamento
Feature: Balanceamento de Processo
  Com processo no Estado EM VALIDACAO
  Com atuação de COMARCA DE PORTO ALEGRE - VFP

  Background:
    Given acesso site eThemis
    Given uso processo basico VFP
 
  @TipoPedido34 @EmValidacao @Dependencia @Done @REGRESSAO
  Scenario: Distribuição / Balanceamento por Dependência sem Alterações - Judicancia Concorrente - Origem do Processo via PPE
    #preparação ambiente interno para execução
    Given executo reset QUANTIDADE_RECEBER para TIPO_PEDIDO 34 FORO 269
    Given altero propriedade dto "classe" "Procedimento Ordinário"
    And altero propriedade dto "tipoPedido" "Indenização por Dano Material/Moral"
    And altero propriedade dto "assunto" "Acidente de Trânsito"
    And altero propriedade dto "atuacao" "Porto Alegre - 1ª Vara da Fazenda Pública"
    And altero propriedade dto "perfilUsuario" "Distribuidor"
    And crio processo pelo servico PPE
    #interação do funcional
    And acesso eThemis
    And seleciono combo HOME ATUACAO "Porto Alegre - Foro Central - Distribuidor"
    When seleciono combo HOME COMPETENCIA "VFP"
    When seleciono combo ESTADO "Em validação"
    And informo campo NUMERO "<NUMERO>"
    And clico botao PESQUISAR
    And clico botao Editar Processo "<NUMERO>"
    When efetuo zoneamento do processo em validacao
    And clico aba DADOS COMPLEMENTARES
    And seleciono combo DADOS COMPLEMENTARES - TIPO DISTRIBUICAO "Dependência"
    And informo numero processo Dependencia judicancia concorrente para TIPO PEDIDO 34
    And clico aba FINALIZACAO
    And clico botao FINALIZAR
    #validação do balancemento em banco
    Then verifico QUANTIDADE_RECEBER 2 judicancia origem para TIPO_PEDIDO 34
    Then verifico QUANTIDADE_RECEBER 1 judicancia destino para TIPO_PEDIDO 34
    And verifico QUANTIDADE_RECEBER 2 judicancias concorrentes TIPO_PEDIDO 34
    And finalizo teste


  @TipoPedido34 @EmValidacao @Dependencia @Done
  Scenario: Distribuição / Balanceamento por Dependência sem Alterações - Mesma Judicancia - Origem do Processo via PPE
    #preparação ambiente interno para execução
    Given executo reset QUANTIDADE_RECEBER para TIPO_PEDIDO 34 FORO 269
    Given altero propriedade dto "classe" "Procedimento Ordinário"
    And altero propriedade dto "tipoPedido" "Indenização por Dano Material/Moral"
    And altero propriedade dto "assunto" "Acidente de Trânsito"
    And altero propriedade dto "atuacao" "Porto Alegre - 1ª Vara da Fazenda Pública"
    And altero propriedade dto "perfilUsuario" "Distribuidor"
    And crio processo pelo servico PPE
    #interação do funcional
    And acesso eThemis
    And seleciono combo HOME ATUACAO "Porto Alegre - Foro Central - Distribuidor" 
    When seleciono combo HOME COMPETENCIA "VFP"
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
    Then verifico QUANTIDADE_RECEBER 1 judicancia origem para TIPO_PEDIDO 34
    Then verifico QUANTIDADE_RECEBER 0 judicancia destino para TIPO_PEDIDO 34
    And verifico QUANTIDADE_RECEBER 1 judicancias concorrentes TIPO_PEDIDO 34
    And finalizo teste

  

  @TipoPedido34 @EmValidacao @Dependencia  @Done
  Scenario: Distribuição / Balanceamento por Dependência com Alterações - Judicancia Concorrente - Origem do Processo via PPE
    #preparação ambiente interno para execução
    Given executo reset QUANTIDADE_RECEBER para TIPO_PEDIDO 34 FORO 269
    Given executo reset QUANTIDADE_RECEBER para TIPO_PEDIDO 65 FORO 269
    Given altero propriedade dto "classe" "Procedimento Ordinário"
    And altero propriedade dto "tipoPedido" "Indenização por Dano Material/Moral"
    And altero propriedade dto "assunto" "Acidente de Trânsito"
    And altero propriedade dto "atuacao" "Porto Alegre - 1ª Vara da Fazenda Pública"
    And altero propriedade dto "perfilUsuario" "Distribuidor"
    And crio processo pelo servico PPE
    #interação do funcional
    And acesso eThemis
    And seleciono combo HOME ATUACAO "Porto Alegre - Foro Central - Distribuidor" 
    When seleciono combo HOME COMPETENCIA "VFP"
    When seleciono combo ESTADO "Em validação"
    And informo campo NUMERO "<NUMERO>"
    And clico botao PESQUISAR
    And clico botao Editar Processo "<NUMERO>"
    And clico aba CLASSIFICACAO
    And seleciono combo CLASSIFICACAO TIPO PEDIDO "Servidor Público Civil"
    And clico botao OK confirma alteracao Tipo de Pedido
    And seleciono combo CLASSIFICACAO ASSUNTO "Contribuições :: Contribuições Previdenciárias :: Cargo em Comissão - 6053"
    And clico botao CLASSIFICACAO ADICIONAR ASSUNTO ASSOCIADO
    When efetuo zoneamento do processo em validacao
    And clico aba DADOS COMPLEMENTARES
    And seleciono combo DADOS COMPLEMENTARES - TIPO DISTRIBUICAO "Dependência" 
    And informo numero processo Dependencia judicancia concorrente para TIPO PEDIDO 65
    And clico aba FINALIZACAO
    And clico botao FINALIZAR
    #validação do balancemento em banco
    Then verifico QUANTIDADE_RECEBER 2 judicancia origem para TIPO_PEDIDO 34
    Then verifico QUANTIDADE_RECEBER 1 judicancia destino para TIPO_PEDIDO 65
    #And verifico QUANTIDADE_RECEBER 2 judicancias concorrentes TIPO_PEDIDO 65  ----------O sistema está com erro nesta validação, está incrementando +1 apenas no destino
    And finalizo teste

 

  @TipoPedido34 @EmValidacao @Dependencia @Done @REGRESSAO
  Scenario: Distribuição / Balanceamento por Dependência com Alterações - Mesma Judicancia - Origem do Processo via PPE
    #preparação ambiente interno para execução
    Given executo reset QUANTIDADE_RECEBER para TIPO_PEDIDO 34 FORO 269
    Given executo reset QUANTIDADE_RECEBER para TIPO_PEDIDO 49 FORO 269
    Given altero propriedade dto "classe" "Procedimento Ordinário"
    And altero propriedade dto "tipoPedido" "Indenização por Dano Material/Moral"
    And altero propriedade dto "assunto" "Acidente de Trânsito"
    And altero propriedade dto "atuacao" "Porto Alegre - 1ª Vara da Fazenda Pública"
    And altero propriedade dto "perfilUsuario" "Distribuidor"
    And crio processo pelo servico PPE
    #interação do funcional
    And acesso eThemis
    And seleciono combo HOME ATUACAO "Porto Alegre - Foro Central - Distribuidor" 
    When seleciono combo HOME COMPETENCIA "VFP"
    When seleciono combo ESTADO "Em validação"
    And informo campo NUMERO "<NUMERO>"
    And clico botao PESQUISAR
    And clico botao Editar Processo "<NUMERO>"    
    And clico aba CLASSIFICACAO
    And seleciono combo CLASSIFICACAO TIPO PEDIDO "Outros"
    And clico botao OK confirma alteracao Tipo de Pedido
    And seleciono combo CLASSIFICACAO ASSUNTO "Adimplemento e Extinção :: Pagamento - 12612"
    And clico botao CLASSIFICACAO ADICIONAR ASSUNTO ASSOCIADO
     When efetuo zoneamento do processo em validacao
    And clico aba DADOS COMPLEMENTARES
    And seleciono combo DADOS COMPLEMENTARES - TIPO DISTRIBUICAO "Dependência"
    And informo numero processo Dependencia judicancia concorrente para TIPO PEDIDO 49
    And clico aba FINALIZACAO
    And clico botao FINALIZAR
    #validação do balancemento em banco
    Then verifico QUANTIDADE_RECEBER 2 judicancia origem para TIPO_PEDIDO 34
    Then verifico QUANTIDADE_RECEBER 1 judicancia destino para TIPO_PEDIDO 49
    #And verifico QUANTIDADE_RECEBER 2 judicancias concorrentes TIPO_PEDIDO 49  ----------O sistema está com erro nesta validação, está incrementando +1 apenas no destino
    And finalizo teste
