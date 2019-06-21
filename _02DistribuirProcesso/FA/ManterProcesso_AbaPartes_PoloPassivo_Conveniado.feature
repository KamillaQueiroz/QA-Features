#Author: Kamilla Xavier
#Review Date: 24/01/2018
#Keywords Summary:
#Feature: ManterProcesso_AbaPartes_PoloPassivo_Conveniado
#Description:

@Funcionalidade
Feature: Manter Processo - Criar parte Polo Passivo Conveniado
  Como usuário de perfil SERVIDOR
  Com atuação de COMARCA DE PORTO ALEGRE - JEC
  Ter executado cenário de CadastroProcesso

  Scenario Outline: Adicionar parte Polo Passivo Conveniado
    Given executo Scenario Editar Processo
    When visualizo página MANTER PROCESSO 1G
    And aciono aba PARTES
    And aciono botão POLO PASSIVO
    And vizualizo modal ASSOCIAR PARTE AO PROCESSO
    And seleciono TIPO DE PESSOA "<tipopessoa>"
    And aciono botão SELECIONAR CONVENICADO
    And visualizo nodal SELEÇÃO DE EMPRESAS CONVENIADAS
    And seleciono EMPRESA "<empresa>"
    And acino botão CONFIRMAR
    And visualizo campos
    And acino botao FINALIZAR
    Then visualizo grid PARTES

    Examples:
      | tipopessoa | empresa                                        |
      | Jurídica   | CLARO TV - Embratel Tvsat Telecomunicações S/A |

#Validar que seja possivel incluir como parte do processo uma empresa conveniada;
#Validar que ao ser selecionada uma empresa, seus dados sejam corretamente preenchidos.

