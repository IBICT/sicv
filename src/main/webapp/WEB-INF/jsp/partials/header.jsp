<%-- 
    Document   : header
    Created on : 17/07/2017, 14:54:46
    Author     : deivdy
--%>

<%@page import="resources.Strings"%>
<%@page import="br.com.ibict.acv.sicv.model.User"%>

<%
    User user = (User) request.getSession().getAttribute("user");
    String name = user.getFirstName();
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="app-bar fixed-top darcula" data-role="appbar">
    <a class="app-bar-element branding"><span class="mif-stack"></span> Sicv</a>
    <span class="app-bar-divider"></span>
    <ul class="app-bar-menu">
        <li><a href="<%=Strings.BASE%>/admin/">Dashboard</a></li>
        <li><a href="<%=Strings.BASE%>/admin/users/">Usuarios</a></li>
        <li>
            <a href="" class="dropdown-toggle">Bases</a>
            <ul class="d-menu" data-role="dropdown">
                <li><a href="">Listar Todos</a></li>
                <li><a href="">Novo base</a></li>
                <li class="divider"></li>
            </ul>
        </li>
        <li>
            <a href="" class="dropdown-toggle">ILCDs</a>
            <ul class="d-menu" data-role="dropdown">
                <li><a href="<%=Strings.BASE%>/admin/ilcd/">Listar Todos</a></li>
                <li class="divider"></li>
            </ul>
        </li>
        <li><a href="#">QualiData</a></li>
        <li><a href="<%=Strings.BASE%>/admin/notifications/">Notificações</a></li>
        <li>
            <a href="" class="dropdown-toggle">Ajuda</a>
            <ul class="d-menu" data-role="dropdown">
                <li><a href="#">Documentação</a></li>
                <li><a href="#">Reportar bug</a></li>
                <li class="divider"></li>
                <li><a href="#">Sobre</a></li>
            </ul>
        </li>
    </ul>
    <div class="app-bar-element place-right">
        <span class="dropdown-toggle"><span class="mif-user"></span><%=name%></span>
        <div class="app-bar-drop-container padding10 place-right no-margin-top block-shadow fg-dark" data-role="dropdown" data-no-close="true" style="width: 220px">
            <h2 class="text-light">Definições rápidas</h2>
            <ul class="unstyled-list fg-dark">
                <li><a href="<%=Strings.BASE%>/admin/perfil" class="fg-white1 fg-hover-yellow">Perfil</a></li>
                <li><a href="<%=Strings.BASE%>/admin/config" class="fg-white2 fg-hover-yellow">Configurações</a></li>
                <li><a href="<%=Strings.BASE%>/admin/security" class="fg-white2 fg-hover-yellow">Segurança</a></li>
                <li><a href="<%=Strings.BASE%>/logout" class="fg-white3 fg-hover-yellow">Saída</a></li>
            </ul>
        </div>
    </div>
</div>