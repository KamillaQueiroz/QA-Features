@Funcionalidade @Carga
Feature: Carga de Processo VFP
  Com processo no Estado EM VALIDACAO
  Com atuação variada

  #Scenario Outline: @Distribuicao @EmValidacao
  #Given executo reset QUANTIDADE_RECEBER para TIPO_PEDIDO 1 FORO 269
  #Given altero propriedade dto "classe" "Procedimento do Juizado Especial Cível"
  #And altero propriedade dto "tipoPedido" "Acidente de Trânsito – Reparação de Danos"
  #And altero propriedade dto "assunto" "Acidente de Trânsito"
  #Given altero propriedade dto "atuacao" "<ATUACAO>"
  #And altero propriedade dto "perfilUsuario" "Servidor"
  #And crio processo pelo servico PPE
  #
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
  #Examples:
  #| ATUACAO                             |
  #| Comarca de Marau - 1ª Vara Judicial |
  #| Comarca de Marau - 1ª Vara Judicial |
  Scenario Outline: @Distribuicao @EmValidacao @Carga
    Given acesso site eThemis
    Given uso processo basico VFP
    #Given altero propriedade dto "classe" "<CLASSE>"
    #And altero propriedade dto "tipoPedido" "<TIPOPEDIDO>"
    #And altero propriedade dto "assunto" "<ASSUNTO>"
    Given removo todas partes do processo dto
    And adiciono parte dto FISICO ATIVO Tipo Participacao "<TIPOPARTICIPACAOATIVO>"
    And adiciono parte dto ESTADO RS Tipo Participacao "<TIPOPARTICIPACAOPASIVO>"
    Given altero propriedade dto "atuacao" "<ATUACAO>"
    And altero propriedade dto "perfilUsuario" "Servidor"
    And crio processo pelo servico PPE
    Then finalizo teste

    Examples: 
      | ATUACAO                                                                   | CLASSE                   | TIPOPEDIDO | ASSUNTO                  | TIPOPARTICIPACAOATIVO | TIPOPARTICIPACAOPASIVO |
      | Comarca de Caxias do Sul - 2ª Vara Cível Especializada em Fazenda Pública | Consignação em Pagamento | Outros     | Pagamento em Consignação | Autor                 | Réu                    |
      | Comarca de Caxias do Sul - 2ª Vara Cível Especializada em Fazenda Pública | Consignação em Pagamento | Outros     | Pagamento em Consignação | Autor                 | Réu                    |
      | Comarca de Caxias do Sul - 2ª Vara Cível Especializada em Fazenda Pública | Consignação em Pagamento | Outros     | Pagamento em Consignação | Autor                 | Réu                    |
      | Comarca de Caxias do Sul - 2ª Vara Cível Especializada em Fazenda Pública | Consignação em Pagamento | Outros     | Pagamento em Consignação | Autor                 | Réu                    |
      | Comarca de Caxias do Sul - 2ª Vara Cível Especializada em Fazenda Pública | Consignação em Pagamento | Outros     | Pagamento em Consignação | Autor                 | Réu                    |
      | Comarca de Caxias do Sul - 2ª Vara Cível Especializada em Fazenda Pública | Consignação em Pagamento | Outros     | Pagamento em Consignação | Autor                 | Réu                    |
      | Comarca de Caxias do Sul - 2ª Vara Cível Especializada em Fazenda Pública | Consignação em Pagamento | Outros     | Pagamento em Consignação | Autor                 | Réu                    |
      | Comarca de Caxias do Sul - 2ª Vara Cível Especializada em Fazenda Pública | Consignação em Pagamento | Outros     | Pagamento em Consignação | Autor                 | Réu                    |
      | Comarca de Caxias do Sul - 2ª Vara Cível Especializada em Fazenda Pública | Consignação em Pagamento | Outros     | Pagamento em Consignação | Autor                 | Réu                    |
  
  Scenario: @Distribuicao @EmValidacao @CargaVFP
		Given acesso site eThemis
	  Given uso processo basico VFP
	  Given altero propriedade dto "classe" "Procedimento Ordinário"
	  And altero propriedade dto "tipoPedido" "Outros"
	  And altero propriedade dto "assunto" "Multas e demais Sanções"
	  And altero propriedade dto "atuacao" "Caxias do Sul - 2ª Vara Cível Especializada em Fazenda Pública"
	  And altero propriedade dto "perfilUsuario" "Distribuidor"
	  And crio processo pelo servico PPE
	  And acesso eThemis 
	  And seleciono combo HOME ATUACAO "Caxias do Sul - Foro de Caxias Do Sul"
	  When seleciono combo HOME COMPETENCIA "VFP"
	  When efetuo zoneamento do processo em validacao
	  And clico aba DADOS COMPLEMENTARES
	  And seleciono combo DADOS COMPLEMENTARES TIPO "Sorteio"
	  And clico aba FINALIZACAO
	  And clico botao FINALIZAR
	  And pesquiso comarca
	  And deslogo eThemis 
  