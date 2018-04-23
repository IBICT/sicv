<%@page import="resources.Strings"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="Tela de Login" />
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
        <link href="<%=Strings.BASE%>/assets/css/login/index.css" rel="stylesheet">

        <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
        <!--[if lt IE 9]><script src="../../assets/bootstrap-3.3.7/js/ie8-responsive-file-warning.js"></script><![endif]-->
        <script src="<%=Strings.BASE%>/assets/bootstrap-3.3.7/js/ie-emulation-modes-warning.js"></script>

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
        <script src="<%=Strings.BASE%>/assets/bootstrap-3.3.7/js/jquery.min.js"></script>
        <script src="<%=Strings.BASE%>/assets/bootstrap-3.3.7/js/jquery.cookie.js"></script>
        <script src="<%=Strings.BASE%>/assets/js/validation.js"></script>

    </head>

    <body class="login-form">

        <div class="container">
            <img alt="SICV" class="logoSICVLogin" src="<%=Strings.BASE%>/assets/images/logoSICVLogin.png">
            <h2 style="text-align: center;letter-spacing: 2px;">Importador de Inventários</h2>
            <form action="<%=Strings.BASE%>/register/forgotPassword" method="post" class="form-signin">
            	<h6 style="font-size: 16px;float: left;">Digite seu e-mail para redefinir a senha</h6>
                <input type="email" name="email" id="inputEmail" class="form-control inputEmail" placeholder="e-mail" required autofocus onkeyup="forgotEmailValidate(this.id);"/><br />
				<span id="resultEmailForgot" style="font-size: 14px;float: left;color: #00697C;margin-bottom: 10px;margin-top: -20px !important; font-weight: bold;">${recoveryMsg}</span>
                <button class="btn btn-lg btn-block bgBtnEntrar" type="submit" id="btnSendForgot">Enviar</button>
	            <a class="btn btn-outlined btnCadastrar linkLogin" href="<%=Strings.BASE%>/login">Efetuar Login</a>
	            <a class="btn btn-outlined btnCadastrar linkLogin" href="<%=Strings.BASE%>/register">Efetuar Cadastro</a>
            </form>
        </div> <!-- /container -->

        <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
        <script src="<%=Strings.BASE%>/assets/bootstrap-3.3.7/js/ie10-viewport-bug-workaround.js"></script>



    </body>
</html>
