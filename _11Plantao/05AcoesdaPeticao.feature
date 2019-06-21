@Funcionalidade
Feature: Detalhes da Petição
  Com ID e Pass de rede
  Ter executado previamente LoginPlantao.feature
  Ter executado previamente Pesquisa&Listagem.feature

  Scenario: Iniciar atendimento
    Given executo Exibir Detalhes Petição - Situação PROTOCOLADA
    When aciono ação INICIAR ATENDIMENTO
    And confirmo ação
    Then valido situação petição

    #Ponto de Validação: verificar que ao iniciar atendimento a situação da petição seja atualizada para EM ATENDIMENTO e que seja possivel incluir novos
    # documentos a petição

  Scenario Outline: Incluir documentos
    Given executo Iniciar atendimento
    When aciono ação SELECIONAR ARQUIVOS
    And seleciono arquivo
    And informo campo TIPO '<tipo>'
    And informo campo DESCRIÇão '<descricao>'
    And aciono ação SALVAR DOCUMENTOS
    Then valido novo documento
    And valido origem
    And valido ações

    Examples:
      | tipo             | descricao   |
      | Outros - Plantão | TST-Plantao |

    #Ponto de Validação: verificar que novo documento tenha sido inserido na grid DOCUMENTOS com sucesso
    #Verificar que a origem seja PLANTONISTA
    #Verificar que para os documentos inseridos pelo plantonista seja apresentados as ações VISUALIZAR DOCUMENTO e EXCLUIR DOCUMENTO

  Scenario: Visualizar documento
    Given executo Incluir documentos
    When identifico documento
    And aciono ação VISUALIZAR DOCUMENTO
    And confirmo SALVAR COMO
    Then valido documento

    #Ponto de Validação: verificar que seja possivel salvar cópia do documento e visualizar o mesmo

  Scenario: Excluir documento
    Given executo Incluir documentos
    When identifico documento
    And aciono ação EXCLUIR DOCUMENTOS
    And confirmo ação
    Then valido exclusão

    #Ponto de Validação: verificar que seja possivel excluir com sucesso documentos acidionados pelo plantonista

  Scenario Outline: Finalizar atendimento - finalizar petição
    Given executo Iniciar atendimento
    When aciono ação FINALIZAR
    And informo campo TIPO DE PETIÇÃO '<tipopeticao>'
    And informo campo TIPO ENCERRAMENTO '<tipoencerramento>'
    And informo campo TIPO DE DECISÃO '<tipodecisao>'
    And aciono ação SALVAR
    And confirmo ação
    Then valido finalização da petição

    Examples:
      | tipopeticao | tipoencerramento  | tipodecisao |
      | Inicial     | É caso de Plantão | Deferido    |

    #Ponto de Validação: verificar que a petição assummiu a situação de FINALIZADA
    #Verificar que a ação REABRIR ATENDIMENTO seja disponibilizada

  Scenario Outline: Finalizar atendimento - arquivar petição
    Given executo Iniciar atendimento
    When aciono ação FINALIZAR
    And informo campo TIPO DE PETIÇÃO '<tipopeticao>'
    And aciono ação SALVAR
    And confirmo ação
    Then valido finalização da petição

    Examples:
      | tipopeticao   |
      | Intermediária |

     #Ponto de Validação: verificar que a petição assummiu a situação de ARQUIVADA

  Scenario: Reabrir atendimento
    Given executo Finalizar atendimento - finalizar petição
    When aciono ação REABRIR ATENDIMENTO
    And confirmo ação
    Then valido situação petição

    #Ponto de Validação: verificar que ao iniciar atendimento a situação da petição seja atualizada para EM ATENDIMENTO e que seja possivel incluir novos
    # documentos a petição