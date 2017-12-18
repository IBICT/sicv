<%@page import="resources.Strings"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="Tela de Cadastro" />
        <meta name="keywords" content="HTML, CSS, JS, JavaScript, framework, bootstrap, front-end, frontend, web development" />
        <meta name="author" content="Deivdy William Silva" />

        <link rel="apple-touch-icon" sizes="57x57" href="<%=Strings.BASE%>/assets/images/favicon/apple-icon-57x57.png" />
        <link rel="apple-touch-icon" sizes="60x60" href="<%=Strings.BASE%>/assets/images/favicon/apple-icon-60x60.png" />
        <link rel="apple-touch-icon" sizes="72x72" href="<%=Strings.BASE%>/assets/images/favicon/apple-icon-72x72.png" />
        <link rel="apple-touch-icon" sizes="76x76" href="<%=Strings.BASE%>/assets/images/favicon/apple-icon-76x76.png" />
        <link rel="apple-touch-icon" sizes="114x114" href="<%=Strings.BASE%>/assets/images/favicon/apple-icon-114x114.png" />
        <link rel="apple-touch-icon" sizes="120x120" href="<%=Strings.BASE%>/assets/images/favicon/apple-icon-120x120.png" />
        <link rel="apple-touch-icon" sizes="144x144" href="<%=Strings.BASE%>/assets/images/favicon/apple-icon-144x144.png" />
        <link rel="apple-touch-icon" sizes="152x152" href="<%=Strings.BASE%>/assets/images/favicon/apple-icon-152x152.png" />
        <link rel="apple-touch-icon" sizes="180x180" href="<%=Strings.BASE%>/assets/images/favicon/apple-icon-180x180.png" />
        <link rel="icon" type="image/png" sizes="192x192" href="<%=Strings.BASE%>/assets/images/favicon/android-icon-192x192.png" />
        <link rel="icon" type="image/png" sizes="32x32" href="<%=Strings.BASE%>/assets/images/favicon/favicon-32x32.png" />
        <link rel="icon" type="image/png" sizes="96x96" href="<%=Strings.BASE%>/assets/images/favicon/favicon-96x96.png" />
        <link rel="icon" type="image/png" sizes="16x16" href="<%=Strings.BASE%>/assets/images/favicon/favicon-16x16.png" />
        <link rel="manifest" href="<%=Strings.BASE%>/assets/images/favicon/manifest.json" />
        <meta name="msapplication-TileColor" content="#ffffff" />
        <meta name="msapplication-TileImage" content="<%=Strings.BASE%>/assets/images/favicon/ms-icon-144x144.png" />
        <meta name="theme-color" content="#ffffff" />

        <title>SICV - ACV | Banco Nacional de Inventários dos inventários brasileiros do Ciclo de Vida (ICVs)</title>

        <!-- Bootstrap core CSS -->
        <link href="<%=Strings.BASE%>/assets/bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">

        <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
        <link href="<%=Strings.BASE%>/assets/bootstrap-3.3.7/css/ie10-viewport-bug-workaround.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <!-- <link href="<%=Strings.BASE%>/assets/bootstrap-3.3.7/css/signin.css" rel="stylesheet"> -->

        <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
        <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
        <script src="<%=Strings.BASE%>/assets/bootstrap-3.3.7/js/ie-emulation-modes-warning.js"></script>

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
        
    </head>

    <body>
		<div class="modal fade" id="modal-terms_SICV">
		  <div class="modal-dialog modal-lg" role="document">
		    <div class="modal-content">
		      <div class="modal-body">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		        <object type="application/pdf" data="documents/terms_SICV.pdf" width="100%" height="500" style="height: 85vh;">No Support</object>
		      </div>
		    </div><!-- /.modal-content -->
		  </div><!-- /.modal-dialog -->
		</div><!-- /.modal -->
		
		<div class="modal fade" id="modal-privacyPolicy_SICV">
		  <div class="modal-dialog modal-lg" role="document">
		    <div class="modal-content">
		      <div class="modal-body">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		        <object type="application/pdf" data="documents/privacyPolicy_SICV.pdf" width="100%" height="500" style="height: 85vh;">No Support</object>
		      </div>
		    </div><!-- /.modal-content -->
		  </div><!-- /.modal-dialog -->
		</div><!-- /.modal -->
		
		<jsp:include page="/WEB-INF/jsp/partials/nav.jsp"/>
		
		<div class="container">

            <h2>Formulário de registro de Usuário</h2>
            
            <form method="post" class="form-signin">

                <h3 class="form-signin-heading">Informações de Login</h3>
                
                <br />
                
                <input class="form-control" type="text" name="userName" placeholder="USUARIO" required="" /><br />

                <input class="form-control" type="email" name="email" placeholder="EMAIL" required="" /><br />
                <input class="form-control" type="password" name="senha" placeholder="SENHA" required="" /><br />
                <input class="form-control" type="password" placeholder="CONFIRMAR SENHA" required="" /><br />

                <h2 class="form-signin-heading">Informações pessoais</h2>
                
                <br />
                
                <select class="form-control" name="title">
                    <option>Por favor, selecione</option>
                    <option>Senhor</option>
                    <option>Senhora</option>
                    <option>Nao Informado</option>
                </select><br />
                <input class="form-control" type="text" name="firstName" placeholder="NOME" required="" /><br />
                <input class="form-control" type="text" name="lastName" placeholder="SOBRENOME" required="" /><br />
                <p>Sexo: </p>
                <label>Feminino</label> <input type="radio" name="gender" value="F" checked="checked" />
                <label>Masculino</label> <input type="radio" name="gender" value="M" /><br />
                <p>Pais: </p>
                <select class="form-control" name="country">
                    <option>Brasil</option>
                </select><br />

                <input class="form-control" type="text" name="jobPosition" placeholder="Profissão" /><br />
                <input class="form-control" type="text" name="telefone" placeholder="Telefone" /><br />
                <input class="form-control" type="text" name="instituicao" placeholder="Nome da instituição" /><br />

                <h2 class="form-signin-heading">Finalidade</h2>
                
                <br />

                <label>Profissional</label> <input type="radio" name="dsPurpose" value="1" />
                <label>Pesquisa</label> <input type="radio" name="dsPurpose" value="2" />
                <label>Educacional</label> <input type="radio" name="dsPurpose" value="3" />
                <label>Outra</label> <input type="radio" name="dsPurpose" /> <input type="text" /><br />

                <h2 class="form-signin-heading" >Termos de aceite</h2>
                <br />
                
                <a href="#" data-toggle="modal" data-target="#modal-terms_SICV">Termos de Uso</a><br />
                <a href="#" data-toggle="modal" data-target="#modal-privacyPolicy_SICV">Politica de Privacidade</a><br />
                
                <div class="col s4">
                    <input type="checkbox" id="termosAcima" required="required" />
                    <label for="termosAcima">Concordo com os termos acima.</label>
                </div>

                <input class="btn btn-lg btn-primary btn-block" type="submit" value="ENVIAR" /><br />
                <a href="<%=Strings.BASE%>" class="btn btn-lg btn-default btn-block">CANCELAR</a><br />
            </form>

        </div>
		
		<script type="application/javascript" src="<%=Strings.BASE%>assets/jquery-3.2.1.min.js"></script>
		<script type="application/javascript" src="<%=Strings.BASE%>assets/bootstrap-3.3.7/js/bootstrap.min.js"></script>
    </body>

</html>