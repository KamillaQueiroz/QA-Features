#Author: Sheila Lopes
#Date: 11/08/2017
#Keywords Summary : Custas Iniciais, Custas Pendente, Guia Aberta, Fechar Modal Novas Custas
#Feature: CadastrarCustasIniciaisDuplicadas
#Description: Essa feature valida o cadastro de Custas Iniciais quando há Custas do tipo 'Custas Iniciais' com situação
#'Pendente' e quando há Guia do tipo 'Custas Iniciais' com situação 'Aberta'.

@Funcionalidade
Feature: Cadastrar Custas Iniciais Duplicadas
  Como usuário de perfil SERVIDOR
  Com atuação de COMARCA DE PORTO ALEGRE - VFP

  Background:
    Given acesso site eThemis
    Given uso processo basico VFP
    Given altero propriedade dto "classe" "Procedimento Ordinário"
    And altero propriedade dto "tipoPedido" "Outros"
    And altero propriedade dto "assunto" "Multas e demais Sanções"
    And altero propriedade dto "atuacao" "Porto Alegre - 1ª Vara da Fazenda Pública"
    And altero propriedade dto "perfilUsuario" "Distribuidor"
    And crio processo pelo servico PPE
    And acesso eThemis
    And seleciono combo HOME ATUACAO
    When seleciono combo HOME COMPETENCIA "VFP"
    When efetuo zoneamento do processo em validacao
    And clico aba DADOS COMPLEMENTARES
    And seleciono combo DADOS COMPLEMENTARES - TIPO DISTRIBUICAO "Sorteio"
    And clico aba FINALIZACAO
    And clico botao FINALIZAR
    And pesquiso comarca
    And deslogo eThemis
    Given efetuo login eThemis "et1g-servidor"
    Given acesso tela PROCESSO
    And seleciono combo HOME ATUACAO
    And informo campo NUMERO "<NUMERO>"
    When clico botao PESQUISAR
    When clico botao Verificar Providências

  @ManterCustas @Done
  Scenario: Cadastrar Custas Iniciais com Custas Pendente
    When clico botao CUSTAS
    Given clico botao NOVAS CUSTAS
    When seleciono combo Tipo de Custas "Custas Iniciais"
    And visualizo campo TOTAL
    And seleciono pagante combo PAGANTE
    And clico botao ADICIONAR
    And clico botao GERAR CUSTAS
    Then mensagem Custas geradas com sucesso é exibida
    When clico botao SAIR
    And clico botao NOVAS CUSTAS
    When seleciono combo Tipo de Custas "Custas Iniciais"
    Then visualizo mensagem custas duplicadas "Já foram geradas Custas Iniciais para esse processo."

  @ManterCustas @Done
  Scenario: Cadastrar Custas Iniciais com Guia Aberta
    When clico botao CUSTAS
    Given clico botao NOVAS CUSTAS
    When seleciono combo Tipo de Custas "Custas Iniciais"
    And visualizo campo TOTAL
    And seleciono pagante combo PAGANTE
    And clico botao ADICIONAR
    And clico botao EMITIR GUIA
    And clico botão OK  na modal Emitir Guia
    When clico botao SAIR
    And clico botao NOVAS CUSTAS
    When seleciono combo Tipo de Custas "Custas Iniciais"
    Then visualizo mensagem custas duplicadas "Já foram geradas Custas Iniciais para esse processo."

