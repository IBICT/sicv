<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@page import="resources.Strings"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">

    <head>
        <meta charset="UTF-8">
        <title>Home</title>
        <link href="<%=Strings.BASE%>/assets/bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="<%=Strings.BASE%>/assets/materialize/css/materialize.min.css">
        <link rel="stylesheet" href="<%=Strings.BASE%>/assets/steps.css">
        <link href="https://fonts.googleapis.com/css?family=Titillium+Web" rel="stylesheet">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
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
        </style>

    </head>

    <body>
        <jsp:include page="/WEB-INF/jsp/partials/nav.jsp" />
        <div class="headerDiv">
            <jsp:include page="/WEB-INF/jsp/partials/header.jsp" />
        </div>



        <div class="row sicv-container">
            <h4 class="page-title">Gestão</h4>
        </div>

        <div class="sicv-container sicv-inventori-table">
            <div class="row">
                <h6 style="color:#4dbcc4;">Invéntarios em andamento</h6>
                <input style="float: right;" type="text" />
            </div>
            <div style="margin:0px;" class="row">
                <div class="col s3 sicv-table-th">Id</div>
                <div class="col s3 sicv-table-th">Nome</div>
                <div class="col s1 sicv-table-th" style="text-align: center;">Pendências</div>
                <div class="col s2 sicv-table-th" style="text-align: center;">Prazo para entregar</div>
                <div class="col s3" style="position: relative; left: 20px; color: #4dbcc4;">Status</div>
            </div>
            <c:forEach var="ilcd" items="${ilcds}"> 
                <div style="margin:0px;" class="row" onclick="window.location = '<%=Strings.BASE%>/gestor/${ilcd.id}';">
                    
                    <div style="height: 40px; position: relative; top: 10px;" class="col s3 sicv-table-td">${ilcd.uuid}</div>
                    <div style="height: 40px; position: relative; top: 10px;" class="col s3 sicv-table-td">${ilcd.title}</div>
                    <div style="height: 40px; text-align: center; position: relative; top: 10px;" class="col s1 sicv-table-td"><i style="color: #c3697c;" class="material-icons">report_problem</i></div>
                    <div style="height: 40px;  text-align: center; position: relative; top: 10px; color: #c3697c;" class="col s2 sicv-table-td">Atrasado</div>
                    <div style="height: 40px;" class="col s3">
                        <!-- Progress Tracker v2 -->
                        <ol style="position: relative;" class="progress-steps"
                            data-steps="5">
                            <li class="${ilcd.homologation.status == 1 ? 'active' : 'done'}">
                                <span class="step"><span>1</span></span>
                            </li>

                            <c:choose>
                                <c:when test="${ilcd.homologation.status == 2}">
                                    <li class="active"><span class="step"><span>2</span></span>
                                    </li>
                                </c:when>
                                <c:otherwise>
                                    <li class="${ilcd.homologation.status lt 2 ? '' : 'done'}">
                                        <span class="step"><span>2</span></span>
                                    </li>
                                </c:otherwise>
                            </c:choose>
                            <c:choose>
                                <c:when test="${ilcd.homologation.status == 3}">
                                    <li class="active"><span class="step"><span>3</span></span>
                                    </li>
                                </c:when>
                                <c:otherwise>
                                    <li class="${ilcd.homologation.status lt 3 ? '' : 'done'}">
                                        <span class="step"><span>3</span></span>
                                    </li>
                                </c:otherwise>
                            </c:choose>
                            <c:choose>
                                <c:when test="${ilcd.homologation.status == 4}">
                                    <li class="active"><span class="step"><span>4</span></span>
                                    </li>
                                </c:when>
                                <c:otherwise>
                                    <li class="${ilcd.homologation.status lt 4 ? '' : 'done'}">
                                        <span class="step"><span>4</span></span>
                                    </li>
                                </c:otherwise>
                            </c:choose>
                            <c:choose>
                                <c:when test="${ilcd.homologation.status == 5}">
                                    <li class="active"><span class="step"><span>5</span></span>
                                    </li>
                                </c:when>
                                <c:otherwise>
                                    <li class="${ilcd.homologation.status lt 5 ? '' : 'done'}">
                                        <span class="step"><span>5</span></span>
                                    </li>
                                </c:otherwise>
                            </c:choose>

                        </ol>
                        <!-- Progress Tracker v2 -->
                    </div>
                </div>
            </c:forEach>
