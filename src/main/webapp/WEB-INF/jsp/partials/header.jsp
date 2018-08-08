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

<c:set var="notificacoes" value="<%=notifications%>" scope="session" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<%=Strings.BASE%>/assets/css/fonts.css">
<link href="<%=Strings.BASE%>/assets/css/partials/navBarStyle.css" rel="stylesheet">


<header>
    <nav class="nav-extended z-depth-0">
        <div class="nav-wrapper">
            <a href="<%=Strings.BASE%>" class="brand-logo"><img src="<%=Strings.BASE%>/assets/img/logo.png" alt="SICV BRASIL" /><span class="hide-on-med-and-down">Importador de Inventários</span></a>

            <ul class="side-nav" id="menu-mobile">
                <li class="${localN == 0 ? 'active':''}" style="">
                    <a href="<%=Strings.BASE%>">Meus Inventários</a>
                </li>
                <li class="${localN == 1 ? 'active':''}">
                    <a href="<%=Strings.BASE%>/qualityreview">Revisão Qualidata</a>
                </li>
                <li class="${localN == 2 ? 'active':''}">
                    <a href="<%=Strings.BASE%>/technicalreview">Revisão Técnica</a>
                </li>
                <c:if test="${isManager or isAdmin}">
                    <li class="${localN == 3 ? 'active':''}">
                        <a href="<%=Strings.BASE%>/gestor">Gestão</a>
                    </li>
                </c:if>
                <c:if test="${isAdmin}">
                    <li class="${localN == 4 ? 'active':''}">
                        <a href="<%=Strings.BASE%>/admin">Administrador</a>
                    </li>
                </c:if>
            </ul>
        </div>

        <div class="nav-content">
            <div class="nav-wrapper">
                <ul>
                    <li class="hide-on-large-only">
                        <a style="position: relative; bottom: 20px;" href="#" data-activates="menu-mobile" class="button-collapse">
                            <i class="fa fa-navicon fa-2x" aria-hidden="true"></i>
                        </a>
                    </li>
                    <li class="hide-on-med-and-down ${localN == 0 ? 'active':''}" style="">
                        <a href="<%=Strings.BASE%>">Meus Inventários</a>
                    </li>
                    <li class="hide-on-med-and-down ${localN == 1 ? 'active':''}">
                        <a href="<%=Strings.BASE%>/qualityreview">Revisão Qualidata</a>
                    </li>
                    <li class="hide-on-med-and-down ${localN == 2 ? 'active':''}">
                        <a href="<%=Strings.BASE%>/technicalreview">Revisão Técnica</a>
                    </li>
                    <c:if test="${isManager or isAdmin}">
                        <li class="hide-on-med-and-down ${localN == 3 ? 'active':''}">
                            <a href="<%=Strings.BASE%>/gestor">Gestão</a>
                        </li>
                    </c:if>
                    <c:if test="${isAdmin}">
                        <li class="hide-on-med-and-down ${localN == 4 ? 'active':''}">
                            <a href="<%=Strings.BASE%>/admin">Administrador</a>
                        </li>
                    </c:if>
                    <li class="hide-on-med-and-down right sair">
                        <a href="<%=Strings.BASE%>/logout">SAIR</a>
                    </li>
                    <li class="hide-on-med-and-down right perfil">
                        <a style="" href="<%=Strings.BASE%>/profile">Perfil: <span><%=user.getFirstName()%></span></a>
                    </li>
                    <li class="hide-on-med-and-down right notification">
                        <a href="<%=Strings.BASE%>/notifications">
                            <span id="notificationBell" style="display: block;" onchange="teste();"><%=notifications%></span>
                            <i id="notifyBell" ${notificacoes > 0 ? 'class="fa fa-bell"' : 'class="fa fa-bell-o"'} aria-hidden="true"></i>
                        </a>
                    </li>

                    <li class="right hide-on-large-only" style="border: 0;">
                        <a id="perfilMobile" style="position: relative; bottom: 20px;" href="<%=Strings.BASE%>/profile">
                            <i class="fa fa-user-circle-o fa-2x" aria-hidden="true" style="color:#4DBCC4; margin-right: 5px;"></i>
                            <i class="fa fa-ellipsis-v fa-2x" aria-hidden="true" style="color: #BDBDBD;"></i>
                        </a>
                    </li>
                </ul>
                <div class="location"><b>Você está em: <u>${local}</u></b></div>
            </div>
        </div>
    </nav>
    <script type="application/javascript" src="<%=Strings.BASE%>/assets/jquery-3.2.1.min.js"></script>
    <script type="text/javascript">
                                $(document).ready(function () {
                                    $(".button-collapse").sideNav();
                                    //change dinamically bell class when notificaitons size is 0
                                    $('#notificationBell').on('DOMSubtreeModified', function () {
                                        if ($("#notificationBell").text() == 0)
                                            $("#notifyBell").attr('class', 'fa fa-bell-o');
                                        else
                                            $("#notifyBell").attr('class', 'fa fa-bell');
                                    });
                                });
    </script>
</header>