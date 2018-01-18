<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@page import="resources.Strings"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

        <link href="<%=Strings.BASE%>/assets/bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="<%=Strings.BASE%>/assets/materialize/css/materialize.min.css">
        <link rel="stylesheet" href="<%=Strings.BASE%>/assets/steps.css">
        <link href="https://fonts.googleapis.com/css?family=Titillium+Web" rel="stylesheet">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" href="<%=Strings.BASE%>/assets/font/font-awesome/css/font-awesome.min.css">

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
                /*margin: 10px 50px;*/
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


            /* Tabs */
            .nav-tabs>li {
                min-width: 5px;
                max-width: 33%;
            }
            .nav-tabs>li>a {
                padding: 2px 10px;
                text-overflow: ellipsis;
                white-space: nowrap;
                overflow: hidden;
                width: 100%;
            }
            .nav-tabs>li.disable>a {
                color: white;
                background-color: #E0E0E0;
            }
            .nav-tabs>li.active>a {
                color: white;
                background-color: #4DBCC4;
            }
            .nav-tabs>li>a {
                color: white;
                background-color: #A3D3D6;
            }
            .nav-tabs>li.active>a:hover, .nav-tabs>li.active>a:focus{
                color: white;
                background-color: #4DBCC4;
            }
            /* Tabs */

            .headerStatus {
                font-family: Titillium Web;
                font-style: normal;
                font-weight: 300;
                line-height: normal;
                font-size: 20px;
                color: #3D3D3D;
            }
        </style>

    </head>

    <body>
        <jsp:include page="/WEB-INF/jsp/partials/nav.jsp" />
        <div class="headerDiv">
            <jsp:include page="/WEB-INF/jsp/partials/header.jsp" />
        </div>


        <div style="width: 90%;margin-left:5%;">
            <div class="row" style="margin: 0;">
                <h4 class="page-title" style="margin: 0;">${ilcd.title}</h4>
            </div>
            <hr />
            <div class="row">
                <div class="col s8">
                    <div style="padding-bottom: 2%;">
                        <h5>Usuário</h5>
                    </div>
                    <h6 class="bold">Autor/es</h6>
                    <c:forEach items="${ilcd.authors}" var="author" varStatus="loop">
                        <i>${author};</i>
                    </c:forEach>
                    <p>
                        <c:forEach items="${ilcd.emails}" var="email" varStatus="loop">
                            <i>${email};</i>
                        </c:forEach>
                        <br>
                    </p>
                    <h6 class="bold">Categoria</h6>
                    <p>${ilcd.category}</p>
                    <br>
                    <h6 class="bold">Descrição</h6>
                    <p>${ilcd.description}</p>

                </div>
                <div class="col s4">
                    <div class="headerStatus">
                        Acompanhamento de revisões 
                    </div>
                    <ul class="nav nav-tabs" style="padding: 1px;border-bottom:5px solid #4DBCC4;">
                        <li class="active">
                            <a  href="#1" data-toggle="tab" title="Revisão Qualidata">Revisão Qualidata</a>
                        </li>
                        <li>
                            <a href="#2" data-toggle="tab" title="Revisão Técnica">Revisão Técnica</a>
                        </li>
                        <li class="disable">
                            <a href="#3" data-toggle="tab" title="Publicar">Publicar</a>
                        </li>
                    </ul> 

                    <div class="tab-content " >
                        <div class="tab-pane active" id="1">
                            <div class="row" style="color: #00697C; margin: 10px 0;">
                                Envio do autor
                            </div>
                            <div class="row">
                                <i class="fa fa-chevron-right" aria-hidden="true" style="color: #00697C;"></i>
                                <a href="#"><i class="fa fa-file-archive-o" aria-hidden="true"></i>
 ILCD.zip</a>
                            </div>
                        </div>
                        <div class="tab-pane" id="2">
                            <h3>Notice the gap between the content and tab after applying a background color</h3>
                        </div>
                        <div class="tab-pane" id="3">
                            <h3>add clearfix to tab-content (see the css)</h3>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script type="application/javascript" src="<%=Strings.BASE%>/assets/jquery-3.2.1.min.js"></script>
        <script type="application/javascript" src="<%=Strings.BASE%>/assets/bootstrap-3.3.7/js/bootstrap.min.js"></script>
        <script type="application/javascript" src="<%=Strings.BASE%>/assets/materialize/js/materialize.min.js"></script>
        <script>
            $(document).ready(function () {
                // the "href" attribute of the modal trigger must specify the modal ID that wants to be triggered
                $('.modal').modal();

            });
        </script>
    </body>

</html>