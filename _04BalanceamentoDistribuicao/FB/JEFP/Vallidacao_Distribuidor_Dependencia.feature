#Author: Kamilla Xavier
#Date: xx/xx/2017
#Keywords Summary :
#Feature: BalanceamentodeProcessoDependencia-JEFP
#Description:

@Funcionalidade @JEFP  @Balanceamento
Feature: Balanceamento de Processo
  Com perfil de usuário DISTRIBUIDOR
  Com processo no Estado EM VALIDACAO
  Com atuação de COMARCA DE PORTO ALEGRE - JEFP

  Background:
    Given acesso site eThemis
    Given uso processo basico JEFAZ

  @TipoPedido24 @EmValidacao @Dependencia 
  Scenario Outline: Distribuição / Balanceamento Sorteio por Dependência (sem alteração) - Judicância Concorrente
    #preparação ambiente interno para execução
    Given executo reset QUANTIDADE_RECEBER para TIPO_PEDIDO 24 FORO 269
    Given altero propriedade dto "classe" "Procedimento do Juizado Especial Cível"
    And altero propriedade dto "tipoPedido" "Indenização por Dano Material/Moral"
    And altero propriedade dto "assunto" "Erro Médico :: Competência do Juizado Especial da Fazenda Pública Estadual"
    And altero propriedade dto "atuacao" "Porto Alegre - Juizado Especial da Fazenda Pública"
    And altero propriedade dto "perfilUsuario" "Distribuidor"
    And crio processo pelo servico PPE
     #interação do funcional
    And acesso eThemis
    And seleciono combo HOME ATUACAO "Porto Alegre - Foro Central - Distribuidor"
    When seleciono combo HOME COMPETENCIA "JEFP"
    When seleciono combo ESTADO "Em validação"
    And informo campo NUMERO "<NUMERO>"
    And clico botao PESQUISAR
    And clico botao Editar Processo "<NUMERO>"
    When efetuo zoneamento do processo em validacao
    And clico aba DADOS COMPLEMENTARES
    And seleciono combo DADOS COMPLEMENTARES - TIPO DISTRIBUICAO "Dependência"
    And informo numero processo Dependencia judicancia concorrente para TIPO PEDIDO 24
    And clico aba FINALIZACAO
    And clico botao FINALIZAR
    #validação do balancemento em banco
    Then verifico QUANTIDADE_RECEBER 2 judicancia origem para TIPO_PEDIDO 24
    Then verifico QUANTIDADE_RECEBER 1 judicancia destino para TIPO_PEDIDO 24
    And verifico QUANTIDADE_RECEBER 2 judicancias concorrentes TIPO_PEDIDO 24
    And finalizo teste

    Examples:
      | tipopedido                                | assunto                                                       |  atuacao                                                           | competencia      | estado        | tipodistribuicao      |
      | Indenização por Dano Material/Moral       | Indenização por Dano Material :: Acidente de Trânsito - 13570 |  Comarca de Porto Alegre - Juizado Especial da Fazenda Pública     | JEFP             | Em validação  | Dependência           |

