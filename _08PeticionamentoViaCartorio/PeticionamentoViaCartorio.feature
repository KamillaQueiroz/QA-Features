@Funcionalidade
Feature: Cadastro Peticionamento Via Cartório
  Como usuário de perfil SERVIDOR
   
    @Done @PeticionamentoViaCartorioCadastroProcessoDTO
    Scenario: Cadastro de Peticionamento Via Cartório com cadastro de processo
 		Given acesso site eThemis
    Given uso processo basico JEFAZ
    And altero propriedade dto "perfilUsuario" "Servidor"
    And altero propriedade dto "atuacao" "Santo Cristo - Juizado Especial da Fazenda Pública"
    And altero propriedade dto "classe" "Procedimento do Juizado Especial Cível"
    And altero propriedade dto "tipoPedido" "Servidor Público Civil"
    And altero propriedade dto "assunto" "Aposentadoria :: Compulsória - 13472"
    And altero propriedade dto "providenciaCartorio" "true"
    Given crio processo JEFAZ
    And seleciono combo HOME ATUACAO "Santo Cristo - Juizado Especial da Fazenda Pública"
	  Given acesso tela CARTORIO
	  And preencho numero processo "<NUMERO>"
	  And clico botao pesquisar
	  Then clico botao Peticonamento via Cartorio 
	  Given seleciono Tipo Peticao "Termo de Manifestação da Parte"
	  And seleciono Parte Peticionante "<PARTE>"
	  And clico botao Redigir Documento
	  And salvo documento redigido 
	  And clico em Ok confimacao documento redigido
	  Then clico em OK na mensagem 'Petição gerada com sucesso! Ao clicar em OK, você será redirecionado para o cartório.' 
	  Given clico no botao Finalizar peticionamento
	  Then clico botao Ok mensagem Petição finalizada com sucesso
      
	  @Done @PeticionamentoViaCartorio 
	  Scenario: Cadastro de Peticionamento Via Cartório com processo já cadastrado
	  Given acesso site eThemis
	  Given efetuo login eThemis "et1g-servidor"
	  Given acesso tela PROCESSO
	  And seleciono combo HOME ATUACAO "Santo Cristo - Juizado Especial da Fazenda Pública"
	  Given acesso tela CARTORIO
	  And preencho numero processo "90000024120188210124"
	  And clico botao pesquisar
	  Then clico botao Peticonamento via Cartorio 
	  Given seleciono Tipo Peticao "Termo de Manifestação da Parte"
	  And seleciono Parte Peticionante "Ativo UOOqXRj87y"
	  And clico botao Redigir Documento
	  And salvo documento redigido 
	  And clico em Ok confimacao documento redigido
	  Then clico em OK na mensagem 'Petição gerada com sucesso! Ao clicar em OK, você será redirecionado para o cartório.' 
	  Given clico no botao Finalizar peticionamento
	  Then clico botao Ok mensagem Petição finalizada com sucesso
  
  