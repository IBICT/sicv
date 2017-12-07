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
			<c:choose>
				<c:when test="${ilcd.homologation.lastArchive.status.type lt 3 and ilcd.homologation.lastArchive.status.status lt 3}">
					<c:if test="${user.perfil == 'QUALITY_REVIEWER' }">
						<div style="margin: 0px;" class="row" id="qRadios">
							
							<div style="height: 40px; position: relative; top: 10px;" class="col s3 ">
								${user.firstName} ${user.lastName}
							</div>
							<div style="height: 40px; position: relative; top: 10px;" class="col s3">
								${user.email}
							</div>
							<div style="height: 40px; position: relative; top: 10px;text-align: center;" class="col s2 ">
								<input type="radio" id="radio1[${loop.index}]" 
									value="${user.id}" ${user.perfil == 'ADMIN' ? 'checked="checked"' : '' } />
								<label for="radio1[${loop.index}]"></label>
							</div>
						</div>
						<hr />
					</c:if>
				</c:when>
				<c:when test="${ilcd.homologation.lastArchive.status.type > 1}">
					<c:if test="${(ilcd.homologation.lastArchive.status.type eq 2 and ilcd.homologation.lastArchive.status.status gt 3)
								or (ilcd.homologation.lastArchive.status.type eq 3 and ilcd.homologation.lastArchive.status.status lt 5) }">
						<c:if test="${user.perfil == 'USER'}">
							<div style="margin: 0px;" class="row">
								
								<div style="height: 40px; position: relative; top: 10px;" class="col s3 ">
									${user.firstName} ${user.lastName}
								</div>
								<div style="height: 40px; position: relative; top: 10px;" class="col s3">
									${user.email}
								</div>
								<div style="height: 40px; position: relative; top: 10px;text-align: center;" class="col s2 ">
									<input type="checkbox" id="box1[${loop.index}]" onclick=""
										value="ADMIN" ${user.perfil == 'ADMIN' ? 'checked="checked"' : '' } />
									<label for="box1[${loop.index}]"></label>
								</div>
							</div>
							<hr />
						</c:if>
					</c:if>
				</c:when>
			</c:choose>
			
		</c:forEach>
   </body>
</html>