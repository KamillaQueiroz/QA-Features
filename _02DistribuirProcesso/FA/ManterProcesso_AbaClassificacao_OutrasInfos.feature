@Funcionalidade
Feature: Manter Processo - Alterar Outras Informações Aba Classificação
Como usuário de perfil SERVIDOR
Com atuação de COMARCA DE PORTO ALEGRE - JEFP / JEC / VFP
Ter executado cenário de CadastroProcesso
Ter executado cenário de PesquisaProcesso
Processo com Estado 'Em Cadastramento'

Scenario Outline: Etiqueta PRIORIDADE
  Given executo Scenario Editar Processo
  When visualizo página MANTER PROCESSO 1G
  And visualizo área OUTRAS INFORMAÇÕES
  And assinalo campo '<outrasinformacoes>'
  And aciono botão SALVAR
  And retorno página PROCESSO
  Then identifico coluna ETIQUETAS
  And visualizo eiqueta PRIORIDADE
  And visualizo '<tooltip>'

  Examples:
    | outrasinformacoes                       | tooltip                     |
    | Parte com mais de 60 anos               | Idoso                       |
    | Doença Grave                            | Doença Grave                |
    | Pessoa com deficiência                  | Pessoa com deficiência      |
    | Criança ou adolescente                  | Criança ou adolescente      |
    | Pedido inicial com liminar              | -                           |
    | Segredo de Justiça                      | Segredo de Justiça          |

#Ponto de Verificação, validar que a etiqueta de PIORIDADE seja aplicada e esteja visivel na coluna Etiquetas.
#Ponto de Verificação, validar que o tooltip exibido esteja de acordo com o valor informado no campo OUTRAS INFORMAÇÕES

Scenario Outline: Etiqueta SEGREDO
  Given executo Scenario Editar Processo
  When visualizo página MANTER PROCESSO 1G
  And visualizo área OUTRAS INFORMAÇÕES
  And assinalo campo '<outrasinformacoes>'
  And aciono botão SALVAR
  And retorno página PROCESSO
  Then identifico coluna ETIQUETAS
  And visualizo eiqueta SEGREDO
  And visualizo '<tooltip>'

 Examples:
   | outrasinformacoes                       | tooltip                     |
   | Segredo de Justiça                      | Segredo de Justiça          |

#Ponto de Verificação, validar que a etiqueta de SEGREDO seja aplicada e esteja visivel na coluna Etiquetas.
#Ponto de Verificação, validar que o tooltip exibido esteja de acordo com o valor informado no campo OUTRAS INFORMAÇÕES

Scenario Outline: Sem Etiqueta
  Given executo Scenario Editar Processo
  When visualizo página MANTER PROCESSO 1G
  And visualizo área OUTRAS INFORMAÇÕES
  And assinalo campo '<outrasinformacoes>'
  And aciono botão SALVAR
  And retorno página PROCESSO
  Then identifico coluna ETIQUETAS

  Examples:
    | outrasinformacoes                       |
    | Pedido inicial com liminar              |

#Ponto de Verificação, validar que não foi aplicado nenhuma etiqueta.