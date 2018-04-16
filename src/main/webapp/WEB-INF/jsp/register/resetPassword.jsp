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

        <link rel="stylesheet" type="text/css" href="<%=Strings.BASE%>/assets/materialize/css/materialize.min.css">
        <style type="text/css">

            @font-face {
                font-family: 'TitilliumWeb-ExtraLight';
                src: url('<%=Strings.BASE%>/assets/fonts/TitilliumWeb-ExtraLight.ttf') format('truetype');
            }

            @font-face {
                font-family: 'TitilliumWeb-Regular';
                src: url('<%=Strings.BASE%>/assets/fonts/TitilliumWeb-Regular.ttf') format('truetype');
            }

            body {
                background-color: #4DBCC4;
            }

            .logoSICVLogin {
                margin-top: 114.36px;
                width: 150px;
                margin-left: 37%;
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

            input[type=password].invalid:not(.browser-default)+label,
            input[type=password].invalid:not(.browser-default):focus+label,
            input[type=password].invalid:not(.browser-default):focus:not([readonly])+label {
                color: #F44336;
            }

            input[type=password]:not(.browser-default):focus:not([readonly])+label {
                color: #fff;
            }

            input[type=password]:not(.browser-default):focus:not([readonly]) {
                border-bottom: 1px solid #fff;
            }

            input.valid:not([type]), input.valid:not([type]):focus, input[type=text].valid:not(.browser-default), input[type=text].valid:not(.browser-default):focus, input[type=password].valid:not(.browser-default), input[type=password].valid:not(.browser-default):focus, input[type=email].valid:not(.browser-default), input[type=email].valid:not(.browser-default):focus, input[type=url].valid:not(.browser-default), input[type=url].valid:not(.browser-default):focus, input[type=time].valid:not(.browser-default), input[type=time].valid:not(.browser-default):focus, input[type=date].valid:not(.browser-default), input[type=date].valid:not(.browser-default):focus, input[type=datetime].valid:not(.browser-default), input[type=datetime].valid:not(.browser-default):focus, input[type=datetime-local].valid:not(.browser-default), input[type=datetime-local].valid:not(.browser-default):focus, input[type=tel].valid:not(.browser-default), input[type=tel].valid:not(.browser-default):focus, input[type=number].valid:not(.browser-default), input[type=number].valid:not(.browser-default):focus, input[type=search].valid:not(.browser-default), input[type=search].valid:not(.browser-default):focus, textarea.materialize-textarea.valid, textarea.materialize-textarea.valid:focus, .select-wrapper.valid>input.select-dropdown {
                border-bottom: 1px solid #fff;
                -webkit-box-shadow: 0 1px 0 0 #fff;
                box-shadow: 0 1px 0 0 #fff;
            }

            input[type=password].invalid:not(.browser-default), input[type=password].invalid:not(.browser-default):focus {
                border-bottom: 1px solid #F44336;
                color: #F44336;
            }

            /*input*/

            h5 {
                font-family: Titillium Web;
                font-style: normal;
                font-weight: normal;
                line-height: normal;
                font-size: 33px;
                text-align: center;

                color: #FFFFFF;

            }
        </style>
        <title></title>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="s12">
                    <img alt="SICV" class="logoSICVLogin" src="<%=Strings.BASE%>/assets/images/logoSICVLogin.png">
                </div>
            </div>
            <div class="row">
                <div class="s12">
                    <h5 style="font-family: TitilliumWeb-Regular;">Importador de Inventários</h5>
                </div>
            </div>
            <form id="form" class="col s12" novalidate="novalidate" method="post" >
                <div class="row" style="margin-bottom: 0px;">
                    <div style="margin-left: 25%;" class="input-field col s6">
                        <input id="field1" name="field1" type="password" required="" aria-required="true" />
                        <label for="field1">Digite uma nova senha</label>
                    </div>
                </div>
                <div class="row" style="margin-bottom: 0px;">
                    <div style="margin-left: 25%;" class="input-field col s6">
                        <input id="field2" name="field2" type="password" required="" aria-required="true" />
                        <label for="field2">Confirmar senha</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s12">
                        <button style="margin-left: 36%; background-color: #00697C;" id="enviar" class="btn waves-effect waves-light" type="submit" name="action">Redefinir senha</button>
                    </div>
                </div>
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
                equalTo: "Please enter the same value again.",
                accept: "Please enter a value with a valid extension.",
                maxlength: jQuery.validator.format("Please enter no more than {0} characters."),
                minlength: jQuery.validator.format("Senhas curtas são fáceis de adivinhar. Tente uma senha com pelo menos  {0} caracteres."),
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
                        field2: {
                            equalTo: "Essas senhas não coincidem. Tentar novamente?"
                        }
                    }
                });

                $('#field1, #field2').on('keyup', function () {
                    $("#form").validate({
                        rules: {
                            field1: {
                                minlength: 8
                            },
                            field2: {
                                minlength: 8,
                                equalTo: "#field1"
                            }
                        }
                    });
                });

                $("#enviar").on('click', function () {
                    $("#form").validate({
                        rules: {
                            field1: {
                                required: true,
                                minlength: 8
                            },
                            field2: {
                                required: true,
                                minlength: 8,
                                equalTo: "#field1"
                            }
                        }
                    });
                });

            });//]]> 
        </script>
    </body>
</html>

