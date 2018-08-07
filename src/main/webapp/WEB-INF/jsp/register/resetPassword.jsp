<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="resources.Strings"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
		
		<link href="<%=Strings.BASE%>/assets/css/resetPassword/resetPassword.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="<%=Strings.BASE%>/assets/materialize/css/materialize.min.css">
        <title></title>
    </head>
    <body>
        <div class="container">
            <img alt="SICV" class="logoSICVLogin" src="<%=Strings.BASE%>/assets/images/logoSICVLogin.png">
            <h5 style="text-align: center;letter-spacing: 2px;">Importador de Inventários</h5>
            <form id="form" class="col s12" novalidate="novalidate" method="post" >
                <div class="input-field col s6">
                    <input id="password" value="${plainPassword}" name="password" type="password" class="inputEmail" required="" aria-required="true" />
                    <label for="password">Digite uma nova senha</label>
                </div>

                <div class="input-field col s6">
                    <input id="confirmPassword" value="${plainPassword}" name="confirmPassword" type="password" class="inputEmail" required="" aria-required="true" />
                    <label for="confirmPassword">Confirmar senha</label>
                </div>
                <div style="text-align:center;margin-bottom: 10px;margin-top: -10px !important;">
					<span id="resultSuccess" class="resultSuccess">${resetedMsg}</span>
                </div>
				<c:choose>
					<c:when test="${empty resetedMsg}">
   	            		<button id="enviar" class="btn btn-lg btn-block btnCadastrar" type="submit" name="action">Redefinir senha</button>
					</c:when>
					<c:when test="${not empty resetedMsg}">
	            		<div class="btn btn-lg btn-block btnCadastrar" onclick="location.href='<%=Strings.BASE%>/login'">Fazer login</div>
					</c:when>
				</c:choose>                
            </form>
        </div>
        <script type="text/javascript" src="<%=Strings.BASE%>/assets/jquery-3.2.1.min.js"></script>
        <script type="text/javascript" src="<%=Strings.BASE%>/assets/materialize/js/materialize.min.js"></script>
        <script type="text/javascript" src="<%=Strings.BASE%>/assets/jquery.validate.js"></script>
        <script type="text/javascript">//<![CDATA[

            $.extend(jQuery.validator.messages, {
                required: "Você não pode deixar este campo em branco.",
                remote: "Please fix this field.",
                email: "Digite seu endereço de e-mail completo, incluindo o \"@\".",
                url: "Digite uma URL valida.",
                date: "Digite uma data valida.",
                dateISO: "Please enter a valid date (ISO).",
                number: "Please enter a valid number.",
                digits: "Please enter only digits.",
                creditcard: "Please enter a valid credit card number.",
                equalTo: "Informe a mesma senha nos dois campos.",
                accept: "Please enter a value with a valid extension.",
                maxlength: jQuery.validator.format("Please enter no more than {0} characters."),
                minlength: jQuery.validator.format("Tente uma senha com pelo menos {0} caracteres."),
                rangelength: jQuery.validator.format("Please enter a value between {0} and {1} characters long."),
                range: jQuery.validator.format("Please enter a value between {0} and {1}."),
                max: jQuery.validator.format("Please enter a value less than or equal to {0}."),
                min: jQuery.validator.format("Please enter a value greater than or equal to {0}.")
            });

            $(document).ready(function () {
                // Extension materialize.css
                $.validator.setDefaults({
                    errorClass: 'invalid',
                    validClass: "valid",
                    errorPlacement: function (error, element) {
                        $(element)
                                .closest("form")
                                .find("label[for='" + element.attr("id") + "']")
                                .attr('data-error', error.text());
                    },
                    submitHandler: function (form) {
                        var $form = $(form);
                        $form.submit();
                    }, messages: {
                        confirmPassword: {
                            equalTo: "Informe a mesma senha nos dois campos."
                        }
                    }
                });

                $('#password, #confirmPassword').on('keyup', function () {
                    $("#form").validate({
                        rules: {
                            password: {
                                minlength: 8
                            },
                            confirmPassword: {
                                minlength: 8,
                                equalTo: "#password"
                            }
                        }
                    });
                });

                $("#enviar").on('click', function () {
                    $("#form").validate({
                        rules: {
                            password: {
                                required: true,
                                minlength: 8
                            },
                            confirmPassword: {
                                required: true,
                                minlength: 8,
                                equalTo: "#password"
                            }
                        }
                    });
                });

            });//]]> 
        </script>
    </body>
</html>

