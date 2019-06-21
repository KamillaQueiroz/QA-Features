#Author: Sheila Lopes
#Date: 14/08/2017
#Keywords Summary : Custas Iniciais, Pagante, Parcelas, Gerar Custas
#Feature: AlterarPaganteNroParcelasCustas
#Description: Essa feature tem a finalidade de validar a alteração do pagante e o número de parcelas
#das custas.

@Funcionalidade
Feature: Alterar Pagante e Nro Parcelas Custas
  Como usuário de perfil SERVIDOR
  Com atuação de COMARCA DE PORTO ALEGRE - VFP

#	Background:
#		Given acesso site eThemis
#	  Given uso processo basico VFP
#	  Given altero propriedade dto "classe" "Procedimento Ordinário"
#	  And altero propriedade dto "tipoPedido" "Outros"
#	  And altero propriedade dto "assunto" "Multas e demais Sanções"
#	  And altero propriedade dto "atuacao" "Porto Alegre - 11ª Vara da Fazenda Pública"
#	  And altero propriedade dto "perfilUsuario" "Distribuidor"
#	  And crio processo pelo servico PPE
#	  And acesso eThemis
#	  And seleciono combo HOME ATUACAO
#	  When seleciono combo HOME COMPETENCIA "VFP"
#	  When efetuo zoneamento do processo em validacao
#	  And clico aba DADOS COMPLEMENTARES
#	  And seleciono combo DADOS COMPLEMENTARES - TIPO DISTRIBUICAO "Sorteio"
#	  And clico aba FINALIZACAO
#	  And clico botao FINALIZAR
#	  And pesquiso comarca
#	  And deslogo eThemis
#	  Given efetuo login eThemis "et1g-servidor"
    #Given acesso tela PROCESSO
    #And seleciono combo HOME ATUACAO
    #And informo campo NUMERO "<NUMERO>"
    #When clico botao PESQUISAR
    #When clico botao Verificar Providências


  Background:
    Given acesso site eThemis
    Given uso processo basico VFP
    And altero propriedade dto "perfilUsuario" "Distribuidor"
    And seleciono combo HOME COMPETENCIA "VFP"
    And seleciono combo HOME ATUACAO "Porto Alegre - Foro Central - Distribuidor"
    And altero propriedade dto "classe" "Procedimento Ordinário"
    And altero propriedade dto "tipoPedido" "Indenização por Dano Material/Moral"
    And altero propriedade dto "assunto" "Responsabilidade da Administração :: Indenização por Dano Ambiental - 9994"
    Then crio processo VFP
    And pesquiso comarca
    And deslogo eThemis
    Given efetuo login eThemis "et1g-servidor"
    Given acesso tela PROCESSO
    And informo campo NUMERO "<NUMERO>"
    When clico botao PESQUISAR
    When clico botao Verificar Providências


  @Done @ManterCustas
  Scenario: Alterar Pagante e Número Parcelas
    Given clico botao CUSTAS
    Given clico botao NOVAS CUSTAS
    When seleciono combo Tipo de Custas "Custas Iniciais"
    And visualizo campo TOTAL
    And seleciono pagante combo PAGANTE
    And clico botao ADICIONAR
    And informo campo PARCELAS "5"
    And clico botao GERAR CUSTAS
    Then mensagem Custas geradas com sucesso é exibida
    Given coleto os dados informados
    When clico botao SAIR
    And valido no BANCO DE DADOS a guia gravada corretamente GUIA PAGA: "N", IMPRESSA: "N", PROPORCAO: "100", CODIGO TIPO CUSTAS: "700", QTD PARCELAS: "5", NRO PARCELA: "1", GUIA EMITIDA: "N"
    Then visualizo grid CUSTAS
    And valido campo TIPO "Custas"
    And valido campo DATA EMISSAO
    And valido campo PAGANTE GRID
    And valido campo AJG "Não"
    And valido campo Nº DA GUIA
    And valido campo PARCELA "1 de 5"
    And valido campo FINALIDADE "Custas Iniciais"
    And valido campo VALOR
    And valido campo SITUACAO "Pendente"
    And valido campo AÇÕES com botões Editar Custas, Emitir Guia, Excluir Custas
    And clico botao EDITAR CUSTAS
    And visualizo modal NOVO CALCULO DE CUSTAS
    And visualizo campo PAGANTE
    And visualizo campo POLO
    And visualizo campo RATEIO
    And visualizo campo PARCELAS GRID PAGANTE
    And visualizo campo ACOES
    And clico botao EXCLUIR PAGANTE
    Then campo PAGANTE RATEIO deixa de ser exibido
    And campo POLO deixa de ser exibido
    And campo RATEIO deixa de ser exibido
    And campo VALOR PARCELA deixa de ser exibido
    And campo PARCELAS deixa de ser exibido
    And campo TOTAL RATEIO deixa de ser exibido
    And campo TOTAL VALOR deixa de ser exibido
    And seleciono pagante combo PAGANTE
    And clico botao ADICIONAR
    And informo campo PARCELAS "2"
    And clico botao GERAR CUSTAS
    Then mensagem Custas geradas com sucesso é exibida
    When clico botao SAIR
    And valido no BANCO DE DADOS a guia gravada corretamente GUIA PAGA: "N", IMPRESSA: "N", PROPORCAO: "100", CODIGO TIPO CUSTAS: "700", QTD PARCELAS: "2", NRO PARCELA: "1", GUIA EMITIDA: "N"
    Then visualizo grid CUSTAS
    And valido campo TIPO "Custas"
    And valido campo DATA EMISSAO
    And valido campo PAGANTE GRID
    And valido campo AJG "Não"
    And valido campo Nº DA GUIA
    And valido campo PARCELA "1 de 2"
    And valido campo FINALIDADE "Custas Iniciais"
    And valido campo VALOR
    And valido campo SITUACAO "Pendente"
    And valido campo AÇÕES com botões Editar Custas, Emitir Guia, Excluir Custas
    
 

