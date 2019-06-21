@Funcionalidade
Feature: Vincular Comarca
  Como usuário de perfil COORDENADOR CORREGEDORIA (et1g-coordenador_cgj)
  Com atuação de COMARCA DE PORTO ALEGRE - JEC
  Ter executado @Scenario2 da 01SCadastrooRegime.feature

  @Scenario1
  Scenario: Acessa Tela Vincular Comarca
    Given cadastro REGIME DE EXECAO
    When aciono botao VINCULAR COMARCA
    Then visualizo modal VINCULAR COMARCA

#Ponto de verificação:
#(1)Validar que ao acessar modal de VINCULAR COMARCA a mesma seja exibida conforme descrição abaixo:
#Campo: COMARCA
#Grid com as colunas: COMARCA - VINCULAÇÃO - AÇÕES
#Botão: ADICIONAR

  @Scenario2
  Scenario Outline: Vincular Comarca ao Regime de Exceção
    Given visualizo modal VINCULAR COMARCA
    When aciono botao VINCULAR COMARCA
    And preencho campo COMARCA '<comarca>'
    And aciono botão ADICIONAR
    And visualizo COMARCAS
    And aiciono VINCULACAO
    And aciono botão SALVAR
    Then visualizo COMARCAS VINCULADAS

    Examples:
      | comarca         |
      | *INSERIR VALOR* |

#Ponto de Verificação
#(1)Validar que seja possivel incluir um ou mais comarcas a serem vinculadas ao Regime de Exceção;
#(2)Validar que seja possivel definir o tipo de vinculação (Incluir - que sera considerada no RE ou Excluir - que não será cosiderada no RE)

  @Scenario3
  Scenario: Excluir vinculação
    Given visualizo COMARCAR VINCULADAS
    When aciono botão EXCLUIR
    Then visualizo EXCLUSAO

#Ponto de Verificação
#(1)Validar que seja possivel excluir vinculação de comarcas
