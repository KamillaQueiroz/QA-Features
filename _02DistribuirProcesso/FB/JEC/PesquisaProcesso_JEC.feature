@Funcionalidade
Feature: Pesquisa de Processo
Como usuário de perfil SERVIDOR
Com atuação de COMARCA DE PORTO ALEGRE - 1º JEC
Tendo executado cenário Login.feature

@Scenario1
Scenario: Pesquisa Processo Simples
Given acesso eThemis "et1g-servidor"
And seleciono combo HOME ATUACAO "Comarca de Porto Alegre - 1º Juizado Especial Cível - Servidor"
And tela PROCESSO
When clico botao PESQUISAR
Then verifico resultado PESQUISA COMARCA "Comarca de Porto Alegre" VARA "1º Juizado Especial Cível" NUMERO "" NOME DA PARTE "" ESTADO "[Todos]" LOCAL DE PESQUISA "Na Atuação" CLASSE "[Todas]" NAO EXIBIR BAIXADOS "true"

@Scenario2
Scenario Outline: Pesquisa Processo por Número Processo
Given tela PROCESSO
And informo campo NUMERO "<NUMERO>"
When clico botao PESQUISAR
Then verifico resultado PESQUISA COMARCA "Comarca de Porto Alegre" VARA "1º Juizado Especial Cível" NUMERO "<NUMERO>" NOME DA PARTE "" ESTADO "[Todos]" LOCAL DE PESQUISA "Na Atuação" CLASSE "[Todas]" NAO EXIBIR BAIXADOS "true"

Examples:
|	NUMERO						|
|	9000001-09.2017.8.21.5001	|
|	9000028-26.2016.8.21.5001	|
|	9000026-56.2016.8.21.5001	|

@Scenario3
Scenario Outline: Pesquisa Processo por Nome da Parte
Given tela PROCESSO
And informo campo NOME DA PARTE "<NOME DA PARTE>"
When clico botao PESQUISAR
Then verifico resultado PESQUISA COMARCA "Comarca de Porto Alegre" VARA "1º Juizado Especial Cível" NUMERO "" NOME DA PARTE "<NOME DA PARTE>" ESTADO "[Todos]" LOCAL DE PESQUISA "Na Atuação" CLASSE "[Todas]" NAO EXIBIR BAIXADOS "true"

Examples:
|	NOME DA PARTE					|
|	Giovani Jesus Bastista da Silva	|
|	Wal Mart Brasil					|
|	Luis Guilherme Martins da Rocha	|

@Scenario4
Scenario Outline: Pesquisa Processo por Estado
Given tela PROCESSO
And seleciono combo ESTADO "<ESTADO>"
When clico botao PESQUISAR
Then verifico resultado PESQUISA COMARCA "Comarca de Porto Alegre" VARA "1º Juizado Especial Cível" NUMERO "" NOME DA PARTE "" ESTADO "<ESTADO>" LOCAL DE PESQUISA "Na Atuação" CLASSE "[Todas]" NAO EXIBIR BAIXADOS "true"

Examples:
|	ESTADO					|
|	[Todos]					|
|	Aguardando Audiência	|
|	Apensado				|
|	Baixado					|
|	Com Juiz Leigo			|
|	Concluso				|
|	Distribuído				|
|	Em cadastramento		|
|	Em validação			|
|	Prazo					|
|	Prazo Suspenso			|
|	Segundo Grau			|
|	Verificar Providências	|

@Scenario5
Scenario Outline: Pesquisa Processo por Local de Pesquisa
Given tela PROCESSO
And seleciono combo LOCAL DE PESQUISA "<LOCAL DE PESQUISA>"
When clico botao PESQUISAR
Then verifico resultado PESQUISA COMARCA "Comarca de Porto Alegre" VARA "1º Juizado Especial Cível" NUMERO "" NOME DA PARTE "" ESTADO "[Todos]" LOCAL DE PESQUISA "<LOCAL DE PESQUISA>" CLASSE "[Todas]" NAO EXIBIR BAIXADOS "true"

Examples:
|	LOCAL DE PESQUISA	|
|	Na Atuação			|
|	Na Comarca			|
|	Todas as Comarcas	|

@Scenario6
Scenario Outline: Pesquisa Processo por Classe
Given tela PROCESSO
And seleciono combo CLASSE "<CLASSE>"
When clico botao PESQUISAR
Then verifico resultado PESQUISA COMARCA "Comarca de Porto Alegre" VARA "1º Juizado Especial Cível" NUMERO "" NOME DA PARTE "" ESTADO "[Todos]" LOCAL DE PESQUISA "Na Atuação" CLASSE "<CLASSE>" NAO EXIBIR BAIXADOS "true"

Examples:
|	CLASSE													|
|	[Todas]													|
|	Carta Precatória										|
|	Cumprimento de sentença									|
|	Embargos de Terceiro									|
|	Execução de Título Extrajudicial						|
|	Execução de Título Judicial								|
|	Incidente de Desconsideração de Personalidade Jurídica	|
|	Procedimento do Juizado Especial Cível					|