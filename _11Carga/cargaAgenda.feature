@Funcionalidade
Feature: Carga de dados para Agenda

  Background: 
    Given acesso site eThemis

  @Done @Agenda @JEC
  Scenario Outline: Criação Agenda JEC
    Given preencho campo LOGIN SENHA "12345678"
    Given preencho campo LOGIN USUARIO "et1g-servidor"
    Given clico botao LOGIN ACESSAR
    Given seleciono combo HOME ATUACAO "<ATUACAO>"
    Given clico botao CONFIGURACAO AGENDA
    When clico botao NOVO AGENDA MES
    When seleciono combo MES AGENDA "<MES>"
    When informo DESCRICAO AGENDA "<DESCRICAO>"
    When seleciono combo TIPO AUDIENCIA AGENDA "<TIPO AUDIENCIA>"
    When informo HORARIO INICIAL AGENDA "<HORA INICIAL>"
    When informo HORARIO FINAL AGENDA "<HORA FINAL>"
    When informo DURACAO AUDIENCIA AGENDA "<DURACAO>"
    When informo QUANTIDADE AUDIENCIA AGENDA "<QUANTIDADE>"
    When seleciono DIA DOMINGO AGENDA
    When seleciono DIA SEGUNDA AGENDA
    When seleciono DIA TERCA AGENDA
    When seleciono DIA QUARTA AGENDA
    When seleciono DIA QUINTA AGENDA
    When seleciono DIA SEXTA AGENDA
    When seleciono DIA SABADO AGENDA
    When informo DESCRICAO AGENDA "<DESCRICAO>"
    When clico botao ADICIONA AGENDA
    Then valido cadatro de Agenda com a mensagem de sucesso "Registro gravado com sucesso"

    Examples: 
      | ATUACAO                       | MES   | TIPO AUDIENCIA | HORA INICIAL | HORA FINAL | DURACAO | QUANTIDADE | DESCRICAO             |
      | Gramado - Vara adjunta do JEC | Abril | Conciliação    |         0800 |       1800 |    0030 |         10 | carga de dados Agenda |

  @Done @AgendaDTO @JEC
  Scenario Outline: Criação agenda DTO básica Mês JEC
    Given uso agenda basica MES
    Given altero propriedade dto "atuacao" "<ATUACAO>"
    Given altero propriedade dto "mes" "<MES>"
    Given altero propriedade dto "perfilUsuario" "Servidor"
    Given altero propriedade dto "tipoAudiencia" "<TIPO AUDIENCIA>"
    Given altero propriedade dto "horarioInicial" "<HORA INICIAL>"
    Given altero propriedade dto "horarioFinal" "<HORA FINAL>"
    Given altero propriedade dto "duracao" "<DURACAO>"
    Given altero propriedade dto "quantidade" "<QUANTIDADE>"
    Given altero propriedade dto "segunda" "true"
    Given altero propriedade dto "terca" "true"
    Given altero propriedade dto "quarta" "true"
    When efetuo criacao AGENDA
    Then valido cadatro de Agenda com a mensagem de sucesso "Registro gravado com sucesso"

    Examples: 
      | ATUACAO                | MES   | TIPO AUDIENCIA | HORA INICIAL | HORA FINAL | DURACAO | QUANTIDADE | DESCRICAO    |
      | Gravataí - Vara do JEC | Abril | Conciliação    |         0800 |       1800 |    0100 |         10 | carga de dados Agenda |
