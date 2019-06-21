@Funcionalidade
Feature: Pesquisa & Atribuição de Regime
  Como usuário de perfil COORDENADOR CORREGEDORIA (et1g-coordenador_cgj)
  Com atuação de COMARCA DE PORTO ALEGRE - JEC
  Possuir Regimes de Exceção cadastrados

  @Scenario1
  Scenario Outline: Acessa Tela Regime de Exceção - Vincular Processo
    Given efetuo login APLICACAO
    When aciono opcao REGIME DE EXCECAO - VINCULAR PROCESSO
    # And seleciono campo LISTAGEM "<listagem>"
    Then visualizo tela REGIME DE EXCECAO - VINCULAR PROCESSO

    Examples:
    | listagem        |
    | *INCLUIR VALOR* |

#Ponto de verificação:
#(1) Validar que ao acionar a opção de REGIME DE EXCECAO - VINCULAR PROCESSO e seleção de um Regime de Exceção seja exibida tela de Mapeamento  a mesma seja exibida conforme descrição abaixo:
#Campos: Listagem de Regime de Exceção
#Sub-Área Dados do Regime de Exceção: Dados de Origem e Destino (Comarca / Vara / Judicância) - Data de Cadastro - Total de Prccessos - Total de Processos Ativos;
#Sub-Área de Seleção de Processos: Campos Comarca Origem - Classe - Tipo de Pedido - Assunto - Data Conclusão (Inicio e Fim) - Período (opções  Maos de 300 /  De 201 à 300 /  De 101 à 200 /  Até 100) - Nº CNJ - Decimal CNJ  - Limitador (100 / 250 / 500 Processos) e o botões Pesquisar e Adicionar;
#Sub-Área Grid de Resultado: Colunas Comarca Origem - Data de Conclusão - Data de Distribuição - Número CNJ - Estado

  @Scenario2
  Scenario Outline:  Pesquisar Processos
    Given visualizo tela MAPEAMENTO REGIME DE EXCECAO
    And seleciono campo LISTAGEM "<listagem>"
    And visualizo AREA DADOS DO REGIME DE EXCEÇÃO
    When preencho campo CLASSE "<classe>"
    And preencho campo TIPO PEDIDO "<tipopedido>"
    # And preencho campo ASSUNTO "<assunto>"
    # And preencho campo DATA INICIO "<datainicio>"
    # And preencho campo DATA FIM "<datafim>"
    # And preencho campo PERÍODO "<periodo>"
    # And preencho campo Nº CNJ "<numerocnj>"
    # And preencho campo DECIMAL CNJ "<decimalcnj>"
    # And preencho campo LIMITADOR "<limitador>"
    And aciono botão PESQUISAR
    Then visualizo grid de registros

    Examples:
    | listagem        | classe          | tipopedido      | assunto         | datainicio      | datafim         | periodo         | numerocnj       | decimalcnj      | limitador       |
    | *INCLUIR VALOR* | *INCLUIR VALOR* | *INCLUIR VALOR* | *INCLUIR VALOR* | *INCLUIR VALOR* | *INCLUIR VALOR* | *INCLUIR VALOR* | *INCLUIR VALOR* | *INCLUIR VALOR* | *INCLUIR VALOR* |

#Ponto de verificação:
#(0) Validar que os dados exibidos na ÁREA DE DADOS DO REGIME estejam de acordo com o Regime de Exceção cadastrado e que os dados de Origem e Destino sejam corretamente carregados nos campos destinados;
#(1) Validar que o resultado da pesquisa seja corretamente apresentado na Grid de registros;
#(2) Validar que os registros listados na grid de resultados seja válida em relação aos filtros aplciados;
#(3) Validar que as colunas apresentadas na grid de resultado sejam COMARCA DE ORIGEM, DATA DE CONCLUSÃO, DATA DE DISTRIBUIÇÃO, NÚMERO CNJ, ESTADO e haoja uma coluna de seleção / informação;

  @Scenario3
  Scenario: Selecionar & Adicionar Processos
    Given visualizo grid de registros
    When seleciono processos válidos
    And aciono botão ADICIONAR
    Then visualizo mensagem SUCESSO

#Ponto de verificação:
#(1) Validar que seja possivel selecionar Processos válidos;
#(2) Validar que seja possivel  adiciona os Processos válidos selecionados ao Regime de Exceção;
