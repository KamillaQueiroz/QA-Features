@Funcionalidade
Feature: Pesquisa de Regime
  Como usuário de perfil COORDENADOR CORREGEDORIA (et1g-coordenador_cgj)
  Com atuação de COMARCA DE PORTO ALEGRE - JEC
  Possuir Regimes de Exceção cadastrados

  @Scenario1
  Scenario Outline: Acessa Tela Pesquisa
    Given efetuo login APLICACAO
    When aciono opcao CONSULTA REGIME DE EXCECAO
    # And seleciono campo LISTAGEM "<listagem>"
    Then visualizo tela MAPEAMENTO REGIME DE EXCECAO

  Examples:
  | listagem        |
  | *INCLUIR VALOR* |

#Ponto de verificação:
#(1) Validar que ao acionar a opção de CONSULTA REGIME DE EXCECAO e seleção de um Regime de Exceção seja exibida tela de Consulta a mesma seja exibida conforme descrição abaixo:
#Campos: Listagem de Regime de Exceção
#Sub-Área Dados do Regime de Exceção: Dados de Origem e Destino (Comarca / Vara / Judicância) - Data de Cadastro - Total de Prccessos e os botões Limpar, PEsquisar, Exportar Dados;
#Sub-Área Listagem de Processos Atribuidos: Número CNJ - Comarca Origem - Resultado e botão Pesquisar na Seleção
#Sub-Área Grid de Resultado: Colunas Comarca Origem - Data de Conclusão - Data de Distribuição - Número CNJ - Estado - Início Exceção - Fim Exceção - Resultado - Ações

  @Scenario2
  Scenario Outline: Pesquisa Regine de Exceção
    Given visualizo tela MAPEAMENTO REGIME DE EXCECAO
    And seleciono campo LISTAGEM "<listagem>"
    And preencho campo NUMERO "<numerocnj>"
    And preenho campo COMARCA "<comarcaorigem>"
    And preencho campo RESULTADO "<resultado>"
    And aciono botão PESQUISAR
    Then visualizo grid de registros

    Examples:
    | listagem        | numerocnj       | comarcaorigem   | resultado       |
    | *INCLUIR VALOR* | *INCLUIR VALOR* | *INCLUIR VALOR* | *INCLUIR VALOR* |

#Ponto de verificação:
#(0) Validar que os dados exibidos na ÁREA DE DADOS DO REGIME estejam de acordo com o Regime de Exceção cadastrado e que os dados de Origem e Destino sejam corretamente carregados nos campos destinados;
#(1) Validar que o resultado da pesquisa seja corretamente apresentado na Grid de registros;
#(2) Validar que os registros listados na grid de resultados seja válida em relação aos filtros aplciados;
#(3) Validar que as colunas apresentadas na grid de resultado sejam COMARCA DE ORIGEM, DATA DE CONCLUSÃO, DATA DE DISTRIBUIÇÃO, NÚMERO CNJ, ESTADO, INICIO EXCEÇÃO, FIM EXCEÇÃO, RESULTADO E AÇÕES;
#(4) Validar que quando processo apresentar na coluna ação ícone 'VERDE', a coluna FIM EXCEÇÃO do mesmo registro deve apresentar valores válidos;
#(5) Validar que quando processo apresentar na coluna ação ícone 'AMARELO' a coluna  ESTADO do mesmo registro deve apresentar o valor CONCLUSO;
#(6) Validar que quando processo apresentar na coluna ação ícone 'VERMELHO', o ícone deve estar habilitado para ser removido do Regime de Exceção - e validar que ao acionar o mesmo, mensagem O processo XXXXXXXXXXX será removido deste Regime de Exceção e irá retornar a sua Judicância de origem. Confirma o encerramento? (SIM/NÃO)”, seja exibida
