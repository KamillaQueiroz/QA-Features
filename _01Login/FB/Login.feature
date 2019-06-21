@tag
Feature: Logar no site eThemis1G usando perfis validos

@basico
Scenario: Acessar eThemis como Servidor
Given acesso site eThemis
When preencho campo LOGIN USUARIO "et1g-servidor"
And preencho campo LOGIN SENHA "12345678"
And clico botao LOGIN ACESSAR
Then verifico pagina ATUAL "manterprocesso1gsel"

@basico
Scenario: Acessar eThemis como Contador
Given acesso site eThemis
When preencho campo LOGIN USUARIO "et1g-contador"
And preencho campo LOGIN SENHA "12345678"
And clico botao LOGIN ACESSAR
Then verifico pagina ATUAL "contadoriasel"

@basico
Scenario: Acessar eThemis como Contador URCA
Given acesso site eThemis
When preencho campo LOGIN USUARIO "et1g-contador-urca"
And preencho campo LOGIN SENHA "12345678"
And clico botao LOGIN ACESSAR
Then verifico pagina ATUAL "contadoriasel"

@basico
Scenario: Acessar eThemis como Administrador
Given acesso site eThemis
When preencho campo LOGIN USUARIO "et1g-administrador"
And preencho campo LOGIN SENHA "12345678"
And clico botao LOGIN ACESSAR
Then verifico pagina ATUAL "manterprocesso1gsel"

@basico
Scenario: Acessar eThemis como Distribuidor
Given acesso site eThemis
When preencho campo LOGIN USUARIO "et1g-distribuidor"
And preencho campo LOGIN SENHA "12345678"
And clico botao LOGIN ACESSAR
Then verifico pagina ATUAL "manterprocesso1gsel"

@basico
Scenario: Acessar eThemis como Estagiario
Given acesso site eThemis
When preencho campo LOGIN USUARIO "et1g-estagiario"
And preencho campo LOGIN SENHA "12345678"
And clico botao LOGIN ACESSAR
Then verifico pagina ATUAL "manterprocesso1gsel"

@basico
Scenario: Acessar eThemis como Leigo
Given acesso site eThemis
When preencho campo LOGIN USUARIO "et1g-leigo"
And preencho campo LOGIN SENHA "12345678"
And clico botao LOGIN ACESSAR
Then verifico pagina ATUAL "processoaudienciasel"

@basico
Scenario: Acessar eThemis como Magistrado
Given acesso site eThemis
When preencho campo LOGIN USUARIO "et1g-magistrado"
And preencho campo LOGIN SENHA "12345678"
And clico botao LOGIN ACESSAR
Then verifico pagina ATUAL "mantermodulodecisaosel"

@basico
Scenario: Acessar eThemis como Assessor
Given acesso site eThemis
When preencho campo LOGIN USUARIO "et1g-assessor"
And preencho campo LOGIN SENHA "12345678"
And clico botao LOGIN ACESSAR
Then verifico pagina ATUAL "mantermodulodecisaosel"
