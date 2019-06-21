@Funcionalidade
Feature: Pesquisa de Processo
Como usuário de perfil SERVIDOR
Com atuação de COMARCA DE PORTO ALEGRE - JEFP
Tendo executado cenário Login.feature

@Scenario1
Scenario Outline: Pesquisa sem resultado
Given acesso eThemis "et1g-servidor"
And seleciono combo HOME ATUACAO "Comarca de Porto Alegre - JEFP Adjunto à 11ª Vara da Fazenda Pública - Servidor"
And tela PROCESSO
And informo campo NUMERO "<NUMERO>"
And informo campo NOME DA PARTE "<NOME DA PARTE>"
And seleciono combo ESTADO "<ESTADO>"
And seleciono combo LOCAL DE PESQUISA "<LOCAL DE PESQUISA>"
And seleciono combo CLASSE "<CLASSE>"
When clico botao PESQUISAR
Then verifico alerta "Nenhum registro que atende aos critérios informados foi encontrado!"

Examples:
|	NUMERO                        |   NOME DA PARTE                             |   ESTADO                |   LOCAL DE PESQUISA               |   CLASSE																									|
|	9002185-97.2017.8.21.0001     |   Câmara Municipal de Santa Cruz Do Sul     |   Concluso              |   Na Atuação                      |   Incidente de Desconsideração de Personalidade Jurídica	|