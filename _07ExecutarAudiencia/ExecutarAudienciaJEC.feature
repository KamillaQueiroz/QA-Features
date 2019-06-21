@Funcionalidade
Feature: Execução de Audiências JEC

  #Background:
  #Given acesso site eThemis
  #		  Given uso processo basico JEC
  #		  And altero propriedade dto "perfilUsuario" "Servidor"
  #	  	And altero propriedade dto "tipoPedido" "Acidente de Trânsito – Reparação de Danos"
  #	And altero propriedade dto "assunto" "Indenização por Dano Material :: Acidente de Trânsito - 11319"
  #	And altero propriedade dto "atuacao" "Porto Alegre - 10º Juizado Especial Cível"
  #	And altero propriedade dto "agendarAudiencia" "true"
  #	And altero propriedade dto "audienciaInicial" "true"
  #	And altero propriedade dto "tipoAudiencia" "Conciliação"
  #And altero propriedade dto "providenciaCartorio" "false"
  #And altero propriedade dto "apreciacaoMagistrado" "false"
  #Given crio processo JEC
  #Then valido status do processo "Aguardando Audiência"
  
  Background: 
    Given acesso site eThemis
    Given efetuo login eThemis "et1g-servidor"
    Given acesso tela PROCESSO
    And seleciono combo HOME ATUACAO "Porto Alegre - 10º Juizado Especial Cível"
    And acessa tela de audiencia "90001184920188213001"
   
  @Done @AudienciaJEC @Realizada
  Scenario: Execução Audência/Resultado: Realizada - Encaminhamento: Acordo
    And acessa tela de audiencia "90001184920188213001"
    Given uso audiencia basica
    And altero propriedade dto "julgador" ""
    And altero propriedade dto "presentes" "Ativo"
    And altero propriedade dto "resultado" "Realizada"
    And altero propriedade dto "encaminhamento" "Acordo"
    And altero propriedade dto "valorAcordo" "100000"
    And executo Audiencia

  @AudienciaJEC @Realizada
  Scenario: Execução Audência/Resultado: Realizada - Encaminhamento: Acordo parcial
    And acessa tela de audiencia
    Given uso audiencia basica
    And altero propriedade dto "julgador" ""
    And altero propriedade dto "presentes" "Ativo"
    And altero propriedade dto "resultado" "Realizada"
    And altero propriedade dto "encaminhamento" "Acordo parcial"
    And altero propriedade dto "valorAcordo" "100000"
    And executo Audiencia

  @AudienciaJEC @Realizada
  Scenario: Execução Audência/Resultado: Realizada - Encaminhamento: Audiência de Instrução
    And acessa tela de audiencia
    Given uso audiencia basica
    And altero propriedade dto "julgador" ""
    And altero propriedade dto "presentes" "Ativo"
    And altero propriedade dto "resultado" "Realizada"
    And altero propriedade dto "encaminhamento" "Audiência de Instrução"
    And altero propriedade dto "valorAcordo" "100000"
    And executo Audiencia

  @AudienciaJEC @Realizada
  Scenario: Execução Audência/Resultado: Realizada - Encaminhamento: Audiência de Instrução - necessidade de diligência
    And acessa tela de audiencia
    Given uso audiencia basica
    And altero propriedade dto "julgador" ""
    And altero propriedade dto "presentes" "Ativo"
    And altero propriedade dto "resultado" "Realizada"
    And altero propriedade dto "encaminhamento" "Audiência de Instrução - necessidade de diligência"
    And altero propriedade dto "valorAcordo" "100000"
    And altero propriedade dto "tipoNovaAudiencia" "Conciliação"
    And executo Audiencia

  @AudienciaJEC @Realizada
  Scenario: Execução Audência/Resultado: Realizada - Encaminhamento: Necessidade de apreciação / Conclusão ao juiz
    And acessa tela de audiencia
    Given uso audiencia basica
    And altero propriedade dto "julgador" ""
    And altero propriedade dto "presentes" "Ativo"
    And altero propriedade dto "resultado" "Realizada"
    And altero propriedade dto "encaminhamento" "Necessidade de apreciação / Conclusão ao juiz"
    And altero propriedade dto "valorAcordo" "100000"
    And altero propriedade dto "tipoNovaAudiencia" "Conciliação"
    And executo Audiencia

  @AudienciaJEC @Realizada
  Scenario: Execução Audência/Resultado: Realizada - Encaminhamento: Pedido de desistência
    And acessa tela de audiencia
    Given uso audiencia basica
    And altero propriedade dto "julgador" ""
    And altero propriedade dto "presentes" "Ativo"
    And altero propriedade dto "resultado" "Realizada"
    And altero propriedade dto "encaminhamento" "Pedido de desistência"
    And altero propriedade dto "valorAcordo" "100000"
    And altero propriedade dto "tipoNovaAudiencia" "Conciliação"
    And executo Audiencia

 @Done @Realizada
  Scenario: Execução Audência/Realizada - Encaminhamento: Prazo - diligências cartorárias
  And acessa tela de audiencia "90001401020188213001"
  Given uso audiencia basica
  And altero propriedade dto "julgador" ""
  And altero propriedade dto "presentes" "Ativo"
  And altero propriedade dto "resultado" "Realizada"
  And altero propriedade dto "encaminhamento" "Prazo - diligências cartorárias"
  And altero propriedade dto "valorAcordo" "100000"
  And executo Audiencia
  
  @AudienciaJEC @Realizada
  Scenario: Execução Audência/Resultado: Realizada - Encaminhamento: Requerimento de transferência em audiência
    And acessa tela de audiencia
    Given uso audiencia basica
    And altero propriedade dto "julgador" ""
    And altero propriedade dto "presentes" "Ativo"
    And altero propriedade dto "resultado" "Realizada"
    And altero propriedade dto "encaminhamento" "Requerimento de transferência em audiência"
    And altero propriedade dto "valorAcordo" "100000"
    And executo Audiencia
 
  @AudienciaJEC @Realizada
  Scenario: Execução Audência/Resultado: Realizada - Encaminhamento: Requerimento de transferência em audiência – diligência
    And acessa tela de audiencia
    Given uso audiencia basica
    And altero propriedade dto "julgador" ""
    And altero propriedade dto "presentes" "Ativo"
    And altero propriedade dto "resultado" "Realizada"
    And altero propriedade dto "encaminhamento" "Requerimento de transferência em audiência – diligência"
    And altero propriedade dto "valorAcordo" "100000"
    And executo Audiencia

  @AudienciaJEC @Realizada
  Scenario: Execução Audência/Resultado: Realizada - Encaminhamento: Revelia
    And acessa tela de audiencia
    Given uso audiencia basica
    And altero propriedade dto "julgador" ""
    And altero propriedade dto "presentes" "Ativo"
    And altero propriedade dto "resultado" "Realizada"
    And altero propriedade dto "encaminhamento" "Revelia"
    And altero propriedade dto "valorAcordo" "100000"
    And executo Audiencia

  @Done @Realizada
  Scenario: Execução Audência/Realizada - Encaminhamento: Revelia - prazo para apresentar provas
  And acessa tela de audiencia "90002431720188213001"
  Given uso audiencia basica
  And altero propriedade dto "julgador" ""
  And altero propriedade dto "presentes" "Ativo"
  And altero propriedade dto "resultado" "Realizada"
  And altero propriedade dto "encaminhamento" "Revelia - prazo para apresentar provas"
  And altero propriedade dto "valorAcordo" "100000"
  And executo Audiencia
  
  
  @AudienciaJEC @Cancelada
  Scenario: Execução Audência/Resultado: Cancelada - Encaminhamento: Acordo extrajudicial
    And acessa tela de audiencia
    Given uso audiencia basica
    And altero propriedade dto "julgador" ""
    And altero propriedade dto "presentes" "Ativo"
    And altero propriedade dto "resultado" "Cancelada"
    And altero propriedade dto "encaminhamento" "Acordo extrajudicial"
    And altero propriedade dto "valorAcordo" "100000"
    And executo Audiencia

  @AudienciaJEC @Cancelada
  Scenario: Execução Audência/Resultado: Cancelada - Encaminhamento: Cancelamento de audiência
    And acessa tela de audiencia
    Given uso audiencia basica
    And altero propriedade dto "julgador" ""
    And altero propriedade dto "presentes" "Ativo"
    And altero propriedade dto "resultado" "Cancelada"
    And altero propriedade dto "encaminhamento" "Cancelamento de audiência"
    And altero propriedade dto "valorAcordo" "100000"
    And executo Audiencia

  @AudienciaJEC @Cancelada
  Scenario: Execução Audência/Resultado: Cancelada - Encaminhamento: Pedido de desistência
    And acessa tela de audiencia
    Given uso audiencia basica
    And altero propriedade dto "julgador" ""
    And altero propriedade dto "presentes" "Ativo"
    And altero propriedade dto "resultado" "Cancelada"
    And altero propriedade dto "encaminhamento" "Pedido de desistência"
    And altero propriedade dto "valorAcordo" "100000"
    And executo Audiencia

  @AudienciaJEC @Cancelada
  Scenario: Execução Audência/Resultado: Cancelada - Encaminhamento: Requerimento de extinção pelo pagamento/acerto entre as partes
    And acessa tela de audiencia
    Given uso audiencia basica
    And altero propriedade dto "julgador" ""
    And altero propriedade dto "presentes" "Ativo"
    And altero propriedade dto "resultado" "Cancelada"
    And altero propriedade dto "encaminhamento" "Requerimento de extinção pelo pagamento/acerto entre as partes"
    And altero propriedade dto "valorAcordo" "100000"
    And executo Audiencia

  @AudienciaJEC @ConvertidaEmDeligencia
  Scenario: Execução Audência/Resultado: Convertida em Diligência - Encaminhamento: Autor não compareceu
    And acessa tela de audiencia
    Given uso audiencia basica
    And altero propriedade dto "julgador" ""
    And altero propriedade dto "presentes" "Ativo"
    And altero propriedade dto "resultado" "Convertida em Diligência"
    And altero propriedade dto "encaminhamento" "Autor não compareceu"
    And altero propriedade dto "valorAcordo" "100000"
    And executo Audiencia

  @AudienciaJEC @ConvertidaEmDeligencia
  Scenario: Execução Audência/Resultado: Convertida em Diligência - Encaminhamento: Autor não compareceu
    And acessa tela de audiencia
    Given uso audiencia basica
    And altero propriedade dto "julgador" ""
    And altero propriedade dto "presentes" "Ativo"
    And altero propriedade dto "resultado" "Convertida em Diligência"
    And altero propriedade dto "encaminhamento" "Nenhuma das partes compareceu"
    And altero propriedade dto "valorAcordo" "100000"
    And executo Audiencia

  @AudienciaJEC @ConvertidaEmDeligencia
  Scenario: Execução Audência/Resultado: Convertida em Diligência - Encaminhamento: Parte não compareceu e não foi intimada
    And acessa tela de audiencia
    Given uso audiencia basica
    And altero propriedade dto "julgador" ""
    And altero propriedade dto "presentes" "Ativo"
    And altero propriedade dto "resultado" "Convertida em Diligência"
    And altero propriedade dto "encaminhamento" "Parte não compareceu e não foi intimada"
    And altero propriedade dto "valorAcordo" "100000"
    And executo Audiencia

  @AudienciaJEC @ConvertidaEmDeligencia
  Scenario: Execução Audência/Resultado: Convertida em Diligência - Encaminhamento: Réu não compareceu e não foi citado – citação por oficial de justiça
    And acessa tela de audiencia
    Given uso audiencia basica
    And altero propriedade dto "julgador" ""
    And altero propriedade dto "presentes" "Ativo"
    And altero propriedade dto "resultado" "Convertida em Diligência"
    And altero propriedade dto "encaminhamento" "Réu não compareceu e não foi citado – citação por oficial de justiça"
    And altero propriedade dto "valorAcordo" "100000"
    And executo Audiencia

  @AudienciaJEC @Redesignada @EmCodificação
  Scenario: Execução Audência/Resultado: Redesignada - Encaminhamento: Impossibilidade de realização da sessão
    And acessa tela de audiencia "90015772320178213001"
    Given uso audiencia basica
    And altero propriedade dto "julgador" ""
    And altero propriedade dto "presentes" "Todos"
    And altero propriedade dto "resultado" "Redesignada"
    And altero propriedade dto "encaminhamento" "Impossibilidade de realização da sessão"
    And altero propriedade dto "motivoRedesignacao" "Motivo"
    And altero propriedade dto "valorAcordo" "100000"
    And executo Audiencia
