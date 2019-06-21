#Author: Kamilla Xavier
#Review Date: 24/01/2018
#Keywords Summary:
#Feature: ManterProcesso_AbaDocumentos_Sigilo
#Description:

@Funcionalidade
Feature: Manter Processo - Sigilo de Documentos
  Como usuário de perfil SERVIDOR
  Com atuação de COMARCA DE PORTO ALEGRE - JEC
  Ter executado cenário de CadastroProcesso

  Scenario: Adicionar Sigilo de Documentos
    Given executo Scenario Editar Processo
    When visualizo página MANTER PROCESSO 1G
    And aciono aba Documentos
    And aciono botão SIGILO DOCUMENTOS
    And visualizo modal DOCUMENTOS SIGILOSOS
    And seleciono DOCUMENTO
    And aciono botão SALVAR
    Then visualizo tela MANTER PROCESSO

#Ponto de Verificação, validar que o documento selecionado não seja exibido nos autos quando acessado externamente e na consulta de processos pela web.Ability: