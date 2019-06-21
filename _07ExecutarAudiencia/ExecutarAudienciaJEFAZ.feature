@Funcionalidade
Feature: Execução de Audiências JEFAZ
Processo no status Concluso

#Background: Crio processo PPE com status Concluso
#		Given acesso site eThemis
    #Given uso processo basico JEFAZ
    #Given altero propriedade dto "classe" "Procedimento do Juizado Especial Cível"
    #And altero propriedade dto "tipoPedido" "Servidor Público Civil"
    #And altero propriedade dto "assunto" "Regime Estatutário :: Competência do Juizado Especial da Fazenda Pública Estadual"
    #And altero propriedade dto "atuacao" "Porto Alegre - 1º Juizado Especial da Fazenda Pública"
    #And altero propriedade dto "tipoDistribuicao" "Dependência"
    #And altero propriedade dto "numeroProcessoDependencia" "90009843620188210001"
    #And altero propriedade dto "perfilUsuario" "Distribuidor"
    #And crio processo pelo servico PPE
    #And acesso eThemis
    #And seleciono combo HOME ATUACAO "Porto Alegre - Foro Central - Distribuidor"
    #When seleciono combo HOME COMPETENCIA "JEFAZ"
    #When efetuo zoneamento do processo em validacao
    #And clico aba DADOS COMPLEMENTARES
    #And clico aba FINALIZACAO
    #And clico botao FINALIZAR
    #And deslogo site eThemis
    #And pesquiso comarca
    #Then exibo processo e comarca
       
   
@Desenvolvimento
Scenario: Realizo Julgamento com perfil Masgistrado
		Given acesso site eThemis
		Given efetuo login eThemis "et1g-magistrado"	
		Given seleciono combo HOME ATUACAO "Porto Alegre - 1º Juizado Especial da Fazenda Pública - Juizado 2 - Magistrado"
	  When acesso tela CARTORIO
	  Then preencho numero processo "90009860620188210001"
	  And clico botao pesquisar
	  And clico em julgar processo
	 


Scenario: Cria Nova Audência em Verificar Providências
	  Given clico botao Nova Audiência 
    Given exibida tela Informações Nova Audiência
    And seleciono Tipo audiência "Conciliação"
    And informo data nova audência "19" "Abril" "2018"
    And informo hora nova audência "1800"
    Then clico botao Salvar Nova Audiêcnia
    Given executo clico botao executar audiencia 

