#Author: Sheila Lopes
#Date: 06/10/2017
#Keywords Summary : Novas Custas, Tipo Custas, Custas Finais
#Feature: CadastrarCustasFinais
#Description: Essa feature tem o objetivo de validar o cadastro de custas finais.


@Funcionalidade
Feature: Cadastrar Custas Finais
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

  @Done @ManterCustas 
  Scenario: Cadastrar Custas Finais
    When clico botao CUSTAS
    Given clico botao NOVAS CUSTAS
    When seleciono combo Tipo de Custas "Custas Finais"
    And seleciono pagante combo PAGANTE
    And valido campo DESCRICAO "Taxa Única de Serviços Judiciais (Lei 14.634/14)"
    And visualizo checkbox PROPORCAO
    And visualizo checkbox EM DOBRO
    And seleciono pagante combo PAGANTE
    And clico botao ADICIONAR
    And clico botao EMITIR GUIA
    And clico botão OK  na modal Emitir Guia
    And valido campo TIPO "Guia"
    And valido campo FINALIDADE "Custas Finais"
    And valido campo SITUACAO "Aberta"
