<%--
    Document   : homologacao
    Created on : 11/05/2017, 09:48:46
    Author     : Deivdy.Silva
--%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page import="br.com.ibict.acv.sicv.helper.URLHelper"%>
<%@page import="br.com.ibict.acv.sicv.model.User"%>
<%@page import="resources.Strings"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="/WEB-INF/jsp/partials/styles.jsp" />
        <style>
            .table.bordered tbody tr td:first-child {
                background-color: #BDC3C7;
                font-weight: bold;
            }
            html, body {
                height: 100%;
            }
            body {
            }
            .page-content {
                padding-top: 3.125rem;
                min-height: 100%;
                height: 100%;
            }
            .table .input-control.checkbox {
                line-height: 1;
                min-height: 0;
                height: auto;
            }
            @media screen and (max-width: 800px){
                #cell-sidebar {
                    flex-basis: 52px;
                }
                #cell-content {
                    flex-basis: calc(100% - 52px);
                }
            }
        </style>
    </head>
    <body class="bg-steel">
        <jsp:include page="/WEB-INF/jsp/partials/header.jsp" />
        <div class="page-content">
            <div class="flex-grid no-responsive-future" style="height: 100%;">
                <div class="row" style="height: 100%">
                    <div class="cell size-x200" id="cell-sidebar" style="background-color: #71b1d1; height: 100%">
                        <ul class="sidebar">
                            <li><a href="#">
                                    <span class="mif-apps icon"></span>
                                    <span class="title">TODOS OS ITENS</span>
                                    <span class="counter">0</span>
                                </a></li>
                            <li><a href="#">
                                    <span class="mif-database icon"></span>
                                    <span class="title">ILCD Bases</span>
                                    <span class="counter">0</span>
                                </a></li>
                            <li><a href="#">
                                    <span class="mif-file-binary icon"></span>
                                    <span class="title">ILCD</span>
                                    <span class="counter">0</span>
                                </a></li>
                            <li><a href="#">
                                    <span class="mif-user icon"></span>
                                    <span class="title">USUÁRIO</span>
                                    <span class="counter">0</span>
                                </a></li>
                            <li><a href="#">
                                    <span class="mif-apps icon"></span>
                                    <span class="title">TODOS OS ITENS</span>
                                    <span class="counter">0</span>
                                </a></li>
                        </ul>
                    </div>
                    <div class="cell auto-size padding20 bg-white" id="cell-content">
                        <h1 class="text-light">Homologação</h1>
                        <hr class="thin bg-grayLighter" />
                        <c:choose>
                            <c:when test="${ilcd.getHomologacao().getStatus() > 1}">
                                <a href="<%=Strings.BASE%>/admin/homologacao/${ilcd.getId()}/qualidata" class="button warning">Qualidata</a>
                            </c:when>    
                            <c:otherwise>
                                <a href="<%=Strings.BASE%>/admin/homologacao/${ilcd.getId()}/accept" class="button warning">Aceitar</a>
                                <a href="<%=Strings.BASE%>/admin/homologacao/${ilcd.getId()}/refused" class="button danger">Recusar</a>
                            </c:otherwise>
                        </c:choose>

                        <a href="<%=Strings.BASE%>/ilcd/${ilcd.getPathFile()}" class="button success">Download</a>


                        <table class="table border bordered">

                            <tbody>
                                <tr>
                                    <td>Nome</td><td>${ilcd.getName()}</td>
                                </tr>
                                <tr>
                                    <td>Localização</td><td>${ilcd.getLocation()}</td>
                                </tr>
                                <tr>
                                    <td>Classificação</td><td>${ilcd.getClasification()}</td>
                                </tr>
                                <tr>
                                    <td>Criado por</td><td><a href="#">${ilcd.getUser().getUserName()}</a></td>
                                </tr>
                            </tbody>

                        </table>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="/WEB-INF/jsp/partials/scriptsLibs.jsp" />
        <script src="<%=Strings.BASE%>/assets/metro-ui3.0.17/js/jquery.dataTables.min.js"></script>
        <script>

            $(function () {
                $('.sidebar').on('click', 'li', function () {
                    if (!$(this).hasClass('active')) {
                        $('.sidebar li').removeClass('active');
                        $(this).addClass('active');
                    }
                })
            })
        </script>
    </body>
</html>
</html>