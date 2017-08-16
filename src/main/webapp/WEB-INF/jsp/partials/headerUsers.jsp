<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@page import="br.com.ibict.acv.sicv.model.User"%>
<%@page import="br.com.ibict.acv.sicv.controller.HomeController"%>
<%@page import="resources.Strings"%>

<sec:authorize var="loggedIn" access="isAuthenticated()" />

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="navbar-wrapper">
    <div class="container">

        <nav class="navbar navbar-inverse navbar-static-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="<%=Strings.BASE%>">SICV</a>
                </div>
                <div id="navbar" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="<%=Strings.BASE%>">HOME</a></li>
                        <li><a href="<%=Strings.BASE%>/ilcd">ILCD</a></li>
                        <c:if test="${loggedIn}">
                         <%
                                 User user = (User) HomeController.session().getAttribute("user");
                                 if(user.getPerfil().equals("ADMINISTRADOR")){
                         %>

                         <%="<li><a href=\""+ Strings.BASE +"/admin/\">ADMIN</a></li>"%>

                         <%
                                 }
                         %>
                        </c:if>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                    	<c:if test="${loggedIn}">
                         <%
                                 User user = (User) HomeController.session().getAttribute("user");
                         %>

                         <%="<li><a href=\"" + Strings.BASE + "/logout\">" + user.getFirstName() + "</a></li>"%>
						</c:if>
						<c:if test="${not loggedIn}">

                         <li><a href="<%=Strings.BASE%>/login">Login</a></li>
						</c:if>


                    </ul>
                </div>
            </div>
        </nav>

    </div>
</div>