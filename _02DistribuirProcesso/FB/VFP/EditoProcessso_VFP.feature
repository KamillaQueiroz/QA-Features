@Funcionalidade
Feature: Edição de Processo
  Como usuário de perfil DISTRIBUIDOR
  Com atuação de COMARCA DE PORTO ALEGRE - VFP
  Ter executado @Scenario4 da PesquisaProcesso_FP.feature
  Processo com Estado 'Em Cadastramento'

  Background:
    Given acesso site eThemis
    Given uso processo basico JEC

  Scenario: Editar Processo
    Given visualizo grid PROCESSOS
    And   visualizo campo ACOES
    When clico botao Editar Processo
    Then  visualizo tela MANTER PROCESSO 1G
    And   visualizo aba CLASSIFICACAO
    And   visualizo aba PARTES
    And   visualizo aba DOCUMENTOS
    And   visualizo aba DADOS COMPLEMENTARES
    And   visualizo aba AUDIENCIAS


  @Scenario1
  Scenario: Editar Processo
    Given realizo pesquisa eThemis
    When aciono ação EDITAR
    Then visualizo página  EDIÇÃO "manterprocesso1gman?id=xxxx"

#Ponto de verificação para validar que seja exibido tela de edição de acordo com o ID do processo editado
#No "manterprocesso1gman?id=xxxx" os 'XXXX são referentes ao valor do ID do processo

  @Scenario2
  Scenario Outline: Editar Processo - Alterar valores Aba Classificação
    Given página  EDIÇÃO "manterprocesso1gman?id=xxxx"
    When excluo ASSUNTO ASSOCIADO
    And altero campo CLASSE "<classe>"
    And altero campo TIPO DE PEDIDO "<tipodepedido>"
    And altero campo ASSUNTO "<assunto>"
    And aciono botão ADCIONAR
    And aciono botão SALVAR
    Then verifico mensagem "Registro gravado com sucesso"

    Examples:
      |	classe                   |   tipodepedido                            |   assunto                                                                         |
      | Procedimento Ordinário   |   Acidente do Trabalho - INSS             |   Benefícios em Espécie :: Aposentadoria por Invalidez Acidentária - 10567        |
      | Procedimento Ordinário   |   Indenização por Dano Material/Moral     |   Responsabilidade da Administração :: Indenização por Dano Ambiental - 9994      |
      | Mandado de Segurança     |   Acidente do Trabalho - INSS             |   Benefícios em Espécie :: Auxílio-Acidente (Art. 86) - 6107                      |

#Ponto de verificação para validar a ação de exclusão da grid Assuntos Associados
#Ponto de verificação para validar a inclusão de um novo valor a grid Assuntos Associados
#Ponto de verificação para validar a ação de salvar após as alterações

  @Scenario3
  Scenario Outline: Editar Processo - Alterar valores Aba Classificação II
    Given página  EDIÇÃO "manterprocesso1gman?id=xxxx"
    When altero campo CLASSE "<classe>"
    And altero campo TIPO DE PEDIDO "<tipodepedido>"
    And verifico mensagem CONFIRMAÇÃO
    And altero campo ASSUNTO "<assunto>"
    And aciono botão ADCIONAR
    And aciono botão SALVAR
    Then verifico mensagem "Registro gravado com sucesso"

    Examples:
      |	classe                   |   tipodepedido                            |   assunto                                                                         |
      | Procedimento Ordinário   |   Acidente do Trabalho - INSS             |   Benefícios em Espécie :: Aposentadoria por Invalidez Acidentária - 10567        |
      | Procedimento Ordinário   |   Indenização por Dano Material/Moral     |   Responsabilidade da Administração :: Indenização por Dano Ambiental - 9994      |
      | Mandado de Segurança     |   Acidente do Trabalho - INSS             |   Benefícios em Espécie :: Auxílio-Acidente (Art. 86) - 6107                      |

