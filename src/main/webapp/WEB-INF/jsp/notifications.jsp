<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page import="br.com.ibict.acv.sicv.helper.URLHelper"%>
<%@page import="br.com.ibict.acv.sicv.model.User"%>
<%@page import="resources.Strings"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<link href="<%=Strings.BASE%>/assets/css/defaultNotifications.css"	rel="stylesheet">
<link rel="stylesheet" href="<%=Strings.BASE%>/assets/font/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="<%=Strings.BASE%>/assets/materialize/css/materialize.min.css">
<script src="<%=Strings.BASE%>/assets/bootstrap-3.3.7/js/jquery.min.js"></script>
<script src="<%=Strings.BASE%>/assets/materialize/js/materialize.min.js"></script>
<!DOCTYPE html>
<html>
	<script>
		var ar=[];
		
		$(function () {
		    $('#list tr').click(function (ev) {
			    var shown = $(this).children("th").children("div");
		        if (shown.css("display")=="none") {
		        	$(this).children("th").children("div").slideDown(1000);
		        	$(this).children("th").children("div").show();
		        }else{
		        	$(this).children("th").children("div").slideUp(1000);
		        	$(this).children("th").children("div").css('display','none');
		        	
		        }
		        shown = !shown;
		    });
		})
		
		function subtract(id, visualized, index){
			//alert(ar);
			if(visualized != true && $.inArray( id , ar) == -1){
				if( $('#notificationBell').text() > 0){
					var bell = +($('#notificationBell').text()) -1;
					$('#notificationBell').text(bell);
				}
				//alert(bell);
				var link = "<%=Strings.BASE%>/notifications/setVisualized";
				$.ajax({
					type: "post",
		            url: link,
		            data: { index: index},
		            success : function(resposta){
		            	//check if an item is in the array
						if( $.inArray( id , ar) == -1 ){
		                	ar.push(id);
		                	$('#'+index).css({"background":"#ebf5f5"});
						}
		            }
				});
			}
		}
	</script>
<head>
	<style type="text/css">
		.divs {
			display: none;
		}

	</style>
</head>
<body style="color: #00697c !important;">

	<jsp:include page="/WEB-INF/jsp/partials/header.jsp" />
	<div class="principalDivAdmin">

		<div class="titleNotify">Notificações</div>
		<c:if test="${not empty msg}">
			<p class="page-description page-subtitle"><i>${msg}</i></p>
		</c:if>

		<table id="list" class="responsive-table highlight">
			<thead>

			</thead>
			<tbody>
				<c:forEach items="${notifications}" var="notify" varStatus="loop">
					<tr onclick="subtract(${notify.id}, ${notify.visualized}, ${loop.index});"
						style="cursor: pointer;${notify.visualized ? 'background:#ebf5f5;' : ''} " id="${loop.index}">
						<th style="border-bottom: solid .5px #DFDFDF">
							${notify.subject} <output style="font-weight: lighter;margin-left: 15px;">${notify.notifyDate} </output> 
							<div class="divs" style="padding-top: 1%">${notify.messages[0]}<br></div>
							<div class="divs">${notify.messages[1]}</div>
						</th>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr></tr>
			</tfoot>
		</table>

	</div>
</body>
</html>
