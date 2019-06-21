@Funcionalidade
Feature: Reedistribuição Processo JEC com Balanceamento
  Como usuario de perfil Servidor
  Com atuacao - JEC
  Processo status em Verificar Providências
  
 Background:
    Given acesso site eThemis
    Given uso processo basico JEC
    And altero propriedade dto "perfilUsuario" "Servidor"
    Given altero propriedade dto "classe" "Procedimento do Juizado Especial Cível"
    And altero propriedade dto "tipoPedido" "Acidente de Trânsito – Reparação de Danos"
    And altero propriedade dto "assunto" "Acidente de Trânsito"
    And altero propriedade dto "atuacao" "Porto Alegre - 1º Juizado Especial Cível"
    And altero propriedade dto "providenciaCartorio" "true"
    Given crio processo JEC
    And seleciono combo HOME ATUACAO "Porto Alegre - 1º Juizado Especial Cível"
    And informo campo NUMERO "<NUMERO>"
    And clico botao PESQUISAR
    When clico botao Verificar Providências
        
     #FORO CENTRAL EM HML: 172 - FORO CENTRAL EM DESEN: 269       
   @Done 
   Scenario: Redistribuir Processo JEC - Origem JEC/ Destino JEC - Sorteio - Sem Alteração no Balanceamento
   	Given executo reset QUANTIDADE_RECEBER para TIPO_PEDIDO 1 FORO 172
    Given seleciono opção "Redistribuição" na combo AÇÃO/ENCAMINHAR
    And clico botao FINALIZAR Ação/Encaminhar
    And seleciono Motivo da Redistribuicao "Recusa de prevenção/dependência"
    And clico botao FINALIZAR Redistribuição
    #Then valido informações da tela Confirmação de redistribuição de processo
    When clico botao CONFIRMAR Redistribuição 
    Then visualizo a mensagem "Processo redistribuído com sucesso." de confirmação de Redistruição
    Then verifico QUANTIDADE_RECEBER 2 judicancia origem para TIPO_PEDIDO 1
    Then verifico QUANTIDADE_RECEBER 0 judicancia destino para TIPO_PEDIDO 1
        
  @Done @Redistribuicao 
  Scenario: Reedistribuir Processo JEC - Validação alteração de campos JEC 
    Given seleciono opção "Redistribuição" na combo AÇÃO/ENCAMINHAR
    And clico botao FINALIZAR Ação/Encaminhar
    Then valido campo Classe não é permitido alteração no JEC
    And valido campo Tipo Pedido não é permitido alteração no JEC
    And valido campo Competência de destino não é permitido alteração no JEC
    
  @Done @Redistribuicao
  Scenario: Redistribuir Processo JEC - Origem JEC/ Destino JEC - Dependência - Judicância Concorrente
  	Given executo reset QUANTIDADE_RECEBER para TIPO_PEDIDO 1 FORO 172
    Given seleciono opção "Redistribuição" na combo AÇÃO/ENCAMINHAR
    And clico botao FINALIZAR Ação/Encaminhar
    And seleciono Tipo Redistribuição "Dependência"
    And seleciono Vara de Destino "3º Juizado Especial Cível"
    And seleciono Juizado de Destino "Juizado 1"
    And seleciono Judicancia de Destino "Dr. Jose Vinicius Andrade Jappur"
    And seleciono Motivo da Redistribuicao "Recusa de prevenção/dependência"
    And clico botao FINALIZAR Redistribuição
    When clico botao CONFIRMAR Redistribuição 
    Then visualizo a mensagem "Processo redistribuído com sucesso." de confirmação de Redistruição
    Then verifico QUANTIDADE_RECEBER 2 judicancia origem para TIPO_PEDIDO 1
    Then verifico QUANTIDADE_RECEBER 1 judicancia destino para TIPO_PEDIDO 1
    And verifico QUANTIDADE_RECEBER 2 judicancias concorrentes TIPO_PEDIDO 1
    
    
