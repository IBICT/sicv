<%@page import="resources.Strings"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
        <a href="<%=Strings.BASE%>" class="brand-logo"><img src="<%=Strings.BASE%>/assets/img/logo.png" alt="SICV"> Importador de Inventários</a>
    </div>
</nav>