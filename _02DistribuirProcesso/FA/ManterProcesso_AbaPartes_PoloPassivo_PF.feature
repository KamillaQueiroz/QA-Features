#Author: Kamilla Xavier
#Review Date: 26/01/2018
#Keywords Summary:
#Feature: ManterProcesso_AbaPartes_PoloPassivo_PF
#Description:

@Funcionalidade
Feature: Manter Processo - Criar parte Polo Passivo Pessoa Física
  Como usuário de perfil SERVIDOR
  Com atuação de COMARCA DE PORTO ALEGRE - JEC

  Scenario Outline: Adicionar parte Polo Passivo Tipo Pessoa Física
    Given executo Scenario Editar Processo
    When visualizo tela MANTER PROCESSO 1G
    And aciono botão POLO PASSIVO
    And visualizo modal ASSOCIAR PARTE AO PROCESSO
    And seleciono TIPO DE PESSOA "<tipopessoa>"
    And informo campo NOME "<nome>"
    And informo campo SEXO "<sexo>"
    And informo campo RG "<registrogeral>"
    And informo campo UF DE EMISSÃO DO RG "<rgemissao>"
    And aciono aba ENDEREÇOS
    And informo campo CEP "<cep>"
    And visualizo preenchimento cmapos
    And informo campo NÚMERO "<numero>"
    And informo campo TIPO DE ENDEREÇO "<tipoendereco>"
    And clico botão ADICIONAR
    And visualizo grid ENDEREÇOS
    And aciono aba CONTATOS
    And informo campo TIPO "<tipocontato>"
    And informo campo DDD "<ddd>"
    And informo campo NUMERO "<numero>"
    And clico botão ADICIONAR
    And visualizo grid TELEFONES
    And clico no botão FINALIZAR
    Then visualizo grid PARTES

    Examples:
      | tipopessoa | nome   | sexo     | registrogeral | rgemissao | cep      | numero | tipoendereco | tipocontato | ddd | numero     |
      | Física     | TST001 | Feminino | INSERIR       | INSERIR   | 90670003 | 746    | Residencial  | Residencial | 51  | 3692587411 |

  # Ponto de Verificação, validar que seja possivel incluir o tipo de pesso FÍSICA no cadastro de Parte Passiva;
  # Ponto de Verificação, validar que ao inserir CEP válido, os demais campos sejam preenchidos corretamente;
  # Ponto de Verificação, validar que o endereço seja corretamente incluido na Grid Endereços;
  # Ponto de Verificação, validar que o contato seja corretamente incluido na Grid Contatos;
  # Ponto de Verificação, valdiar que seja corretamente incluso dados na Grid Partes.






