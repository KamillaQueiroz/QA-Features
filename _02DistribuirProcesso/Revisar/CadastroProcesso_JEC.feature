
@Funcionalidade
Feature: Cadastro de Processo
Como usuário de perfil SERVIDOR
Com atuação de COMARCA DE PORTO ALEGRE - JEC

Background:
Given acesso eThemis USUARIO "et1g-servidor" SENHA "12345678"
And crio novo processo HOME ATUACAO "Comarca de Porto Alegre - 4º Juizado Especial Cível"
And preencho aba CLASSIFICACAO CLASSE "Procedimento do Juizado Especial Cível" TIPO PEDIDO "Acidente de Trânsito – Reparação de Danos" ASSUNTO "Indenização por Dano Material :: Acidente de Trânsito - 11319"
And preencho aba FATO-PEDIDO FATO "fato do processo" PEDIDO "pedido do processo"
And adiciono POLO ATIVO "AutoName", "Feminino", "00339635096", "12345678", "Rio Grande do Sul", "Mestrado", "Solteiro", "Advogado", "Joao", "Maria", "null", "Brasil", "RS", "Porto Alegre", "Brasil", "90660110", "2222", "Comercial", "Celular", "51", "999999999", "teste@test.com", "123456", "Rio Grande do Sul", "Advogado"
And adiciono POLO PASSIVO "AutoName2", "Feminino", "00339635096", "12345678", "Rio Grande do Sul", "Mestrado", "Solteiro", "Advogado", "Joao", "Maria", "null", "Brasil", "RS", "Porto Alegre", "Brasil", "90660110", "2222", "Comercial", "Celular", "51", "999999999", "teste@test.com", "123456", "Rio Grande do Sul", "Advogado"
#And preencho aba DADOS  COMPLEMENTARES

@basico
Scenario: salvar PROCESSO
When clico botao SALVAR
Then verifico BANCO DE DADOS