# Observações
# REALIZAR IMPLESMENTAÇÃO (CASO NECESSÁRIO) NOS STEPS 15 À 18
# REALIZAR IMPLEMENTAÇÃO DOS STEP DE PESQUISA E EDIÇÃO - LINHAS 23 A 29


  @TipoPedido1 @EmValidacao @Dependencia
  Scenario Outline: Distribuição / Balanceamento Sorteio por Dependência (sem alteração) - Mesma Judicâancia
    #preparação ambiente interno para execução
    Given executo reset QUANTIDADE_RECEBER para TIPO_PEDIDO 24 FORO 269
    Given altero propriedade dto "classe" "Procedimento do Juizado Especial Cível"
    And altero propriedade dto "tipoPedido" "<tipopedido>"
    And altero propriedade dto "assunto" "<assunto>"
    And altero propriedade dto "atuacao" "Comarca de Porto Alegre - Juizado Especial da Fazenda Pública"
    And altero propriedade dto "perfilUsuario" "Distribuidor"
    And crio processo pelo servico PPE
    #interação do funcional
    And acesso eThemis
    And seleciono combo HOME ATUACAO '<atuacao>'
    When seleciono combo HOME COMPETENCIA '<competencia>"
    When seleciono combo ESTADO '<estado>"
    And aciono botão PESQUISAR
    And aciono botão EDITAR
    And clico aba DADOS COMPLEMENTARES
    And seleciono combo TIPO DE DISTRIBUICAO '<tipodistribuicao>'
    And informo numero processo Dependencia mesma judicancia
    And clico aba FINALIZACAO
    And clico botao FINALIZAR
    #validação do balancemento em banco
    Then verifico QUANTIDADE_RECEBER 0 judicancia origem para TIPO_PEDIDO 24
    Then verifico QUANTIDADE_RECEBER 0 judicancia destino para TIPO_PEDIDO 24
    And verifico QUANTIDADE_RECEBER 1 judicancias concorrentes TIPO_PEDIDO 24
    And finalizo teste

    Examples:
      | tipopedido                                | assunto                                                       |  atuacao                                                           | competencia      | estado        | tipodistribuicao      |
      | Indenização por Dano Material/Moral       | Indenização por Dano Material :: Acidente de Trânsito - 13570 |  Comarca de Porto Alegre - Juizado Especial da Fazenda Pública     | JEFP             | Em validação  | Dependência           |

# Observações
# REALIZAR IMPLESMENTAÇÃO (CASO NECESSÁRIO) NOS STEPS 52 À 55
# REALIZAR IMPLEMENTAÇÃO DOS STEP DE PESQUISA E EDIÇÃO - LINHAS 60 A 66


  @TipoPedido1 @EmValidacao @Dependencia
  Scenario Outline: Distribuição / Balanceamento Sorteio para Dependencia (com alteração) - Judicancia Concorrente
    #preparação ambiente interno para execução
    Given executo reset QUANTIDADE_RECEBER para TIPO_PEDIDO 24 FORO 269
    Given executo reset QUANTIDADE_RECEBER para TIPO_PEDIDO 28 FORO 269
    Given altero propriedade dto "classe" "Procedimento do Juizado Especial Cível"
    And altero propriedade dto "tipoPedido" "<tipopedido>"
    And altero propriedade dto "assunto" "<assunto>"
    And altero propriedade dto "atuacao" "Comarca de Porto Alegre - 2º Juizado Especial Cível"
    And altero propriedade dto "perfilUsuario" "Distribuidor"
    And crio processo pelo servico PPE
    #interação do funcional
    And acesso eThemis
    And seleciono combo HOME ATUACAO '<atuacao>'
    When seleciono combo HOME COMPETENCIA '<competencia>"
    When seleciono combo ESTADO '<estado>"
    And aciono botão PESQUISAR
    And aciono botão EDITAR
    And clico aba DADOS COMPLEMENTARES
    And seleciono combo HOME CLASSE '<classe>'
    And seleciono combo CLASSIFICACAO TIPO PEDIDO '<tipopedido2>'
    And clico botao OK confirma alteracao Tipo de Pedido
    And seleciono combo CLASSIFICACAO ASSUNTO '<assunto2>'
    And clico botao CLASSIFICACAO ADICIONAR ASSUNTO ASSOCIADO
    And clico aba DADOS COMPLEMENTARES
    And seleciono combo TIPO DE DISTRIBUICAO '<tipodistribuicao>'
    And informo numero processo Dependencia judicancia concorrente para TIPO PEDIDO 28
    And clico aba FINALIZACAO
    And clico botao FINALIZAR
    #validação do balancemento em banco
    Then verifico mensagem redistribuição
    Then verifico QUANTIDADE_RECEBER 1 judicancia origem para TIPO_PEDIDO 24
    Then verifico QUANTIDADE_RECEBER 1 judicancia destino para TIPO_PEDIDO 28
    And verifico QUANTIDADE_RECEBER 2 judicancias concorrentes TIPO_PEDIDO 28
    And finalizo teste

    Examples:
      | tipopedido                                | assunto                                                       |  atuacao                                                           | competencia      | estado        | classe                                    | tipopedido2                     | assunto2                                                        | tipodistribuicao      |
      | Indenização por Dano Material/Moral       | Indenização por Dano Material :: Acidente de Trânsito - 13570 |  Comarca de Porto Alegre - Juizado Especial da Fazenda Pública     | JEFP             | Em validação  | Procedimento do Juizado Especial Cível    | Tributário Municipal            | Crédito Tributário :: Anulação de Débito Fiscal - 6004          | Dependência           |

