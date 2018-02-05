<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="resources.Strings"%>
<%@page import="br.com.ibict.acv.sicv.model.User"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<sec:authorize access="hasAuthority('USER')" var="isUser" />
<sec:authorize access="hasAuthority('MANAGER')" var="isManager" />
<sec:authorize access="hasAuthority('ADMIN')" var="isAdmin" />
<%
    User user = (User) request.getSession().getAttribute("user");
    Long notifications = user.getQntdNotificacoes();
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link href="<%=Strings.BASE%>/assets/css/defaultNotifications.css" rel="stylesheet">

<table class="table">
    <thead>
        <tr >
            <td class="tdCenterHeader" onclick="">
                <button class="button" style="${localN == 0 ? "color:#00697C;font-weight: bold;":""}" onclick="location.href='<%=Strings.BASE%>'">Meus Inventários</button>
            </td>
            <td class="tdCenterHeader">
                <button class="button" style="${localN == 1 ? "color:#00697C;font-weight: bold;":""}" onclick="location.href='<%=Strings.BASE%>/qualityreview'">Revisão Qualidata</button>
            </td>
            <td class="tdCenterHeader">
                <button class="button" style="${localN == 2 ? "color:#00697C;font-weight: bold;":""}" onclick="location.href='<%=Strings.BASE%>/tecnicalreview'">Revisão Técnica</button>
            </td>
            <c:if test="${isManager or isAdmin}">
                <td class="tdCenterHeader" >
                    <button class="button" style="${localN == 3 ? "color:#00697C;font-weight: bold;":""}" onclick="location.href='<%=Strings.BASE%>/gestor'">Gestão</button>
                </td>
            </c:if>
            <c:if test="${isAdmin}">
                <td class="tdCenterHeader" >
                    <button class="button" style="${localN == 4 ? "color:#00697C;font-weight: bold;":""}" onclick="location.href = '<%=Strings.BASE%>/admin'">Administrador</button>
                </td>
            </c:if>
            <td class="tdAlertHeader"><a style="color: #c3697c;" href="<%=Strings.BASE%>/notifications"><span class="glyphicon glyphicon-bell" id="bell"><%=notifications%></span></a></td>
            <td class="sortable-column tdCenterHeader" >Perfil: <a href="<%=Strings.BASE%>/profile">${name}</a></td> 
            <td class="sortable-column" style="text-align: center; width:1%; white-space:nowrap;" >
                <button class="button" onclick="location.href='<%=Strings.BASE%>/logout'">SAIR</button>
            </td>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td colspan="8" style="background-color: #EBF4F5;font-weight: bold;">
                Você está em: ${local}
            </td>
        </tr>
    </tbody>
</table>