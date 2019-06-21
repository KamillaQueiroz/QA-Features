@Funcionalidade
Feature: Redistribuição Processo JEFAZ com Balanceamento
  Como usuario de perfil Servidor
  Com atuacao - JEFAZ
  Processo status em Verificar Providências

  Background: 
    Given acesso site eThemis
    Given uso processo basico JEFAZ
    And altero propriedade dto "perfilUsuario" "Servidor"
    And altero propriedade dto "atuacao" "Porto Alegre - 1º Juizado Especial da Fazenda Pública"
    And altero propriedade dto "classe" "Procedimento do Juizado Especial Cível"
    And altero propriedade dto "tipoPedido" "Servidor Público Civil"
    And altero propriedade dto "assunto" "Aposentadoria :: Compulsória - 13472"
    And altero propriedade dto "providenciaCartorio" "true"
    And removo todas partes do processo dto
    And adiciono parte dto FISICO ATIVO Tipo Participacao "Autor"
    And adiciono Passivo orgão público "DEMHAB - Departamento de Habitação de Porto Alegre"
    Given crio processo JEFAZ
    And seleciono combo HOME ATUACAO "Porto Alegre - 1º Juizado Especial da Fazenda Pública"
    And informo campo NUMERO "<NUMERO>"
    And clico botao PESQUISAR
    When clico botao Verificar Providências

  #FORO CENTRAL EM HML: 172 - FORO CENTRAL EM DESEN: 269
  @Done 
  Scenario: Redistribuir Processo JEFAZ - Origem JEFAZ/ Destino JEFAZ - mesma competência - Sem influência no balanceamento (Sorteio)
    Given executo reset QUANTIDADE_RECEBER para TIPO_PEDIDO 22 FORO 172
    Given seleciono opção "Redistribuição" na combo AÇÃO/ENCAMINHAR
    And clico botao FINALIZAR Ação/Encaminhar
    And seleciono Motivo da Redistribuicao "Incompetência"
    And clico botao FINALIZAR Redistribuição
    When clico botao CONFIRMAR Redistribuição
    Then visualizo a mensagem "Processo redistribuído com sucesso." de confirmação de Redistruição
    Then verifico QUANTIDADE_RECEBER 1 judicancia origem para TIPO_PEDIDO 22
    Then verifico QUANTIDADE_RECEBER 1 judicancia destino para TIPO_PEDIDO 22

@EmDesenvolvimento
  Scenario: Redistribuir Processo JEFAZ - Origem JEFAZ/ Destino JEFAZ - mesma competência - Sem influência no balanceamento (Dependência)
    Given executo reset QUANTIDADE_RECEBER para TIPO_PEDIDO 22 FORO 172
    Given seleciono opção "Redistribuição" na combo AÇÃO/ENCAMINHAR
    And clico botao FINALIZAR Ação/Encaminhar
    And seleciono Tipo Redistribuição "Dependência"
    And seleciono Vara de Destino "2º Juizado Especial da Fazenda Pública"
    And seleciono Juizado de Destino "Juizado 1"
    And seleciono Judicancia de Destino "Dr. et1g-magistrado"
    And seleciono Motivo da Redistribuicao "Incompetência"
    And clico botao FINALIZAR Redistribuição
    When clico botao CONFIRMAR Redistribuição
    Then visualizo a mensagem "Processo redistribuído com sucesso." de confirmação de Redistruição
    Then verifico QUANTIDADE_RECEBER 2 judicancia origem para TIPO_PEDIDO 22
    Then verifico QUANTIDADE_RECEBER 1 judicancia destino para TIPO_PEDIDO 22
    And verifico QUANTIDADE_RECEBER 2 judicancias concorrentes TIPO_PEDIDO 22

@EmDesenvolvimento
  Scenario: Redistribuir Processo JEFAZ - Origem JEFAZ/ Destino VFP - outra competência - Balanceamento com Compensação (Sorteio)
    #	Given executo reset QUANTIDADE_RECEBER para TIPO_PEDIDO 22 FORO 172
    Given seleciono opção "Redistribuição" na combo AÇÃO/ENCAMINHAR
    And clico botao FINALIZAR Ação/Encaminhar
    And seleciono Competência de Destino "Vara da Fazenda Pública"
    And seleciono Tipo Pedido de Destino "Tributário Estadual"
    And seleciono Assunto Destino "Atos Administrativos :: Infração Administrativa :: Multas e demais Sanções - 10023"
    And clico botao Adicionar assunto
    And seleciono Tipo Redistribuição "Dependência"
    And seleciono Vara de Destino "3º Juizado Especial Cível"
    And seleciono Juizado de Destino "Juizado 1"
    And seleciono Judicancia de Destino "Dr. Gustavo Alberto Gastal Diefenthaler"
    And seleciono Motivo da Redistribuicao "Recusa de prevenção/dependência"
    And clico botao FINALIZAR Redistribuição
    When clico botao CONFIRMAR Redistribuição
