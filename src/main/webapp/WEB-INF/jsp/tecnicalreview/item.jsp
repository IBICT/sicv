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
            }

            .page-title {
                color: #00697c;
            }

            .btn-import {
                background-color: #accc5f;
            }

            .user-menu {
                border-bottom: 2px solid silver;
                margin: 60px 80px 20px 80px;
                height: 30px;
            }

            .item-menu {
                border-right: 2px solid silver;
                height: 30px;
            }

            .item-menu2 {
                text-align: center;
                border-left: 2px solid silver;
                height: 30px;
            }

            .item-menu3 {
                text-align: right;
                height: 30px;
            }

            .link-menu {
                color: #00697c;
                font-weight: bold;
                font-size: 16px;
            }

            .link-menu2 {
                color: #c3697c;
                font-weight: bold;
                font-size: 16px;
            }

            .link-menu3 {
                color: #00697c;
                font-size: 16px;
            }

            .notif-num {
                position: relative;
                top: -5px;
            }

            .sicv-container {
                margin: 0px 80px 0px 80px;
            }

            .sicv-table-th {
                color: #4dbcc4;
                border-bottom: 1px solid silver;
                border-top: 1px solid black;
            }

            .sicv-table-td {
                border-bottom: 1px solid silver;
            }
        </style>
        <link rel="stylesheet" href="steps.css">
    </head>

    <body>

        <jsp:include page="/WEB-INF/jsp/partials/nav.jsp" />
        <div class="headerDiv">
            <jsp:include page="/WEB-INF/jsp/partials/header.jsp" />
        </div>

        <div class="row sicv-container">

        </div>
        <div class="row  sicv-container">
            <div class="row">

                <div class="row">
                    <div class="col s8"><h5 class="page-title">${ilcd.title}</h5></div>
                        <c:if test="${ilcd.homologation.status < 3}">
                        <div class="col s2" style="color:red;"><i class="material-icons">do_not_disturb</i> Não, obrigado</div>
                        <div class="col s2" style="color:green;"><i class="material-icons">check</i> Aceito</div>
                    </c:if>
                </div>
                <hr />

                <div class="col s6">
                    <h5>Usuário</h5>
                    <h6>${username}</h6>
                    <h6>Autor/es</h6>
                    <p>${ilcd.title}<br />
                        ${ilcd.email}
                    </p>
                    <hr />
                    <h6>Categoria</h6>
                    <p>${ilcd.category}</p>
                    <hr />
                    <h6>Descrição</h6>
                    <p>${ilcd.description}</p>
                    <hr />
                </div>
                <div class="col s6">
                    <h5 style="color:#7c7c7c;">Histórico</h5>
                    <div class="row">
                        <div class="col s3" style="color:#006b7b;">Autor</div>
                        <div style="color:#27bec3;" class="col s3">Devolução Qualidata</div>
                    </div>
                    <div class="row">
                        <div class="col s3"><a href="<%=Strings.BASE%>/ilcd/${archive.pathFile}"><i style="color:#006b7b;" class="medium material-icons">insert_drive_file</i>ILCD.zip</a></div>
                        <a href="<%=Strings.BASE%>/tecnicalreview/${archive.id}/review" style="background-color:#27bec3;" class="btn col s6">Aplicar Revisão Tecnica</a>
                    </div>
                    <!--
                    <hr />
                    <div class="row">
                        <div class="col s3"><i style="color:#006b7b;" class="medium material-icons">insert_drive_file</i>ILCD.zip</div>
                        <div class="col s3">
                            <i style="color:#27bec3;" class="medium material-icons">insert_drive_file</i>23/08/2017
                        </div>
                    </div>
                    <hr />
                    <div class="row">
                        <div class="col s3"><i style="color:#006b7b;" class="medium material-icons">insert_drive_file</i>ILCD.zip</div>
                        <div class="col s3">
                            <i style="color:#27bec3;" class="medium material-icons">insert_drive_file</i>12/08/2017
                        </div>
                    </div>
                    -->
                    <hr />

                </div>
            </div>
        </div>
        <script type="application/javascript" src="<%=Strings.BASE%>/assets/jquery-3.2.1.min.js"></script>
        <script type="application/javascript" src="<%=Strings.BASE%>/assets/materialize/js/materialize.min.js"></script>

    </body>

</html>