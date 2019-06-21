@Funcionalidade
Feature: Cadastro de Regime
  Como usuário de perfil COORDENADOR CORREGEDORIA (et1g-coordenador_cgj)
  Com atuação de COMARCA DE PORTO ALEGRE - JEC
  Ter executado @Scenario1 da 00SelecaoRegime.feature

  @Scenario1
  Scenario: Acessa Tela Novo Regime de Exceção
    Given visualizo tela REGIME DE EXECAO
    When aciono botao NOVO REGIME
    Then visualizo tela NOVO REGIME DE EXECAO

#Ponto de verificação:
#(1)Validar que ao acessar tela de NOVO REGIME DE EXCEÇÃO a mesma seja exibida conforme descrição abaixo:
#Campos Área Cadastro de Regime de Exceção: Nome - Competência do Regime de Exceção - Abrangência do Regime de Exceção - Vigência do Regime de Exceção - Tipo do Regime de Exeção - Código Movimento CNJ (envio) - Complemento(envio)  - Código Movimento CNJ (retorno) - Complemento(retorno) - Finalizar Regime de Exceção
#Campos sub Área Dados de Origem: Comarca - Vara - Julgador
#Campos sub Área Dados do Destino: Comarca - Vara - Julgador
#Campos sub Área Filtros de Pesquisa: Estado do Processo - Restrição (com opções PROCESSO PAR / PROCESSO IMPAR / TODOS) - Forma de Encerramento (com opções POR ASSINATURA / POR PRAZO / SOMENTE MANUAL)
#Botões Vincular Comarcas, Limpar e Salvar

  @Scenario2
  Scenario Outline: Cadastrar Novo Regime de Exceção
    Given visualizo tela REGIME DE EXECAO
    And preencho campo NOME "<nome>"
    And preencho campo COMPETENCIA DO REGIME EXCECAO "<competencia>"
    And preencho campo ABRANGENCIA DO REGIME EXCECAO "<abrangencia>"
    And preencho campo COMARCA ORIGEM "<comarcaorigem>"
    And preencho campo VARA ORIGEM "<varaorigem>"
    And preencho campo JULGADOR ORIGEM "<julgadororigem>"
    And preencho campo COMARCA DESTINO "<comarcadestino>"
    And preencho campo VARA DESTINO "<varadestino>"
    And preencho campo JULGADOR DESTINO "<julgadordestino>"
    And preencho campo VIGENCIA INICIO "<vigenciainicio>"
    And preencho campo VIGENCIA FIM "<vigenciafim>"
    And preencho campo TIPO "<tiporegime>"
    # And preencho campo MOVIMENTO ENVIO "<movimentocnjenvio>"
    # And preencho campo COMPLEMENTO ENVIO "<complementocnjenvio>"
    # And preencho campo MOVIMENTO RETORNO "<movimentocnjretorno>"
    # And preencho campo COMPLEMENTO RETORNO "<movimentocnjretorno>"
    And preencho campo ESTADO "<estadoprocesso>"
    And preencho campo RESTRICAO "<restricao>"
    And preencho campo ENCERRAMENTO "<encerramento>"
    When aciono botao SALVAR
    Then visualizo mensagem SUCESSO


    Examples:
    | nome    | competencia | abrangencia               | comarcaorigem   | varaorigem      | julgadororigem  | comarcadestino  | varadestino     | julgadordestino | vigenciainicio  | vigenciafim     | tiporegime        | movimentocnjenvio    | complementocnjenvio  | movimentocnjretorno | movimentocnjretorno  | estadoprocesso  | restricao       | encerramento    |
    | TST 001 | JEC         | N/A                       | N/A             | N/A             | N/A             | N/A             | N/A             | N/A             | N/A             | N/A             | N/A               | N/A                  | N/A                  | N/A                 | N/A                  | N/A             | N/A             | N/A             |
    | TST 002 | JEFAZ       | Todo Estado               | N/A             | N/A             | N/A             | *INLCUIR VALOR* | *INLCUIR VALOR* | *INLCUIR VALOR* | *INLCUIR VALOR* | N/A             | Substituição      | N/A                  | N/A                  | N/A                 | N/A                  | *INCLUIR VALOR* | *INCLUIR VALOR* | *INCLUIR VALOR* |
    | TST 003 | VFP         | Orgão Julgador Específico | *INCLUIR VALOR* | *INCLUIR VALOR  | *INLCUIR VALOR* | *INLCUIR VALOR* | *INCLUIR VALOR* | *INLCUIR VALOR* | *INLCUIR VALOR* | *INCLUIR VALOR* | Remessa Processo  | *INCLUIR VALOR*      | *INCLUIR VALOR*      | *INCLUIR VALOR*     | *INCLUIR VALOR*      | *INCLUIR VALOR* | *INCLUIR VALOR* | *INCLUIR VALOR* |

