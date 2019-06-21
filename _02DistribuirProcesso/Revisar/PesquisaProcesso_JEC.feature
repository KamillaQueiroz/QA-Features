@Funcionalidade
Feature: Pesquisa de Processo
Como usuário de perfil SERVIDOR
Com atuação de COMARCA DE PORTO ALEGRE - 1º JEC
Tendo executado cenário Login.feature
Tendo executado cenário FB/PesquisaProcesso_JEC.feature

@Scenario1
Scenario Outline: Limpa Resultado Pesquisa
Given acesso eThemis "et1g-servidor"
And seleciono combo HOME ATUACAO "Comarca de Porto Alegre - 1º Juizado Especial Cível - Servidor"
And tela PROCESSO
When informo campo NUMERO "<NUMERO>"
And informo campo NOME DA PARTE "<NOME DA PARTE>"
And seleciono combo ESTADO "<ESTADO>"
And seleciono combo LOCAL DE PESQUISA "<LOCAL DE PESQUISA>"
And seleciono combo CLASSE "<CLASSE>"
And clico botao LIMPAR
Then verifico campo NUMERO vazio
And verifico campo NOME DA PARTE vazio
And verifico combo ESTADO vazio
And verifico combo LOCAL DE PESQUISA vazio
And verifico combo CLASSE vazio

Examples:
|	NUMERO						|	NOME DA PARTE			|	ESTADO		|	LOCAL DE PESQUISA	|	CLASSE									|
|	9000035-52.2015.8.21.5001	|	Mauro Lumertz Kreuzburg	|	Concluso	|	Na Atuação			|	Procedimento do Juizado Especial Cível	|