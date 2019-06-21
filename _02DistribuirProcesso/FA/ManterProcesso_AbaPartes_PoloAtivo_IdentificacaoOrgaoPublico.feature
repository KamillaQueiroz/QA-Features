#Author: Kamilla Xavier
#Review Date: 29/01/2018
#Keywords Summary:
#Feature: ManterProcesso-AbaPartes-PoloAtivo-IdentificaçãoOrgãoPublico
#Description:

@Funcionalidade
Feature: Manter Processo - Criar parte Polo Ativo Identificação Orgão Público
  Como usuário de perfil SERVIDOR
  Com atuação de COMARCA DE PORTO ALEGRE - JEFAZ
  Ter executado cenário de CadastroProcesso

  Scenario Outline: Adicionar parte Polo Passivo Tipo Pessoa Juridica
    Given executo Scenario Editar Processo
    When visualizo tela MANTER PROCESSO 1G
    And aciono botão POLO PASSIVO
    And visualizo modal ASSOCIAR PARTE AO PROCESSO
    And seleciono TIPO DE PESSOA "<tipopessoa>"
    And visualizo modal SELEÇÃO DE ENTES PÚBLICOS
    And seleciono ENTE PÚBLICO "<entepublico>"
    And aciono botão CONFIRMAR
    And visualizo aba IDENTIFICAÇÃO
    And aciono aba ENDEREÇOS
    And visualizo grid ENDEREÇOS
    And aciono aba CONTATOS
    And visualizo grid TELEFONES
    And aciona botão FINALIZAR
    Then visualizo grid PARTES

    Examples:
      | tipopessoa    | entepublico |
      | Órgão Público | INSERIR     |

# Ponto de Verificação, validar que seja possivel incluir o tipo de pessoa ORGÃO PÚBLICO no cadastro de Parte Ativa;
# Ponto de Verificação, validar que a modal de seleção ENTES PÚBLICOS seja corretamente carregada;
# Ponto de Verificação, validar que após seleção do Orgão Público o conteúdo das abas sejam corretamente preenchidos;
# Ponto de Verificação, valdiar que seja corretamente incluso dados na Grid Partes.

