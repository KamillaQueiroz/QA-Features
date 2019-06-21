@Funcionalidade
Feature: Pesquisa de Processo
Como usuário de perfil SERVIDOR
Com atuação de COMARCA DE PORTO ALEGRE - FP
Tendo executado cenário Login.feature

@Scenario1
Scenario: Pesquisa Processo Simples
Given acesso tela PROCESSO
When aciono botao PESQUISAR
Then verifico resultado PESQUISA

#Ponto de verificação, garantir que  a ação de pesquisar esteja retornando valores válidos e que a grid PROCESSOS seja corretamente incrementada

@Scenario2
Scenario Outline: Pesquisa Processo por Número Processo
Given acesso tela PROCESSO
And informo campo NÚMERO "<numero>"
When aciono botao PESQUISAR
Then verifico resultado PESQUISA

Examples:
|	numero                     |
|	9001154-42.2017.8.21.0001  |
|   9000708-39.2017.8.21.0001  |
|   9000174-95.2017.8.21.0001  |

#Ponto de verificação, garantir que o resultado da pesquisa, traga valores de acordo com o filtro informado

@Scenario3
Scenario Outline: Pesquisa Processo por Nome da Parte
Given acesso tela PROCESSO
And informo campo NOME DA PARTE '<nomeparte>"
When aciono botao PESQUISAR
Then verifico resultado PESQUISA

  Examples:
  |	nomeparte   |
  |  TST        |

#Ponto de verificação, garantir que o resultado da pesquisa, traga valores de acordo com o filtro informado

@Scenario4
Scenario Outline: Pesquisa Processo por Estado
Given acesso tela PROCESSO
And informo campo ESTADO "<estado>"
When aciono botao PESQUISAR
Then verifico resultado PESQUISA

Examples:
 |    estado                  |
 |    Aguardando Audiência    |
 |    Apensado                |
 |    Baixado                 |
 |    Concluso                |
 |    Distribuído             |
 |    Em cadastramento        |
 |    Prazo                   |
 |    Prazo Suspenso          |
 |    Segundo Grau            |
 |    Verificar Providências  |

#Ponto de verificação, garantir que o resultado da pesquisa, traga valores de acordo com o filtro informado

@Scenario5
Scenario Outline: Pesquisa Processo por Local de Pesquisa
Given acesso tela PROCESSO
And informo campo LOCAL DE PESQUISA "<localdepesquisa>"
When aciono botao PESQUISAR
Then verifico resultado PESQUISA

Examples:
 |    localdepesquisa   |
 |    Na Atuação        |
 |    Na Comarca        |
 |    Todas as Comarcas |

 #Ponto de verificação, garantir que o resultado da pesquisa, traga valores de acordo com o filtro informado

@Scenario6
Scenario Outline: Pesquisa Processo por Classe
Given acesso tela PROCESSO
And informo campo CLASSE '<classe>"
When aciono botao PESQUISAR
Then verifico resultado PESQUISA

Examples:
 |    classe                                                  |
 |    Ação Civil Pública                                      |
 |    Ação Popular                                            |
 |    Carta Precatória                                        |
 |    Cumprimento de sentença                                 |
 |    Cumprimento de sentença contra a Fazenda Pública        |
 |    Embargos de Terceiro                                    |
 |    Exibição de Documento ou Coisa                          |

 #Ponto de verificação, garantir que o resultado da pesquisa, traga valores de acordo com o filtro informado