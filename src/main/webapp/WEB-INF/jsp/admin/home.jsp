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
        
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href="<%=Strings.BASE%>/assets/bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="<%=Strings.BASE%>/assets/materialize/css/materialize.min.css">

        <style>
            html {
                font-family: 'Titillium Web', "Roboto", sans-serif;
            }

            .page-title {
                color: #00697C;
                font-size: 27px;
            }
            .page-subtitle {
                color: #666;
            }
            .btn {
                background-color: #00697C !important;
                margin-left: 480px !important;
                font-size: 16px !important;
                border-radius: 5px !important;
                text-transform: none !important;
                font-weight: bold;
                height: 30px;
                width: 195px;
                letter-spacing: .2px;
                padding: 0px;
                line-height: 0px;
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
				vertical-align: middle;
	            height: 50px;
	            top: 10px;
	            padding-top: 15px !important;
	        }
	        .fullName{
	        	font-size: 16px;
	        }
	        .email{
	        	font-size: 15px;
	        }
	        
	        .fullName{
	        	font-size: 16px;
	        	font-weight: bold;
	        	color: #6B6B6A;
	        	text-align: left !important;
	        }
	        .mail{
	        	font-size: 15px;
	        	font-style: italic;
	        	text-align: left !important;
	        }
	        
	        [type="checkbox"].filled-in:disabled:checked+label:before{
	        	border-right: 2px solid #BDBDBD !important;
    			border-bottom: 2px solid #BDBDBD !important;
    			left: 9px;
	        }
	        [type="checkbox"].filled-in:disabled:checked+label:after{
		        color: #BDBDBD !important;
		        border-color: #BDBDBD !important;
		        left: 9px;
	        }
	        [type="checkbox"].filled-in:disabled:checked+label:after, [type="checkbox"].filled-in:not(:checked)+label:after{
	        	font-style: normal;
	        	color: #6B6B6A;
	        	width: 14px;
	        	height: 14px;
	        	background: white;
	        	margin-top: 0px;
	        	left: 8px;
	        }
	        [type="checkbox"].filled-in:checked+label:before{
	        	border-right: 2px solid #6B6B6A;
    			border-bottom: 2px solid #6B6B6A;
    			top: -3px;
    			left: 9px;
	        }
	        
	        [type="checkbox"].filled-in:checked+label:after{
	        	width: 14px;
	        	height: 14px;
	        	background: white;
	        	border-color: #6B6B6A !important;
	        	left: 8px;
	        }
	        input[type="search"]{
				border-radius: 5px !important;
				border: 1px solid #4DBCC4 !important;
				height: 30px !important;
				width: 198px !important;
				color: #BDBDBD;
				margin-left: 40px !important;
	        }
			
        </style>
    </head>

    <body>
		<jsp:include page="/WEB-INF/jsp/partials/nav.jsp" />
		<div class="headerDiv">
	        <jsp:include page="/WEB-INF/jsp/partials/header.jsp" />
		</div>
        <div class="principalDiv">
        	<div>
	        	<h4 class="page-title">
	        		<c:out value="Administrador"></c:out>
					<input class="btn btn-lg btn-primary btn-import" type="submit" value="Cadastrar novo usuário" onclick="location.href='<%=Strings.BASE%>/admin/insertProfile'"/>
					<input type="Search" placeholder="busque um usuário" />
					<i class="fa fa-search" style="color: #00697C;font-size:16px;margin-left: -35px"></i>
					
	        	</h4>
				
        	</div>
   			<br><br>
   	
<%--             		<input name="role" value="${user.roles['role']}"/> --%>
   	
            <div style="margin:0px;" class="row" >
	            <div class="col s2 sicv-table-th" style="float: left;font-size: 18px;"><b style="float: left;">Lista de Usuários</b></div>
	            <div class="col s3 sicv-table-th"> </div>
	            <div class="col s3 sicv-table-th"> </div>
	            <div class="col s1 sicv-table-th">Usuário</div>
	            <div class="col s1 sicv-table-th">Gestor</div>
	            <div class="col s1 sicv-table-th">Administrador</div>
	            <div class="col s1 sicv-table-th"> </div>
			
        	</div>
        	<form class="col s12" id="formAdminProfiles" method="POST" action="<%=Strings.BASE%>/admin/saveProfiles" >
            <c:forEach items="${users}" var="user" varStatus="loop" >
				<c:set var="containsMANAGER" value="false" />
				<c:set var="containsADMIN" value="false" />
				<c:forEach items="${user.roles}" var="rol">
					<c:if test="${rol.role eq 'MANAGER'}">
						<c:set var="containsMANAGER" value="true" />
					</c:if>
					<c:if test="${rol.role eq 'ADMIN'}">
						<c:set var="containsADMIN" value="true" />
					</c:if>
				</c:forEach>

	        	<div style="margin:0px;" class="row">
				    <div class="col s1 sicv-table-td">
				    	<a href="<%=Strings.BASE%>/admin/profile/${loop.index}" style="margin-left: 5px; float: left;"> Editar </a>
				    </div>
		   			<div class="col s3 sicv-table-td fullName">${user.firstName} ${user.lastName}</div>   
		   			<div class="col s4 sicv-table-td mail">${user.email}</div>
		            <div class="col s1 sicv-table-td">
						<input class="filled-in" type="checkbox" checked="checked" readonly="readonly" disabled="disabled" name="user.roles[]" id="${loop.index}box1" value="USER" checked="checked"/>
						<label for="${loop.index}box1"></label>
		            </div>
		   			<div class="col s1 sicv-table-td">
						<input class="perfis filled-in" type="checkbox" id="${loop.index}box2" name="user.roles[]" value="MANAGER" ${containsMANAGER ? 'checked="checked"' : '' }
						onclick="enableSubmit('btnSubmit${loop.index}');"/>
						<label for="${loop.index}box2"></label>
		   			</div>
		            <div class="col s1 sicv-table-td">
						<input class="perfis filled-in" type="checkbox" id="${loop.index}box3" name="user.roles[]" value="ADMIN" ${containsADMIN ? 'checked="checked"' : '' }
						onclick="enableSubmit('btnSubmit${loop.index}');"/>
						<label for="${loop.index}box3"></label>
		            </div>

		   			<div style="font-size: 16px;" class="col s1 sicv-table-td">
		   				<input value="Confirmar" type="button" class="button btnSaveProfile" id="btnSubmit${loop.index}" disabled="disabled" onclick="submitForm('${loop.index}');" />
		   			</div>
	   			</div>
			</c:forEach>
			</form>

        </div>
		    <script type="application/javascript" src="<%=Strings.BASE%>/assets/jquery-3.2.1.min.js"></script>
			<script type="application/javascript" src="<%=Strings.BASE%>/assets/materialize/js/materialize.min.js"></script>
			<script type="application/javascript" src="<%=Strings.BASE%>/assets/adminProfiles.js"></script>

	    </body>
		
</html>

<!--                    
     <td><a class="waves-effect waves-light btn">Revisão Qualidata</a></td>
     <td><a class="btn-import waves-effect waves-light btn">Revisão Técnica</a></td> 
				var ar=[];
	        $('.perfis').each(function(){
	            if($(this).is(':checked'))
	            {
	                ar.push({id:$(this).attr('id'),perfil:$(this).attr('value')}); 
	            }        
	        });
	        alert(JSON.stringify(ar));
	
-->