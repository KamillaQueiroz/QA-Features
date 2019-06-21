#Author: Sheila Lopes
#Date: 06/10/2017
#Keywords Summary : Custas Iniciais, Custas Iniciais Complementar, Tipo Custas, Novas Custas
#Feature: ValidarCadastroCustasIniciaisComplementarSemAlterarValorAcao
#Description: Essa feature tem o objetivo de validar o cadastro de custas iniciais complementar,
#sem a alteração do valor da ação.

@Funcionalidade
Feature: Validar Cadastro Custas Iniciais Complementar Sem Alterar Valor Acao
  Como usuário de perfil SERVIDOR
  Com atuação de COMARCA DE PORTO ALEGRE - VFP

  @Scenario1
  Scenario: Cadastrar Custas Iniciais
    Given acesso site eThemis
    And acesso tela PROCESSO
    And seleciono combo HOME ATUACAO
    And informo campo NUMERO "<numero>"
    And clico botao PESQUISAR
    And clico botao Verificar Providencias
    And clico grid CUSTAS
    And clico botao NOVAS CUSTAS
    And seleciono combo TIPO DE CUSTAS 'Custas Iniciais'
    And seleciono combo PAGANTE
    And clico botao ADICIONAR
    And clico botao EMITIR GUIA
    When clico botao OK
    Then visualizo grid CUSTAS
    And valido campo TIPO
    And valido campo FINALIDADE

#Ponto de Verificação 1, campo TIPO = 'Guia', campo FINALIDADE = 'Custas Iniciais'.

  @Scenario2
  Scenario: Validar Cadastro Custas Iniciais Complementar
    Given clico botao NOVAS CUSTAS
    When seleciono combo TIPO DE CUSTAS 'Custas Iniciais - Complementar'
    Then visualizo mensagem 'As Custas Iniciais já existentes consideram o valor atualizado do processo, não sendo necessário criar Custas Iniciais - Complementar.'