<!--            
            <div style="margin:0px;" class="row">
                <div style="height: 40px; position: relative; top: 10px;" class="col s3 sicv-table-td">266c5da8-55bc-4d58-a4af-cbf7724f7939</div>
                <div style="height: 40px; position: relative; top: 10px;" class="col s3 sicv-table-td">Phenol from cumene production mix, at producer</div>
                <div style="height: 40px; text-align: center; position: relative; top: 10px;" class="col s1 sicv-table-td"><i style="color: #c3697c;" class="material-icons">report_problem</i></div>
                <div style="height: 40px;  text-align: center; position: relative; top: 10px;" class="col s2 sicv-table-td">5 dias</div>
                <div style="height: 40px;" class="col s3">
                    <ol style="position: relative; top: -10px;" class="progress-steps" data-steps="5">
                        <li class="active">
                            <span class="step"><span>1</span></span>
                        </li>
                        <li>
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
                </div>
            </div>
            <div style="margin:0px;" class="row">
                <div style="height: 40px; position: relative; top: 10px;" class="col s3 sicv-table-td">266c5da8-55bc-4d58-a4af-cbf7724f7939</div>
                <div style="height: 40px; position: relative; top: 10px;" class="col s3 sicv-table-td">Phenol from cumene production mix, at producer</div>
                <div style="height: 40px; text-align: center; position: relative; top: 10px;" class="col s1 sicv-table-td"><i style="color: #c3697c;" class="material-icons">report_problem</i></div>
                <div style="height: 40px;  text-align: center; position: relative; top: 10px; color: #c3697c;" class="col s2 sicv-table-td">Atrasado</div>
                <div style="height: 40px;" class="col s3">
                     Progress Tracker v2 
                    <ol style="position: relative; top: -10px;" class="progress-steps" data-steps="5">
                        <li class="done">
                            <span class="step"><span>1</span></span>
                        </li>
                        <li class="done">
                            <span class="step"><span>2</span></span>
                        </li>
                        <li class="done">
                            <span class="step"><span>3</span></span>
                        </li>
                        <li class="done">
                            <span class="step"><span>4</span></span>
                        </li>
                        <li class="active">
                            <span class="step"><span>5</span></span>
                        </li>
                    </ol>
                     Progress Tracker v2 
                </div>
            </div>
            <div style="margin:0px;" class="row">
                <div style="height: 40px; position: relative; top: 10px;" class="col s3 sicv-table-td">266c5da8-55bc-4d58-a4af-cbf7724f7939</div>
                <div style="height: 40px; position: relative; top: 10px;" class="col s3 sicv-table-td">Phenol from cumene production mix, at producer</div>
                <div style="height: 40px; text-align: center; position: relative; top: 10px;" class="col s1 sicv-table-td"><i style="color: #accc5f;" class="material-icons">check</i></div>
                <div style="height: 40px;  text-align: center; position: relative; top: 10px;" class="col s2 sicv-table-td">Entregue</div>
                <div style="height: 40px;" class="col s3">
                     Progress Tracker v2 
                    <ol style="position: relative; top: -10px;" class="progress-steps" data-steps="5">
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
                     Progress Tracker v2 
                </div>
            </div>
            -->
        </div>

        <script type="application/javascript" src="<%=Strings.BASE%>/assets/jquery-3.2.1.min.js"></script>
        <script type="application/javascript" src="<%=Strings.BASE%>/assets/materialize/js/materialize.min.js"></script>
        <script>
            $(document).ready(function () {
                // the "href" attribute of the modal trigger must specify the modal ID that wants to be triggered
                $('.modal').modal();

            });
        </script>
    </body>

</html>