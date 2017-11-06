<%@page import="resources.Strings"%>
<%@page import="br.com.ibict.acv.sicv.model.User"%>

<%
    User user = (User) request.getSession().getAttribute("user");
    String name = user.getFirstName();
    Long notifications = user.getQntdNotificacoes(); 
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link href="<%=Strings.BASE%>/assets/css/defaultNotifications.css" rel="stylesheet">

<table class="table">
	<thead>
		<tr style="border-bottom:1px solid black">
			<td class="tdCenterHeader" onclick="">Meus Inventários</td>
			<td class="tdCenterHeader" style="color: #4dbcc4;" >Revisão Qualidata</td>
			<td class="tdCenterHeader" style="color: #accc5f;" >Revisão Técnica</td>
			<td class="tdCenterHeader" >Gestão</td>
			<td class="tdAlertHeader"><a style="color: #c3697c;" href="<%=Strings.BASE%>notifications"><span class="glyphicon glyphicon-bell"><%=notifications%></span></a></td>
			<td class="sortable-column tdCenterHeader" >Perfil: <a href="<%=Strings.BASE%>/"><%=name%></a></td>
			<td class="sortable-column" style="text-align: center; width:1%; white-space:nowrap;" 
			onclick="location.href='<%=Strings.BASE%>/logout'" >
					SAIR
			</td>
		</tr>
	</thead>		
</table>