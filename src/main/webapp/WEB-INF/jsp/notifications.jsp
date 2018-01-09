<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page import="br.com.ibict.acv.sicv.helper.URLHelper"%>
<%@page import="br.com.ibict.acv.sicv.model.User"%>
<%@page import="resources.Strings"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<link href="<%=Strings.BASE%>/assets/css/defaultNotifications.css" rel="stylesheet">
<link href="<%=Strings.BASE%>/assets/bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="<%=Strings.BASE%>/assets/materialize/css/materialize.min.css">
<!DOCTYPE html>
<html>
<head>

</head>
<body style="color: #00697c !important;">
	<jsp:include page="/WEB-INF/jsp/partials/nav.jsp"/>
	<div class="headerDiv">
	       <jsp:include page="/WEB-INF/jsp/partials/header.jsp" />
	</div>
	<div class="principalDiv">
		
		<div class="titleNotify">Notificações</div>
	

		<table id="list" class="table table-hover" >
			<thead>
				<tr >
					<td class="sortable-column" style="text-align: center;">Data</td>
					<td class="sortable-column">Assunto</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${notifications}" var="notification">
					<tr>
						<td class="tdCenter">${notification.notifyDate}</td>
						<th>
							<p>${notification.subject}</p>
					        <div class="divs" style="padding-top: 1%">${notification.messages[0]}</div><p>
					        <div class="divs">${notification.messages[1]}</div>
						</th>
						
					</tr>
				</c:forEach>
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
