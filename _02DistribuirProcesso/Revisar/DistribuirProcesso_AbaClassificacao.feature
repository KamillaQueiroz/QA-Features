#Author: your.email@your.domain.com
#Keywords Summary :
#Feature: List of scenarios.
#Scenario: Business rule through list of steps with arguments.
#Given: Some precondition step
#When: Some key actions
#Then: To observe outcomes or validation
#And,But: To enumerate more Given,When,Then steps
#Scenario Outline: List of steps for data-driven as an Examples and <placeholder>
#Examples: Container for s table
#Background: List of steps run before each of the scenarios
#""" (Doc Strings)
#| (Data Tables)
#@ (Tags/Labels):To group Scenarios 
#<> (placeholder)
#""
## (Comments)

#Sample Feature Definition Template
@tag
Feature: Preenchimento da aba CLASSIFICACAO

@basico
Scenario Outline: Criar ASSUNTO ASSOCIADO
Given acesso eThemis USUARIO "et1g-servidor" SENHA "12345678"
And acesso eThemis
And crio novo processo HOME ATUACAO "Comarca de Porto Alegre - 10º Juizado Especial Cível"
When seleciono combo CLASSIFICACAO CLASSE "<classe>"
And seleciono combo CLASSIFICACAO TIPO PEDIDO "<tipoPedido>"
And seleciono combo CLASSIFICACAO ASSUNTO "<assunto>"
And clico botao CLASSIFICACAO ADICIONAR ASSUNTO ASSOCIADO
Then verifico grid CLASSIFICACAO ASSUNTOS ASSOCIADOS "<assuntoAssociado>" incluido
And verifico aba FATO-PEDIDO habilitado
And verifico aba PARTES habilitado
And verifico aba DOCUMENTOS habilitado
And verifico aba DADOS COMPLEMENTARES habilitado
And verifico aba FINALIZACAO habilitado

Examples:
	|	classe									|	tipoPedido									|	assunto															|	assuntoAssociado										|
	|	Procedimento do Juizado Especial Cível	|	Acidente de Trânsito – Reparação de Danos	|	Indenização por Dano Material :: Acidente de Trânsito - 11319	|	Indenização por Dano Material :: Acidente de Trânsito	|

@basico
Scenario: Marcar VALOR ALCADA
When marco check CLASSIFICACAO VALOR ALCADA
Then verifico campo CLASSIFICACAO VALOR ALCADA preenchido
