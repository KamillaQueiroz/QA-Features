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
Feature: Preenchimento da aba FINALIZACAO

@basico
Scenario: verificar validacao abas
Given acesso eThemis USUARIO "et1g-servidor" SENHA "12345678"
And crio novo processo HOME ATUACAO "Comarca de Porto Alegre - 10º Juizado Especial Cível"
And preencho aba CLASSIFICACAO CLASSE "Procedimento do Juizado Especial Cível" TIPO PEDIDO "Acidente de Trânsito – Reparação de Danos" ASSUNTO "Indenização por Dano Material :: Acidente de Trânsito - 11319"
And preencho aba FATO-PEDIDO FATO "fato do processo" PEDIDO "pedido do processo"
And adiciono POLO ATIVO "AutoName", "Feminino", "00339635096", "12345678", "Rio Grande do Sul", "Mestrado", "Solteiro", "Advogado", "Joao", "Maria", "null", "Brasil", "RS", "Porto Alegre", "Brasil", "90660110", "2222", "Comercial", "Celular", "51", "999999999", "teste@test.com", "123456", "Rio Grande do Sul", "Advogado"
And adiciono POLO PASSIVO "AutoName2", "Feminino", "00339635096", "12345678", "Rio Grande do Sul", "Mestrado", "Solteiro", "Advogado", "Joao", "Maria", "null", "Brasil", "RS", "Porto Alegre", "Brasil", "90660110", "2222", "Comercial", "Celular", "51", "999999999", "teste@test.com", "123456", "Rio Grande do Sul", "Advogado"
#And preencho aba DADOS COMPLEMENTARES	#nao precisa colocar pois e preenchido automaticamente
When clico aba FINALIZACAO
Then verifico aba CLASSIFICAÇÃO 
And verifico aba FATO-PEDIDO
And verifico aba PARTES
And verifico aba DOCUMENTOS
And verifico aba DADOS COMPLEMENTARES

@basico
Scenario: salvar PROCESSO
When clico botao SALVAR
Then verifico BANCO DE DADOS
