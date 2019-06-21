#Author: your.email@your.domain.com
#Keywords Summary :
#Feature: List of scenarios.
#Scenario: Business rule through list of steps with arguments.
#Given: Some precondition step
#When: Some key actions
#Then: To observe outcomes or validation
#And,But: To enumerate more Given,When,Then steps
#Scenario Outline: List of steps for data-driven as an Examples and <placeholder>
#Examples: Container for s table
#Background: List of steps run before each of the scenarios
#""" (Doc Strings)
#| (Data Tables)
#@ (Tags/Labels):To group Scenarios 
#<> (placeholder)
#""
## (Comments)

#Sample Feature Definition Template
@tag
Feature: Adicionano de Outro Participante

@basico
Scenario Outline: Acessar modal ASSOCIAR PARTE AO PROCESSO - OUTROS PARTICIPANTES
Given acesso eThemis USUARIO "et1g-servidor" SENHA "12345678"
And crio novo processo HOME ATUACAO "Comarca de Porto Alegre - 10º Juizado Especial Cível"
And preencho aba CLASSIFICACAO CLASSE "Procedimento do Juizado Especial Cível" TIPO PEDIDO "Acidente de Trânsito – Reparação de Danos" ASSUNTO "Indenização por Dano Material :: Acidente de Trânsito - 11319"
When clico aba PARTES
And clico botao OUTROS
Then verifico modal ASSOCIAR PARTE AO PROCESSO
And verifico combo TIPO DE PARTICIPACAO "<tipoParticipacao>"
And verifico radio TIPO DE PESSOA FISICA
And verifico check EXIBIR NA PAUTA DE AUDIENCIA

Examples:
	|	tipoParticipacao	|
	|	Testemunha			|

@basico
Scenario Outline: Preencher aba IDENTIFICACAO
When marco radio TIPO DE PESSOA FISICA
And preencho campo NOME "<nome>"
And seleciono combo SEXO "<sexo>"
And preencho campo CPF "<cpf>"
And preencho campo RG "<rg>"
And seleciono combo UF RG "<ufRg>"
And seleciono combo ESTADO CIVIL "<estadoCivil>"
And seleciono combo PROFISSAO "<profissao>"
And preencho campo DATA "<data>"

Examples:
	|	nome		|	sexo		|	cpf			|	rg			|	ufRg				|	estadoCivil	|	profissao	|	data	|
	|	AutoName2	|	Feminino	|	00339635096	|	12345678	|	Rio Grande do Sul	|	Solteiro	|	Advogado	|	null	|

@basico
Scenario Outline: Preencher aba ENDERECOS
When clico aba ENDERECOS
And seleciono combo ENDERECO PAIS "<pais>"
And preencho campo CEP "<cep>"
And preencho campo ENDERECO NUMERO "<numero>"
And seleciono combo TIPO DE ENDERECO "<tipoEndereco>"
And clico botao ADICIONAR ENDERECO
Then verifico inclusao GRID ENDEREÇOS "<endereco>"

Examples:
	|	pais	|	cep			|	numero	|	tipoEndereco	|
	|	Brasil	|	90660110	|	2222	|	Comercial		|

@basico
Scenario Outline: Preencher aba CONTATOS - TELEFONE
When clico aba CONTATOS
And seleciono combo TIPO "<tipo>"
And preencho campo DDD "<ddd>"
And preencho campo TELEFONE NUMERO "<numero>"
And preencho campo COMPLEMENTO "<complemento>"
And clico botao ADICIONAR TELEFONE
Then verifico inclusao GRID TELEFONES

Examples:
	|	tipo	|	ddd	|	numero		|	complemento	|
	|	Celular	|	51	|	999999999	|	Cel			|

@basico
Scenario Outline: Preencher aba CONTATOS - EMAIL
When preencho campo EMAIL "<email>"
And clico botao ADICIONAR EMAIL
Then verifico GRID EMAILS

Examples:
	|	email			|
	|	teste@test.com	|

@basico
Scenario Outline: Preencher aba ADVOGADOS
When clico aba ADVOGADOS
And preecho campo NUMERO DA OAB "<numeroOAB>"
And seleciono combo ADVOGADO UF "<advogadoUf>"
And clico botao PESQUISAR ADVOGADO
And seleciono combo TIPO ADVOGADO "<tipoAdvogado>"
And clico botao ADICIONAR ADVOGADO
Then verifico GRID ADVOGADOS

Examples:
	|	numeroOAB	|	advogadoUf			|	tipoAdvogado	|
	|	123456		|	Rio Grande do Sul	|	Advogado		|

@basico
Scenario: adicionar PARTE
When clico botao FINALIZAR PARTE
Then verifico GRID PARTES

@fluxo
Scenario Outline: adicionar Outro Participante
Given acesso eThemis USUARIO "et1g-servidor" SENHA "12345678"
And crio novo processo HOME ATUACAO "Comarca de Porto Alegre - 10º Juizado Especial Cível"
And preencho aba CLASSIFICACAO CLASSE "Procedimento do Juizado Especial Cível" TIPO PEDIDO "Acidente de Trânsito – Reparação de Danos" ASSUNTO "Indenização por Dano Material :: Acidente de Trânsito - 11319"
When adiciono OUTRO PARTICIPANTE "<nome>", "<sexo>", "<cpf>", "<rg>", "<ufRg>", "<estadoCivil>", "<profissao>", "<data>", "<pais>", "<cep>", "<numeroEndereco>", "<tipoEndereco>", "<tipo>", "<ddd>", "<numeroTelefone>", "<email>", "<numeroOAB>", "<advogadoUf>", "<tipoAdvogado>"
Then verifico GRID PARTES

Examples:
	|	nome		|	sexo		|	cpf			|	rg			|	ufRg				|	estadoCivil		|	profissao	|	data	|	pais	|	cep			|	numeroEndereco	|	tipoEndereco	|	tipo	|	ddd	|	numeroTelefone	|	email			|	numeroOAB	|	advogadoUf				|	tipoAdvogado	|
	|	AutoName2	|	Feminino	|	00339635096	|	12345678	|	Rio Grande do Sul	|	Solteiro		|	Advogado	|	null	|	Brasil	|	90660110	|	2222			|	Comercial		|	Celular	|	51	|	999999999		|	teste@test.com	|	123456		|	Rio Grande do Sul		|	Advogado		|