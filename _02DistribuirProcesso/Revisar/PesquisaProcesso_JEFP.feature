@Funcionalidade
Feature: Pesquisa de Processo
Como usuário de perfil SERVIDOR
Com atuação de COMARCA DE PORTO ALEGRE - JEFP
Tendo executado cenário Login.feature
Tendo executado cenário FB/PesquisaProcesso_JEFP.feature

@Scenario1
Scenario Outline: Limpa Resultado Pesquisa
Given acesso eThemis "et1g-servidor"
And seleciono combo HOME ATUACAO "Comarca de Porto Alegre - JEFP Adjunto à 11ª Vara da Fazenda Pública - Servidor"
And tela PROCESSO
And informo campo NUMERO "<NÚMERO>"
And informo campo NOME DA PARTE "<NOME DA PARTE>"
And seleciono combo ESTADO "<ESTADO>"
And seleciono combo LOCAL DE PESQUISA "<LOCAL DE PESQUISA>"
And seleciono combo CLASSE "<CLASSE>"
When clico botao LIMPAR
Then verifico campo NUMERO vazio
And verifico campo NOME DA PARTE vazio
And verifico combo ESTADO vazio
And verifico combo LOCAL DE PESQUISA vazio
And verifico combo CLASSE vazio

Examples:
|	NÚMERO                        |   NOME DA PARTE                             |   ESTADO                |   LOCAL DE PESQUISA               |   CLASSE                                |
|	9002185-97.2017.8.21.0001     |   Câmara Municipal de Santa Cruz Do Sul     |   Concluso              |   Na Atuação                      |   Procedimento do Juizado Especial Cível|