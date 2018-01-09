<%@page import="resources.Strings"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authorize access="hasAuthority('ADMIN')" var="isAdmin" />

<style>
	nav {
        background-color: #4dbcc4;
    }
       
    nav .brand-logo {
        margin-left: 50px;
    }
    
    nav .brand-logo img {
        margin-right: 20px;
        vertical-align: middle;
    }
    .headerDiv{
    	width: 90%;
    	margin-left:5%;
    	margin-top: 2%;
    }
    .principalDiv{
	   	width: 90%;
	   	margin-left:5%;
	   	margin-top: 2%;
    }

</style>
<nav>
    <div class="nav-wrapper">
    	<sec:authorize access="hasAuthority('ADMIN')">
	        <a href="<%=Strings.BASE%>/admin" class="brand-logo">		
	        <img src="<%=Strings.BASE%>/assets/img/logo.png" alt="SICV"> Importador de Inventários</a>
    	</sec:authorize>
    	<c:if test="${not isAdmin}">
    	    <a href="<%=Strings.BASE%>" class="brand-logo">		
	        <img src="<%=Strings.BASE%>/assets/img/logo.png" alt="SICV"> Importador de Inventários</a>
    	</c:if>
    </div>
</nav>