<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@page import="resources.Strings"%>
<%@page import="br.com.ibict.acv.sicv.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="apple-touch-icon" sizes="57x57" href="<%=Strings.BASE%>/assets/images/favicon/apple-icon-57x57.png" />
<%
	String base = Strings.BASE;
	pageContext.setAttribute("base", base);
%>
<c:set var="link" value="${base}authorIlcd" />
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
	            padding: 0 !important;
	            text-align: center;
	        }
	        .hr {
		        border-top: 1px solid #bbb;
	        }
	        .sicv-table-td {
	            border-top: 1px solid silver;
	            border-bottom: 1px solid silver;
	            color: #999;
	            padding: 0 !important;
	            text-align: center;
	        }
			
        </style>
    </head>

    <body>
		<jsp:include page="/WEB-INF/jsp/partials/nav.jsp" />
		<div class="headerDiv">
	        <jsp:include page="/WEB-INF/jsp/partials/header.jsp" />
		</div>
        <div class="principalDiv">
        	
   			<h4 class="page-title"></h4>
   			<br><br>
   	
            <div style="margin:0px;" class="row" >
	            <div class="col s1 sicv-table-th"> </div>
	            <div class="col s2 sicv-table-th"> </div>
	            <div class="col s2 sicv-table-th"> </div>
	            <div class="col s1 sicv-table-th">Usuário</div>
	            <div class="col s1 sicv-table-th">Gestor</div>
	            <div class="col s1 sicv-table-th">Admin</div>
	            <div class="col s1 sicv-table-th"> </div>
			
        	</div>
        	<form class="col s12 formAdminProfiles" method="POST" action="<%=Strings.BASE%>admin/profiles" >
            <c:forEach items="${users}" var="user" varStatus="loop" >
	        	<div style="margin:0px;" class="row">
				    <div style="height: 40px; position: relative; top: 10px;" class="col s1 sicv-table-td">
				    	<a href="#"> Editar </a>
				    </div>
		   			<div style="height: 40px; position: relative; top: 10px;" class="col s2 sicv-table-td fullName">${user.firstName} ${user.lastName}</div>   
		   			<div style="height: 40px; position: relative; top: 10px;" class="col s2 sicv-table-td mail">${user.email}</div>
		            <div style="height: 40px; position: relative; top: 10px;" class="col s1 sicv-table-td">
						<input class="perfis" type="checkbox" id="box1[${loop.index}]" name="perfil" value="USER" ${user.perfil == 'USER' ? 'checked="checked"' : '' }/>
						<label for="box1[${loop.index}]"></label>
		            </div>
		   			<div style="height: 40px; position: relative; top: 10px;" class="col s1 sicv-table-td">
						<input type="checkbox" id="box3[${loop.index}]" name="perfil" value="GESTOR" ${user.perfil == 'MANAGER' ? 'checked="checked"' : '' }/>
						<label for="box3[${loop.index}]"></label>
		   			</div>   
		            <div style="height: 40px; position: relative; top: 10px;" class="col s1 sicv-table-td">
						<input type="checkbox" id="box4[${loop.index}]" name="perfil" value="ADMIN" ${user.perfil == 'ADMIN' ? 'checked="checked"' : '' }/>
						<label for="box4[${loop.index}]"></label>
		            </div>
		   			<div style="height: 40px; position: relative; top: 10px;" class="col s1 sicv-table-td">
		   				<button class="button" id="btnSubmit" type="submit">Confirmar</button>
		   			</div>
	   			</div>
			</c:forEach>
			</form>

        </div>
		    <script type="application/javascript" src="<%=Strings.BASE%>/assets/jquery-3.2.1.min.js"></script>
			<script type="application/javascript" src="<%=Strings.BASE%>/assets/materialize/js/materialize.min.js"></script>
			<script type="application/javascript" src="<%=Strings.BASE%>/assets/teste.js"></script>
	    </body>
		
</html>

<!--                         <td><a class="waves-effect waves-light btn">Revisão Qualidata</a></td>
                        <td><a class="btn-import waves-effect waves-light btn">Revisão Técnica</a></td> -->