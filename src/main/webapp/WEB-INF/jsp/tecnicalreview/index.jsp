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
            <h4 class="page-title">Revisão Tecnica</h4>
        </div>

        <c:if test="${not empty invite}">
            <div class="row sicv-container">
                <p class="page-description">Confirme sua participação como revisor e acompanhe os inventários que lhe foram atribuidos para realizar a revisão de Qualidade</p>
            </div>
            <c:forEach var="homologacao" items="${invite}"> 

                <div class="row sicv-container" style="padding-top:10px;background-color: #d7eef0;">
                    <h5 style="color:#4dbcc4; margin:20px;">Aguardando confirmação ou cancelamento</h5>
                    <!--<div class="row">
                        <a style="margin:20px;color:#00728a;" href="#">Particle board, at plant, for indoor use, 7.4% water content, from virgin wood, BR 2012</a><i style="color:red;" class="material-icons">do_not_disturb</i><i style="color:green;" class="material-icons">check</i>
                    </div>
                    <div class="row">
                        <a style="margin:20px;color:#00728a;" href="#">Cotton boll production_unlinked</a><i style="color:red;" class="material-icons">do_not_disturb</i><i style="color:green;" class="material-icons">check</i>
                    </div>-->
                    <div class="row">
                        <a class="col s1 offset-s7" style="margin:0 20px;color:#00728a;" href="#">${homologacao.ilcd.title}</a><a class="col s1" href="refused" ><i style="color:red;" class="material-icons">do_not_disturb</i></a><a class="col s1" href="<%=Strings.BASE%>/qualityreview/accept/${homologacao.id}" ><i style="color:green;" class="material-icons">check</i></a>
                    </div>
                </div>
            </c:forEach>
        </c:if>

        <c:if test="${not empty work}">
            <div class="sicv-container sicv-inventori-table">
                <div class="row">
                    <h6 style="color:#4dbcc4;">Invéntarios em andamento</h6>
                </div>
                <div style="margin:0px;" class="row">
                    <div class="col s3 sicv-table-th">Id</div>
                    <div class="col s3 sicv-table-th">Nome</div>
                    <div class="col s1 sicv-table-th" style="text-align: center;">Pendências</div>
                    <div class="col s2 sicv-table-th" style="text-align: center;">Prazo para entregar</div>
                </div>
                <c:forEach var="homologacao" items="${work}">
                    <div style="margin:0px;cursor:pointer;" class="row" onclick="window.location = '<%=Strings.BASE%>/tecnicalreview/${homologacao.ilcd.id}';">
                        <div style="height: 40px; position: relative; top: 10px;" class="col s3 sicv-table-td">${homologacao.ilcd.uuid}</div>
                        <div style="height: 40px; position: relative; top: 10px;" class="col s3 sicv-table-td">${homologacao.ilcd.title}</div>
                        <div style="height: 40px; text-align: center; position: relative; top: 10px;" class="col s1 sicv-table-td"><i style="color: #c3697c;" class="material-icons">report_problem</i></div>
                        <div style="height: 40px;  text-align: center; position: relative; top: 10px;" class="col s2 sicv-table-td">5 dias</div>
                    </div>
                        <!--
                    <div style="margin:0px;cursor:pointer;" class="row" onclick="window.location = '<%=Strings.BASE%>/qualityreview/1';">
                        <div style="height: 40px; position: relative; top: 10px;" class="col s3 sicv-table-td">266c5da8-55bc-4d58-a4af-cbf7724f7939</div>
                        <div style="height: 40px; position: relative; top: 10px;" class="col s3 sicv-table-td">Phenol from cumene production mix, at producer</div>
                        <div style="height: 40px; text-align: center; position: relative; top: 10px;" class="col s1 sicv-table-td"><i style="color: #accc5f;" class="material-icons">check</i></div>
                        <div style="height: 40px;  text-align: center; position: relative; top: 10px;" class="col s2 sicv-table-td">Entregue</div>
                    </div>-->
                </c:forEach>
            </div>
        </c:if>
        <script type="application/javascript" src="<%=Strings.BASE%>/assets/jquery-3.2.1.min.js"></script>
        <script type="application/javascript" src="<%=Strings.BASE%>/assets/materialize/js/materialize.min.js"></script>
        <c:if test="${not empty teste}">
            <c:forEach var="contato" items="${teste}"> 
                ${contato}
            </c:forEach>
        </c:if>


    </body>

</html>