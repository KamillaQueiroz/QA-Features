@Funcionalidade
Feature: Executar Ações com Documento Prcatorio
  Como usuário de perfil MAGISTRADO (et1g-magistrado)

  @Scenario1
  Scenario: Assinar Documento Precatório
    Given visualizo guia DOCUMENTOS
    When identifico pasta REQUISIÇÃO DE PAGAMENTO - PRECATÓRIO
    And seleciono pasta REQUISIÇÃO DE PAGAMENTO - PRECATÓRIO
    And visualizo grid REQUISIÇÃO DE PAGAMENTO - PRECATÓRIO
    And seleciono documento
    And aciono botão ASSINAR
    And preencho campo SENHA ASSINATURA DIGITAL
    Then documento assinado
    And documento retorna origem

#Ponto de verificação:
# (1) Validar que o documento gerado esteja disponivel para assinatura;
# (2) Validar em base que a situação do documento seja igual à GERADO
# (3) Validar que após ser assinado, documento seja corretamente disponibilizado em seu processo de origem.

  @Scenario2
  Scenario: Devolver Documento Precatório
    Given visualizo guia DOCUMENTOS
    When identifico pasta REQUISIÇÃO DE PAGAMENTO - PRECATÓRIO
    And seleciono pasta REQUISIÇÃO DE PAGAMENTO - PRECATÓRIO
    And visualizo grid REQUISIÇÃO DE PAGAMENTO - PRECATÓRIO
    And seleciono documento
    And aciono botão DEVOLVER AO CARTÓRIO
    And confirmo envio
    Then documento retorna origem

#Ponto de verificação:
# (1) Validar que o documento gerado esteja disponivel para assinatura;
# (2) Validar que após ser devolvido, documento seja corretamente dretornado em seu processo de origem.