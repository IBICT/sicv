<%-- 
    Document   : notifications
    Created on : 11/05/2017, 09:48:46
    Author     : Deivdy.Silva
--%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page import="br.com.ibict.acv.sicv.helper.URLHelper"%>
<%@page import="br.com.ibict.acv.sicv.model.User"%>
<%@page import="resources.Strings"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<link href="<%=Strings.BASE%>/assets/css/defaultNotifications.css" rel="stylesheet">
<link
	href="<%=Strings.BASE%>/assets/bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
<!DOCTYPE html>
<html>
<head>

</head>
<body>
	<div class="page-content" style="width: 85%; margin-left:5%;">
		<table class="table">
			<thead>
				<tr style="border-bottom:1px solid black">
					<td class="tdCenterHeader" onclick="">Meus Inventários</td>
					<td class="tdCenterHeader" style="color: #4dbcc4;" >Revisão Qualidata</td>
					<td class="tdCenterHeader" style="color: #accc5f;" >Revisão Técnica</td>
					<td class="tdCenterHeader" >Gestão</td>
					<td class="tdAlertHeader"><span class="glyphicon glyphicon-bell"></span> 1</td>
					<td class="sortable-column tdCenterHeader" >Perfil: ${nome}</td>
					<td class="sortable-column" style="text-align: center; width:1%; white-space:nowrap;" 
					onclick="location.href='<%=Strings.BASE%>/logout'" >
						SAIR
					</td>
				</tr>
			</thead>		
		</table>
		
		<div class="titleNotify">Notificações</div>
	

		<table id="list" class="table table-hover" >
			<thead>
				<tr >
					<td class="sortable-column" style="text-align: center;">Data</td>
					<td class="sortable-column">Assunto</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td class="tdCenter">13/09/2017</td>
					<th>
						<p>Aprovado pelo revisor de Qualidade: 266c5da8-55bc-4d58-a4af-cbf7724f7939: </p>
				        <div class="divs" style="padding-top: 1%"> Brick technology mix production mix, at plant 1800 kg/m3 foi aprovado pelo revisor de Qualidade.</div><p>
				        <div class="divs"> Acesse à revisão em: Meus inventários Download Disponíveis</div>
					</th>
					
				</tr>
				<tr>
					<td class="tdCenter">23/10/2017</td>
					<th>
						<p>Aprovado pelo revisor de Qualidade: 266c5da8-55bc-4d58-a4af-cbf7724f7939: </p>
				        <div class="divs" style="padding-top: 1%"> Brick technology mix production mix, at plant 1800 kg/m3 foi aprovado pelo revisor de Qualidade.</div><p>
				        <div class="divs"> Acesse à revisão em: Meus inventários Download Disponíveis</div>
					</th>
					
				</tr>
			</tbody>
			<tfoot>
				<tr></tr>
			</tfoot>
		</table>

		<jsp:include page="/WEB-INF/jsp/partials/scriptsLibs.jsp" />	
	</div>
	<script>
		
		$(function () {
		    $('#list tr').click(function (ev) {
			    var shown = $(this).children("th").children("div");
		        if (shown.css("display")=="none") {
		        	$(this).children("th").children("div").slideDown(1000);
		    	        
		        }else{
		        	$(this).children("th").children("div").slideUp(1000);
		        	
		        }
		        shown = !shown;
		    });
		})
	</script>

</body>
</html>