# Observações
# REALIZAR IMPLESMENTAÇÃO (CASO NECESSÁRIO) NOS STEPS 90 À 93
# Implementar step de mudança de Pedido com Judicância diferente - linha 89 (CONFIRMAR NECESSIDADE)
# REALIZAR IMPLEMENTAÇÃO DOS STEP DE PESQUISA E EDIÇÃO - LINHAS 98 à 110


  @TipoPedido1 @EmValidacao @Dependencia
  Scenario Outline: Distribuição / Balanceamento Sorteio para Dependencia (com alteração) - Mesma Judicância
    #preparação ambiente interno para execução
    Given executo reset QUANTIDADE_RECEBER para TIPO_PEDIDO 24 FORO 269
    Given executo reset QUANTIDADE_RECEBER para TIPO_PEDIDO 25 FORO 269
    Given altero propriedade dto "classe" "Procedimento do Juizado Especial Cível"
    And altero propriedade dto "tipoPedido" "<tipopedido>"
    And altero propriedade dto "assunto" "<assunto>"
    And altero propriedade dto "atuacao" "Comarca de Porto Alegre - 2º Juizado Especial Cível"
    And altero propriedade dto "perfilUsuario" "Distribuidor"
    And crio processo pelo servico PPE
    #interação do funcional
    And acesso eThemis
    And seleciono combo HOME ATUACAO '<atuacao>'
    When seleciono combo HOME COMPETENCIA '<competencia>"
    When seleciono combo ESTADO '<estado>"
    And aciono botão PESQUISAR
    And aciono botão EDITAR
    And clico aba DADOS COMPLEMENTARES
    And seleciono combo HOME CLASSE '<classe>'
    And seleciono combo CLASSIFICACAO TIPO PEDIDO '<tipopedido2>'
    And clico botao OK confirma alteracao Tipo de Pedido
    And seleciono combo CLASSIFICACAO ASSUNTO '<assunto2>'
    And clico botao CLASSIFICACAO ADICIONAR ASSUNTO ASSOCIADO
    And clico aba DADOS COMPLEMENTARES
    And seleciono combo TIPO DE DISTRIBUICAO '<tipodistribuicao>'
    And informo numero processo Dependencia judicancia concorrente para TIPO PEDIDO 25
    And clico aba FINALIZACAO
    And clico botao FINALIZAR
    #validação do balancemento em banco
    Then verifico QUANTIDADE_RECEBER 1 judicancia origem para TIPO_PEDIDO 24
    Then verifico QUANTIDADE_RECEBER 1 judicancia destino para TIPO_PEDIDO 25
    And verifico QUANTIDADE_RECEBER 2 judicancias concorrentes TIPO_PEDIDO 25
    And finalizo teste

    Examples:
      | tipopedido                                | assunto                                                       |  atuacao                                                           | competencia      | estado        | classe                                    | tipopedido2       | assunto2                                             | tipodistribuicao      |
      | Indenização por Dano Material/Moral       | Indenização por Dano Material :: Acidente de Trânsito - 13570 |  Comarca de Porto Alegre - Juizado Especial da Fazenda Pública     | JEFP             | Em validação  | Procedimento do Juizado Especial Cível    | Outros            | Adimplemento e Extinção :: Pagamento - 15624         | Dependência           |

# Observações
# REALIZAR IMPLESMENTAÇÃO (CASO NECESSÁRIO) NOS STEPS 136 À 139
# Implementar step de mudança de Pedido com Judicância diferente - linha 135 (CONFIRMAR NECESSIDADE)
# REALIZAR IMPLEMENTAÇÃO DOS STEP DE PESQUISA E EDIÇÃO - LINHAS 144 à 156