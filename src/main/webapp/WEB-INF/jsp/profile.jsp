<%@page import="resources.Strings"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String base = Strings.BASE;
	pageContext.setAttribute("base", base);
%>

<c:set var="link" value="${base}" />
<c:if test="${isAdmin}">
	<c:set var="link" value="${base}admin/" />
</c:if>

<!DOCTYPE html>
<html lang="pt-BR">

    <head>
        <meta charset="UTF-8">
        <title>Home</title>
  		<link href="<%=Strings.BASE%>assets/bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" href="<%=Strings.BASE%>assets/materialize/css/materialize.min.css">
        <style>
            html {
                font-family: 'Titillium Web', "Roboto", sans-serif;
            }

            .page-title {
                color: #00697c;
            }

            .btn-import {
                background-color: #accc5f;
            }

        </style>
    </head>

    <body>
		<jsp:include page="/WEB-INF/jsp/partials/nav.jsp" />
		<div class="headerDiv">
	        <jsp:include page="/WEB-INF/jsp/partials/header.jsp" />
		</div>
		<div class="principalDiv">
            
			<form class="userForm" action="${link}profile" method="POST">
                <input id="id" name="id" type="text" class="validate" value="${user.id}" hidden="true">
                <input id="dsPurpose" name="dsPurpose" type="text" class="validate" value="${user.dsPurpose}" hidden="true">
                <input id="gender" name="gender" type="text" class="validate" value="${user.gender}" hidden="true">
                <input id="jobPosition" name="jobPosition" type="text" class="validate" value="${user.jobPosition}" hidden="true">
                <input id="passwordHashSalt" name="passwordHashSalt" type="text" class="validate" value="${user.passwordHashSalt}" hidden="true">
				<input id="registrationKey" name="registrationKey" type="text" class="validate" value="${user.registrationKey}" hidden="true">
				<input id="superAdminPermission" name="superAdminPermission" type="text" class="validate" value="${user.superAdminPermission}" hidden="true">
				<input id="title" name="title" type="text" class="validate" value="${user.title}" hidden="true">
				<input id="streetAddress" name="streetAddress" type="text" class="validate" value="${user.streetAddress}" hidden="true">
				<input id="zipCode" name="zipCode" type="text" class="validate" value="${user.zipCode}" hidden="true">
				<input id="organization" name="organization" type="text" class="validate" value="${user.organization}" hidden="true">
				<input id="purpose" name="purpose" type="text" class="validate" value="${user.purpose}" hidden="true">
				<input id="userName" name="userName" type="text" value="${user.userName}" hidden="true">
				<input id="qntdNotificacoes" name="qntdNotificacoes" type="text" class="validate" value="${user.qntdNotificacoes}" hidden="true">

				<div class="row">
					<h5 class="page-title">Perfil</h5>
				</div>
                 <div class="row">
                     <div class="input-field col s4">
                         <h6 class="page-title">Informações pessoais</h6>
                     </div>
                     <div class="input-field col s4">
                         <h6 class="page-title">Informações de login</h6>
                     </div>
                 </div>
                 <div class="row">
                     <div class="input-field col s2">
                         <input placeholder="" id="first_name" name="firstName" type="text" class="validate" value="${user.firstName}">
                         <label for="name">Nome</label>
                     </div>
                     <div class="input-field col s2">
	                     <input placeholder="" id="last_name" name="lastName" type="text" class="validate" value="${user.lastName}">
	                     <label for="lastName">Sobrenome</label>
                     </div>
                     <div class="input-field col s2">
                         <input placeholder="" id="password" name="plainPassword" type="password" class="validate" value="${user.plainPassword}">
                         <label for="password">Senha</label>
                     </div>
                 </div>
                 <div class="row">
                     <div class="input-field col s2">
                         <input placeholder="" id="email" name="email" type="text" class="validate" value="${user.email}">
                         <label for="email">E-mail</label>
                     </div>
                     <div class="input-field col s2">
                         <input placeholder="" id="phone" name="telefone" type="text" class="validate" value="${user.telefone}">
                         <label for="phone">Telefone</label>
                     </div>
                     <div class="input-field col s2">
                         <input placeholder="" id="newPassword" name="newPassword" type="password" class="validate">
                         <label for="newPassword">Nova Senha</label>
                     </div>
                 </div>
                 <div class="row">
                     <div class="input-field col s4">
                         <input placeholder="" id="intituition" name="instituicao" type="text" class="validate" value="${user.instituicao}">
                         <label for="instituition">Instituição</label>
                     </div>
                     <div class="input-field col s2">
                         <input placeholder="" id="confirm" type="password" class="validate">
                         <label for="confirm">Confirmar nova senha</label>
                     </div>
                 </div>
                 <div class="row">
                     <div class="input-field col s2">
                         <input placeholder="" id="city" name="city" type="text" class="validate" value="${user.city}">
                         <label for="city">Cidade</label>
                     </div>
                     <div class="input-field col s2">
                         <input placeholder="" id="country" name="country" type="text" class="validate" value="${user.country}">
                         <label for="country">País</label>
                         <input class="waves-effect waves-light btn" value="Salvar alterações" type="submit" style="float: right;">
                     </div>
                 </div>
                     
             </form>
		</div>
        <script type="application/javascript" src="<%=Strings.BASE%>assets/jquery-3.2.1.min.js"></script>
        <script type="application/javascript" src="<%=Strings.BASE%>assets/materialize/js/materialize.min.js"></script>
		
        <script>
	        $(document).ready(function () {
        			$("form").submit(function() {
        				var result = {};
						$.each($('form').serializeArray(), function() {
							result[this.name] = this.value;
						});

						// reference to form object
						$(":input[value='']").attr('disabled', true);						
						var input = $("<input />").attr("type", "hidden").attr(
								"name", "profile").val(JSON.stringify(result));
						$('form').append($(input));
        			});
			});
            
        </script>

    </body>

</html>
