@Funcionalidade
Feature: Cadastro de Processo JEC
  Com atuação de COMARCA DE PORTO ALEGRE - JEC

  @Done  @REGRESSAO
  Scenario: Cadastrar Processo JEC - Perfil Distribuidor
   Given acesso site eThemis
   Given uso processo basico JEC
   And altero propriedade dto "perfilUsuario" "Distribuidor"
   And altero propriedade dto "atuacao" "Porto Alegre - Foro Central"
   And altero propriedade dto "tipoPedido" "Acidente de Trânsito – Reparação de Danos"
   And altero propriedade dto "assunto" "Indenização por Dano Material :: Acidente de Trânsito - 11319"
   And altero propriedade dto "providenciaCartorio" "true"
   And altero propriedade dto "apreciacaoMagistrado" "false"
   Given crio processo JEC Perfil Distribuidor
   And pesquiso comarca
   Then exibo processo e comarca
  
  
  @Done  @REGRESSAO
  Scenario: Cadastrar Processo  JEC - Perfil Servidor - Cumprimento de Sentença
    Given acesso site eThemis
    Given uso processo basico JEC
    And altero propriedade dto "perfilUsuario" "Servidor"
    Given removo todas partes do processo dto
    And adiciono parte dto FISICO ATIVO Tipo Participacao "Exequente"
    And adiciono parte dto FISICO PASSIVO Tipo Participacao "Executado"
    And altero propriedade dto "classe" "Cumprimento de sentença"
    And altero propriedade dto "tipoPedido" "Cumprimento de Sentença"
    And altero propriedade dto "assunto" "Justiça Estadual :: Liquidação / Cumprimento / Execução - 9148"
    And altero propriedade dto "atuacao" "Piratini - Vara Adjunta do JEC"
    And altero propriedade dto "providenciaCartorio" "true"
    Given crio processo JEC

  @Done @REGRESSAO 
  Scenario: Cadastrar Processo  JEC - Perfil Servidor - Embargos de Terceiro
    Given acesso site eThemis
    Given uso processo basico JEC
    And altero propriedade dto "perfilUsuario" "Servidor"
    Given removo todas partes do processo dto
    And adiciono parte dto FISICO ATIVO Tipo Participacao "Embargante"
    And adiciono parte dto FISICO PASSIVO Tipo Participacao "Embargado"
    And altero propriedade dto "classe" "Embargos de Terceiro"
    And altero propriedade dto "tipoPedido" "Embargos de Terceiro"
    And altero propriedade dto "assunto" "Coisas :: Propriedade - 14161"
    And altero propriedade dto "atuacao" "Santo Cristo - Vara Adjunta do JEC"
    And altero propriedade dto "providenciaCartorio" "true"
    Given crio processo JEC
   
   @Revisar
  Scenario: Cadastrar Processo  JEC - Perfil Servidor - Execução de Título Extrajudicial
    Given acesso site eThemis
    Given uso processo basico JEC
    And altero propriedade dto "perfilUsuario" "Servidor"
    And altero propriedade dto "atuacao" "Piratini - Vara Adjunta do JEC"
    Given removo todas partes do processo dto
    And adiciono parte dto FISICO ATIVO Tipo Participacao "Exequente"
    And adiciono parte dto FISICO PASSIVO Tipo Participacao "Executado"
    And altero propriedade dto "classe" "Execução de Título Extrajudicial"
    And altero propriedade dto "tipoPedido" "Execução de Título Extrajudicial"
    And altero propriedade dto "assunto" "Espécies de Contratos :: Arrendamento Rural - 13790"
    And adciono documento dto DOCUMENTO Tipo "Título Executivo Extrajudicial"
    And altero propriedade dto "providenciaCartorio" "true"
    Given crio processo JEC

  @Done @DistribuicaoJECServidorPartes
  Scenario: Cadastrar Processo  JEC - Perfil Servidor - Diversas Partes Cadastradas
    Given acesso site eThemis
    Given uso processo basico JEC
    And altero propriedade dto "perfilUsuario" "Servidor"
    Given removo todas partes do processo dto
    And adiciono parte dto FISICO ATIVO Tipo Participacao "Autor"
    And adiciono parte dto FISICO PASSIVO Tipo Participacao "Réu"
    And altero propriedade dto "classe" "Procedimento do Juizado Especial Cível"
    And altero propriedade dto "tipoPedido" "Cobrança – Aluguel"
    And altero propriedade dto "assunto" "Espécies de Contratos :: Cobrança de Aluguéis - Sem Despejo - 12629"
    And altero propriedade dto "atuacao" "Horizontina - Vara Adjunta do JEC"
    Given crio processo JEC


  @Done @ProcessoVerificarProvidenciasJEC  
  Scenario: Cadastrar Processo  JEC - Processo no Estado Verificar Providências
    Given acesso site eThemis
    Given uso processo basico JEC
    And altero propriedade dto "perfilUsuario" "Servidor"
    And altero propriedade dto "tipoPedido" "Acidente de Trânsito – Reparação de Danos"
    And altero propriedade dto "assunto" "Indenização por Dano Material :: Acidente de Trânsito - 11319"
    And altero propriedade dto "atuacao" "Santo Cristo - Vara Adjunta do JEC"
    And altero propriedade dto "providenciaCartorio" "true"
    And altero propriedade dto "apreciacaoMagistrado" "false"
    Given crio processo JEC
    And pesquiso comarca
    Then exibo processo e comarca
    Then valido status do processo "Verificar Providências"

  @Done @ProcessoConcluso @REGRESSAO
  Scenario: Cadastrar Processo  JEC - Processo no Estado Concluso
    Given acesso site eThemis
    Given uso processo basico JEC
    And altero propriedade dto "perfilUsuario" "Servidor"
    And altero propriedade dto "tipoPedido" "Acidente de Trânsito – Reparação de Danos"
    And altero propriedade dto "assunto" "Indenização por Dano Material :: Acidente de Trânsito - 11319"
    And altero propriedade dto "atuacao" "Porto Alegre - 10º Juizado Especial Cível"
    And altero propriedade dto "apreciacaoMagistrado" "true"
    And altero propriedade dto "providenciaCartorio" "false"
    Given crio processo JEC
    Then valido status do processo "Concluso"

  @Done @ProcessoEmCadastramento  
  Scenario: Cadastrar Processo  JEC - Processo no Estado Em Cadastramento
    Given acesso site eThemis
    Given uso processo basico JEC
    And altero propriedade dto "perfilUsuario" "Servidor"
    And altero propriedade dto "tipoPedido" "Acidente de Trânsito – Reparação de Danos"
    And altero propriedade dto "assunto" "Indenização por Dano Material :: Acidente de Trânsito - 11319"
    And altero propriedade dto "atuacao" "Porto Alegre - 10º Juizado Especial Cível"
    Given crio processo em cadastramento
    

  @Done @ProcessoAguardandoAudiência  @REGRESSAO 
  Scenario: Cadastrar Processo  JEC - Processo no Estado Aguardando Audiência
    Given acesso site eThemis
    Given uso processo basico JEC
    And altero propriedade dto "perfilUsuario" "Servidor"
    And altero propriedade dto "tipoPedido" "Acidente de Trânsito – Reparação de Danos"
    And altero propriedade dto "assunto" "Indenização por Dano Material :: Acidente de Trânsito - 11319"
    And altero propriedade dto "atuacao" "Porto Alegre - 10º Juizado Especial Cível"
    And altero propriedade dto "agendarAudiencia" "true"
    And altero propriedade dto "audienciaInicial" "true"
    And altero propriedade dto "tipoAudiencia" "Conciliação"
    And altero propriedade dto "providenciaCartorio" "false"
    Given crio processo JEC
    #Implementar validação do status do processo

  @Done @ProcessoEmValidaçãoJEC @REGRESSAO
  Scenario: Cadastrar Processo JEC - Processo no Estado Em Validação PPE
    Given acesso site eThemis
  	Given uso processo basico JEC
    Given altero propriedade dto "classe" "Procedimento do Juizado Especial Cível"
    And altero propriedade dto "tipoPedido" "Cobrança – Contratos/Discussão"
    And altero propriedade dto "assunto" "Locação de Móvel :: Competência do Juizado Especial Cível"
    And altero propriedade dto "atuacao" "Santiago - Vara Adjunta do JEC"
    And altero propriedade dto "perfilUsuario" "Distribuidor"
    And crio processo pelo servico PPE
    And pesquiso comarca
    Then exibo processo e comarca
    Then valido status do processo "Em validação"
    
  @Done @ProcessoEmValidaçãoJECExtraJudicial  
  Scenario: Cadastrar Processo - Classe Execução de Título Extrajudicial JEC - Processo no Estado Em Validação PPE
    Given acesso site eThemis
  	Given uso processo basico JEC
    Given altero propriedade dto "classe" "Execução de Título Extrajudicial"
    And altero propriedade dto "tipoPedido" "Execução de Título Extrajudicial"
    And altero propriedade dto "assunto" "Cheque :: Competência de Execução do Juizado Especial Cível"
    And altero propriedade dto "atuacao" "Porto Alegre - 10º Juizado Especial Cível"
    And altero propriedade dto "perfilUsuario" "Distribuidor"
    And altero propriedade dto "numeroProcessoDependencia" "90001765220188213001"
    And crio processo pelo servico PPE
    And acesso eThemis 
    And pesquiso comarca
    Then exibo processo e comarca
    Then valido status do processo "Em validação"
    
  @Done @ProcessoEmValidaçãoJECExtraJudicialFORO 
  Scenario: Cadastrar Processo - Classe Execução de Título Extrajudicial JEC - Processo no Estado Em Validação PPE
    Given acesso site eThemis
  	Given uso processo basico JEC
    Given altero propriedade dto "classe" "Execução de Título Extrajudicial"
    And altero propriedade dto "tipoPedido" "Execução de Título Extrajudicial"
    And altero propriedade dto "assunto" "Cheque :: Competência de Execução do Juizado Especial Cível"
    And altero propriedade dto "atuacao" "Porto Alegre - 2º Juizado Especial Cível"
    And altero propriedade dto "perfilUsuario" "Distribuidor"
    And altero propriedade dto "tipoDistribuicao" "Sorteio"
    And crio processo pelo servico PPE
    And acesso eThemis 
    And pesquiso comarca
    Then exibo processo e comarca
    Then valido status do processo "Em validação"
