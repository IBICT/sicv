<%@page import="java.util.Calendar"%>
<%@page import="br.com.ibict.acv.sicv.model.Ilcd"%>
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
        <link rel="stylesheet" href="<%=Strings.BASE%>/assets/materialize/css/materialize.css">
        <link rel="stylesheet" href="<%=Strings.BASE%>/assets/font/font-awesome/css/font-awesome.min.css">
        <link rel="stylesheet" href="<%=Strings.BASE%>/assets/steps.css">
        <link rel="stylesheet" href="<%=Strings.BASE%>/assets/css/fonts.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <style>
            html {
                font-family: 'Titillium Web', "Roboto", sans-serif;
            }

            .page-title {
                color: #4dbcc4;
            }
            .page-subtitle {
                color: #666;
            }
            .btn-import {
                background-color: #accc5f;
            }
            .table {
                width: 100% !important;
                max-width: 100%;
            }
            .head {
                color: #999;
            }
            .sicv-table-th {
                color: #4dbcc4;
                border-bottom: 1px solid silver;
                /*border-top: 1px solid silver;*/
                padding: 0 !important;
                height: 30px;
            }

            .sicv-table-td {
                border-bottom: 1px solid silver;
                color: #999;
                padding: 0 !important;
            }

            .search {
                width: 300px;
                position: relative
            }

            .searchTerm {

                float: left;
                width: 100%;
                height: 32px;
                border: 1px solid #00B4CC;
                padding: 5px;
                border-radius: 5px;
                outline: none;
                color: #9DBFAF;
            }

            .searchTerm:focus{
                color: #00B4CC;
            }

            .searchButton {
                position: absolute;  
                right: -35px;
                width: 40px;
                height: 32px;
                border: 1px solid #00B4CC;
                border-left: 0;
                background: #fff;
                text-align: center;
                color: #00697C;
                border-radius: 5px;
                border-top-left-radius: 0;
                border-bottom-left-radius: 0;
                cursor: pointer;
                font-size: 20px;
            }

            .list-ilcd-item:hover{
                cursor: pointer;
                background-color: #EBF4F5;
            }

        </style>

    </head>

    <body>
        <jsp:include page="/WEB-INF/jsp/partials/header.jsp" />


        <div class="principalDiv">
            <div class="row sicv-container">
                <h4 class="page-title">Gestão</h4>
            </div>

            <div class="row">
                <div style="margin-right: 5%; float: right;">
                    <div class="search">
                        <input type="text" class="searchTerm" id="searchTerm" placeholder="busque autor, gestor, título">
                        <button type="submit" class="searchButton">
                            <i class="fa fa-search"></i>
                        </button>
                    </div>
                </div>
            </div>

            <div style="margin:0px;" class="row">
                <div class="col sicv-table-th" style="width: 10%">Autor</div>
                <div class="col sicv-table-th" style="width: 30%">Nome</div>
                <div class="col sicv-table-th" style="width: 10%">Gestor</div>
                <div class="col s1 sicv-table-th" style="text-align: center;">Pendências</div>
                <div class="col s2 sicv-table-th" style="text-align: center;">Prazo para entregar</div>
                <div class="col s3" style="position: relative; left: 20px; color: #4dbcc4;">Status</div>
            </div>

            <c:forEach items="${ilcds}" var="ilcd" varStatus="loop">
                <div style="margin:0px;" class="row tabIlcdManager list-ilcd-item" onclick="window.location = '<%=Strings.BASE%>/gestor/${ilcd.id}';">
                    <div style="height: 40px; width:10%; position: relative; top: 10px;" class="col s3 sicv-table-td">
                        ${ilcd.user.firstName}
                    </div>
                    <div style="height: 40px; width:30%; position: relative; top: 10px;" class="col s3 sicv-table-td">
                        ${ilcd.name}
                    </div>
                    <div style="height: 40px;width:10%; position: relative; top: 10px;" class="col s3 sicv-table-td">
                        ${ilcd.homologation.user.firstName == null ? "aguardando":ilcd.homologation.user.firstName}
                    </div>
                    <c:choose>
                       	<c:when test="${ilcd.homologation.pending}">
                            <!-- <td style="text-align: center;"><i style="color: #c3697c;" class="material-icons">report_problem</i></td>
                                <td style="text-align: center;"><i style="color: #accc5f;" class="material-icons">check</i></td>
                            -->
                            <div style="height: 40px; text-align: center; position: relative; top: 10px;" class="col s1 sicv-table-td" onclick="location.href = '#'">
                                <i style="color: #c3697c;" class="fa fa-exclamation-triangle"></i>
                            </div>
                            <%

                                Ilcd ilcd = (Ilcd) pageContext.getAttribute("ilcd");
                                Calendar cal = Calendar.getInstance();
                                cal.setTime(ilcd.getHomologation().getSubmission());
                                int dtInit = cal.get(Calendar.DAY_OF_YEAR);
                                cal.setTime(ilcd.getHomologation().getPrazo());
                                int dtLimit = cal.get(Calendar.DAY_OF_YEAR);
                                String resporta;
                                Boolean style;
                                if ((dtLimit - dtInit) < 0) {
                                    resporta = "atrasado";
                                    style = true;
                                } else {
                                    resporta = (dtLimit - dtInit) + " dias";
                                    style = false;
                                }
                                pageContext.setAttribute("prazoStyle", style);
                                pageContext.setAttribute("prazo", resporta);
                            %>
                            <div style="height: 40px;  text-align: center; position: relative; top: 10px; ${prazoStyle ? "color: #c3697c;":""}" class="col s2 sicv-table-td">
                                ${prazo}
                            </div>
                       	</c:when>
                       	<c:when test="${not ilcd.homologation.pending}">
                            <div style="height: 40px; text-align: center; position: relative; top: 10px;" class="col s1 sicv-table-td" onclick="location.href = '#'">
                                <i style="color: #accc5f;" class="fa fa-check"></i>
                            </div> 
                            <div style="height: 40px;  text-align: center; position: relative; top: 10px; color: #accc5f;" class="col s2 sicv-table-td">
                                Entregue
                            </div>
                       	</c:when>
                       	<c:otherwise>
                       	</c:otherwise>
                    </c:choose>

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

        </div>

        <script type="application/javascript" src="<%=Strings.BASE%>/assets/jquery-3.2.1.min.js"></script>
        <script type="application/javascript" src="<%=Strings.BASE%>/assets/materialize/js/materialize.min.js"></script>
        <script>
                                $(document).ready(function () {
                                    // the "href" attribute of the modal trigger must specify the modal ID that wants to be triggered
                                    $('.modal').modal();

                                    $("#searchTerm").on("keyup", function () {
                                        var value = $(this).val().toLowerCase();
                                        $(".tabIlcdManager ").filter(function () {
                                            $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                                        });
                                    });
                                });
        </script>
    </body>

</html>
