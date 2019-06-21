@Funcionalidade
Feature: Manter Processo - Cadastro Advogados Aba Partes
Como usuário de perfil SERVIDOR
Com atuação de COMARCA DE PORTO ALEGRE - JEFP / JEC / VFP
Ter executado cenário de CadastroProcesso
Ter executado cenário de PesquisaProcesso
Processo com Estado 'Em Cadastramento'

Scenario Outline: Associar Advogado
 Given executo Scenario Editar Processo
 When visualizo página MANTER PROCESSO 1G
 And aciono aba PARTES
 And identifico grid PARTES
 And identifico parte POLO ATIVO
 And aciono botão EDITAR
 And identifo modal ASSOCIAR PARTE AO PROCESSO
 And aciono aba ADVOGADOS
 And informo campo NUMERO OAB '<numerooab>'
 And informo campo UF '<ufadvogado>'
 And informo campo CPF '<cpfadvogado>'
 And aciono botão PESQUISAR
 And visualizo area DADOS ADVOGADOS
 And informo campo TIPO '<tipo>'
 And informo campo ABRANGÊNCIA DA PARTICIPAÇÃO '<abrangencia>'
 And aciono botão ADICIONAR
 Then visualizo grid ADVOGADOS

Examples:
  | numerooab     |  ufadvogado     |  cpfadvogado           |  tipo      | abrangencia     |
  | 666           |  BA             |  695.821.220-72        |  Advogado  | Processo        |

#Ponto de Verificação, validar que ao informar valores válidos para os campos NUMERO OAB, UF e CPF e caso haja cadastro associado, que seja corretamente preenchido os campos da área DADOS ADVOGADO
#Ponto de Verificação, validar que seja corretamente incluso na grid ADVOGADOS as informações apresentadas na área DADOS ADVOGADO

Scenario Outline: Cadastrar Advogado
  Given executo Scenario Editar Processo
  When visualizo página MANTER PROCESSO 1G
  And aciono aba PARTES
  And identifico grid PARTES
  And identifico parte POLO ATIVO
  And aciono botão EDITAR
  And identifo modal ASSOCIAR PARTE AO PROCESSO
  And aciono aba ADVOGADOS
  And informo campo NUMERO OAB '<numerooab>'
  And informo campo UF '<ufadvogado>'
  And informo campo CPF '<cpfadvogado>'
  And aciono botão PESQUISAR
  And visualizo area DADOS ADVOGADOS
  And informo campo NUMERO OAB '<numerooab>'
  And informo campo UF '<ufadvogado>'
  And informo campo NOME '<nomeadvogado>'
  And informo campo CPF '<cpfadvogado>'
  And informo campo TIPO '<tipo>'
  And informo campo ABRANGÊNCIA DA PARTICIPAÇÃO '<abrangencia>'
  And aciono botão ADICIONAR
  Then visualizo grid ADVOGADOS

Examples:
  | numerooab     |  ufadvogado     |  cpfadvogado           |  nomeadvogado      |   tipo       | abrangencia     |
  | 345           |  BA             |  4.032.894-40          |  Advogado 001      |   Advogado   | Processo        |

#Ponto de Verificação, validar que ao informar valores inválidos para os campos NUMERO OAB, UF e CPF e caso não haja cadastro associado, que seja os campos da área DADOS ADVOGADO permaneçam em branco
#Ponto de Verificação, validar que seja exibido mensagem informando que Advogado não está cadastrado no sistema 'Advogado não cadastrado no sistema corporativo do Tribunal de Justiça. Informe o nome completo e o CPF para cadastro no eThemis'
#Ponto de Verificação, validar que seja corretamente incluso na grid ADVOGADOS as informações apresentadas na área DADOS ADVOGADO



Scenario Outline: Associar Sociedade de Advogados
  Given executo Scenario Cadastrar Advogado
  When aciono radio-button SOCIEDADE DE ADVOGADOS
  And informo campo NUMERO OAB '<numerooab>'
  And informo campo UF '<ufadvogado>'
  And informo campo CNPJ '<cnpjsociedade>'
  And aciono botão PESQUISAR
  And visualizo aba IDENTIFICAÇÃO
  And visualizo aba ENDEREÇOS
  And visualizo aba CONTATOS
  And aciono botão ADICIONAR
  Then visualizo grid ADVOGADOS

Examples:
  | numerooab     |  ufadvogado     |  cnpjsociedade            |
  | --            |  --             |  --                       |

#Ponto de Verificação, validar que ao informar valores válidos para os campos NUMERO OAB, UF e CNPJ e caso haja cadastro associado, que seja corretamente preenchido os campos das abas IDENTIFICAÇÃO, ENDEREÇOOS e  CONTATOS
#Ponto de Verificação, validar que seja corretamente incluso na grid ADVOGADOS as informações apresentadas acerca da SOCIEDADE DE ADVOGADOS

Scenario Outline: Cadastrar Sociedade de Advogados
  Given executo Scenario Cadastrar Advogado
  When aciono radio-button SOCIEDADE DE ADVOGADOS
  And informo campo NUMERO OAB '<numerooab>'
  And informo campo UF '<ufadvogado>'
  And informo campo CNPJ '<cnpjsociedade>'
  And aciono botão PESQUISAR
  And visualizo aba IDENTIFICAÇÃO
  And visualizo aba ENDEREÇOS
  And visualizo aba CONTATOS
  And aciono aba IDENTIFICAÇÃO
  And informo campo NUMERO DA OAB '<numerooab>'
  And informo campo RAZAO SOCIAL '<razaosocial>'
  And informo campo CNPJ '<cnpjsociedade>'
  And informo campo DATA DE FUNDAÇÃO '<datafundacao>'
  And informo campo EMAIL '<email>'
  And aciono aba ENDEREÇOS
  And informo campo CEP '<cep>'
  And informo campo TIPO DE LOGRADOURO '<tipologradouro>'
  And informo campo LOGRADOURO '<logradouro>'
  And infomor campo BAIRRO '<bairro>'
  And informo campo NUMERO '<numero>'
  And informo campo TIPO DE ENDEREÇO '<tipoendereco>'
  And aciono botão ADICIONAR ENDEREÇO
  And aciono aba CONTATOS
  And informo campo TIPO '<tipocontato>'
  And informo campo DDD '<ddd>"
  And informo campo NÚMERO '<numerotelefone>'
  And aciono botão ADICIONAR CONTATO
  And aciono botão ADICIONAR
  Then visualizo grid ADVOGADOS

Examples:
  | numerooab     |  ufadvogado     |  cnpjsociedade           |  razaosocial       | datafundacao      | email     | cep       | tipologradouro        | logradouro      | bairro      | numero      | tipoendereco      | tipocontato     | ddd     | numerotelefone      |
  | --            |  --             |  --                      |                    |                   |           |           |                       |                 |             |             |                   |                 |         |                     |

#Ponto de Verificação, validar que ao informar valores válidos para os campos NUMERO OAB, UF e CNPJ e caso não haja cadastro associado, que seja os campos da área dos dados permaneçam em branco
#Ponto de Verificação, validar que seja exibido mensagem informando que a Assodiação de Advogados não está cadastrado no sistema 'Erro ao consultar dados OAB juridica. [CTJ-1025] Pessoa juridica inexistente no cadastro.'
#Ponto de Verificação, validar que seja corretamente incluso na grid ADVOGADOS as informações apresentadas acerca da SOCIEDADE DE ADVOGADOS