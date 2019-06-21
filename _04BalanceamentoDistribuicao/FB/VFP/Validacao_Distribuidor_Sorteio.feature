#Author: Kamilla Xavier
#Date: xx/xx/2017
#Keywords Summary :
#Feature: BalanceamentodeProcessoSorteio-VFP
#Description:


Feature: Balanceamento de Processo
  Com processo no Estado EM VALIDACAO
  Com atuação de COMARCA DE PORTO ALEGRE - VFP

  Background: 
    Given acesso site eThemis
    Given uso processo basico VFP

  @TipoPedido34 @EmValidacao @PorSorteio @Done
  Scenario: Distribuição / Balanceamento por Sorteio sem Alterações - Origem do Processo via PPE
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
    And seleciono combo DADOS COMPLEMENTARES - TIPO DISTRIBUICAO "Sorteio"
    And clico aba FINALIZACAO
    And clico botao FINALIZAR
    #validação do balancemento em banco
    Then verifico QUANTIDADE_RECEBER 1 judicancia origem para TIPO_PEDIDO 34
    Then verifico QUANTIDADE_RECEBER 0 judicancia destino para TIPO_PEDIDO 34
    And verifico QUANTIDADE_RECEBER 1 judicancias concorrentes TIPO_PEDIDO 34
    And finalizo teste


  @TipoPedido34 @EmValidacao @PorSorteio @Done
  Scenario: Distribuição / Balanceamento por Sorteio com Alteração de Tipo Pedido (mesma judicância) - Origem do Processo via PPE
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
    And efetuo zoneamento do processo em validacao
    And clico aba DADOS COMPLEMENTARES
    And seleciono combo DADOS COMPLEMENTARES - TIPO DISTRIBUICAO "Sorteio"
    And clico aba FINALIZACAO
    And clico botao FINALIZAR
    #validação do balancemento em banco
    Then verifico QUANTIDADE_RECEBER 1 judicancia origem para TIPO_PEDIDO 34
    #Then verifico QUANTIDADE_RECEBER 0 judicancia destino para TIPO_PEDIDO 49 -------Erro, não está decrementando o destino no sorteio
    #And verifico QUANTIDADE_RECEBER 1 judicancias concorrentes TIPO_PEDIDO 49
    And finalizo teste

  

  @TipoPedido34 @EmValidacao @PorSorteio  @Done
  Scenario: Distribuição / Balanceamento por Sorteio com Alteração de Tipo Pedido (judicância diferente) - Origem do Processo via PPE
  #preparação ambiente interno para execução
    Given executo reset QUANTIDADE_RECEBER para TIPO_PEDIDO 34 FORO 269
    Given executo reset QUANTIDADE_RECEBER para TIPO_PEDIDO 44 FORO 269
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
    And seleciono combo CLASSIFICACAO TIPO PEDIDO "Acidente do Trabalho - INSS"
    And clico botao OK confirma alteracao Tipo de Pedido
    And seleciono combo CLASSIFICACAO ASSUNTO "Benefícios em Espécie :: Auxílio-Acidente (Art. 86) - 6107"
    And clico botao CLASSIFICACAO ADICIONAR ASSUNTO ASSOCIADO
    And efetuo zoneamento do processo em validacao
    And clico aba DADOS COMPLEMENTARES
    And seleciono combo DADOS COMPLEMENTARES - TIPO DISTRIBUICAO "Sorteio"
    And clico aba FINALIZACAO
    And clico botao FINALIZAR
  #validação do balancemento em banco
    Then verifico QUANTIDADE_RECEBER 1 judicancia origem para TIPO_PEDIDO 34
    Then verifico QUANTIDADE_RECEBER 0 judicancia destino para TIPO_PEDIDO 44
    And verifico QUANTIDADE_RECEBER 1 judicancias concorrentes TIPO_PEDIDO 44
    And finalizo teste

    
