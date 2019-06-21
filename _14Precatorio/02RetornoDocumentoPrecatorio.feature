@Funcionalidade
Feature: Retorno Documento Prcatorio
  Como usuário de perfil SERVIDOR (et1g-servidor)

  @Scenario1
  Scenario: Documento Precatório Assinado
    Given executado Scenario: Assinar Documento Precatório
    When visualizo tela VERIFICAR PROVIDÊNCIAS DO PROCESSO
    And identifico grid DOCUMENTOS
    And identifico DOCUMENTO REQUISIÇÃO DE PAGAMENTO - PRECATÓRIO
    And aciono ação VISUALIZAR
    Then visualizo documento assinado

#Ponto de verificação:
# (1) Validar que documento assinado seja corretamente disponibilizado na grid de documento do seu processo de origem;
# (2) Validar em base que a situação do documento seja igual à GERADO.

  @Scenario2
  Scenario: Documento Precatório Devolvido
    Given executado Scenario: Assinar Documento Precatório
    When visualizo tela VERIFICAR PROVIDÊNCIAS DO PROCESSO
    And aciono guia DOCUMENTOS
    And seleciono pasta REVISAR
    And identifico grid DOCUMENTOS
    And identifico DOCUMENTO REQUISIÇÃO DE PAGAMENTO - PRECATÓRIO
    And aciono ação EXCLUIR
    Then DOCUMENTO REQUISIÇÃO DE PAGAMENTO - PRECATÓRIO é excluido

#Ponto de verificação:
# (1) Validar que documento adevolvido esteja disponivel na pasta de Revisão da Guia Documentos;
# (2) Validar que seja possivel excluir documento;
# (3) Validar em base que a situação do documento seja igual à CANCELADO.