@Funcionalidade @Carga
Feature: Carga de Processo JEFP
  Com processo no Estado EM VALIDACAO
  Com atuação variada

  Scenario Outline: @TipoPedido1 @JEC @Distribuicao @EmValidacao
    Given acesso site eThemis
    Given uso processo basico JEFAZ
    #Given executo reset QUANTIDADE_RECEBER para TIPO_PEDIDO 1 FORO 269
    #Given altero propriedade dto "classe" "Procedimento do Juizado Especial Cível"
    And altero propriedade dto "tipoPedido" "<TIPOPEDIDO>"
    And altero propriedade dto "assunto" "<ASSUNTO>"
    Given altero propriedade dto "atuacao" "<ATUACAO>"
    #And altero propriedade dto "perfilUsuario" "Servidor"
    And crio processo pelo servico PPE
    #And acesso eThemis
    #And seleciono combo HOME ATUACAO
    #When seleciono combo HOME COMPETENCIA "JEC"
    #When efetuo zoneamento do processo em validacao
    #And clico aba DADOS COMPLEMENTARES
    #And seleciono combo DADOS COMPLEMENTARES TIPO "Sorteio"
    #And clico aba FINALIZACAO
    #And clico botao FINALIZAR
    #Then verifico QUANTIDADE_RECEBER 0 judicancia origem para TIPO_PEDIDO 1
    #Then verifico QUANTIDADE_RECEBER 0 judicancia destino para TIPO_PEDIDO 1
    #And verifico QUANTIDADE_RECEBER 1 judicancias concorrentes TIPO_PEDIDO 1
    Then finalizo teste

    Examples: 
      | ATUACAO                                                        | TIPOPEDIDO                          | ASSUNTO     |
      #|Comarca de Gravataí - Juizado Especial da Fazenda Pública Adjunto|Indenização por Dano Material/Moral|Erro Médico |
      #|Comarca de Gravataí - Juizado Especial da Fazenda Pública Adjunto|Indenização por Dano Material/Moral|Erro Médico |
      #|Comarca de Gravataí - Juizado Especial da Fazenda Pública Adjunto|Indenização por Dano Material/Moral|Erro Médico |
      #|Comarca de Gravataí - Juizado Especial da Fazenda Pública Adjunto|Indenização por Dano Material/Moral|Erro Médico |
      #|Comarca de Gravataí - Juizado Especial da Fazenda Pública Adjunto|Indenização por Dano Material/Moral|Erro Médico |
      | Comarca de Porto Alegre - 10ª Vara da Fazenda Pública | Saúde | Fornecimento de Medicamentos |
      #| Comarca de Caxias do Sul - Juizado Especial da Fazenda Pública | Indenização por Dano Material/Moral | Erro Médico |
      #| Comarca de Caxias do Sul - Juizado Especial da Fazenda Pública | Indenização por Dano Material/Moral | Erro Médico |
      #| Comarca de Caxias do Sul - Juizado Especial da Fazenda Pública | Indenização por Dano Material/Moral | Erro Médico |
      #| Comarca de Caxias do Sul - Juizado Especial da Fazenda Pública | Indenização por Dano Material/Moral | Erro Médico |
      #| Comarca de Caxias do Sul - Juizado Especial da Fazenda Pública | Indenização por Dano Material/Moral | Erro Médico |
      #| Comarca de Caxias do Sul - Juizado Especial da Fazenda Pública | Indenização por Dano Material/Moral | Erro Médico |
      #| Comarca de Caxias do Sul - Juizado Especial da Fazenda Pública | Indenização por Dano Material/Moral | Erro Médico |
      #| Comarca de Caxias do Sul - Juizado Especial da Fazenda Pública | Indenização por Dano Material/Moral | Erro Médico |
