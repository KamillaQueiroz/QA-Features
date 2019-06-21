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
Feature: Preenchimento da aba DADOS COMPLEMENTARES

Background:
Given acesso eThemis USUARIO "et1g-servidor" SENHA "12345678"
And crio novo processo HOME ATUACAO "Comarca de Porto Alegre - 10º Juizado Especial Cível"
And preencho aba CLASSIFICACAO CLASSE "Procedimento do Juizado Especial Cível" TIPO PEDIDO "Acidente de Trânsito – Reparação de Danos" ASSUNTO "Indenização por Dano Material :: Acidente de Trânsito - 11319"

@basico
Scenario: Criar ASSUNTO ASSOCIADO
When clico aba DADOS COMPLEMENTARES
And seleciono combo DADOS COMPLEMENTARES TIPO
And seleciono combo DADOS COMPLEMENTARES HORARIO
Then verifico campo VARA
And verifico campo JUIZADO
And verifico campo JUDICANCIA

@fluxo
Scenario: preencher aba DADOS COMPLEMENTARES
When preencho aba DADOS COMPLEMENTARES
Then verifico campo VARA
And verifico campo JUIZADO
And verifico campo JUDICANCIA
