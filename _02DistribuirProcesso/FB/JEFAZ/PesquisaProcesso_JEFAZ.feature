@Funcionalidade
Feature: Pesquisa de Processo
  Como usuário de perfil SERVIDOR
  Com atuação de COMARCA DE PORTO ALEGRE - JEFP
  Tendo executado cenário Login.feature

  @Scenario
  Scenario: Pesquisa Processo Simples
    Given acesso eThemis "et1g-servidor"
    And seleciono combo HOME ATUACAO "Comarca de Porto Alegre - 10ª Vara da Fazenda Pública - Servidor"
    And tela PROCESSO
    When clico botao PESQUISAR
    Then verifico resultado PESQUISA COMARCA "Comarca de Porto Alegre" VARA "10ª Vara da Fazenda Pública" NUMERO "" NOME DA PARTE "" ESTADO "[Todos]" LOCAL DE PESQUISA "Na Atuação" CLASSE "[Todas]" NAO EXIBIR BAIXADOS "true"

  @Scenario2
  Scenario Outline: Pesquisa Processo por Número Processo
    Given tela PROCESSO
    And informo campo NUMERO "<NÚMERO>"
    When clico botao PESQUISAR
    Then verifico resultado PESQUISA COMARCA "Comarca de Porto Alegre" VARA "10ª Vara da Fazenda Pública" NUMERO "<NUMERO>" NOME DA PARTE "" ESTADO "[Todos]" LOCAL DE PESQUISA "Na Atuação" CLASSE "[Todas]" NAO EXIBIR BAIXADOS "true"

    Examples:
      | NÚMERO                    |
      | 9002106-21.2017.8.21.0001 |
      | 9002022-20.2017.8.21.0001 |
      | 9001480-02.2017.8.21.0001 |

  @Scenario3
  Scenario Outline: Pesquisa Processo por Nome da Parte
    Given tela PROCESSO
    And informo campo NOME DA PARTE "<NOME DA PARTE>"
    When clico botao PESQUISAR
    Then verifico resultado PESQUISA COMARCA "Comarca de Porto Alegre" VARA "10ª Vara da Fazenda Pública" NUMERO "" NOME DA PARTE "<NOME DA PARTE>" ESTADO "[Todos]" LOCAL DE PESQUISA "Na Atuação" CLASSE "[Todas]" NAO EXIBIR BAIXADOS "true"

    Examples:
      | NOME DA PARTE                                             |
      | MP/RS - Ministério Público do Estado do Rio Grande do Sul |
      | Ativo KdTdK6CnD6                                          |
      | Ativo Lg0XRwbUXL                                          |

  @Scenario4
  Scenario Outline: Pesquisa Processo por Estado
    Given tela PROCESSO
    And seleciono combo ESTADO "<ESTADO>"
    When clico botao PESQUISAR
    Then verifico resultado PESQUISA COMARCA "Comarca de Porto Alegre" VARA "10ª Vara da Fazenda Pública" NUMERO "" NOME DA PARTE "" ESTADO "<ESTADO>" LOCAL DE PESQUISA "Na Atuação" CLASSE "[Todas]" NAO EXIBIR BAIXADOS "true"

    Examples:
      | ESTADO                 |
      | [Todos]                |
      | Aguardando Audiência   |
      | Apensado               |
      | Baixado                |
      | Concluso               |
      | Distribuído            |
      | Em cadastramento       |
      | Prazo                  |
      | Prazo Suspenso         |
      | Segundo Grau           |
      | Verificar Providências |

  @Scenario5
  Scenario Outline: Pesquisa Processo por Local de Pesquisa
    Given tela PROCESSO
    And seleciono combo LOCAL DE PESQUISA "<LOCAL DE PESQUISA>"
    When clico botao PESQUISAR
    Then verifico resultado PESQUISA COMARCA "Comarca de Porto Alegre" VARA "10ª Vara da Fazenda Pública" NUMERO "" NOME DA PARTE "" ESTADO "[Todos]" LOCAL DE PESQUISA "<LOCAL DE PESQUISA>" CLASSE "[Todas]" NAO EXIBIR BAIXADOS "true"

    Examples:
      | LOCAL DE PESQUISA |
      | Na Atuação        |
      | Na Comarca        |
      | Todas as Comarcas |

  @Scenari6
  Scenario Outline: Pesquisa Processo por Classe
    Given tela PROCESSO
    And seleciono combo CLASSE "<CLASSE>"
    When clico botao PESQUISAR
    Then verifico resultado PESQUISA COMARCA "Comarca de Porto Alegre" VARA "10ª Vara da Fazenda Pública" NUMERO "" NOME DA PARTE "" ESTADO "[Todos]" LOCAL DE PESQUISA "Na Atuação" CLASSE "<CLASSE>" NAO EXIBIR BAIXADOS "true"

    Examples:
      | CLASSE                                                 |
      | Carta Precatória                                       |
      | Incidente de Desconsideração de Personalidade Jurídica |
      | Procedimento do Juizado Especial Cível                 |

