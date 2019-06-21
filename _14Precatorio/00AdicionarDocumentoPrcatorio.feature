@Funcionalidade
Feature: Adicionar Novo Documento Prcatorio
  Como usuário de perfil SERVIDOR (et1g-servidor)
  Com atuação de COMARCA DE PORTO ALEGRE - VFP (Vara da Fazenda Pública)
  Possuir processos no estado Verificar Providências
  Possuir uma parte passiva como PESSOA JURÍDICA ou ORGÃO PÚBLICO

  @Scenario1
  Scenario Outline: Adicionar Documento (EASY)
    Given visualizo tela VERIFICAR PROVIDÊNCIAS DO PROCESSO
    When aciono botao NOVO DOCUMENTO
    And aciono opção OUTROS DOCUMENTOS
    And seleciono opção REQUISIÇÃO DE PAGAMENTO - PRECATÓRIO
    And aciono botão AVANÇAR
    And seleciono BENEFICIARIO '<beneficiario>'
    And preencho campo VALOR '<valor>'
    And preencho campo DATA NASCIMENTO '<datanascimento>'
    And seleciono CREDOR PREFERENCIAL '<credopreferencial>'
    And seleciono NATUREZA DO CRÉDITO '<naturezacredito>'
    And seleciono ESPECIE DE REQUISIÇÃO '<especierequiscao>'
    And preencho campo Nº PRECATÓRIO ANTERIOR '<precatorioanterior>'
    And preencho campo OBJETO DA AÇÃO INICIAL '<objetoacao>'
    And preencho campo DATA BASE DO CÁLCULO '<datacalculo>'
    And preencho campo DATA DO AJUIZAMENTO DO PROCESSO DE CONHECIMENTO '<dataajuizamento>'
    And preencho campo Nº DE FOLHA DOS AUTOS COM CERTIDÃO DA INTIMAÇÃO DO CÁLCULO PELO DEVEDOR '<numerofolha>'
    And preencho campo DSTA DO TRANSITO EM JULGADO DA SENTENÇA OU ACORDÃO(Processo de Conhecimento) '<dt_transito_julgado>'
    And aciono botão AVANÇAR
    And visualize MODELO GERADO
    And aciono botão AVANÇAR
    And acione botão ENCAMINHAR DOCUMENTO PARA O MAGISTRADO
    Then visualizo mensagem de encaminhando

  Examples:
  | beneficiario    | valor           | datanascimento  | credopreferencial | naturezacredito | especierequiscao  | precatorioanterior  | objetoacao      | datacalculo     | dataajuizamento | numerofolha     | dt_transito_julgado   |
  | *INLCUIR VALOR* | *INLCUIR VALOR* | *INLCUIR VALOR* | *INLCUIR VALOR*   | *INLCUIR VALOR* | *INLCUIR VALOR*   | *INLCUIR VALOR*     | *INLCUIR VALOR* | *INLCUIR VALOR* | *INLCUIR VALOR* | *INLCUIR VALOR* | *INLCUIR VALOR*       |

