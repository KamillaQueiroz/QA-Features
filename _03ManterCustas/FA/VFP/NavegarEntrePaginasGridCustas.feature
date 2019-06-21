#Author: Sheila Lopes
#Date: 16/08/2017
#Keywords Summary : Custas Iniciais, Primeira, Proxima, Ultima, Anterior, Página
#Feature: NavegarEntrePaginasGridCustas
#Description: Essa feature tem a finalidade de validar a navegação entre as páginas da grid
#Custas através dos botoes Primeira, Proxima, Ultima, Anterior.

@Funcionalidade
Feature: Navegar entre Paginas Grid Custas
  Como usuário de perfil SERVIDOR
  Com atuação de COMARCA DE PORTO ALEGRE - VFP

  @Scenario1
  Scenario: Acessar Manter Custas
    Given acesso site eThemis
    And acesso tela PROCESSO
    And seleciono combo HOME ATUACAO
    And informo campo NUMERO "<numero>"
    And clico botao PESQUISAR
    And clico botao Verificar Providencias
    When clico grid CUSTAS
    Then visualizo filtro TIPO DE CUSTAS

  @Scenario2
  Scenario: Gerar Custas com um Pagante Parcelado
    Given clico botao NOVAS CUSTAS
    And seleciono como TIPO DE CUSTAS 'Custas Iniciais'
    And seleciono combo PAGANTE
    And clico botao ADICIONAR
    And informo campo PARCELAS '22'
    And clico botao GERAR CUSTAS
    And visualizo mensagem 'Custas geradas com sucesso.'
    When clico botao SAIR
    Then visualizo grid CUSTAS 'Ver 1-10 de 22'

# Ponto de Verificação, após clicar em SAIR, modal NOVAS CUSTAS é fechada e grid CUSTAS é exibida

  @Scenario3
  Scenario: Acessar Proxima Pagina
    Given visualizo grid CUSTAS 'Página 1 de 3'
    When clico botao PROXIMA
    Then visualizo grid CUSTAS 'Página 2 de 3'
    And visualizo campo TIPO
    And visualizo campo DATA EMISSAO
    And visualizo campo PAGANTE
    And visualizo campo AJG
    And visualizo campo Nº DA GUIA
    And visualizo campo PARCELA
    And visualizo campo FINALIDADE
    And visualizo campo VALOR
    And visualizo campo SITUACAO
    And visualizo campo ACOES

  @Scenario4
  Scenario: Acessar Ultima Pagina
    Given visualizo grid CUSTAS 'Ver 11-20 de 22'
    When clico botao ULTIMA
    Then visualizo grid CUSTAS 'Página 3 de 3'
    And visualizo campo TIPO
    And visualizo campo DATA EMISSAO
    And visualizo campo PAGANTE
    And visualizo campo AJG
    And visualizo campo Nº DA GUIA
    And visualizo campo PARCELA
    And visualizo campo FINALIDADE
    And visualizo campo VALOR
    And visualizo campo SITUACAO
    And visualizo campo ACOES

  @Scenario5
  Scenario: Acessar Pagina Anterior
    Given visualizo grid CUSTAS 'Ver 21-22 de 22'
    When clico botao ANTERIOR
    Then visualizo grid CUSTAS 'Página 2 de 3'
    And visualizo campo TIPO
    And visualizo campo DATA EMISSAO
    And visualizo campo PAGANTE
    And visualizo campo AJG
    And visualizo campo Nº DA GUIA
    And visualizo campo PARCELA
    And visualizo campo FINALIDADE
    And visualizo campo VALOR
    And visualizo campo SITUACAO
    And visualizo campo ACOES

  @Scenario6
  Scenario: Acessar Primeira Pagina
    Given visualizo grid CUSTAS 'Ver 11-20 de 22'
    When clico botao PRIMEIRA
    Then visualizo grid CUSTAS 'Página 1 de 3'
    And visualizo grid CUSTAS 'Ver 1-10 de 22'
    And visualizo campo TIPO
    And visualizo campo DATA EMISSAO
    And visualizo campo PAGANTE
    And visualizo campo AJG
    And visualizo campo Nº DA GUIA
    And visualizo campo PARCELA
    And visualizo campo FINALIDADE
    And visualizo campo VALOR
    And visualizo campo SITUACAO
    And visualizo campo ACOES

