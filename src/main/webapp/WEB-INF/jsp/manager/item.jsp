<%-- 
    Document   : home
    Created on : 11/05/2017, 09:48:46
    Author     : Deivdy.Silva
--%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="br.com.ibict.acv.sicv.model.Status"%>
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

                </div>
                <hr />

                <div class="col s6">
		            <div style="padding-bottom: 2%;">
		                <h5>Autor correpondente</h5>
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
	                <h6 class="bold">Categoria</h6>
	                <p>${ilcd.category}</p>
	                <br>
	                <h6 class="bold">Descrição</h6>
	                <p>${ilcd.description}</p>
                
           		</div>
                <div class="col s6">
                    <div class="row">
                        <button style="background-color:#27bec3;" onclick="invite(1)" class="btn col s3">Convidar Q +</button>
                        <button style="background-color:#27bec3;" onclick="invite(2)" class="btn col s3">Convidar T+</button>
                        <!--                        <a href="#modal1" style="background-color:#27bec3;" class="btn col s3 modal-trigger">Convidar Q +</a>
                                                <a href="#modal1" style="background-color:#27bec3;" class="btn col s3 modal-trigger">Convidar T+</a>-->
                    </div>
                    <hr />

                    <c:forEach var="statu" items="${status}"> 

                        <c:choose>

                            <c:when test="${statu.type == 0}">
                                <h5 style="color:#7c7c7c;">Envio do autor</h5>
                                <div class="row">
                                    <div class="col s3"><a href="<%=Strings.BASE%>/ilcd/${statu.archive.pathFile}"><i style="color:#006b7b;" class="medium material-icons">insert_drive_file</i>ILCD.zip</a></div>
                                </div>
                            </c:when>

                            <c:when test="${statu.type == 1}">
                                <h5 style="color:#7c7c7c;">Revisões Qualidata</h5>
                                <div class="row">
                                    <div class="col s6">${statu.revisor.firstName} ${statu.revisor.lastName}</div> <c:if test="${ilcd.homologation.status > 2}"><div class="col s3" style="color:red;">Aceitou convite</div></c:if> <c:if test="${ilcd.homologation.status < 3}"><div class="col s3"><a href="">Cancelar convite</a></div></c:if>
                                    </div>
                                    <div class="row">
                                        <div class="col s12">
                                        <%
                                            Status status = (Status) pageContext.getAttribute("statu");

                                            Date dt = status.getExpectedDate();
                                            Calendar c = Calendar.getInstance();
                                            c.setTime(dt);
                                            c.add(Calendar.DATE, 5);

                                            int diaVencimento = c.get(Calendar.DAY_OF_YEAR);

                                            c.setTime(new Date());

                                            int diaDeHoje = c.get(Calendar.DAY_OF_YEAR);

                                            //String resp = String.valueOf();
                                            pageContext.setAttribute("prazo", (diaVencimento - diaDeHoje));

                                        %>
                                        <c:choose>
                                            <c:when test="${statu.status != null}">
                                                Revisão Entregue
                                                <div class="row">
                                                    <%
                                                        SimpleDateFormat dataFormatada = new SimpleDateFormat("dd/MM/yyyy");
                                                        pageContext.setAttribute("entregaData", dataFormatada.format(status.getEndDate()));
                                                    %>
                                                    <a href="<%=Strings.BASE%>/qualidata/${statu.qualiData.id}"><i style="color:#27bec3; position: relative; top:20px; font-size: 50px;" class="medium material-icons">insert_drive_file</i><span style="color:#27bec3;"><c:out value="${entregaData}"/></span></a>
                                                    <c:choose>
                                                        <c:when test="${statu.status == 1}">
                                                            aprovado
                                                        </c:when>
                                                        <c:when test="${statu.status == 2}">
                                                            aprovado com correções
                                                        </c:when>
                                                        <c:when test="${statu.status == 3}">
                                                            reprovado
                                                        </c:when>
                                                    </c:choose>
                                                </div>
                                            </c:when>
                                            <c:when test="${prazo > -1}">
                                                Prazo de <c:out value="${prazo}"/> dias.
                                            </c:when>
                                            <c:when test="${prazo < 0}">
                                                <%                                                    int prazo = (Integer) pageContext.getAttribute("prazo");
                                                    prazo = Math.abs(prazo);
                                                    pageContext.setAttribute("prazo", prazo);
                                                %>
                                                atrasado <c:out value="${prazo}"/> dias
                                            </c:when>
                                        </c:choose>
                                    </div>
                                </div>
                                <hr />
                            </c:when>

                            <c:when test="${statu.type == 2}">
                                <h5 style="color:#7c7c7c;">Revisão Técnica</h5>
                                <div class="row">
                                    <div class="col s12">
                                        <%
                                            Status status2 = (Status) pageContext.getAttribute("statu");

                                            Date dt2 = status2.getExpectedDate();
                                            Calendar c2 = Calendar.getInstance();
                                            c2.setTime(dt2);
                                            c2.add(Calendar.DATE, 5);

                                            int diaVencimento2 = c2.get(Calendar.DAY_OF_YEAR);

                                            c2.setTime(new Date());

                                            int diaDeHoje2 = c2.get(Calendar.DAY_OF_YEAR);

                                            //String resp = String.valueOf();
                                            pageContext.setAttribute("prazo2", (diaVencimento2 - diaDeHoje2));
                                        %>
                                        <c:choose>
                                            <c:when test="${statu.status != null}">
                                                Revisão Entregue
                                                
                                            </c:when>
                                            <c:when test="${prazo2 > -1}">
                                                Prazo de x dias.
                                            </c:when>
                                            <c:when test="${prazo2 < 0}">
                                                
                                                atrasado 5 dias
                                            </c:when>
                                        </c:choose>
                                    </div>
                                </div>
                                <hr />
                            </c:when>


                        </c:choose>


                    </c:forEach>

                    <hr />

                </div>
            </div>

            <!-- Modal Structure -->
            <div id="modal1" class="modal modal-fixed-footer">
                <form action="<%=Strings.BASE%>/gestor/invite" method="post">
                    <div class="modal-content">
                        <h4>Escolha um usuario</h4>
                        <c:forEach var="userForm" items="${users}"> 
                            <p>
                                <input name="user" type="radio" id="test${userForm.id}" value="${userForm.id}"  />
                                <label for="test${userForm.id}">${userForm.firstName} ${userForm.lastName} (${userForm.email})</label>
                            </p>
                        </c:forEach>
                        <input type="hidden" name="ilcd" value="${ilcd.id}" />
                        <input id="tipo" type="hidden" name="tipo" value="1" />
                    </div>
                    <div class="modal-footer">
                        <input type="submit" class="modal-action modal-close waves-effect waves-green btn-flat" value="ENVIAR" />
                    </div>
                </form>
            </div>

        </div>
        <script type="application/javascript" src="<%=Strings.BASE%>/assets/jquery-3.2.1.min.js"></script>
        <script type="application/javascript" src="<%=Strings.BASE%>/assets/materialize/js/materialize.min.js"></script>
        <script>
                            function invite(type) {
                                $('#tipo').val(type);
                                $('#modal1').modal('open');
                            }

                            $(document).ready(function () {
                                // the "href" attribute of the modal trigger must specify the modal ID that wants to be triggered
                                $('.modal').modal();
                            });
        </script>
    </body>

</html>