<%@page import="br.com.ibict.acv.sicv.model.Status"%>
<%@page import="br.com.ibict.acv.sicv.model.Homologacao"%>
<%@page import="java.util.Calendar"%>
<%@page import="br.com.ibict.acv.sicv.model.Ilcd"%>
<%@page import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@page import="resources.Strings"%>
<%@page import="br.com.ibict.acv.sicv.model.User"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String base = Strings.BASE;
    pageContext.setAttribute("base", base);
%>
<c:set var="link" value="${base}/authorIlcd" />
<sec:authorize access="hasAuthority('USER')" var="isUser" />

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
        <link rel="stylesheet" href="<%=Strings.BASE%>/assets/font/font-awesome/css/font-awesome.min.css">
        <link rel="stylesheet" href="<%=Strings.BASE%>/assets/css/fonts.css">
        <link rel="stylesheet" href="<%=Strings.BASE%>/assets/steps.css">

        <style>
            html {
                font-family: 'TitilliumWeb-Regular', sans-serif !important;
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
            .h5-text{
                color:#4dbcc4;
                margin: 15px 20px 0 20px;
            }
            .h6-text{
                color:#61615F;
                margin-left: 20px;
                margin-bottom: 20px;

            }
            
        </style>
    </head>

    <body>

        <jsp:include page="/WEB-INF/jsp/partials/header.jsp" />


        <div class="principalDiv">

            <h4 class="page-title">Revisão Qualidata</h4>

            <c:if test="${not empty invite}">
                <div class="row sicv-container" style="padding-top:10px;background-color: #d7eef0; width: 75%; float: left;">
                    <h5 class="h5-text">Aguardando confirmação ou cancelamento</h5>
                    <h6 class="h6-text">Confirme sua participação como revisor e acompanhe os inventários que lhe foram atribuidos para realizar a revisão de Qualidade</h6>
                    <c:forEach var="status1" items="${invite}" varStatus="loop"> 
                        <div class="row">
                            <a class="" style="margin:0 20px;color:#00728a;" href="<%=Strings.BASE%>/qualityreview/${status1.id}">${status1.ilcd.title}<i style="color: #c3697c; margin-left: 10px;" class="fa fa-eye"></i></a>
                        </div>
                        <hr ${loop.last ? 'hidden' : ''} style="border:solid 0.5px #FFFFFF; width:875px;">
                    </c:forEach>
                </div>
            </c:if>

            <br />

            <!--Lista de revisões-->
            <c:if test="${not empty work}">

                <div class="row">
                    <div class="col s12">
                        <h6 style="color:#4dbcc4;font-weight: bold;">Histórico de Revisões Qualidata</h6>
                    </div>	
                </div>
                <div class="row">
                    <div style="margin:0px;" class="row">
                        <div class="col s2 sicv-table-th">Autor</div>
                        <div class="col s4 sicv-table-th">Nome</div>
                        <div class="col s2 sicv-table-th">Gestor</div>
                        <div class="col s2 sicv-table-th">Pendências</div>
                        <div class="col s2 sicv-table-th">Prazo para entregar</div>
                    </div>
                    <c:forEach var="status2" items="${work}">
                        <div style="cursor:pointer; margin:0px;" class="row" onclick="window.location = '<%=Strings.BASE%>/qualityreview/${status2.id}';">
                            <div style="height: 40px; position: relative; top: 10px;" class="col s2 sicv-table-td">
                                ${status2.ilcd.user.firstName}
                            </div>
                            <div style="padding: 10px;text-overflow: ellipsis; white-space: nowrap; overflow: hidden; height: 40px; position: relative; top: 10px; " class="col s4 sicv-table-td">
                                <div title="${status2.ilcd.title}" style="width: 75%;text-overflow: ellipsis; white-space: nowrap; overflow: hidden;">${status2.ilcd.title}</div>
                            </div>
                            <div style="height: 40px; position: relative; top: 10px;" class="col s2 sicv-table-td">
                                ${status2.ilcd.homologation.user.firstName}
                            </div>
                            <div style="height: 40px; position: relative; top: 10px;" class="col s2 sicv-table-td">
                                <c:choose>
                                    <c:when test="${empty status2.endDate}">
                                        <i style="color: #c3697c;" class="fa fa-exclamation-triangle"></i>
                                    </c:when>
                                    <c:when test="${not empty status2.endDate}">
                                        <i style="color: #accc5f;" class="fa fa-check"></i>
                                    </c:when>
                                </c:choose>

                            </div>
                            <div style="height: 40px; position: relative; top: 10px;" class="col s2 sicv-table-td">
                                <%
                                    Status status = (Status) pageContext.getAttribute("status2");
                                    Calendar cal = Calendar.getInstance();
                                    cal.setTime(status.getRequestDate());
                                    int dtInit = cal.get(Calendar.DAY_OF_YEAR);
                                    cal.setTime(status.getExpectedDate());
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
                                ${prazo}
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </c:if>
            <!--Lista de revisões-->

            <script type="application/javascript" src="<%=Strings.BASE%>/assets/jquery-3.2.1.min.js"></script>
            <script type="application/javascript" src="<%=Strings.BASE%>/assets/materialize/js/materialize.min.js"></script>
            <c:if test="${not empty teste}">
                <c:forEach var="contato" items="${teste}"> 
                    ${contato}
                </c:forEach>
            </c:if>

        </div>

        <script type="application/javascript" src="<%=Strings.BASE%>/assets/jquery-3.2.1.min.js"></script>
        <script type="application/javascript" src="<%=Strings.BASE%>/assets/materialize/js/materialize.min.js"></script>
    </body>

</html>