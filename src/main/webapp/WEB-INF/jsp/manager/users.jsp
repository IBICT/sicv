<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="resources.Strings"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">

	<head>
		<meta charset="UTF-8">
		<title>SICV</title>
		
	</head>
	
	<body>
		<div style="margin: 0px;" class="row">
			<div class="col s3 sicv-table-th"><h5>Nome</h5></div>
			<div class="col s3 sicv-table-th"><h5>Email</h5></div>
			<div class="col s2 sicv-table-th"><h5>Selecionar</h5></div>
		</div>
		<hr />
		<c:forEach items="${users}" var="user" varStatus="loop">
			<div style="margin: 0px;" class="row" id="qRadios">
							
							<div style="height: 40px; position: relative; top: 10px;" class="col s3 ">
								${user.firstName} ${user.lastName}
							</div>
							<div style="height: 40px; position: relative; top: 10px;" class="col s3">
								${user.email}
							</div>
							<div style="height: 40px; position: relative; top: 10px;text-align: center;" class="col s2 ">
								<input type="radio" id="radio1[${loop.index}]" name="user"
									value="${user.id}" />
								<label for="radio1[${loop.index}]"></label>
							</div>
						</div>
						<hr />
			
		</c:forEach>
   </body>
</html>