<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="resources.Strings"%>
<%@page import="br.com.ibict.acv.sicv.model.User"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<sec:authorize access="hasAuthority('USER')" var="isUser" />
<sec:authorize access="hasAuthority('MANAGER')" var="isManager" />
<sec:authorize access="hasAuthority('ADMIN')" var="isAdmin" />
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
			<td class="tdCenterHeader" onclick="">
				<button class="button" onclick="location.href='<%=Strings.BASE%>'">Meus Inventários</button>
			</td>
			<td class="tdCenterHeader" style="color: #4dbcc4;" >
				<button class="button" onclick="location.href='#'">Revisão Qualidata</button>
			</td>
			<td class="tdCenterHeader" style="color: #accc5f;" >
				<button class="button" onclick="location.href='#'">Revisão Técnica</button>
			</td>
			<c:if test="${isManager or isAdmin}">
				<td class="tdCenterHeader" >
					<button class="button" onclick="location.href='<%=Strings.BASE%>/manager'">Gestão</button>
				</td>
			</c:if>
			<c:if test="${isAdmin}">
				<td class="tdCenterHeader" >
					<button class="button" onclick="location.href='<%=Strings.BASE%>/admin'"><b>Administrador</b></button>
				</td>
			</c:if>
			<td class="tdAlertHeader">
				<button class="button" style="color: #c3697c;white-space:nowrap;" onclick="location.href='<%=Strings.BASE%>/notifications'">
					<span class="glyphicon glyphicon-bell"><%=notifications%></span>
				</button>
			</td>
			<td class="sortable-column tdCenterHeader" style="color: #00697c;" >
				Perfil: <button class="button" onclick="location.href='<%=Strings.BASE%>/profile'" style="color: #00697c;">
					<b><%=name%></b>
				</button>
			</td>
			<td class="sortable-column" style="text-align: center; width:1%; white-space:nowrap;color: #00697c;" >
				<button class="button" onclick="location.href='<%=Strings.BASE%>/logout'">SAIR</button>
			</td>
		</tr>
	</thead>		
</table>