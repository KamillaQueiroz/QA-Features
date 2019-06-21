#Author: Sheila Lopes
#Date: 06/09/2017
#Keywords Summary : Cancelar, Custas, Pendente, Parcelamento
#Feature: CancelarCustasPendenteComParcelamento
#Description: Essa feature tem o objetivo de validar o cancelamento de custas pendente com
#parcelamento.

@Funcionalidade
Feature: Cancelar Custas Pendente com Parcelamento
  Como usuário de perfil SERVIDOR
  Com atuação de COMARCA DE PORTO ALEGRE - VFP

  Background:
    Given acesso site eThemis
    Given uso processo basico VFP
    Given altero propriedade dto "classe" "Procedimento Ordinário"
    And altero propriedade dto "tipoPedido" "Outros"
    And altero propriedade dto "assunto" "Multas e demais Sanções"
    And altero propriedade dto "atuacao" "Porto Alegre - 1ª Vara da Fazenda Pública"
    And altero propriedade dto "perfilUsuario" "Distribuidor"
    And crio processo pelo servico PPE
    And acesso eThemis
    And seleciono combo HOME ATUACAO
    When seleciono combo HOME COMPETENCIA "VFP"
    When efetuo zoneamento do processo em validacao
    And clico aba DADOS COMPLEMENTARES
    And seleciono combo DADOS COMPLEMENTARES - TIPO DISTRIBUICAO "Sorteio"
    And clico aba FINALIZACAO
    And clico botao FINALIZAR
    And pesquiso comarca
    And deslogo eThemis
    Given efetuo login eThemis "et1g-servidor"
    Given acesso tela PROCESSO
    And seleciono combo HOME ATUACAO
    And informo campo NUMERO "<NUMERO>"
    When clico botao PESQUISAR
    When clico botao Verificar Providências

  @ManterCustas  @Done 
  Scenario: CANCELAR CUSTAS PENDENTE COM PARCELAMENTO
    And clico botao CUSTAS
    And clico botao NOVAS CUSTAS
    And seleciono combo Tipo de Custas "Custas Iniciais"
    And seleciono pagante combo PAGANTE
    And clico botao ADICIONAR
    And informo campo PARCELAS "2"
    And clico botao GERAR CUSTAS
    When clico botao SAIR
    Then visualizo parcelas no rodapé da grid de custas "Ver 1 - 2 de 2"
    Given valido campo SITUACAO "Pendente"
    And valido campo PARCELA "1 de 2"
    When clico ícone Excluir da coluna Ações
    And visualizo mensagem de exclusão custa com parcelamento: "Ao excluir esta guia também serão excluídas 1 guias que estão relacionadas a ela. Confirma a exclusão?"
    And clico botao OK na modal Excluir Custas
    Then valido campo SITUACAO "Cancelada"
    And valido campo PARCELA "1 de 2"

  @ManterCustas  @Done 
  Scenario: CANCELAR CUSTAS PENDENTE COM PARCELAMENTO COM RATEIO
    And clico botao CUSTAS
    And clico botao NOVAS CUSTAS
    And seleciono combo Tipo de Custas "Custas Iniciais"
    And seleciono pagante combo PAGANTE
    And clico botao ADICIONAR
    And informo campo RATEIO "50"
    And informo campo PARCELAS "2"
    And seleciono segundo pagante combo Pagante
    And clico botao ADICIONAR
    And informo campo RATEIO segundo pagante "50"
    And informo campo PARCELAS segundo pagante "3"
    And clico botao GERAR CUSTAS
    When clico botao SAIR
    Then  visualizo parcelas no rodapé da grid de custas "Ver 1 - 5 de 5"
    Given valido campo SITUACAO "Pendente"
    And valido campo PARCELA "1 de 2"
    And clico ícone Excluir da coluna Ações
    And visualizo mensagem de exclusão custa com parcelamento: "Ao excluir esta guia também serão excluídas 4 guias que estão relacionadas a ela. Confirma a exclusão?"
    When clico botao OK na modal Excluir Custas
    Then valido campo SITUACAO "Cancelada"

  @ManterCustas  @Done 
  Scenario: Cancelar Custas Pendente Com Rateio
    And clico botao CUSTAS
    And clico botao NOVAS CUSTAS
    And seleciono combo Tipo de Custas "Custas Iniciais"
    And seleciono pagante combo PAGANTE
    And clico botao ADICIONAR
    And informo campo RATEIO "50"
    And seleciono segundo pagante combo Pagante
    And clico botao ADICIONAR
    And informo campo RATEIO segundo pagante "50"
    And clico botao GERAR CUSTAS
    When clico botao SAIR
    Then visualizo parcelas no rodapé da grid de custas "Ver 1 - 2 de 2"
    Given valido campo SITUACAO "Pendente"
    And valido campo PARCELA "1 de 1"
    And clico ícone Excluir da coluna Ações
    And visualizo mensagem de exclusão custa com parcelamento: "Ao excluir esta guia também serão excluídas 1 guias que estão relacionadas a ela. Confirma a exclusão?"
    When clico botao OK na modal Excluir Custas
    Then valido campo SITUACAO "Cancelada"
    Then valido campo SITUACAO "Cancelada" segundo pagante

  @ManterCustas  @Done 
  Scenario: CANCELAR CUSTAS PENDENTE SEM PARCELAMENTO SEM RATEIO
    And clico botao CUSTAS
    And clico botao NOVAS CUSTAS
    And seleciono combo Tipo de Custas "Custas Iniciais"
    And seleciono pagante combo PAGANTE
    And clico botao ADICIONAR
    And clico botao GERAR CUSTAS
    When clico botao SAIR
    Then  visualizo parcelas no rodapé da grid de custas "Ver 1 - 1 de 1"
    Given valido campo SITUACAO "Pendente"
    And valido campo PARCELA "1 de 1"
    And clico ícone Excluir da coluna Ações
    And modal Excluir Custas é exibida com a mensagem: Confirma a exclusão da guia "Numero Guia" ? e os botões OK e Cancelar
    When clico botao OK na modal Excluir Custas
    Given valido campo SITUACAO "Cancelada"
    And valido campo PARCELA "1 de 1"

  @ManterCustas  @Done 
  Scenario: CANCELAR GUIA ABERTA COM PARCELAMENTO
    And clico botao CUSTAS
    And clico botao NOVAS CUSTAS
    And seleciono combo Tipo de Custas "Custas Iniciais"
    And seleciono pagante combo PAGANTE
    And clico botao ADICIONAR
    And informo campo PARCELAS "2"
    And clico botao EMITIR GUIA
    And clico botão OK  na modal Emitir Guia
    Then  visualizo parcelas no rodapé da grid de custas "Ver 1 - 2 de 2"
    Given valido campo SITUACAO "Aberta"
    And valido campo PARCELA "1 de 2"
    And clico ícone Excluir da coluna Ações
    And visualizo mensagem de exclusão custa com parcelamento: "Ao excluir esta guia também serão excluídas 1 guias que estão relacionadas a ela. Confirma a exclusão?"
    When clico botao OK na modal Excluir Custas
    Then valido campo SITUACAO "Cancelada"
    And valido campo PARCELA "1 de 2"
 
  @ManterCustas  @Done 
  Scenario: Cancelar Guia Aberta Com Parcelamento Com Rateio
    And clico botao CUSTAS
    And clico botao NOVAS CUSTAS
    And seleciono combo Tipo de Custas "Custas Iniciais"
    And seleciono pagante combo PAGANTE
    And clico botao ADICIONAR
    And informo campo RATEIO "50"
    And informo campo PARCELAS "2"
    And seleciono segundo pagante combo Pagante
    And clico botao ADICIONAR
    And informo campo RATEIO segundo pagante "50"
    And informo campo PARCELAS segundo pagante "2"
    And clico botao EMITIR GUIA
    When clico botão OK  na modal Emitir Guia
    Then visualizo parcelas no rodapé da grid de custas "Ver 1 - 4 de 4"
    Given valido campo SITUACAO "Aberta"
    And valido campo PARCELA "1 de 2"
    And clico ícone Excluir da coluna Ações
    And visualizo mensagem de exclusão custa com parcelamento: "Ao excluir esta guia também serão excluídas 3 guias que estão relacionadas a ela. Confirma a exclusão?"
    When clico botao OK na modal Excluir Custas
    Then valido campo SITUACAO "Cancelada"
    And valido segundo pagante campo SITUACAO "Cancelada"


  @ManterCustas  @Done 
  Scenario: CANCELAR GUIA ABERTA COM RATEIO
    And clico botao CUSTAS
    And clico botao NOVAS CUSTAS
    And seleciono combo Tipo de Custas "Custas Iniciais"
    And seleciono pagante combo PAGANTE
    And clico botao ADICIONAR
    And informo campo RATEIO "50"
    And seleciono segundo pagante combo Pagante
    And clico botao ADICIONAR
    And informo campo RATEIO segundo pagante "50"
    And clico botao EMITIR GUIA
    When clico botão OK  na modal Emitir Guia
    Then visualizo parcelas no rodapé da grid de custas "Ver 1 - 2 de 2"
    Given valido campo SITUACAO "Aberta"
    And valido campo PARCELA "1 de 1"
    And clico ícone Excluir da coluna Ações
    And visualizo mensagem de exclusão custa com parcelamento: "Ao excluir esta guia também serão excluídas 1 guias que estão relacionadas a ela. Confirma a exclusão?"
    When clico botao OK na modal Excluir Custas
    Then valido campo SITUACAO "Cancelada"
    And valido segundo pagante campo SITUACAO "Cancelada"

  @ManterCustas  @Done
  Scenario: CANCELAR GUIA ABERTA SEM PARCELAMENTO SEM RATEIO
    And clico botao CUSTAS
    And clico botao NOVAS CUSTAS
    And seleciono combo Tipo de Custas "Custas Iniciais"
    And seleciono pagante combo PAGANTE
    And clico botao ADICIONAR
    And clico botao EMITIR GUIA
    When clico botão OK  na modal Emitir Guia
    Then visualizo parcelas no rodapé da grid de custas "Ver 1 - 1 de 1"
    Given valido campo SITUACAO "Aberta"
    And valido campo PARCELA "1 de 1"
    And clico ícone Excluir da coluna Ações
    Then modal Excluir Custas é exibida com mensagem de confirmação de exlusão: "Confirma a exclusão da guia " <Numero Guia> "? Ok Cancelar"
    When clico botao OK na modal Excluir Custas
    Then valido campo SITUACAO "Cancelada"
    And valido campo PARCELA "1 de 1"
