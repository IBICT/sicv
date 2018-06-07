<%@page import="resources.Strings"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<sec:authorize access="hasAuthority('ADMIN')" var="isAdmin" />

<%
	String base = Strings.BASE;
	pageContext.setAttribute("base", base);
%>

<c:set var="link" value="${base}" />
<c:if test="${isAdmin}">
	<c:set var="link" value="${base}/admin" />
</c:if>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="Tela Visualização de Perfil" />
        <meta name="keywords" content="HTML, CSS, JS, JavaScript, framework, bootstrap, front-end, frontend, web development" />
        <meta name="author" content="Wellington Stanley" />

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

        <title>SICV - ACV | Banco Nacional de Inventários dos inventários brasileiros do Ciclo de Vida (ICVs)</title>

   		<link rel="stylesheet" href="<%=Strings.BASE%>/assets/materialize/css/materialize.min.css">
   		<link rel="stylesheet" href="<%=Strings.BASE%>/assets/font/font-awesome/css/font-awesome.min.css">
        <link rel="stylesheet" href="<%=Strings.BASE%>/assets/css/fonts.css">
        
    </head>
    	<style>
			.logoSICVLogin {
				display: block;
				margin: 17px 34px;
				font-size: 27px;
				color: white;
				font-family: 'TitilliumWeb-ExtraLight', sans-serif !important;
			}
			
			.title{
				font-size: 26px !important;
				line-height: 40px;
				color: #00697C;
				font-weight: bold;
			}
			
			.subtitle{
				font-size: 20px !important;
				line-height: 30px;
				color: #3D3D3D;
			}
			
			.text{
				font-size: 18px !important;
				line-height: 27px;
				color: #3D3D3D;
			}
			
		</style>

    <body>

		<div style="background-color: #4dbcc4;height: 225px;" class="">
			<div style="width: 541px;float: left;" class="logoSICVLogin">
				<a href="${link}">
					<img alt="SICV" title="SICV" style="float: left;" src="<%=Strings.BASE%>/assets/images/logoSICVLogin.png">
					<div style="margin-left: 34px;float: left; color: #FFFFFF">
						Importador de Inventários
					</div>
				</a>
			</div>
		</div>
		
		<div class="register-form" style="text-align: center;">
			<div>
				<div class="col s2 offset-s1">
					<img id="user_img" src="${imgStr}" ${imgStr == '' ? 'class="fa fa-user-circle img_select"' : 'height="142" width="142" class="img_select"'} style="color: #EBF4F5;border-radius: 50%;font-size:142px;margin-top: -70px;"/>
				</div>
			</div>

			<div class="row title">
				${user.firstName} ${user.lastName}
			</div>
			<div class="row subtitle">
				${user.organization} | ${user.title} | ${user.jobPosition} | ${user.country}
			</div>
			<div class="row text">
				<c:if test="${empty user.curriculum}">
					<i>sem informações de curriculum</i>
				</c:if>
				<a href="${user.curriculum}">
					<i>${user.curriculum}</i>
				</a>
			</div>
			<div class="row text">
				<i class="fa fa-envelope-o"></i>
				${user.email}
			</div>
			<div class="row text">
				<i class="fa fa-phone"></i>
				${user.phone}
			</div>
		</div>
	            
		<script type="application/javascript" src="<%=Strings.BASE%>/assets/jquery-3.2.1.min.js"></script>
		<script type="application/javascript" src="<%=Strings.BASE%>/assets/materialize/js/materialize.min.js"></script>
		
    </body>

</html>