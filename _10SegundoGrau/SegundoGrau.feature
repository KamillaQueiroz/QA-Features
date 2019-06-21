#Author: Martina Santos
#Date: xx/xx/2017
#Keywords Summary:
#Feature: SegundoGrau
#Description:

@Funcionalidade
Feature: Envio para segundo grau
  Ter acessado aplicação como SERVIDOR
  Ter executado PesquisaProcesso, @scenario Pesquisa Processo por Estado

  @Scenario1 @estadoVERIFICARPROVIDENCIA
  Scenario Outline: Manter Providencias - Enviar processo para segundo grau
    Given acesso tela MANTER PROVIDENCIAS
    When seleciono combo ACAO/ENCAMINHAR PARA "<encaminhar>"
    And clico botao FINALIZAR
    And verifico modal ENCAMINHAR PARA SEGUNDO GRAU
    And clico combo CLASSES "<classes>"
    And verifico grid PARTICIPANTES PARA O SEGUNDO GRAU
    And seleciono combo TIPO PARTICIPACAO "<tipoparticipacao>"
    And seleciono combo TIPO PARTICIPACAO "<tipoparticipacao>"
    And clico botao ENCAMINHAR
    Then visualizo mensagem ENCAMINHAR PARA SEGUNDO GRAU
    And clico botao OK
    And visualizo mensagem FINALIZAÇÃO

    Examples:
      | encaminhar   | classes           | tipoparticipacao | tipoparticipacao |
      | segundo grau | recurso inonimado | recorrido        | recorrente       |

#Ponrto de Verificação, validar que ao acionar botão FINALIZAR, sistema valide que ambas as partes tenham ao menos um Advogado cadastrado
#Ponto de Verificação, devo garantir que o processo foi encaminhado para o segundo grau.


  @Scenario2 @estadoSEGUNDOGRAU
  Scenario: Localizar ano e numero de protocolo
    Given acesso tela MANTER PROVIDENCIAS
    And clico botao EDITAR PROCESSO
    And visualizo tela PROCESSO
    When clico aba SEGUNDO GRAU
    Then visualizo DADOS SEGUNDO GRAU
    And localizo ANO PROTOCOLO
    And localizo PROTOCOLO "<protocolo>"

#******** Ver com a Vanessa como essas informações serão recebidas na automação
#Ponto de Verificação, validar que ao localizar o ano e protocolo do envio de segundo grau estes dados estejam corretos.


  @Scenario3 @soap
  Scenario Outline: Executar metodo retornaDadosInicialTR
    Given executo soupui - metodo retornaDadosInicialTR
    And informo LOGIN "<login>"
    And informo SENHA "<senha>"
    And informo ANO PROTOCOLO "<anoprotocolo>"
    And informo PROTOCOLO "<protocolo>"
    When submeto metodo
    Then visualizo mensagem retorno

    Examples:
      | login     | senha    | anoprotocolo | protocolo |
      | acessoTJP | x3a9aaep | 2017         | 63843     |

#**** validar com vanessa possibilidade de automatizar acesso e processo via soap
#Ponto de Verificação, devo garantir que no retorno do método devem ser exibidas somente as partes que foram enviadas para segundo e com suas informações


  @Scenario4 @soap
  Scenario Outline: Executar metodo informaProcessamentoInicial
    Given acesso soupui - metodo informaProcessamentoInicial
    And informo LOGIN "<login>"
    And informo SENHA "<senha>"
    And informo ANO PROTOCOLO "<anoprotocolo>"
    And informo PROTOCOLO "<protocolo>"
    When submeto metodo
    Then visualizo mensagem de retorno do metodo

    Examples:
      | login     | senha    | anoprotocolo | protocolo |
      | acessoTJP | x3a9aaep | 2017         | 31020     |

#******** Ver com a Vanessa como essas informações serão recebidas na automação
#Ponto de Verificação, no soupui devo validar mensagem de sucesso
#Ponto de Verificação, garantir que no sistema ethemis ao editar processo na aba 'Segundo Grau' deverá ser exibido no histórico informação sobre o processamento, nesse momento o protocolo é consumido pelo TJP e é exibida mensagem Enviado para Segundo Grau


  @Scenario5 @soap
  Scenario Outline: Executar metodo retornaListaInicial
    Given acesso soupui - metodo retornaListaInicial
    And informo LOGIN "<login>"
    And informo SENHA "<senha>"
    When executo metodo
    Then visualizo mensagem de retorno do metodo

    Examples:
      | login     | senha    |
      | acessoTJP | x3a9aaep |

#******** Ver com a Vanessa como essas informações serão recebidas na automação
#Ponto de Verificação, garantir que no retorno do método não deve constar o número do protocolo


  @Scenario6 @soap
  Scenario Outline: Executar metodo retornaDadosInicialTR
    Given acesso soup - metodo retornaDadosInicialTR
    And informo LOGIN "<login>"
    And informo SENHA "<senha>"
    And informo ANO PROTOCOLO "<anoprotocolo>"
    And informo NUMERO PROTOCOLO "<numeroprotocolo>"
    When submeter metodo
    Then visualizo mensagem de retorno do metodo

    Examples:
      | login     | senha    | amoprotocolo | numeroprotocolo |
      | acessoTJP | x3a9aaep | 2017         | 63843           |

