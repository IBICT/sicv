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
            .container {
                width: 97%;
            }
        </style>
    </head>

    <body>

        <jsp:include page="/WEB-INF/jsp/partials/header.jsp" />
        <c:if test="${msg == 'success'}">
            <div id="modalProfileSuccess" class="modal" style="width: 570px;height: 206px">
                <div class="">
                    <div style="text-align: center;font-size: 23px; color: #4F4F4F; margin-top: 50px;">
                        <p>Perfil de Usuário atualizado com sucesso!</p>
                        <p></p>
                    </div>
                    <div style="text-align: center;">
                        <button style="background-color: #ACCC5F;" class="modal-action modal-close waves-effect btn-flat">OK</button>
                    </div>
                </div>
            </div>
        </c:if>
        <div class="principalDiv">
            <c:choose>
                <c:when test="${isUserLabel}">
                    <h4 class="page-title">Meus inventários</h4>
                    <p class="page-description page-subtitle"><i>Envie seu inventário e acompanhe o processo. Você receberá notificações no sistema e no e-mail cadastrado sempre que o status sofrer alterações</i></p>
                    <br>
                    <c:if test="${not isManager}">
                        <a class="btn-import waves-effect waves-light btn modal-trigger" href="<%=Strings.BASE%>/ilcd/new">Submeter Inventário</a>
                    </c:if>
                    <br><br>

                    <h6 style="color:#4dbcc4;font-weight: bold;">Invéntarios em andamento</h6>	
                </c:when>
                <c:otherwise>
                    <c:set var="link" value="${base}/manager/authorIlcd" />
                    <h4 class="page-title">Gestão</h4>
                    <br><br>
                </c:otherwise>
            </c:choose>

            <div class="hide-on-med-and-down">
                <div style="margin:0px;" class="row">
                    <div class="col sicv-table-th" style="width: 40%">Nome</div>
                    <div class="col sicv-table-th" style="width: 10%">Gestor</div>
                    <div class="col s1 sicv-table-th" style="text-align: center;">Pendências</div>
                    <div class="col s2 sicv-table-th" style="text-align: center;">Prazo para entregar</div>
                    <div class="col s3" style="position: relative; left: 20px; color: #4dbcc4;">Status</div>
                </div>

                <c:forEach items="${ilcds}" var="ilcd" varStatus="loop">
                    <div style="margin:0px;" class="row">
                        <div style="height: 40px; width:40%; position: relative; top: 10px;" class="col s3 sicv-table-td">
                            <a href="${link}/${ilcd.id}">${ilcd.title}</a>
                        </div>
                        <div style="height: 40px;width:10%; position: relative; top: 10px;" class="col s3 sicv-table-td">
                            <a href="${link}/${ilcd.id}">${ilcd.homologation.user.firstName == null ? "aguardando":ilcd.homologation.user.firstName}</a>
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
            <div class="hide-on-large-only">
                <ul class="collapsible">
                    <c:forEach items="${ilcds}" var="ilcd" varStatus="loop">
                        <li>
                            <div class="collapsible-header" style="color: #00697C; font-weight: bold;">${ilcd.title}</div>
                            <div class="collapsible-body">
                                <div class="row">
                                    <div style="height: 40px;" class="col s12">
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
                                <div class="row">
                                    <div class="col s12">
                                        <samp style="color: #4DBCC4;">Gestor</samp><br />
                                        <samp><a href="${link}/${ilcd.id}">${ilcd.homologation.user.firstName == null ? "aguardando":ilcd.homologation.user.firstName}</a></samp>
                                    </div>
                                </div>
                                <c:choose>
                                    <c:when test="${ilcd.homologation.pending}">
                                        <div class="row">
                                            <div class="col s12">
                                                <samp style="color: #4DBCC4;">Pendências</samp><br />
                                                <samp><i style="color: #c3697c;" class="fa fa-exclamation-triangle"></i> Aguardando nova aprovação</samp>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col s12">
                                                <samp style="color: #4DBCC4;">Pendências</samp><br />
                                                <samp style="${prazoStyle ? "color: #c3697c;":""}">${prazo}</samp>
                                            </div>
                                        </div>
                                    </c:when>
                                    <c:when test="${not ilcd.homologation.pending}">
                                        <div class="row">
                                            <div class="col s12">
                                                <samp style="color: #4DBCC4;">Pendências</samp><br />
                                                <samp><i style="color: #accc5f;" class="fa fa-check"></i></samp>
                                            </div>  
                                        </div>
                                        <div class="row">
                                            <div class="col s12">
                                                <samp style="color: #4DBCC4;">Pendências</samp><br />
                                                <samp style="color: #accc5f;">Entregue</samp>
                                            </div>
                                        </div>
                                    </c:when>
                                    
                                </c:choose>
                            </div>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
        <script type="application/javascript" src="<%=Strings.BASE%>/assets/jquery-3.2.1.min.js"></script>
        <script type="application/javascript" src="<%=Strings.BASE%>/assets/materialize/js/materialize.min.js"></script>
        <script type="text/javascript">
                                    $(document).ready(function () {
                                        $('.modal').modal();
                                        $('#modalProfileSuccess').modal('open');
                                        $('.collapsible').collapsible();
                                    });
        </script>
    </body>

</html>