#Ponto de verificação para validar a ação de exclusão quando alterado tipo de pedido
#Ponto de verificação para validar a inclusão de um novo valor a grid Assuntos Associados
#Ponto de verificação para validar a ação de salvar após as alterações

  @Scenario4
  Scenario Outline: Editar Processo - Alterar valores Aba Partes POLO ATIVO
    Given pagina EDIÇÃO "manterprocesso1gman?id=xxxx"
    And aciono aba PARTES
    And identifico  Polo Ativo
    When aciono ação EDITAR
    And verifico página "Associar parte ao processo - Polo Ativo"
    And aciono aba INDETIFICAÇÃO
    And altero campo NOME "<nome>"
    And altero campo ESTADO CIVIL "<estadocivil>"
    And aciono botão FINALIZAR
    Then verifico mensagem "Registro gravado com sucesso"

    Examples:
      |     nome                        |     estadocivil   |
      |     TST-001-AlteraçãodeNome     |     Solteiro      |
      |     TST-002-AlteraçãodeNome     |     Solteiro      |

#Ponto de Verificação para validar que ao acionar edição de Polo Ativo, seja exibido tela correta
#Ponto de Verificação para validar a alteração de valores associados ao Polo Ativo é possivel
#Ponto de Verificação para validar que a alteração dos valores é salva com sucesso


  @Scenario5
  Scenario Outline: Editar Processo - Alterar valores Aba Partes POLO PASSIVO
    Given pagina EDIÇÃO "manterprocesso1gman?id=xxxx"
    And aciono aba PARTES
    And identifico  Polo Passivo
    When aciono ação EDITAR
    And verifico página "Associar parte ao processo - Polo Passivo"
    And aciono aba INDETIFICAÇÃO
    And altero campo NOME "<nome>"
    And altero campo ESTADO CIVIL "<profissao>"
    And aciono botão FINALIZAR
    Then verifico mensagem "Registro gravado com sucesso"

    Examples:
      |     nome                        |     profissao                 |
      |     TST-001-AlteraçãodeNome     |     Analista de sistemas      |
      |     TST-002-AlteraçãodeNome     |     Graçon                    |

#Ponto de Verificação para validar que ao acionar edição de Polo Passivo, seja exibido tela correta
#Ponto de Verificação para validar a alteração de valores associados ao Polo Passivo é possivel
#Ponto de Verificação para validar que a alteração dos valores é salva com sucesso

  @Scenario6
  Scenario: Editar Processo - Alterar valores aba Documentos-Múltiplos Documentos
    Given pagina EDIÇÃO "manterprocesso1gman?id=xxxx"
    And aciono aba DOCUMENTOS
    And clico aba MULTIPLOS DOCUMENTOS
    When aciono a ação SELECIONAR
    And seleciono o documento .PDF
    And aciono ação ADICIONAR
    Then verifico grid DOCUMENTO

#Ponto de Verificação para validar que um novo documento foi inserido com sucesso ao editar processo

  @Scenario7
  Scenario Outline: Editar Processo - Alterar valores aba Documentos-Único Documento
    Given pagina EDIÇÃO "manterprocesso1gman?id=xxxx"
    And aciono aba DOCUMENTOS
    And clico aba ÚNICO DOCUMENTO
    And aciono campo ARQUIVO
    And seleciono o documento .PDF
    And preencho campo TIPO DO DOCUMENTO '<tipodocumento>'
    And preencho campo POLO '<polo>'
    And preencho campo DESCRIÇÃO DO DOCUMENTO '<descricao>'
    When aciono a ação ADICIONAR
    Then verifico grid DOCUMENTO

    Examples:
      |     tipodocumento               |     polo                      |     descricao             |
      |     Ata                         |     Polo Ativo                |     Descrição teste 01    |
      |     Petição                     |     Polo Passivo              |     Descrição teste 02    |

#Ponto de Verificação para validar que um novo documento foi inserido com sucesso ao editar processo

  @Scenario8
  Scenario Outline: Editar Processo - Alterar valores aba Dados Complementares
    Given pagina EDIÇÃO "manterprocesso1gman?id=xxxx"
    And aciono aba DADOS COMPLEMENTARES
    When altero campo TIPO DE DISTRIBUIÇÃO '<tipodistribuicao>'
    And preencho campo NÚMERO '<numero>'
    Then valido campo VARA
    And valido campo JUIZADO
    And valido campo JUDICÂNCIA


    Examples:
      |     tipodistribuicao            |     numero                    |
      |     Dependência                 |                               |
      |     Dependência                 |                               |

#Ponto de Verificação para validar que ao alterar tipo de distribuição para DEPENDÊNCIA o campo Número seja exibido e habilitado
#Ponto de Verificação para validar que ao informar valor para o campo NÚMERO os campos Vara, Juizado e Judicância são corretamente preenchidos
#Ponto de Verificação para validar que seja possivel alterar informações da aba Dados complementares