<%-- 
    Document   : home
    Created on : 11/05/2017, 09:48:46
    Author     : Deivdy.Silva
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@page import="resources.Strings"%>
<%@page import="br.com.ibict.acv.sicv.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="apple-touch-icon" sizes="57x57" href="<%=Strings.BASE%>/assets/images/favicon/apple-icon-57x57.png" />

<!DOCTYPE html>
<html lang="pt-BR">

    <head>
        <meta charset="UTF-8">
        <title>SICV</title>
        
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
        
        <link rel="stylesheet" href="<%=Strings.BASE%>/assets/materialize/css/materialize.min.css">
        <link href="https://fonts.googleapis.com/css?family=Titillium+Web" rel="stylesheet">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" href="<%=Strings.BASE%>/assets/steps.css">

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
    </head>

    <body>

        <nav>
            <div class="nav-wrapper">
                <a href="#" class="brand-logo"><img src="<%=Strings.BASE%>/assets/img/logo.png" alt="SICV"> Importador de Inventários</a>
            </div>
        </nav>

        <div class="container">

            <div>
                <a style="color:#00697c;" href="#">Meus Inventários</a> |
                <a style="color:#c3697c;" href="#"><i class="material-icons">notifications</i> 1</a> |
                <a style="color:#00697c;" href="#">Perfil: ${username}</a> |
                <a style="color:#00697c;" href="<%=Strings.BASE%>/logout">Sair</a>
            </div>
            <hr />

            <h4 class="page-title">Meus inventários</h4>
            <p class="page-description">Envie seu inventário e acompanhe o processo. Você receberá notificações no sistema e no e-mail cadastrado sempre que o status sofrer alterações</p>
            <a class="btn-import waves-effect waves-light btn" href="<%=Strings.BASE%>/admin/ilcd/">Submeter Inventário</a>


            <h6 style="color:#4dbcc4;">Invéntarios em andamento</h6>
            <table>
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Nome</th>
                        <th>Downloads Disponíveis</th>
                        <th></th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>${ilcdId}266c5da8-55bc-4d58-a4af-cbf7724f7939</td>
                        <td>${IlcdName}Brick technology mix production mix, at plant 1800 kg/m3</td>
                        <td>${pathDownload}--</td>
                        <td>${status}--</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>266c5da8-55bc-4d58-a4af-cbf7724f7939</td>
                        <td>Phenol from cumene production mix, at producer</td>
                        <td><a class="waves-effect waves-light btn">Revisão Qualidata</a></td>
                        <td><a class="btn-import waves-effect waves-light btn">Revisão Técnica</a></td>
                        <td>
                            <!-- Progress Tracker v2 -->
                            <ol class="progress-steps" data-steps="5">
                                <li class="done">
                                    <span class="step"><span>1</span></span>
                                </li>
                                <li class="active">
                                    <span class="step"><span>2</span></span>
                                </li>
                                <li>
                                    <span class="step"><span>3</span></span>
                                </li>
                                <li>
                                    <span class="step"><span>4</span></span>
                                </li>
                                <li>
                                    <span class="step"><span>5</span></span>
                                </li>
                            </ol>
                            <!-- Progress Tracker v2 -->
                        </td>
                    </tr>
                    <tr>
                        <td>266c5da8-55bc-4d58-a4af-cbf7724f7939</td>
                        <td>Brick technology mix production mix, at plant 1800 kg/m3</td>
                        <td>--</td>
                        <td>--</td>
                        <td></td>
                    </tr>
                </tbody>
            </table>

        </div>

        <script type="application/javascript" src="<%=Strings.BASE%>/assets/jquery-3.2.1.min.js"></script>
        <script type="application/javascript" src="<%=Strings.BASE%>/assets/materialize/js/materialize.min.js"></script>
    </body>

</html>