#Ponto de verificação:
#(1) Validar ao encerrar cadastro e salvar que veja feita verificação de validade do NOME do Regime, garantidno que não haja nenhum outro cadastro com o mesmo nome;
#(2) Validar o preenchimento obrigatório dos campos COMPETENCIA DO REGIME EXCECAO, ABRANGENCIA DO REGIME EXCECAO, COMARCA, VARA E JULGADOR (origem e destino), VIGENCIA (inicio), ESTADO, RESTRICAO e ENCERRAMENTO;
#(3) Valiar que ao escolher a opçãoTODO ESTADO, os campos da sub Área Dados de Origem devem ser bloqueados para preenchimento e seu valor a ser gravado em base será nnulo :: ( PE1G.REGIME_EXCECAO. TJID_JUDICANCIA_ORIGEM = NULL);
#(4) Validar que o formato informado para os campos de DATA sejam válidos;
#(5) Validar que o valor informado para o campo  VIGENCIA FIM não seja menor que o informado para o campo VIGENCIA INICIO;
#(6) Validar o preenchimento obrigarório do campo VIGENCIA FIM quando o campo ENCERRAMENTO assumir o valor PRAZO;
#(7) Validar que quando o tipo de regime selecionado for REMESSA, que o preenchimento dos campos complementares seja obrigatório - sendo assim necessário infromar os campos Código Movimento CNJ e Complemento (envio e retorno);
#(8) Validar o retorno do campo ESTADO de acordo com o valor escolhido: (C) CARTÓRIO, exclusivamente os processos disponíveis no Cartório; / (GC) GABINETE - COMPLETO, exibe todos os processos disponíveis no Gabinete; / (GP) GABINETE – DESPACHO, exibe os processos disponíveis no gabinete na pasta de Despacho; / (GD)GABINETE- DECISAO, exibe os processos disponíveis no gabinete na pasta de Decisão / (GJ) GABINETE – JULGAR, exibe os processos disponíveis no gabinete na pasta de Julgar; / (T) TODOS, irá considerar todos os processos independente se estes estão no Cartório ou Gabinete;
#(9) Validar o retorno do campo RESTRICAO de acordo com o valor escolhido: Restrição Par e Impar, nesta opção de filtro o usuário irão indicar se pretende filtrar apenas processos com final PAR ou IMPAR (900000X) ou ainda sem nenhuma restrição (TODOS);
#(10) Validar o retorno do campo ENCERRAMENTO de acordo com o valor escolhido: 	Por Assinatura: nesta opção quando o magistrado assinar uma sentença / 	 Por Prazo: nesta opção um JOB diário irá verificar se existem processos em alguma RE ainda não finalizados / 	Somente Manual: todos os processos atribuídos a uma RE só podem ser encerrados manualmente.;
#(11) Validar que ao finalizar cadastramento e todas as condições válidas sejam aplciadas que o registro seja corretamente salvo na tabela PE1G.REGIME_EXCECAO.

  @Scenario3
  Scenario Outline: Limpar Cadastro Novo Regime de Exceção
    Given visualizo tela REGIME DE EXECAO
    And preencho campo NOME "<nome>"
    And preencho campo COMPETENCIA DO REGIME EXCECAO "<competencia>"
    And preencho campo ABRANGENCIA DO REGIME EXCECAO "<abrangencia>"
    And preencho campo COMARCA ORIGEM "<comarcaorigem>"
    And preencho campo VARA ORIGEM "<varaorigem>"
    And preencho campo JULGADOR ORIGEM "<julgadororigem>"
    And preencho campo COMARCA DESTINO "<comarcadestino>"
    And preencho campo VARA DESTINO "<varadestino>"
    And preencho campo JULGADOR DESTINO "<julgadordestino>"
    And preencho campo VIGENCIA INICIO "<vigenciainicio>"
    And preencho campo VIGENCIA FIM "<vigenciafim>"
    And preencho campo TIPO "<tiporegime>"
    And preencho campo ESTADO "<estadoprocesso>"
    And preencho campo RESTRICAO "<restricao>"
    And preencho campo ENCERRAMENTO "<encerramento>"
    When aciono botao LIMPAR
    Then visualizo campos

  Examples:
  | nome    | competencia | abrangencia | comarcaorigem   | varaorigem      | julgadororigem  | comarcadestino  | varadestino     | julgadordestino | vigenciainicio  | vigenciafim     | tiporegime        | estadoprocesso  | restricao       | encerramento    |
  | TST 004 | JEFAZ       | Todo Estado | N/A             | N/A             | N/A             | *INLCUIR VALOR* | *INLCUIR VALOR* | *INLCUIR VALOR* | *INLCUIR VALOR* | N/A             | Substituição      | *INCLUIR VALOR* | *INCLUIR VALOR* | *INCLUIR VALOR* |

#Ponto de verificação:
#(1) Validar que ao acionar o botão LIMPAR todos os campos tenham seu preenchimento removido;

  @Scenario4
  Scenario: Finalilzar Regime de Exceção
#Considerar cenário descrito em   @Scenario3 - Scenário: Finalizar Regime de Exceção da 05FinalizaRegime.feature

  @Scenario5
  Scenario: : Vincular Comarcas
#Considerar cenário descrito em   @Scenario1 - Scenário: Vincular Comarcas da 06VincularComarca.feature



