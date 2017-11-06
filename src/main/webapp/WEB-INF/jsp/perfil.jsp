<%@page import="resources.Strings"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="pt-BR">

    <head>
        <meta charset="UTF-8">
        <title>Home</title>
        <link rel="stylesheet" href="<%=Strings.BASE%>assets/materialize/css/materialize.min.css">
        <link href="https://fonts.googleapis.com/css?family=Titillium+Web" rel="stylesheet">
        <style>
            html {
                font-family: 'Titillium Web', "Roboto", sans-serif;
            }

            nav {
                background-color: #4dbcc4;
            }

            nav .brand-logo {
                margin-left: 50px;
            }

            nav .brand-logo img {
                margin-right: 20px;
                vertical-align: middle;
            }

            .container {
                margin: 10px 50px;
            }

            .page-title {
                color: #00697c;
            }

            .btn-import {
                background-color: #accc5f;
            }

            table {
                width: 1800px;
            }

            table > thead > tr > th {
                color: #4dbcc4;
                border-bottom: 1px solid silver;
                border-top: 1px solid silver;
            }

            table > thead > tr > th:last-child {
                border: 0;
            }

            table > thead > tr > th {
                padding: 1px;
            }

            table > tbody > tr > td {
                border-bottom: 1px solid silver;
            }

            table > tbody > tr:last-child {
                border-bottom: 1px solid black;
            }

            table > tbody > tr:last-child {
                border: 0;
            }

        </style>
        <link rel="stylesheet" href="steps.css">
    </head>

    <body>

        <nav>
            <div class="nav-wrapper">
                <a href="#" class="brand-logo"><img src="img/logo.png" alt="SICV"> Importador de Inventários</a>
            </div>
        </nav>

        <div class="container">

            <div>
                <a href="#">Meus Inventários</a> |
                <a href="#">Notificação</a> |
                <a href="#">Perfil</a> |
                <a href="#">Sair</a>
            </div>

            <h4 class="page-title">Perfil</h4>
            <div class="row">
                <form class="col s12">
                    <div class="row">
                        <div class="input-field col s6">
                            <h6 class="page-title">Informações pessoais</h6>
                        </div>
                        <div class="input-field col s6">
                            <h6 class="page-title">Informações de login</h6>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s6">
                            <input placeholder="" id="first_name" type="text" class="validate">
                            <label for="first_name">Nome</label>
                        </div>
                        <div class="input-field col s6">
                            <input placeholder="" id="first_name" type="text" class="validate">
                            <label for="first_name">Senha</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s3">
                            <input placeholder="" id="first_name" type="text" class="validate">
                            <label for="first_name">E-mail</label>
                        </div>
                        <div class="input-field col s3">
                            <input placeholder="" id="first_name" type="text" class="validate">
                            <label for="first_name">Telefone</label>
                        </div>
                        <div class="input-field col s6">
                            <input placeholder="" id="first_name" type="text" class="validate">
                            <label for="first_name">Nova Senha</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s6">
                            <input placeholder="" id="first_name" type="text" class="validate">
                            <label for="first_name">Instituição</label>
                        </div>
                        <div class="input-field col s6">
                            <input placeholder="" id="first_name" type="text" class="validate">
                            <label for="first_name">Confirmar nova senha</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s3">
                            <input placeholder="" id="first_name" type="text" class="validate">
                            <label for="first_name">Cidade</label>
                        </div>
                        <div class="input-field col s3">
                            <input placeholder="" id="first_name" type="text" class="validate">
                            <label for="first_name">País</label>
                        </div>
                        <div class="input-field col s6">
                            <input class="waves-effect waves-light btn" value="Salvar alterações" type="submit" >
                        </div>
                    </div>
                </form>
            </div>

        </div>

		<script type="application/javascript" src="<%=Strings.BASE%>/assets/jquery-3.2.1.min.js"></script>
        <script type="application/javascript" src="<%=Strings.BASE%>/assets/materialize/js/materialize.min.js"></script>
    </body>

</html>
