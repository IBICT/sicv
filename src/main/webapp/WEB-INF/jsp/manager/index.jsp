<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@page import="resources.Strings"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <meta charset="UTF-8">
    <title>Home</title>
    <link href="<%=Strings.BASE%>/assets/bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="<%=Strings.BASE%>/assets/materialize/css/materialize.min.css">
    <link href="https://fonts.googleapis.com/css?family=Titillium+Web" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <style>
        html {
            font-family: 'Titillium Web', "Roboto", sans-serif;
            color: #999;
        }
        hr {
        	border-top: 2px solid #000;
        }
        .page-title {
            color: #00697c;
        }
        .italic{
        	font-style: italic;
        }
        .bold{
        	font-weight: bold;
        }
        .yellow-title {
            color: #accc5f;
        }
        .liteblue-title {
            color: #4dbcc4;
        }
        .btn-save {
            background-color: #4dbcc4;
        }
        .btn-yellow {
            background-color: #accc5f;
        }
        .btn-anexar {
        	background-color: #00697c;
        }
        
    </style>

</head>

<body>
	<jsp:include page="/WEB-INF/jsp/partials/nav.jsp" />
	<div class="headerDiv">
        <jsp:include page="/WEB-INF/jsp/partials/header.jsp" />
	</div>
	
	<!-- Modal Structure -->
	<div id="inviteQ" class="modal modal-fixed-footer">
	  <div class="modal-content">
	    <h2 >Selecione um revisor de qualidade</h2>
	    <jsp:include page="/WEB-INF/jsp/manager/users.jsp" />
	  </div>
	  <div class="modal-footer">
	    <a href="#!" class="modal-action modal-close waves-effect waves-red btn-flat ">Cancelar</a>
	    <a href="<%=Strings.BASE%>manager/invite-quality-review?user=${user.id}&ilcd=${ilcd.id}" class="modal-action modal-close waves-effect waves-green btn-flat ">OK</a>
	  </div>
	</div>
	
	<!-- Modal Structure -->
	<div id="inviteT" class="modal modal-fixed-footer">
	  <div class="modal-content">
	    <h2 >Selecione um revisor técnico</h2>
	    <jsp:include page="/WEB-INF/jsp/manager/users.jsp" />
	  </div>
	  <div class="modal-footer">
	    <a href="#!" class="modal-action modal-close waves-effect waves-red btn-flat ">Cancelar</a>
	    <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat ">OK</a>
	  </div>
	</div>	
	
	<div class="principalDiv ">
    	<div class="row" style="width: 90%;">
        	<div class="row">
	        	<div >
		        	<h5 class="page-title ">${ilcd.name}</h5>
		        	<hr />
	        	</div>

            <div class="col s6">
	            <div style="padding-bottom: 2%;">
	                <h5>Autor correpondente</h5>
	            </div>
                <h6 class="bold">Autor/es</h6>
                <p>${ilcd.email} </p>
                <br>
                <h6 class="bold">Categoria</h6>
                <p>${ilcd.category}</p>
                <br>
                <h6 class="bold">Descrição</h6>
                <p>${ilcd.description}</p>
                
            </div>
			<div class="col s6">
            	<div class="row">
                	<div class="col s2">
						<button class="btn btn-save modal-trigger" data-target="inviteQ" style="float: left;" >Convidar Q+</button>
	                </div>
	                <div class="col s2 offset-s2">
		                <button class="btn btn-yellow modal-trigger" data-target="inviteT" >Convidar T+</button>
	                </div>
	                <div class="col s2 offset-s2">

						<c:set var="pathFile" value="${ilcd.status[0].archive.pathFile}" />
						<div>
							<h6>Arquivo Inicial</h6>
							<i class="material-icons page-title offset-s5">insert_drive_file</i>
							<a href="<%=Strings.BASE%>ilcd/${pathFile}/?name=ILCD.zip">
								ILCD.zip
							</a>
			        	</div>
	                </div>
            	</div>
                <hr />
                
                <c:forEach items="${ilcd.status}" var="status" varStatus="loop">
                	<c:if test="${status.type eq 2 and status.status gt 2}">
		                <div class="row">
				            <h5 class="liteblue-title">Revisão Qualidata</h5> 
			                <h6>Suelen Santos</h6>
		                	<h6 class="">Revisão Entregue</h6>
		                    <div>
								<c:set var="pathFile" value="${status.archive.pathFile}" />
		                    	<a href="<%=Strings.BASE%>ilcd/${pathFile}/?name=ILCD.zip">
		      		                <i class="material-icons page-title">insert_drive_file</i>
		                       	</a>
			                    ${status.endDate}
		                    </div>
		                    <hr />
		                	<h5 class="page-title">Envio do Autor</h5>
							<div>
								<c:set var="pathFile" value="${status.archive.pathFile}" />
		                        <i class="material-icons page-title">insert_drive_file</i>
			                    <a href="<%=Strings.BASE%>ilcd/${pathFile}/?name=ILCD.zip">
		                       		ILCD.zip
		                       	</a>
		                    </div>
		                    <hr />
		                </div>
					</c:if>
                </c:forEach>
                
                <c:forEach items="${ilcd.status}" var="status" varStatus="loop">
                	<c:if test="${status.type eq 3 and status.status gt 3}">
		                <div class="row">
							<h5 class="yellow-title">Revisão Técnica</h5>
							<h6>Wellington Stanley</h6>
							<h6 class="">Revisão Entregue</h6>
			               
			           		<c:set var="pathFile" value="${ilcd.status[0].archive.pathFile}" />
			               	<a href="<%=Strings.BASE%>ilcd/${pathFile}/?name=ILCD.zip">
				                <i class="material-icons yellow-title">insert_drive_file</i>
							</a>
			                 30/08/2017
			                <hr />
			                
			               	<h5 class="page-title">Envio do Autor</h5>
							<div>
								<c:set var="pathFile" value="${ilcd.status[0].archive.pathFile}" />
			                       <i class="material-icons page-title">insert_drive_file</i>
			                    <a href="<%=Strings.BASE%>ilcd/${pathFile}/?name=ILCD.zip">
			                      		ILCD.zip
			                      	</a>
							</div>
							<hr />
		                </div>
					</c:if>
				</c:forEach>
                
                <c:forEach items="${ilcd.status}" var="status" varStatus="loop">
                	<c:if test="${status.type eq 3 and status.status ne 4}">
		                <div class="row">
		                    <div class="col s3">${status.endDate}</div>
		                    <div class="col s3 "><i class="material-icons yellow-title">insert_drive_file</i>
	                    	<a href="#">
	                       		PDF
	                       	</a>
		                    </div>
		                    <div class="col s3">
								<c:set var="pathFile" value="${ilcd.status[0].archive.pathFile}" />
		                        <i class="material-icons page-title">insert_drive_file</i>
			                    <a href="<%=Strings.BASE%>ilcd/${pathFile}/?name=ILCD.zip">
		                       		ILCD.zip
		                       	</a>
		                    </div>
		                    <div class="col s3">
			                    <c:set var="pathFile" value="${ilcd.status[0].archive.pathFile}" />
		                        <i class="material-icons page-title">insert_drive_file</i>
	       		                    <a href="<%=Strings.BASE%>ilcd/${pathFile}/?name=${status.archive.commentName}">
		                       		${status.archive.commentName}
		                       	</a>
		                    </div>
		                </div>
	                	<hr />
	                </c:if>
                </c:forEach>
                
			</div>
        </div>
    </div>
    <script type="application/javascript" src="<%=Strings.BASE%>/assets/jquery-3.2.1.min.js"></script>
    <script type="application/javascript" src="<%=Strings.BASE%>/assets/materialize/js/materialize.min.js"></script>
    <script>
    $(document).ready(function(){
        // the "href" attribute of the modal trigger must specify the modal ID that wants to be triggered
        $('.modal').modal();

      });
    </script>
</body>

</html>
