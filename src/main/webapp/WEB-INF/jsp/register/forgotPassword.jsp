<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <meta name="author" content="Wellington Stanley" />

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
        <meta name="theme-color" content="#ffffff" />

        <title>SICV - ACV | Banco Nacional de Inventários dos inventários brasileiros do Ciclo de Vida (ICVs)</title>

		<link rel="stylesheet" href="<%=Strings.BASE%>/assets/materialize/css/materialize.min.css">
        <link rel="stylesheet" href="<%=Strings.BASE%>/assets/font/font-awesome/css/font-awesome.min.css">
        <link rel="stylesheet" href="<%=Strings.BASE%>/assets/css/fonts.css">
        <link href="<%=Strings.BASE%>/assets/css/forgotPassword/forgotPassword.css" rel="stylesheet">
        <script src="<%=Strings.BASE%>/assets/js/validation.js"></script>
        
    </head>

    <body class="login-form">

        <div class="container">
            <img alt="SICV" class="logoSICVLogin" src="<%=Strings.BASE%>/assets/images/logoSICVLogin.png">
            <h5 style="text-align: center;letter-spacing: 2px;" onclick="location.href='<%=Strings.BASE%>/login'">Importador de Inventários</h5>
            <form action="<%=Strings.BASE%>/register/forgotPassword" method="post" class="form-signin">
				<div class="input-field col s4">
	               	<input type="email" name="email" id="inputEmail" value="${emailSend}" class="inputEmail" required autocomplete="on" onkeyup="forgotEmailValidate(this.id);">
		          	<label for="inputEmail" >Digite seu e-mail para redefinir a senha</label>
	       		</div>
				<br />
                <div style="text-align: center;margin-bottom: 10px;margin-top: -10px !important;">
					<span id="resultEmailForgot" class="resultEmailForgot">${recoveryMsg}</span>
                </div>
				<c:choose>
					<c:when test="${empty recoveryMsg}">
   	            		<button class="btn btn-lg btn-block bgBtnEntrar" type="submit" id="btnSendForgot">Enviar</button>
					</c:when>
					<c:when test="${not empty recoveryMsg}">
	            		<div class="btn btn-lg btn-block btnCadastrar" onclick="location.href='<%=Strings.BASE%>/login'">Voltar</div>
					</c:when>
				</c:choose>		
            </form>
        </div> <!-- /container -->

        <script type="application/javascript" src="<%=Strings.BASE%>/assets/jquery-3.2.1.min.js"></script>
		<script type="application/javascript" src="<%=Strings.BASE%>/assets/materialize/js/materialize.min.js"></script>

    </body>
</html>
