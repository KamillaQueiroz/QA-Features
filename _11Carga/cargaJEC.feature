@Funcionalidade @Carga
Feature: Balanceamento de Processo
  Com processo no Estado EM VALIDACAO
  Com atuação de COMARCA DE PORTO ALEGRE - JEC

  Scenario Outline: @TipoPedido1 @JEC @Distribuicao @EmValidacao 
    Given acesso site eThemis
    Given uso processo basico JEC
    #Given executo reset QUANTIDADE_RECEBER para TIPO_PEDIDO 1 FORO 269
    Given altero propriedade dto "classe" "Procedimento do Juizado Especial Cível"
    And altero propriedade dto "tipoPedido" "Condomínio"
    And altero propriedade dto "assunto" "Administração :: Competência do Juizado Especial Cível"
    And altero propriedade dto "atuacao" "<ATUACAO>"
    And altero propriedade dto "perfilUsuario" "Servidor"
    And crio processo pelo servico PPE
    And acesso eThemis
    And seleciono combo HOME ATUACAO
    When seleciono combo HOME COMPETENCIA "JEC"
    When efetuo zoneamento do processo em validacao
    And clico aba DADOS COMPLEMENTARES
    And seleciono combo DADOS COMPLEMENTARES TIPO "Sorteio"
    And clico aba FINALIZACAO
    And clico botao FINALIZAR
    #Then verifico QUANTIDADE_RECEBER 0 judicancia origem para TIPO_PEDIDO 1
    #Then verifico QUANTIDADE_RECEBER 0 judicancia destino para TIPO_PEDIDO 1
    #And verifico QUANTIDADE_RECEBER 1 judicancias concorrentes TIPO_PEDIDO 1
    Then finalizo teste

    Examples: 
      | ATUACAO                                |
      #|Comarca de Marau - Vara Adjunta do JEC|
      #| Comarca de Gravataí - Vara do JEC |
      #| Comarca de Caxias do Sul - Vara do JEC |
      |Porto Alegre - 5º Juizado Especial Cível |
      #| Comarca de Caxias do Sul - Vara do JEC |
      #| Comarca de Caxias do Sul - Vara do JEC |
      #| Comarca de Caxias do Sul - Vara do JEC |
      #| Comarca de Caxias do Sul - Vara do JEC |
      #| Comarca de Caxias do Sul - Vara do JEC |
      #| Comarca de Caxias do Sul - Vara do JEC |