#Ponto de verificação:
# (1) Validar que seja gerado e disponibilizado na grid DOCUMENTOS um novo documento do tipo REQUISIÇÃO DE PAGAMENTO;
# (2) Validar que o SUBTOTOAL 1 - BENEFICIÁRIO apresente valores corretos, de acordo com o informado;

  @Scenario2
  Scenario Outline: Adicionar Documento (HARD)
    Given visualizo tela VERIFICAR PROVIDÊNCIAS DO PROCESSO
    When aciono botao NOVO DOCUMENTO
    And aciono opção OUTROS DOCUMENTOS
    And seleciono opção REQUISIÇÃO DE PAGAMENTO - PRECATÓRIO
    And aciono botão AVANÇAR
    And seleciono BENEFICIARIO '<beneficiario>'
    And preencho campo VALOR '<valor>'
    And preencho campo DATA NASCIMENTO '<datanascimento>'
    And seleciono CREDOR PREFERENCIAL '<credopreferencial>'
    And seleciono NATUREZA DO CRÉDITO '<naturezacredito>'
    And seleciono ESPECIE DE REQUISIÇÃO '<especierequiscao>'
    And preencho campo Nº PRECATÓRIO ANTERIOR '<precatorioanterior>'
    And preencho campo OBJETO DA AÇÃO INICIAL '<objetoacao>'

     And seleciono PARTICPANTE HONORÁRIOS DE SUCUMBENCIA '<participantehonorarios_advocaticios>'
     And preenhco campo VALOR HONORÁRIOS DE SUCUMBENCIA '<valorhonorarios_advocaticios>'

     And seleciono PARTICPANTE HONORÁRIOS CONTRATUAIS '<participantehonorarios_contratuais>'
     And preenhco campo VALOR HONORÁRIOS CONTRATUAIS '<valorhonorarios_contratuais>'

     And seleciono PARTICPANTE HONORÁRIOS PERICIAIS '<participantehonorarios_periciais>'
     And preenhco campo VALOR HONORÁRIOS PERICIAIS '<valorhonorarios_periciais>'

     And seleciono TAXAS '<taxas>'
     And seleciono PARTICIPANTE TAXAS '<participantetaxas>'
     And preencho VALOR TAXAS '<valortaxas>'

     And seleciono PARTICIPANTE ESCRIVÃO '<participanteescrivao>'
     And preencho VALOR ESCRIVÃO '<valorescrivao>'

     And seleciono PARTICIPANTE DISTRIBUIDOR '<participantedistribuidor>'
     And preencho VALOR DISTRIBUIDOR '<valordistribuidor>'

     And seleciono PARTICIPANTE CONTADOR '<participantedistribuidor>'
     And preencho VALOR CONTADOR '<valordistribuidor>'

    And preencho campo VALOR CUSTAS ESTATIZADAS PODER JUDICIARIO '<custaspoder_judiciario>'
    And preencho campo VALOR CUSTAS ESTATIZADAS FADEP '<custasfundo_judiciario>'

    And preencho campo DATA BASE DO CÁLCULO '<datacalculo>'
    And preencho campo DATA DO AJUIZAMENTO DO PROCESSO DE CONHECIMENTO '<dataajuizamento>'
    And preencho campo Nº DE FOLHA DOS AUTOS COM CERTIDÃO DA INTIMAÇÃO DO CÁLCULO PELO DEVEDOR '<numerofolha>'

    And preencho campo DATA DO TRANSITO EM JULGADO DA SENTENÇA OU ACORDÃO (Processo de Conhecimento) '<dt_transito_julgado>'

    And preencho campo DATA DO TRANSITO EM JULGADO DA SENTENÇA OU ACORDÃO (Embargos ou Impugnação) '<dt_transito_julgado_embargos'

    And aciono botão AVANÇAR
    And visualize MODELO GERADO
    And aciono botão AVANÇAR
    And acione botão ENCAMINHAR DOCUMENTO PARA O MAGISTRADO
    Then visualizo mensagem de encaminhando

  Examples:
  | beneficiario    | valor           | datanascimento  | credopreferencial | naturezacredito | especierequiscao  | precatorioanterior  | objetoacao      | participantehonorarios_advocaticios | valorhonorarios_advocaticios  | participantehonorarios_contratuais  | valorhonorarios_contratuais |  participantehonorarios_periciais | valorhonorarios_periciais | taxas           | participantetaxas | valortaxas      | participanteescrivao  | valorescrivao   | participantedistribuidor  |  valordistribuidor | custaspoder_judiciario | custasfundo_judiciario  | datacalculo     | dataajuizamento | numerofolha     | dt_transito_julgado   |
  | *INLCUIR VALOR* | *INLCUIR VALOR* | *INLCUIR VALOR* | *INLCUIR VALOR*   | *INLCUIR VALOR* | *INLCUIR VALOR*   | *INLCUIR VALOR*     | *INLCUIR VALOR* | *INLCUIR VALOR*                     | *INLCUIR VALOR*               | *INLCUIR VALOR*                     | *INLCUIR VALOR*             | *INLCUIR VALOR*                   | *INLCUIR VALOR*           | *INLCUIR VALOR* | *INLCUIR VALOR*   | *INLCUIR VALOR* | *INLCUIR VALOR*       | *INLCUIR VALOR* | *INLCUIR VALOR*           | *INLCUIR VALOR*    | *INLCUIR VALOR*        | *INLCUIR VALOR*         | *INLCUIR VALOR* | *INLCUIR VALOR* | *INLCUIR VALOR* | *INLCUIR VALOR*       |

#Ponto de verificação:
# (1) Validar que seja gerado e disponibilizado na grid DOCUMENTOS um novo documento do tipo REQUISIÇÃO DE PAGAMENTO;
# (2) Validar que o valor apresentado quanto ao SUBTOTOAL 1 - BENEFICIÁRIO esteja correto quanto aos valores informandos nos preenchimentos dos campos;
# (3) Validar que o valor apresentado quanto ao SUBTOTAL 2 - HONORÁRIOS esteja correto quanto aos valores informandos nos preenchimentos dos campos;
# (4) Validar que o valor apresentado quanto ao SUBTOTAL 3 - REEMBOLSO DE CUSTAS/DESPESAS esteja correto quanto aos valores informandos nos preenchimentos dos campos;
# (5) Validar que o valor apresentado quanto ao SUBTOTAL 4 - CUSTAS ESTATIZADAS A RECOLHER esteja correto quanto aos valores informandos nos preenchimentos dos campos;
# (6) Validar que o valor apresentado quanto ao SUBTOTAL - 5 - CUSTAS JUDICIAIS A PAGAR (SERVENTIAS PRIVATIZADAS) esteja correto quanto aos valores informandos nos preenchimentos dos campos;
# (7) Validar que o valor apresentado quanto ao VALOR TOTAL REQUISITADO esteja correto quanto a soma dos subtotais anteriores;
# (8) Validar que os valores informados estejam corretamente setados na base.

  ## 9025754-93.2018.8.21.0001
  ## Porto Alegre - 10ª Vara da Fazenda Pública - Juizado 1 - Dr. Eugenio Couto Terra
