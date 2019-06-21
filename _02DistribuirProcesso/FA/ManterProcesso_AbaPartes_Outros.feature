#Author: Kamilla Xavier
#Review Date: 23/01/2018
#Keywords Summary:
#Feature: ManterProcesso_AbaPartes_Outros
#Description:

@Funcionalidade
Feature: Manter Processo - Criar parte Outros
  Como usuário de perfil SERVIDOR
  Com atuação de COMARCA DE PORTO ALEGRE - JEC
  Ter executado cenário de CadastroProcesso

  Scenario Outline: Adicionar parte Outros - Pessoa Física
    Given executo Scenario Editar Processo
    When visualizo página MANTER PROCESSO 1G
    And aciono botão OUTROS
    And vizualizo modal ASSOCIAR PARTE AO PROCESSO
    And visualizo aba IDENTIFICAÇÃO
    And informo campo TIPO DE PARTICIPAÇÃO "<tipoparticipacao>"
    And informo campo PARTE VINCULANTE "<partevinculante>"
    And seleciono TIPO PESSOA "<tipopessoa>"
    And infomor campo NOME "<nome>"
    And aciono aba ENDEREÇOS
    And informo campo CEP "<cep>"
    And visualizo campos
    And informo campo NUMERO "<numero>"
    And seleciono campo TIPO DE ENDEREÇO "<tipoendereco>"
    And aciono botão ADICIONAR
    And visualizo grid ENDEREÇO
    And clico botao FINALIZAR
    Then visualizo grid OUTROS PARTICIPANTES

    Examples:
      | tipoparticipacao | partevinculante | tipopessoa | nome                  | cep      | numero | tipoendereco |
      | Testemunha       | INFORMAR        | Física     | TST-Incluir-Outros001 | 90010321 | 445    | Residencial  |

#Ponto de Verificação, validar que após informar CEP os campos UF, Cidade, Tipo de Logradouro, Logradouro, Bairro e Zona foram preenchidos
#Ponto de Verificação, validar seja adicionado corretamente um tipo de parte OUTROS

  Scenario Outline: Adicionar parte Outros - Pessoa Jurídica
    Given executo Scenario Editar Processo
    When visualizo página MANTER PROCESSO 1G
    And aciono botão OUTROS
    And vizualizo modal ASSOCIAR PARTE AO PROCESSO
    And visualizo aba IDENTIFICAÇÃO
    And informo campo TIPO DE PARTICIPAÇÃO "<tipoparticipacao>"
    And informo campo PARTE VINCULANTE "<partevinculante>"
    And seleciono TIPO PESSOA "<tipopessoa>"
    And infomor campo RAZÃO SOCIAL "<razaosocial>"
    And aciono aba ENDEREÇOS
    And informo campo CEP "<cep>"
    And visualizo campos
    And informo campo NUMERO "<numero>"
    And seleciono campo TIPO DE ENDEREÇO "<tipoendereco>"
    And aciono botão ADICIONAR
    And visualizo grid ENDEREÇO
    And clico botao FINALIZAR
    Then visualizo grid OUTROS PARTICIPANTES

    Examples:
      | tipoparticipacao | partevinculante | tipopessoa | razaosocial           | cep      | numero | tipoendereco |
      | Testemunha       | INFORMAR        | Jurídica   | TST-Incluir-Outros002 | 90010321 | 445    | Residencial  |

#Ponto de Verificação, validar que após informar CEP os campos UF, Cidade, Tipo de Logradouro, Logradouro, Bairro e Zona foram preenchidos
#Ponto de Verificação, validar seja adicionado corretamente um tipo de parte OUTROS