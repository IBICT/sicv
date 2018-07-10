<%-- 
    Document   : login
    Created on : 11/05/2017, 09:48:46
    Author     : Deivdy William Silva
--%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
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

        <style>
            
            .mastfoot {
                
                position: fixed;
                bottom: 40px;
            }
            .mastfoot p {
                position: fixed;
                right: 50px;
                font-style: normal;
                font-weight: 600;
                line-height: normal;
                font-size: 16px;
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

        </style>

        <title>SICV - ACV | Banco Nacional de Inventários dos inventários brasileiros do Ciclo de Vida (ICVs)</title>

		<link rel="stylesheet" href="<%=Strings.BASE%>/assets/materialize/css/materialize.min.css">
        <link rel="stylesheet" href="<%=Strings.BASE%>/assets/font/font-awesome/css/font-awesome.min.css">
        
        <link href="<%=Strings.BASE%>/assets/css/login/index.css" rel="stylesheet">

        <script src="<%=Strings.BASE%>/assets/bootstrap-3.3.7/js/jquery.min.js"></script>
        <script src="<%=Strings.BASE%>/assets/bootstrap-3.3.7/js/jquery.cookie.js"></script>
        <script>
            $(function () {

                if (localStorage.chkbox && localStorage.chkbox != '') {
                    $('#rememberChkBox').attr('checked', 'checked');
                    $('#inputEmail').val(localStorage.username);
                    $('#inputPassword').val(localStorage.pass);
                } else {
                    $('#rememberChkBox').removeAttr('checked');
                    $('#inputEmail').val('');
                    $('#inputPassword').val('');
                }

                $('#rememberChkBox').click(function () {

                    if ($('#rememberChkBox').is(':checked')) {
                        // save username and password
                        localStorage.username = $('#inputEmail').val();
                        localStorage.pass = $('#inputPassword').val();
                        localStorage.chkbox = $('#rememberChkBox').val();
                    } else {
                        localStorage.username = '';
                        localStorage.pass = '';
                        localStorage.chkbox = '';
                    }
                });
            });
        </script>
    </head>

    <body class="login-form">

        <div class="container">
            <img alt="SICV" class="logoSICVLogin" src="<%=Strings.BASE%>/assets/images/logoSICVLogin.png">
            <h5 style="text-align: center;letter-spacing: 2px;">Importador de Inventários</h5>
            <div ${param.logout ? 'style="display:"' : 'style="display:none"'} >
                <h4 style="color: #04450f;font-style: italic;font-weight: bold;">Logout efetuado com sucesso</h4>
            </div>
            <form action="login" method="post" class="form-signin">
                <input type="email" name="email" id="inputEmail" class="form-control inputEmail" placeholder="Email" required autofocus autocomplete="on">

                <input type="password" name="senha" id="inputPassword" class="form-control inputEmail" placeholder="Password" required>
                <div ${param.error == 1 ? 'style="display:"' : 'style="display:none"'} >
                    <h4 style="color: #ff0000c2;font-style: italic;font-weight: bold;">Email ou usuário inválido</h4>
                </div>

                <div class="checkbox">
                	<input type="checkbox" class="filled-in" id="rememberChkBox"/>
					<label for="rememberChkBox" style="color: #00697C;"><i><b>Lembrar acesso</b></i></label>
				</div>
                <div>
                    <button class="btn btn-lg btn-block bgBtnEntrar" type="submit">Entrar</button>
                </div>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            </form>
            <a class="btnCadastrar linkLogin" href="<%=Strings.BASE%>/register/forgotPassword">Esqueci minha senha</a>
            <a style="margin-bottom: 10px;" class="btnCadastrar linkLogin" href="<%=Strings.BASE%>/register">Cadastrar</a>
            <div class="mastfoot">
                <p>Versão Beta 0.1</p>
            </div>
        </div> <!-- /container -->

		<script type="application/javascript" src="<%=Strings.BASE%>/assets/materialize/js/materialize.min.js"></script>
    </body>
</html>
