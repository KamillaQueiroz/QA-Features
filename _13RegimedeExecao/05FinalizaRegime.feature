@Funcionalidade
Feature: Finaliza Regime
  Como usuário de perfil COORDENADOR CORREGEDORIA (et1g-coordenador_cgj)
  Com atuação de COMARCA DE PORTO ALEGRE - JEC
  Possuir Regimes de Exceção cadastrados e ativos

  @Scenario1
  Scenario: Finalizar Regime de Exceção
    Given executo @Scenario2 Cadastrar Novo Regime de Exceção
    When aciono opção FINALIZAR REGIME DE EXCEÇÃO
    And confirmo ação
    Then REGIME DE EXCEÇÃO encerrado
    And processos devolvidos

#Ponto de verificação:
#(1) Validar que ao acionar opção finalização, seja exibida mensagem de confirmação;
#(2) Validar que ao confirmar  opção, Regime de Exceção seja corretamente finalizado e os processos associados que estejam abertos sejam devolvidos a sua judicância de origem;
#(3) Validar que ao confirmar opção, o tipo do resultado assuma o valor MANUAL.Ability:


  @Scenario2
  Scenario: Finalizar Regime de Exceção
    Given executo @Scenario3 Selecionar & Adicionar Processos
    And visualizo DADOS DO REGIME DE EXCEÇÃO
    When aciono opção FINALIZAR REGIME DE EXCEÇÃO
    And confirmo ação
    Then REGIME DE EXCEÇÃO encerrado
    And processos devolvidos

#Ponto de verificação:
#(1) Validar que ao acionar opção finalização, seja exibida mensagem de confirmação;
#(2) Validar que ao confirmar  opção, Regime de Exceção seja corretamente finalizado e os processos associados que estejam abertos sejam devolvidos a sua judicância de origem;
#(3) Validar que ao confirmar opção, o tipo do resultado assuma o valor MANUAL.Ability:

  @Scenario3
   Scenario: Finalizar Regime de Exceção
     Given executo @Scenario2 Pesquisa Regine de Exceção
     And visualizo grid de registros
     When aciono opção FINALIZAR REGIME DE EXCEÇÃO
     And confirmo ação
     Then REGIME DE EXCEÇÃO encerrado
     And processos devolvidos

#Ponto de verificação:
#(1) Validar que ao acionar opção finalização, seja exibida mensagem de confirmação;
#(2) Validar que ao confirmar  opção, Regime de Exceção seja corretamente finalizado e os processos associados que estejam abertos sejam devolvidos a sua judicância de origem;
#(3) Validar que ao confirmar opção, o tipo do resultado assuma o valor MANUAL.Ability: