#Author: Kamilla Xavier
#Date: xx/xx/2017
#Keywords Summary :
#Feature: BalanceamentodeProcessoSorteio-JEFP
#Description:

@Funcionalidade @JEFP  @Balanceamento
Feature: Balanceamento de Processo
  Com perfil de usuário DISTRIBUIDOR
  Com processo no Estado EM VALIDACAO
  Com atuação de COMARCA DE PORTO ALEGRE - JEFP

  Background:
    Given acesso site eThemis
    Given uso processo basico JEFAZ

  @TipoPedido1 @EmValidacao @PorSorteio 
  Scenario Outline: Distribuição / Balanceamento por Sorteio sem Alterações - Origem do Processo via PPE
    #preparação ambiente interno para execução
    Given executo reset QUANTIDADE_RECEBER para TIPO_PEDIDO 24 FORO 269
    Given altero propriedade dto "classe" "Procedimento do Juizado Especial Cível"
    And altero propriedade dto "tipoPedido" "Cobrança"
    And altero propriedade dto "assunto" "Licença-Prêmio"
    And altero propriedade dto "atuacao" "Porto Alegre - Juizado Especial da Fazenda Pública"
    And altero propriedade dto "perfilUsuario" "Distribuidor"
    And crio processo pelo servico PPE
    #interação do funcional
    And acesso eThemis
    And seleciono combo HOME ATUACAO "Porto Alegre - Foro Central - Distribuidor"
    When seleciono combo HOME COMPETENCIA "JEFAZ"
    When seleciono combo ESTADO "Em validação"
    And informo campo NUMERO "<NUMERO>"
    And clico botao PESQUISAR
    And clico botao Editar Processo "<NUMERO>"
    And efetuo zoneamento do processo em validacao
    And clico aba DADOS COMPLEMENTARES
    And seleciono combo DADOS COMPLEMENTARES - TIPO DISTRIBUICAO "Sorteio"
    And clico aba FINALIZACAO
    And clico botao FINALIZAR
    #validação do balancemento em banco
    Then verifico QUANTIDADE_RECEBER 0 judicancia origem para TIPO_PEDIDO 24
    Then verifico QUANTIDADE_RECEBER 0 judicancia destino para TIPO_PEDIDO 24
    Then verifico QUANTIDADE_RECEBER 1 judicancias concorrentes TIPO_PEDIDO 24
    And finalizo teste

    Examples:
      | atuacao                         | competencia       | estado        | tipodistribuicao      |
      | Porto Alegre - Foro Central     | JEFAZ             | Em validação  | Sorteio               |

  @TipoPedido1 @EmValidacao @PorSorteio
  Scenario Outline: Distribuição / Balanceamento por Sorteio com Alteração de Tipo Pedido (mesma judicância) - Origem do Processo via PPE
    #preparação ambiente interno para execução
    Given executo reset QUANTIDADE_RECEBER para TIPO_PEDIDO 24 FORO 269
    Given executo reset QUANTIDADE_RECEBER para TIPO_PEDIDO 25 FORO 269
    Given altero propriedade dto "classe" "Procedimento do Juizado Especial Cível"
    And altero propriedade dto "tipoPedido" "Indenização por Dano Material/Moral"
    And altero propriedade dto "assunto" "Indenização por Dano Material :: Acidente de Trânsito - 13570"
    And altero propriedade dto "atuacao" "Porto Alegre - Juizado Especial da Fazenda Pública"
    And altero propriedade dto "perfilUsuario" "Distribuidor"
    And crio processo pelo servico PPE
    #interação do funcional
    And acesso eThemis
    And seleciono combo HOME ATUACAO "Porto Alegre - Foro Central - Distribuidor"
    When seleciono combo HOME COMPETENCIA "JEFAZ"
    When seleciono combo ESTADO "Em validação"
    And informo campo NUMERO "<NUMERO>"
    And clico botao PESQUISAR
    And clico botao Editar Processo "<NUMERO>"
    And clico aba CLASSIFICACAO
    And seleciono combo CLASSIFICACAO TIPO PEDIDO "Outros"
    And clico botao OK confirma alteracao Tipo de Pedido
    And seleciono combo CLASSIFICACAO ASSUNTO "Adimplemento e Extinção :: Pagamento - 15624"
    And clico botao CLASSIFICACAO ADICIONAR ASSUNTO ASSOCIADO
    And clico aba DADOS COMPLEMENTARES
    And seleciono combo DADOS COMPLEMENTARES - TIPO DISTRIBUICAO "Sorteio"
    And efetuo zoneamento do processo em validacao
    And clico aba FINALIZACAO
    And clico botao FINALIZAR
    #validação do balancemento em banco
    Then verifico QUANTIDADE_RECEBER 1 judicancia origem para TIPO_PEDIDO 24
    Then verifico QUANTIDADE_RECEBER 0 judicancia destino para TIPO_PEDIDO 25
    And verifico QUANTIDADE_RECEBER 1 judicancias concorrentes TIPO_PEDIDO 25
    And finalizo teste

    Examples:
      | atuacao                         | competencia       | estado        | tipopedido     | assunto                                         | tipodistribuicao       |
      | Porto Alegre - Foro Central     | JEFAZ             | Em validação  | Outros         | Adimplemento e Extinção :: Pagamento - 15624    |  Sorteio               |

