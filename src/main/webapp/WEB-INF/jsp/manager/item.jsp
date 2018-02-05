<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                pointer-events: none;
            }
            .nav-tabs>li.disable:hover{
                cursor: not-allowed;
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
                    <div class="row">
                        <div class="col s9" style="overflow-x: scroll;overflow-y: scroll;height: 200px;">
                            ${ilcd.description}
                        </div>
                    </div>

                </div>
                <div class="col s4">
                    <div class="headerStatus">
                        Acompanhamento de revisões 
                    </div>
                    <ul class="nav nav-tabs" style="padding: 1px;border-bottom:5px solid #4DBCC4;">
                        <li class="active" id="abas1">
                            <a  href="#1" data-toggle="tab" title="Revisão Qualidata">Revisão Qualidata</a>
                        </li>
                        <li id="abas2" >
                            <a href="#2" data-toggle="tab" title="Revisão Técnica">Revisão Técnica</a>
                        </li>
                        <li class="disable">
                            <a href="#3" disabled data-toggle="tab" title="Publicar">Publicar</a>
                        </li>
                    </ul> 

                    <div class="tab-content" >
                        <div class="tab-pane active" id="1">
                            <c:forEach var="statu" items="${status}"> 
                                <c:choose>
                                    <c:when test="${statu.type == 1 or statu.type == 3 and statu.previous.type == 1}">
                                        <div class="tab-pane active" id="1">
                                            <c:choose>
                                                <c:when test="${statu.type == 1}">
                                                    <c:choose>
                                                        <c:when test="${empty statu.accept}">
                                                            <div class="row" style="color: #00697C; margin: 10px 0;">
                                                                Enviado para  <a href="#" style="color: #00697C; font-weight: bold; margin: 0 10px;">${statu.revisor.firstName}</a> <a href="#" style="color:#6B6B6A;text-decoration: underline;">Cancelar Convite</a>
                                                            </div>
                                                        </c:when>
                                                        <c:when test="${not empty statu.accept and not statu.accept}">
                                                            <div class="row" style="color: #00697C; margin: 10px 0;">
                                                                <a href="#" style="color: #00697C; font-weight: bold; margin: 0 10px;">${statu.revisor.firstName}</a> recusou o convite.
                                                            </div>
                                                        </c:when>
                                                        <c:when test="${not empty statu.accept and statu.accept}">
                                                            <c:choose>
                                                                <c:when test="${statu.closed}">
                                                                    <c:choose>
                                                                        <c:when test="${statu.result == 1}">
                                                                            <div class="row">
                                                                                <div class="col s6" style="color: #ACCC5F;">
                                                                                    Aprovado
                                                                                </div>
                                                                                <div class="col s6">
                                                                                    <a href="#" style="color: #ACCC5F;"><i class="fa fa-file-text-o" aria-hidden="true"></i> Ver revisão<span style="color: #6B6B6A;"> - 11/10/2017</span></a>
                                                                                </div>
                                                                            </div>
                                                                            <c:if test="${ilcd.homologation.status < 3}">
                                                                                <div class="row">
                                                                                    <div class="col s12">
                                                                                        <form action="<%=Strings.BASE%>/gestor/${ilcd.id}/nextstep" method="post">
                                                                                            <input type="hidden" name="status" value="${statu.id}" />
                                                                                            <input class="btn" type="submit" value="Ir para Revisão Técnica" />
                                                                                        </form>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="row">
                                                                                    <div class="col s12">
                                                                                        Caso não concorde com a Revisão “<span style="color: #ACCC5F;">aprovado</span>”
                                                                                    </div>
                                                                                </div>
                                                                                <div class="row" style="margin: 0;">
                                                                                    <div class="col s12">
                                                                                        <p style="margin: 0;">
                                                                                            <input class="with-gap" name="t1" value="1" type="radio" id="t1" />
                                                                                            <label for="t1">Convidar outro qualidata</label>
                                                                                        </p>  
                                                                                    </div>
                                                                                </div>
                                                                                <div class="row" style="margin: 0;">
                                                                                    <div class="col s12">
                                                                                        <p style="margin: 0;">
                                                                                            <input class="with-gap" name="t1" value="2" type="radio" id="t2" />
                                                                                            <label for="t2">Arquivar</label>
                                                                                        </p>  
                                                                                    </div>
                                                                                </div>
                                                                                <div class="row" style="margin: 0;">
                                                                                    <div class="col s12">
                                                                                        <p style="margin: 0;">
                                                                                            <input class="with-gap" name="t1" value="3" type="radio" id="t3" />
                                                                                            <label for="t3">Solicitar nova revisão</label>
                                                                                        </p>  
                                                                                    </div>
                                                                                </div>
                                                                            </c:if>
                                                                        </c:when>
                                                                        <c:when test="${statu.result == 2}">
                                                                            <div class="row">
                                                                                <div class="col s6" style="color: #00697C;">
                                                                                    Aprovado com correções
                                                                                </div>
                                                                                <div class="col s6">
                                                                                    <a href="#" style="color: #00697C;"><i class="fa fa-file-text-o" aria-hidden="true"></i> Ver revisão<span style="color: #6B6B6A;"> - 11/10/2017</span></a>
                                                                                </div>
                                                                            </div>
                                                                            <div class="row">
                                                                                <div class="col s12">
                                                                                    <a class="btn" href="<%=Strings.BASE%>/gestor/${ilcd.id}/sendauthor/${statu.id}">Enviar para Revisor</a>
                                                                                </div>
                                                                            </div>
                                                                            <div class="row">
                                                                                <div class="col s12">
                                                                                    Caso não concorde com a Revisão “<span style="color: #00697C;">Aprovado com correções</span>”
                                                                                </div>
                                                                            </div>
                                                                            <form action="" method="post">
                                                                                <div class="row" style="margin: 0;">
                                                                                    <div class="col s12">
                                                                                        <p style="margin: 0;">
                                                                                            <input class="with-gap" name="t1" value="1" type="radio" id="t1" />
                                                                                            <label for="t1">Convidar outro qualidata</label>
                                                                                        </p>  
                                                                                    </div>
                                                                                </div>
                                                                                <div class="row" style="margin: 0;">
                                                                                    <div class="col s12">
                                                                                        <p style="margin: 0;">
                                                                                            <input class="with-gap" name="t1" value="2" type="radio" id="t2" />
                                                                                            <label for="t2">Arquivar</label>
                                                                                        </p>  
                                                                                    </div>
                                                                                </div>
                                                                                <div class="row" style="margin: 0;">
                                                                                    <div class="col s12">
                                                                                        <p style="margin: 0;">
                                                                                            <input class="with-gap" name="t1" value="3" type="radio" id="t3" />
                                                                                            <label for="t3">Solicitar nova revisão</label>
                                                                                        </p>  
                                                                                    </div>
                                                                                </div>
                                                                                <div class="row" style="margin: 0;">
                                                                                    <div class="col s12">
                                                                                        <input class="btn" value="ENVIAR" type="submit" />  
                                                                                    </div>
                                                                                </div>
                                                                            </form>
                                                                        </c:when>
                                                                        <c:when test="${statu.result == 3}">
                                                                            <div class="row">
                                                                                <div class="col s6" style="color: #C3697C;">
                                                                                    Reprovado
                                                                                </div>
                                                                                <div class="col s6">
                                                                                    <a href="#" style="color: #C3697C;"><i class="fa fa-file-text-o" aria-hidden="true"></i> Ver revisão<span style="color: #6B6B6A;"> - 11/10/2017</span></a>
                                                                                </div>
                                                                            </div>
                                                                            <div class="row">
                                                                                <div class="col s12">
                                                                                    Caso não concorde com a Revisão “<span style="color: #C3697C;">reprovado</span>”
                                                                                </div>
                                                                            </div>
                                                                        </c:when>
                                                                    </c:choose>
                                                                </c:when>
                                                                <c:when test="${not statu.closed}">
                                                                    <div class="row" style="color: #00697C; margin: 10px 0;">
                                                                        Em revisão com <a href="#" style="color: #00697C; font-weight: bold; margin: 0 10px;">${statu.revisor.firstName}</a>
                                                                    </div>
                                                                </c:when>
                                                            </c:choose>
                                                        </c:when>
                                                    </c:choose>
                                                </c:when>
                                                <c:when test="${statu.type == 3}">
                                                    <c:choose>
                                                        <c:when test="${empty statu.endDate}">
                                                            <div class="row" style="color: #00697C; margin: 10px 0;">
                                                                Enviado para o autor <a href="#" style="color: #00697C; font-weight: bold; margin: 0 10px;">${ilcd.user.firstName}</a> em <fmt:formatDate value="${statu.requestDate}" pattern="dd/MM/yyyy"/>
                                                            </div>
                                                        </c:when>
                                                        <c:when test="${not empty statu.endDate}">
                                                            <div class="row" style="color: #00697C; margin: 10px 0;">
                                                                Envio do autor
                                                            </div>
                                                            <div class="row">
                                                                <div class="col s1">
                                                                    <i class="fa fa-angle-right" aria-hidden="true" style="color: #00697C;"></i>
                                                                </div>
                                                                <div class="col s4">
                                                                    <a href="#"><i class="fa fa-file-archive-o" style="margin-right: 5px;" aria-hidden="true"></i> ILCD.zip</a>
                                                                </div>
                                                                <div class="col offset-s1 s6">
                                                                    <a id="invite" href="<%=Strings.BASE%>/gestor/${ilcd.id}/invite?type=1" class="btn" title="Convidar Revisor" style="color: #fff; background-color: #00697C; border-radius: 5px; padding: 0 10px; text-transform: none; font-weight: bold; text-overflow: ellipsis; white-space: nowrap; overflow: hidden; width: 100%; min-width: 50px;">Convidar Revisor</a>
                                                                </div>
                                                            </div>
                                                        </c:when>
                                                    </c:choose>
                                                </c:when>
                                            </c:choose>
                                            <hr style="color: #6B6B6B;" />
                                        </div>
                                    </c:when>
                                </c:choose>
                            </c:forEach>
                        </div>
                        <div class="tab-pane" id="2">
                            <c:forEach var="statu" items="${status}"> 
                                <c:choose>
                                    <c:when test="${statu.type == 2}">
                                        <c:choose>
                                            <c:when test="${empty statu.revisor}">
                                                <div class="row" style="color: #00697C; margin: 10px 0;">
                                                    Envio do autor
                                                </div>
                                                <div class="row">
                                                    <div class="col s1">
                                                        <i class="fa fa-angle-right" aria-hidden="true" style="color: #00697C;"></i>
                                                    </div>
                                                    <div class="col s4">
                                                        <a href="#"><i class="fa fa-file-archive-o" style="margin-right: 5px;" aria-hidden="true"></i> ILCD.zip</a>
                                                    </div>
                                                    <div class="col offset-s1 s6">
                                                        <a id="invite" href="<%=Strings.BASE%>/gestor/${ilcd.id}/invite?type=2" class="btn" title="Convidar Revisor" style="color: #fff; background-color: #00697C; border-radius: 5px; padding: 0 10px; text-transform: none; font-weight: bold; text-overflow: ellipsis; white-space: nowrap; overflow: hidden; width: 100%; min-width: 50px;">Convidar Revisor</a>
                                                    </div>
                                                </div>
                                            </c:when>
                                            <c:when test="${not empty statu.revisor}">
                                                <c:choose>
                                                    <c:when test="${empty statu.accept}">
                                                        <div class="row" style="color: #00697C; margin: 10px 0;">
                                                            Enviado para  <a href="#" style="color: #00697C; font-weight: bold; margin: 0 10px;">${statu.revisor.firstName}</a> <a href="#" style="color:#6B6B6A;text-decoration: underline;">Cancelar Convite</a>
                                                        </div>
                                                        <hr />
                                                    </c:when>
                                                    <c:when test="${not empty statu.accept and not statu.accept}">
                                                        <div class="row" style="color: #00697C; margin: 10px 0;">
                                                            <a href="#" style="color: #00697C; font-weight: bold; margin: 0 10px;">${statu.revisor.firstName}</a> recusou o convite.
                                                        </div>
                                                        <hr />
                                                    </c:when>
                                                    <c:when test="${not empty statu.accept and statu.accept}">
                                                        <c:choose>
                                                            <c:when test="${statu.closed}">
                                                                <c:choose>
                                                                    <c:when test="${statu.result == 1}">
                                                                        <div class="row">
                                                                            <div class="col s6" style="color: #ACCC5F;">
                                                                                Aprovado
                                                                            </div>
                                                                            <div class="col s6">
                                                                                <a href="#" style="color: #ACCC5F;"><i class="fa fa-file-text-o" aria-hidden="true"></i> Ver revisão<span style="color: #6B6B6A;"> - 11/10/2017</span></a>
                                                                            </div>
                                                                        </div>
                                                                        <div class="row">
                                                                            <div class="col s12">
                                                                                <a href="<%=Strings.BASE%>/gestor/${ilcd.id}" class="btn">Ir para Publicação</a>
                                                                            </div>
                                                                        </div>
                                                                        <div class="row">
                                                                            <div class="col s12">
                                                                                Caso não concorde com a Revisão “<span style="color: #ACCC5F;">aprovado</span>”
                                                                            </div>
                                                                        </div>
                                                                        <div class="row" style="margin: 0;">
                                                                            <div class="col s12">
                                                                                <p style="margin: 0;">
                                                                                    <input class="with-gap" name="t1" value="1" type="radio" id="t1" />
                                                                                    <label for="t1">Convidar outro qualidata</label>
                                                                                </p>  
                                                                            </div>
                                                                        </div>
                                                                        <div class="row" style="margin: 0;">
                                                                            <div class="col s12">
                                                                                <p style="margin: 0;">
                                                                                    <input class="with-gap" name="t1" value="2" type="radio" id="t2" />
                                                                                    <label for="t2">Arquivar</label>
                                                                                </p>  
                                                                            </div>
                                                                        </div>
                                                                        <div class="row" style="margin: 0;">
                                                                            <div class="col s12">
                                                                                <p style="margin: 0;">
                                                                                    <input class="with-gap" name="t1" value="3" type="radio" id="t3" />
                                                                                    <label for="t3">Solicitar nova revisão</label>
                                                                                </p>  
                                                                            </div>
                                                                        </div>
                                                                    </c:when>
                                                                    <c:when test="${statu.result == 2}">
                                                                        <div class="row">
                                                                            <div class="col s6" style="color: #00697C;">
                                                                                Aprovado com correções
                                                                            </div>
                                                                            <div class="col s6">
                                                                                <a href="#" style="color: #00697C;"><i class="fa fa-file-text-o" aria-hidden="true"></i> Ver revisão<span style="color: #6B6B6A;"> - 11/10/2017</span></a>
                                                                            </div>
                                                                        </div>
                                                                        <div class="row">
                                                                            <div class="col s12">
                                                                                Caso não concorde com a Revisão “<span style="color: #00697C;">Aprovado com correções</span>”
                                                                            </div>
                                                                        </div>
                                                                    </c:when>
                                                                    <c:when test="${statu.result == 3}">
                                                                        <div class="row">
                                                                            <div class="col s6" style="color: #C3697C;">
                                                                                Reprovado
                                                                            </div>
                                                                            <div class="col s6">
                                                                                <a href="#" style="color: #C3697C;"><i class="fa fa-file-text-o" aria-hidden="true"></i> Ver revisão<span style="color: #6B6B6A;"> - 11/10/2017</span></a>
                                                                            </div>
                                                                        </div>
                                                                        <div class="row">
                                                                            <div class="col s12">
                                                                                Caso não concorde com a Revisão “<span style="color: #C3697C;">reprovado</span>”
                                                                            </div>
                                                                        </div>
                                                                    </c:when>
                                                                </c:choose>
                                                            </c:when>
                                                            <c:when test="${not statu.closed}">
                                                                <div class="row" style="color: #00697C; margin: 10px 0;">
                                                                    Em revisão com <a href="#" style="color: #00697C; font-weight: bold; margin: 0 10px;">${statu.revisor.firstName}</a>
                                                                </div>
                                                            </c:when>
                                                        </c:choose>
                                                    </c:when>
                                                </c:choose>
                                            </c:when>
                                        </c:choose>
                                    </c:when>
                                </c:choose>
                            </c:forEach>
                        </div>
                        <div class="tab-pane" id="3">
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
                //activaTab(2);
                $("#abas1").on("click", function () {
                    console.log(Object.keys($("#1")).length);
                    //$('#invite').attr("href", "<%=Strings.BASE%>/gestor/${ilcd.id}/invite?type=1");
                });
                $("#abas2").on("click", function () {
                    if (Object.keys($("#2")).length === 0) {
                        $('.tab-content').append('<div class="tab-pane" id="2"></div>');
                    }
                    //$('#invite').attr("href", "<%=Strings.BASE%>/gestor/${ilcd.id}/invite?type=2");
                });
            });
            function activaTab(tab) {
                $('.nav-tabs a[href="#' + tab + '"]').tab('show');
            }
            ;
        </script>
    </body>

</html>