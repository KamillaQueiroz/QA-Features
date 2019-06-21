#Author: Kamilla Xavier
#Review Date: 23/01/2018
#Keywords Summary:
#Feature: ManterProcesso_AbaDocumentos_DcoumentoParticionado
#Description: Feature se destina a validar opção de particionamento de documentos que são anexados junto ao processo.

@Funcionalidade
Feature: Manter Processo - Documento Particionado
  Como usuário de perfil SERVIDOR
  Com atuação de COMARCA DE PORTO ALEGRE - JEC
  Ter executado cenário de CadastroProcesso

  Scenario Outline: Adicionar e Particionar Documento
    Given executo Scenario EDITAR PROCESSO
    When visualizo página MANTER PROCESSO 1G
    And aciono aba DOCUMENTOS
    And aciono botao SELECIONAR
    And identifico modal SELEÇÃO DE DOCUMENTOS
    And seleciono documento
    And aciono botão ADICIONAR
    And visualizo grid DOCUMENTOS
    And valido grid DOCUMENTOS
    And aciono ação PARTICIONAR
    And visualizo modal PARTICIONAR DOCUMENTO
    And informo campo DE "<de>"
    And informo campo ATÉ "<ate>"
    And informo campo TIPO "<tipo>"
    And informo campo DESCRICAO "<descricao>"
    And aciono ação DOCUMENTO
    And informo campo DE "<de>"
    And informo campo ATÉ "<ate>"
    And informo campo TIPO "<tipo>"
    And informo campo DESCRICAO "<descricao>"
    And clico botao CONFIRMA
    Then verifico grid DOCUMENTOS

    Examples:
      | de | ate | tipo   | descricao |
      | 01 | 25  | Outros | TST01     |
      | 26 | 50  | Outros | TST02     |

#Ponto de Verificação, validar que documento selecionado, seja corretamente apresentado na Gird Documentos;
#Ponto de Verificação, validar que seja corretamente disposnibilizado opção de particionamento para documento inserido;
#Ponto de Verificação, validar que o particionamento seja feito corretamente;