# Observações
# REALIZAR IMPLESMENTAÇÃO (CASO NECESSÁRIO) NOS STEPS 52 À 56
# REALIZAR IMPLEMENTAÇÃO DOS STEP DE PESQUISA E EDIÇÃO - LINHAS 60 a 69

  @TipoPedido1 @EmValidacao @PorSorteio
  Scenario Outline: Distribuição / Balanceamento por Sorteio com Alteração de Tipo Pedido (judicância diferente) - Origem do Processo via PPE
    #preparação ambiente interno para execução
    Given executo reset QUANTIDADE_RECEBER para TIPO_PEDIDO 24 FORO 269
    Given executo reset QUANTIDADE_RECEBER para TIPO_PEDIDO 28 FORO 269
    Given altero propriedade dto "classe" "Procedimento do Juizado Especial Cível"
    And altero propriedade dto "tipoPedido" "Indenização por Dano Material/Moral"
    And altero propriedade dto "assunto" "Indenização por Dano Material :: Acidente de Trânsito - 13570"
    And altero propriedade dto "atuacao" "Comarca de Porto Alegre - Juizado Especial da Fazenda Pública"
    And altero propriedade dto "perfilUsuario" "Distribuidor"
    And crio processo pelo servico PPE
    #interação do funcional
    And acesso eThemis
    And seleciono combo HOME ATUACAO "Porto Alegre - Foro Central - Distribuidor"
    When seleciono combo HOME COMPETENCIA "JEFAZ"
    When seleciono combo ESTADO "Em validação"
    And informo campo NUMERO "<NUMERO>"
    And clico botao PESQUISAR
    And clico botao Editar Processo "<NUMERO>"
    And clico aba CLASSIFICACAO
    And seleciono combo HOME CLASSE '<classe>'
    And seleciono combo CLASSIFICACAO TIPO PEDIDO '<tipopedido>'
    And clico botao OK confirma alteracao Tipo de Pedido
    And seleciono combo CLASSIFICACAO ASSUNTO '<assunto>'
    And clico botao CLASSIFICACAO ADICIONAR ASSUNTO ASSOCIADO
    And clico aba DADOS COMPLEMENTARES
    And seleciono combo DADOS COMPLEMENTARES TIPO '<tipodistribuicao>'
    And clico aba FINALIZACAO
    And clico botao FINALIZAR
    #validação do balancemento em banco
    Then verifico QUANTIDADE_RECEBER 1 judicancia origem para TIPO_PEDIDO 24
    Then verifico QUANTIDADE_RECEBER 0 judicancia destino para TIPO_PEDIDO 28
    And verifico QUANTIDADE_RECEBER 1 judicancias concorrentes TIPO_PEDIDO 28
    And finalizo teste


    Examples:
      | atuacao                         | competencia     | estado        | classe                                      | tipopedido                | assunto                                                   | tipodistribuicao       |
      | Porto Alegre - Foro Central     | JEC             | Em validação  | Procedimento do Juizado Especial Cível      | Tributário Municipal      | Crédito Tributário :: Anulação de Débito Fiscal - 6004    |  Sorteio               |

# Observações
# REALIZAR IMPLESMENTAÇÃO (CASO NECESSÁRIO) NOS STEPS 91 À 94
# Implementar step de mudança de Pedido com Judicância diferente - linha 90 (CONFIRMAR NECESSIDADE)
# REALIZAR IMPLEMENTAÇÃO DOS STEP DE PESQUISA E EDIÇÃO - LINHAS 99 À 109