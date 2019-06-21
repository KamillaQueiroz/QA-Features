#Author: Sheila Lopes
#Date: 06/10/2017
#Keywords Summary : Novas Custas, Tipo Custas, Preparo de Recurso, Em Dobro
#Feature: CadastrarCustasPreparoRecursoPagamentoEmDobro
#Description: Essa feature tem o objetivo de validar o cadastro de custas de preparo de recurso com pagamento em dobro.


@Funcionalidade
Feature: Cadastrar Custas Preparo Recurso
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

  @Scenario1
  Scenario: Cadastrar Custas Preparo de Recurso Pagamento em Dobro
    When clico botao CUSTAS
    And clico botao NOVAS CUSTAS
    And seleciono combo TIPO DE CUSTAS "Preparo de Recurso"
    And coleto valores de itens de custas
    And clico check EM DOBRO
    And valido campo VALOR e TOTAL
    And seleciono pagante combo PAGANTE
    And clico botao ADICIONAR
    And clico botao EMITIR GUIA
    And clico botão OK  na modal Emitir Guia
    Then visualizo grid CUSTAS
    And valido campo TIPO "Guia"
    And valido campo FINALIDADE "Preparo de Recurso"
    And valido campo VALOR

#Ponto de Verificação 1, campo TOTAL = soma campos VALOR de cada recurso (1º e 2º Grau)
#Ponto de Verificação 2, campo TOTAL = soma campos VALOR de cada recurso (1º e 2º Grau), multiplicado por dois
#Ponto de Verificação 3, campo TIPO = 'Guia', campo FINALIDADE = 'Preparo de Recurso'
#Ponto de Verificação 4, campo VALOR = campo TOTAL.