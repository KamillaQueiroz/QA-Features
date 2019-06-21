#Author: Kamilla Xavier
#Review Date: 24/01/2018
#Keywords Summary:
#Feature: ManterProcesso_AbaPartes_AJG
#Description:

@Funcionalidade
Feature: Manter Processo - Solicitação AJG Aba Partes
  Como usuário de perfil SERVIDOR
  Com atuação de COMARCA DE PORTO ALEGRE - VFP
  Ter executado cenário de CadastroProcesso
  Ter executado cenário de PesquisaProcesso
  Processo com Estado 'Em Cadastramento'
  Ter Advogado associado

  Scenario Outline: Solicitar AJG
    Given executo Scenario Editar Processo
    And visualizo página MANTER PROCESSO 1G
    And aciono aba PARTES
    And identifico grid PARTES
    And identifico parte POLO ATIVO
    And aciono botão EDITAR
    And identifo modal ASSOCIAR PARTE AO PROCESSO
    When aciono aba AJG
    And aciono botão NOVA SITUAÇÃO AJG
    And visualizo campo DESPACHO/DECISÃO/SENTENÇA
    And preencho campo  OBSERVAÇÕES '<observacoes>'
    And identifico grid PETIÇÕES
    And seleciono DOCUMENTO
    And aciono botão CONFIRMAR
    Then visualizo grid SITUAÇÃO AJG

    Examples:
      | observacoes                    |
      | Observação teste para execução |

#Ponto de Verificação, verificar que o campo DESPACHO/DECISÃO/SENTENÇA seja apresentado preenchido com o valor 'Pedido de AJG'
#Ponto de Verificação, verificar que após confirmação, na grid SITUAÇÃO AJG seja exibido pedido de AJG
#Ponto de Verificação, verificar que os dados presentes da grid SITUAÇÃO AJG estejam corretose consistentes

  Scenario Outline: Incluir Situação AJG
    Given executo Scenario Solicitar AJG
    And identifo modal ASSOCIAR PARTE AO PROCESSO
    When aciono aba AJG
    And aciono botão NOVA SITUAÇÃO AJG
    And preencho campo DESPACHO/DECISÃO/SENTENÇA '<decisao>"
  #And preencho campo PERCENTUAL '<percentual>'
    And preencho campo  OBSERVAÇÕES '<observacoes>'
    And identifico grid SETENÇAS
    And assinalo documento
    And identifico grid SITUAÇÃO AJG
    And aciono botão ADICIONAR
    Then visualizo grid SITUAÇÃO AJG

    Examples:
      | decisao          | percentual | observacoes                    |
      | Deferido Total   | -          | Observação teste para execução |
      | Deferido Parcial | 60.00      | Observação teste para execução |
      | Indeferido       | -          | Observação teste para execução |
      | Revogado         | -          | Observação teste para execução |

#Ponto de Verificação, verificar que seja possivel incluir nova informação sobre a solicitação AJG
#Ponto de Verificação, verificar que ao definir o valor do campo DESPACHO/DECISÃO/SENTENÇA como 'DEFERIDO PARCIAL' seja exibido novo campo PERCENTUAL
#Ponto de Verificação, verificar que ao confirmar nova situação os dados sejam incluidos com sucesso na grid SITUAÇÃO AJG
#Ponto de Verificação, verificar que os dados presentes da grid SITUAÇÃO AJG estejam corretose consistentes

  Scenario: Excluir Situação AJG
    Given executo Scenario Solicitar AJG
    And identifo modal ASSOCIAR PARTE AO PROCESSO
    When aciono aba AJG
    And identifico grid SITUAÇÃO AJG
    And aciono ação EXCLUIR
    And identifico área EXCLUIR A SITUAÇÃO AJG
    And informo campo MOTIVO DA EXCLUSÃO DA SITUAÇÃO DA AJG '<motivoexclusao>'
    And aciono botão EXCLUIR
    And confirmo mensagem EXLUSÃO
    Then visualizo grid SITUAÇÃO AJG

#Ponto de Verificação, verificar que seja possivel excluir um registro presente na grid SITUAÇÃO AJG
#Ponto de Verificação, verificar que seja exibida tela para justificativa da exclusão
#Ponto de Verificação, verificar que na grid de Situação AJG item excluido apresente conotação diferenciada
#Ponto de Verificação, verificar que dados sejam corretamente excluido