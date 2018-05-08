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
<link href="<%=Strings.BASE%>/assets/css/partials/navBarStyle.css" rel="stylesheet">


<header>
    <nav class="nav-extended z-depth-0">
        <div class="nav-wrapper">
            <a href="<%=Strings.BASE%>" class="brand-logo"><img src="<%=Strings.BASE%>/assets/img/logo.png" alt="SICV BRASIL" /><span class="hide-on-med-and-down">Importador de Inventarios</span></a>
            <a href="#" data-activates="mobile-demo" class="button-collapse"><i class="material-icons">menu</i></a>

            <ul class="side-nav" id="mobile-demo">
                <li class="${localN == 0 ? "active":""}" style="">
                        <a href="<%=Strings.BASE%>">Meus Inventários</a>
                    </li>
                    <li class="${localN == 1 ? "active":""}">
                        <a href="<%=Strings.BASE%>/qualityreview">Revisão Qualidata</a>
                    </li>
                    <li class="${localN == 2 ? "active":""}">
                        <a href="<%=Strings.BASE%>/technicalreview">Revisão Técnica</a>
                    </li>
                    <c:if test="${isManager or isAdmin}">
                    <li class="${localN == 3 ? "active":""}">
                        <a href="<%=Strings.BASE%>/gestor">Gestão</a>
                    </li>
                    </c:if>
                    <c:if test="${isAdmin}">
                    <li class="${localN == 4 ? "active":""}">
                        <a href="<%=Strings.BASE%>/admin">Administrador</a>
                    </li>
                    </c:if>
            </ul>
        </div>

        <div class="nav-content">
            <div class="nav-wrapper hide-on-med-and-down">
                <ul>
                    <li class="${localN == 0 ? "active":""}" style="">
                        <a href="<%=Strings.BASE%>">Meus Inventários</a>
                    </li>
                    <li class="${localN == 1 ? "active":""}">
                        <a href="<%=Strings.BASE%>/qualityreview">Revisão Qualidata</a>
                    </li>
                    <li class="${localN == 2 ? "active":""}">
                        <a href="<%=Strings.BASE%>/technicalreview">Revisão Técnica</a>
                    </li>
                    <c:if test="${isManager or isAdmin}">
                    <li class="${localN == 3 ? "active":""}">
                        <a href="<%=Strings.BASE%>/gestor">Gestão</a>
                    </li>
                    </c:if>
                    <c:if test="${isAdmin}">
                    <li class="${localN == 4 ? "active":""}">
                        <a href="<%=Strings.BASE%>/admin">Administrador</a>
                    </li>
                    </c:if>
                    <li class="right sair">
                        <a href="<%=Strings.BASE%>/logout">SAIR</a>
                    </li>
                    <li class="right perfil">
                        <a style="" href="<%=Strings.BASE%>/profile">Perfil: <span>${name}</span></a>
                    </li>
                    <li class="right notification">
                        <a href="<%=Strings.BASE%>/notifications">
                            <span style=""><%=notifications%></span>
                            <i class="fa fa-bell" aria-hidden="true"></i>
                        </a>
                    </li>
                </ul>
                <div class="location">Você está em: ${local}</div>
            </div>
        </div>
    </nav>
</header>