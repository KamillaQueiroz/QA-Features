@Funcionalidade
Feature: Edição de Regime
  Como usuário de perfil COORDENADOR CORREGEDORIA (et1g-coordenador_cgj)
  Com atuação de COMARCA DE PORTO ALEGRE - JEC
  Possuir Regimes de Exceção cadastrados

  @Scenario1
  Scenario: Editar Regime de Exceção ATIVO
    Given executo Scenario: Realizar Pesquisa de Regime de Exceção
    When identifico REGIME DE EXCECAO
    And aciono AÇÃO
    Then visualizo tela EDITAR REGIME DE EXCECAO

#Ponto de verificação:
#(1) Validar caso haja ao menos um processo atribuido ativo que não seja possivel realizar alterações quanto a competência do Regime de Exceção;
#(2) Validar caso haja ao menos um processo atribuido ativo que nãos seja possivel realizar alterações quanto a abrangência do Regime de Exceção nem os dados de origem, quando cadastrados;
#(3) Validar caso haja ao menos um processo atribuido ativo que mão seja possivel realizar alterações quanto as informações de Destino do Regime de Exceção;
#(4) Validar caso haja ao menos um processo atribuido ativo que não seja possivel realizar alterações quanto  a Data de Inicio do regime de exceção;

  @Scenario2
  Scenario: Alterar Regime de Exceção ATIVO
    Given visualizo tela EDITAR REGIME DE EXCECAO
    When altero campo VIGENCIA FIM "<vigenciafim>"
    And altero campo TIPO "<tiporegime>"
    And altero campo ESTADO "<estadoprocesso>"
    And altero campo RESTRICAO "<restricao>"
    And altero campo ENCERRAMENTO "<encerramento>"
    When aciono botao SALVAR
    Then visualizo mensagem SUCESSO

#Ponto de verificação:
#(1) Validar que ao finalizar edição e todas as condições válidas sejam aplciadas que o registro seja corretamente alterado e salvo na tabela PE1G.REGIME_EXCECAO.


























































