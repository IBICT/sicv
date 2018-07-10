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

		<link rel="stylesheet" href="<%=Strings.BASE%>/assets/materialize/css/materialize.min.css">
        <link rel="stylesheet" href="<%=Strings.BASE%>/assets/font/font-awesome/css/font-awesome.min.css">
        <link rel="stylesheet" href="<%=Strings.BASE%>/assets/css/fonts.css">
         <script src="<%=Strings.BASE%>/assets/js/validation.js"></script>
        
        <!-- Custom styles for this template 
        <link href="<%=Strings.BASE%>/assets/css/login/index.css" rel="stylesheet">
        -->        
        <style type="text/css">
        	body {
			    padding-top: 40px;
			    padding-bottom: 40px;
			    background-color: #4DBCC4;
			}

            /*input*/
            input:not([type]), input[type=text]:not(.browser-default), input[type=password]:not(.browser-default), input[type=email]:not(.browser-default), input[type=url]:not(.browser-default), input[type=time]:not(.browser-default), input[type=date]:not(.browser-default), input[type=datetime]:not(.browser-default), input[type=datetime-local]:not(.browser-default), input[type=tel]:not(.browser-default), input[type=number]:not(.browser-default), input[type=search]:not(.browser-default), textarea.materialize-textarea {
                border-bottom: 1px solid #fff;
                color: #fff;
                font-size: 30px;
            }

            label {
                width: 100%;
                font-size: 30px;
            }

            .input-field label {
                color: #fff;
                font-size: 20px;
            }

            /*input*/
            h6 {
                font-family: Titillium Web;
                font-style: normal;
                font-weight: normal;
                line-height: normal;
                font-size: 12px;
                text-align: center;
                color: #FFFFFF;
            }
            
            /*input*/
            h5 {
                font-family: TitilliumWeb-ExtraLight;
                font-style: normal;
                font-weight: normal;
                line-height: normal;
                font-size: 33px;
                text-align: center;
                color: #FFFFFF;
            }
            
            .bgBtnEntrar {
			    font-family: 'TitilliumWeb-Regular', sans-serif !important;
			    border-radius: 5px !important;
			    background-color: #00697C !important;
			    font-size: 16px;
			    text-transform: none;
			}
			
			.btnCadastrar {
			    font-family: 'TitilliumWeb-Regular', sans-serif !important;
			    border-radius: 5px !important;
			    background-color: #00697C;
			    font-size: 16px;
			    text-transform: none;
			    cursor: pointer;
			 }
			
			.inputEmail {
			    font-family: 'TitilliumWeb-Regular', sans-serif !important;
			    margin-bottom: 10px !important;
			    text-transform: none;
			    color: #FFFFFF;
			    height: 25px !important;
			    margin: auto !important;
			    display: block !important;
			    padding-top: 25px !important;
			}
				
	        /* label focus color */
	        input[type=email]:not(.browser-default){
	        	font-size: 18px !important;
	            color: #FFFFFF !important;
	            border-bottom: 2px solid #FFFFFF !important;
	            box-shadow: 1px solid #FFFFFF !important;
	            width: 353px !important;
	        }
	
	        input[type=email]:not(.browser-default):focus:not([readonly]){
	            font-size: 18px !important;
	            color: #00697C;
	            border-bottom: 2px solid #00697C !important;
	            box-shadow: none !important;
	        }
			
			.logoSICVLogin {
			    display: block;
			    margin: 0 auto;
			}
			
			.container {
			    position:absolute;
			    top:22%;
			    right:0;
			    left:0;
			}
			    
			.btn-lg{
				height: 32px;
				width: 126px;
				padding: 0px;
			    margin: auto;
			}
			
			.btn:hover, .btn-large:hover {
    			background-color: #00697C;
			}
			
			::placeholder { /* Chrome, Firefox, Opera, Safari 10.1+ */
			    color: #FFFFFF;
			    opacity: 1; /* Firefox */
			    font-family: 'TitilliumWeb-Regular', sans-serif !important;
			}
			
        </style>

    </head>

    <body class="login-form">

        <div class="container">
            <img alt="SICV" class="logoSICVLogin" src="<%=Strings.BASE%>/assets/images/logoSICVLogin.png">
            <h5 style="text-align: center;letter-spacing: 2px;" onclick="location.href='<%=Strings.BASE%>/login'">Importador de Inventários</h5>
            <form action="<%=Strings.BASE%>/register/forgotPassword" method="post" class="form-signin">
            	<c:if test="${not empty recoveryMsg}">
	            	<h6 style="font-size: 12px;color: #9ADEE3;">Digite seu e-mail para redefinir a senha</h6>
	            </c:if>

                <input type="email" value="${emailSend}" name="email" id="inputEmail" class="form-control inputEmail" ${not empty emailSend ? 'readonly' : '' } placeholder="Digite seu e-mail para redefinir a senha" required autofocus onkeyup="forgotEmailValidate(this.id);"/><br />
                <div style="text-align: center;margin-bottom: 10px;margin-top: -10px !important;">
					<span id="resultEmailForgot" style="font-size: 14px;color: #00697C; font-style: italic;">${recoveryMsg}</span>
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
