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
        
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href="<%=Strings.BASE%>/assets/bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="<%=Strings.BASE%>/assets/materialize/css/materialize.min.css">
        <link rel="stylesheet" href="<%=Strings.BASE%>/assets/steps.css">

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
	            border-top: 1px solid silver;
	            padding: 0 !important;
	        }
	        
	        .sicv-table-td {
	            border-bottom: 1px solid silver;
	            color: #999;
	            padding: 0 !important;
	        }
			
        </style>
    </head>

    <body>
		<jsp:include page="/WEB-INF/jsp/partials/nav.jsp"/>
		<div class="headerDiv">
	        <jsp:include page="/WEB-INF/jsp/partials/header.jsp" />
		</div>
        <div class="principalDiv">

            <h4 class="page-title">Meus inventários</h4>
            <p class="page-description page-subtitle"><i>Envie seu inventário e acompanhe o processo. Você receberá notificações no sistema e no e-mail cadastrado sempre que o status sofrer alterações</i></p>
            <br>
            <a class="btn-import waves-effect waves-light btn modal-trigger" href="<%=Strings.BASE%>ilcd/new">Submeter Inventário</a>
			<br><br>
			
            <h6 style="color:#4dbcc4;">Invéntarios em andamento</h6>
            
            <div style="margin:0px;" class="row">
	            <div class="col s3 sicv-table-th">Id</div>
	            <div class="col s3 sicv-table-th">Nome</div>
	            <div class="col s1 sicv-table-th" style="text-align: center;">Pendências</div>
	            <div class="col s2 sicv-table-th" style="text-align: center;">Prazo para entregar</div>
	            <div class="col s3" style="position: relative; left: 20px; color: #4dbcc4;">Status</div>
        	</div>
        
            <c:forEach items="${ilcds}" var="ilcd">
		        <div style="margin:0px;" class="row">
        		    <div style="height: 40px; position: relative; top: 10px;" class="col s3 sicv-table-td">${ilcd.UUID}</div>
           			<div style="height: 40px; position: relative; top: 10px;" class="col s3 sicv-table-td">${ilcd.name}</div>
					<c:choose>
                       	<c:when test="${ilcd.homologation.pending}">
                            <!-- <td style="text-align: center;"><i style="color: #c3697c;" class="material-icons">report_problem</i></td>
                       		<td style="text-align: center;"><i style="color: #accc5f;" class="material-icons">check</i></td>
                             -->
				            <div style="height: 40px; text-align: center; position: relative; top: 10px;" class="col s1 sicv-table-td"><i style="color: #c3697c;" class="material-icons">report_problem</i></div>
		       				<div style="height: 40px;  text-align: center; position: relative; top: 10px; color: #c3697c;" class="col s2 sicv-table-td">${ilcd.homologation.prazo}</div>
                       	</c:when>
                       	<c:when test="${not ilcd.homologation.pending}">
                        	 <div style="height: 40px; text-align: center; position: relative; top: 10px;" class="col s1 sicv-table-td"><i style="color: #accc5f;" class="material-icons">check</i></div>
   	        				 <div style="height: 40px;  text-align: center; position: relative; top: 10px;" class="col s2 sicv-table-td">${ilcd.homologation.prazo}</div>
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
	    </body>

</html>

<!--                         <td><a class="waves-effect waves-light btn">Revisão Qualidata</a></td>
                        <td><a class="btn-import waves-effect waves-light btn">Revisão Técnica</a></td> -->