#******** Ver com a Vanessa como essas informações serão recebidas na automação
#Ponto de Verificação, garantir que após submeter o método o retorno seja de sucesso.


  @Scenario7 @soap
  Scenario Outline: Executar metodo  informaDistribuicaoInicialET1G
    Given acesso soup - metodo informaDistribuicaoInicialET1G
    And informo LOGIN "<login>"
    And informo SENHA "<senha>"
    And informo ANO PROTOCOLO "<anoprotocolo>"
    And informo NUMERO PROTOCOLO "<numeroprotocolo>"
    And informo IDDOCUMENTO "<iddocumento>"
    When submeto metodo
    Then visualizo mensagem de retorno do metodo

    Examples:
      | login     | senha    | anoprotocolo | protocolo | iddocumento |
      | acessoTJP | x3a9aaep | 2017         | 63843     | 6288993     |

#******** Ver com a Vanessa como essas informações serão recebidas na automação
#Ponto de Verificação, garantir que na edição do processo, na aba 'Segundo Grau' deve constar no histórico informação da distribuição de segundo grau


  @Scenario8 @soap
  Scenario Outline: Executar metodo solicitaDiligenciaET1G
    Given acesso soup - metodo solicitaDiligenciaET1G
    And informo LOGIN "<login>"
    And informo SENHA "<senha>"
    And informo ANO PROTOCOLO "<anoprotocolo>"
    And informo PROTOCOLO "<protocolo>"
    And informo SEQDOCUMENTO "<seqdocumento>"
    And informo IDDOCUMENTO "<iddocumento>"
    And informo IDTIPODOCUMENTO "<idtipodocumento>"
    And informo NOMEDOCUMENTO "<nomedocumento>"
    And informo DESCDOCUMENTO "<descdocumento>"
    When submeto metodo
    Then visualizo mensagem de retorno do metodo

    Examples:
      | login     | senha    | anoprotocolo | protocolo | seqdocumento | iddocumento | idtipodocumento | nomedocumento    | descdocumento |
      | acessoTJP | x3a9aaep | 2017         | 63843     | 0            | 6288993     | 111             | Termo de Retorno | qualquer      |

#******** Ver com a Vanessa como essas informações serão recebidas na automação
#Ponto de Verificação, garantir que após a execução do metodo o processo foi para o estado verificar providencias
#Ponto de Verificação, garantir que o processo foi para pasta Segundo Grau > Diligencia
#Ponto de Verificação, garantir que foi gerado documento e data de incio da diligência

  @Scenario9 @soap
  Scenario: Enviar novamente processo para segundo grau
    Given tela MANTER PROVIDENCIAS
    And seleciono combo ACAO/ENCAMINHAR PARA
    And clico botao FINALIZAR
    And verifico modal RETORNA PARA SEGUNDO GRAU
    When clico BOTAO OK
    Then visualizo TELA PESQUISA

#******** Ver com a Vanessa como essas informações serão recebidas na automação
#Ponto de Verificação, garantir que o processo foi enviado novamente para o segundo grau
#Ponto de Verificação, garantir que a tela ENCAMINHAR PARA SEGUNDO GRAU não será exibida
#Ponto de Verificação, garantir que o termo de diligência foi gerado
#Ponto de Verificação, garantir que passa para o estado SEGUNDO GRAU
#Ponto de Verificação, garantir que encontra-se na pasta AGUARDANDO > SEGUNDO GRAU
#Ponto de Verificação, garantir que na edição do processo > aba segundo grau > grud sanfonada Diligência > registro da diligência DATA DE FIM


  @Scenario10 @soap
  Scenario Outline: Executar metodo retornaListaDiligenciaTR
    Given acesso soup - metodo retornaListaDiligenciaTR
    And informo LOGIN "<login>"
    And informo SENHA "<senha>"
    When clico no botao SUBMIT
    And submeto o metodo
    Then visualizo retorno apos executar metodo

    Examples:
      | login     | senha    |
      | acessoTJP | x3a9aaep |

#******** Ver com a Vanessa como essas informações serão recebidas na automação
#Ponto de Verificação, garantir retorno com sucesso após executar método
#Ponto de Verificação, garantir que o número do protocolo retornou para lista


  @Scenario11 @soap
  Scenario Outline: Executar o metodo informaProcessamentoDiligencia
    Given acesso soup - metodo informaProcessamentoDiligencia
    And informo LOGIN "<login>"
    And informo SENHA "<senha>"
    And informo ANO PROTOCOLO "<anoprotocolo>"
    And informo NUMERO PROTOCOLO "<numeroprotocolo>"
    When clico no botao SUBMIT
    And submeto o metodo
    Then visualizo retorno apos executar metodo

    Examples:
      | login     | senha    | anoprotocolo | numeroprotocolo |
      | acessoTJP | x3a9aaep | 2017         | 63843           |

#******** Ver com a Vanessa como essas informações serão recebidas na automação
#Ponto de Verificação, garantir mensagem de sucesso após a execução do método no soup.
#Ponto de Verificação, garantir foi gerado o documento termo retorno para segundo grau no sistema ethemis.


  @Scenario12 @soap
  Scenario Outline: Executar o metodo retornaListaDiligenciaTR
    Given acesso soup - metodo retornaListaDiligenciaTR
    And informo LOGIN "<login>"
    And informo SENHA "<senha>"
    When clico no botao SUBMIT
    And submeto o metodo
    Then visualizo retorno apos executar metodo

    Examples:
      | login     | senha    |
      | acessoTJP | x3a9aaep |

#******** Ver com a Vanessa como essas informações serão recebidas na automação
#Ponto de Verificação, garantir que no retorno do soup não conste o número do protocolo, pois ele deve ter sido consumido


