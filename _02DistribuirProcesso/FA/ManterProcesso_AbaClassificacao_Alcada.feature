@Funcionalidade
Feature: Manter Processo - Alterar Valor Alçada Aba Classificação
Como usuário de perfil SERVIDOR
Com atuação de COMARCA DE PORTO ALEGRE - JEFP / JEC / VFP
Ter executado cenário de CadastroProcesso
Ter executado cenário de PesquisaProcesso
Processo com Estado 'Em Cadastramento'

Scenario: Campo Valor Ação Preenchimento Valor Alçada
  Given executo Scenario Editar Processo
  When visualizo página MANTER PROCESSO 1G
  And visualizo área VALOR DA ACAO
  And assinalo campo '<valordealcada>'
  And aciono botão SALVAR
  Then visualizo campo VALOR DA ACAO

#Ponto de Verificação, validar que o campo VALOR DA AÇÃO é preenchido automaticamente quando o campo VALOR DA ALÇADA é acionado.
#Ponto de Verificação, validar que o valor informado em tela, reflete na tabela PROCESSO, campo VL_ACAO

Scenario Outline: Campo Valor Ação Com Preenchimento
  Given executo Scenario Editar Processo
  When visualizo página MANTER PROCESSO 1G
  And visualizo área VALOR DA ACAO
  And desmarco campo '<valordealcada>'
  And informo campo VALOR DA AÇÃO '<valordaacao>'
  And aciono botão SALVAR
  Then visualizo campo VALOR DA ACAO

#Ponto de Verificação, validar que o campo VALOR DA AÇÃO deixa de apresentar valor automaticamente quando o campo VALOR DA ALÇADA é desmarcado.
#Ponto de Verificação, validar que o valor informado no campo VALOR DA AÇÃO e em tela, reflete na tabela PROCESSO, campo VL_ACAO

  Examples:
    | valordaacao       |
    | 10.000,00         |

Scenario: Campo Valor Ação Sem Preenchimento
  Given executo Scenario Editar Processo
  When visualizo página MANTER PROCESSO 1G
  And visualizo área VALOR DA ACAO
  And desmarco campo '<valordealcada>'
  And aciono botão SALVAR
  Then visualizo campo VALOR DA ACAO
  And visualizo aba FINALIZAÇÃO

#Ponto de Verificação, validar que o campo VALOR DA AÇÃO deixa de apresentar valor automaticamente quando o campo VALOR DA ALÇADA é desmarcado.
# Ponto de Verificação, validar que o valor informado no campo VALOR DA AÇÃO e em tela, reflete na tabela PROCESSO, campo VL_ACAO
#Ponto de Verificação, validar que na aba FINALIZAÇÃO seja exibida informação que o campo VALOR DA AÇÃO não foi informado