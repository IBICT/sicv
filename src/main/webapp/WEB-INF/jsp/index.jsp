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
<div class="principalDiv ">
    <div class="row" style="width: 90%;">
        <div class="row">
		    <div class="row">
		        <h5 class="page-title">${ilcd.name}</h5>
			    <hr />
		    </div>
            <div class="col s6">
	            <div style="padding-bottom: 2%;">
	                <h5>Usuário</h5>
	                <h6 class="page-title bold italic">${user.userName}</h6>
	            </div>
                <h6 class="bold">Autor/es</h6>
                <c:forEach items="${ilcd.authors}" var="author" varStatus="loop">
	                <i>${author};</i>
               	</c:forEach>
                <p>
                <c:forEach items="${ilcd.emails}" var="email" varStatus="loop">
                	<i>${email};</i>
                </c:forEach>
                <a href="#" style="float: right;"> Editar </a>
                <hr />
                <h6 class="bold">Categoria</h6>
                <p>${ilcd.category}
                <a href="#" style="float: right;"> Editar </a>
                </p>
                <hr />
                <h6 class="bold">Descrição</h6>
                <p>${ilcd.description}
                <a href="#" style="float: right;"> Editar </a>
                </p>
                <hr />
                <button class="btn" style="float: right;">Salvar alterações</button>
            </div>
            <div class="col s6">
            	<div class="row">
	                <h5>Histórico</h5>
            	</div>
                <div class="row">
                    <div class="col s3 bold">Data</div>
                    <div class="col s3 yellow-title bold">Devolução técnica</div>
                    <div class="col s6 bold page-title">Minha resposta para esta revisão</div>
                </div>
                
	                <div class="row">
	                    <div class="col s3">30/08/2017</div>
	                    <div class="col s3 yellow-title"><i class="material-icons">insert_drive_file</i></div>
                       	
	                    <div class="col s6">
	                        <div class="row">
	                            <div class="file-field input-field">
	                                <div class="btn btn-anexar">
	                                    <span>Anexar ILCD</span>
	                                </div>
	                                <input type="file" class="btn" name="anexar" id="file" disabled="disabled">
		                            <div class="file-path-wrapper">
		                                <input placeholder="Escolha arquivo em formato ILCD" class="file-path validate" type="text" disabled="disabled">
		                            </div>
	                            </div>
	                        </div>
	                        <div class="row">
	                            <div class="file-field input-field">
	                                <div class="btn btn-anexar">
	                                    <span>Comentário</span>
	                                </div>
									<input type="file" class="btn" name="anexar" id="file" disabled="disabled">
		                            <div class="file-path-wrapper">
		                                <input placeholder="Escolha arquivo em formato ILCD" class="file-path validate" type="text" disabled="disabled">
		                            </div>
	                            </div>
	                        </div>
	                        <div class="row">
	                            <button class="btn col s6 offset-s6 btn-anexar" disabled="disabled">Enviar</button>
	                        </div>
	                    </div>
	                </div>
                <hr />
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
			                    <a href="<%=Strings.BASE%>/ilcd/${pathFile}/?name=ILCD.zip">
		                       		ILCD.zip
		                       	</a>
		                    </div>
		                    <div class="col s3">
			                    <c:set var="pathFile" value="${ilcd.status[0].archive.pathFile}" />
		                        <i class="material-icons page-title">insert_drive_file</i>
	       		                    <a href="<%=Strings.BASE%>/ilcd/${pathFile}/?name=${status.archive.commentName}">
		                       		${status.archive.commentName}
		                       	</a>
		                    </div>
		                </div>
	                	<hr />
	                </c:if>
                </c:forEach>
				<c:forEach items="${ilcd.status}" var="status" varStatus="loop">
                   	<c:if test="${status.type eq 2}">
   	                   	<c:if test="${status.status eq 4}">
			                <div class="row">
			                    <div class="col s3">${status.endDate}</div>
			                    <div class="col s9"><i>Qualidata aprovado | ILCD encaminhado para revisão Técnica |</i></div>
			                </div>
			                <hr />
			                <div class="row">
			                    <div class="col s4 bold offset-s2 liteblue-title" style="text-align: center;">Devolução Qualidata</div>
			                    <div class="col s4 bold page-title" >Minha resposta para esta revisão</div>
			                </div>
		                </c:if>
		                <div class="row">
		                    <div class="col s3">${status.endDate}</div>
		                    <div class="col s3"><i class="material-icons liteblue-title">insert_drive_file</i>
	   		                    <a href="#">
		                       		PDF
		                       	</a>
		                    </div>
		                    <div class="col s3">
			                    <c:set var="pathFile" value="${ilcd.status[0].archive.pathFile}" />
		                        <i class="material-icons page-title">insert_drive_file</i>
		                        	<a href="<%=Strings.BASE%>/ilcd/${pathFile}/?name=ILCD.zip">
		                        		ILCD.zip
		                        	</a>
		                    </div>
		                    <div class="col s3">
			                    <c:set var="pathFile" value="${ilcd.status[0].archive.pathFile}" />
		                        <i class="material-icons page-title">insert_drive_file</i>
								<a href="<%=Strings.BASE%>/ilcd/${pathFile}/?name=${status.archive.commentName}">
		                       		${status.archive.commentName}
		                       	</a>
		                    </div>
		                </div>
	                </c:if>
	                <hr />
                </c:forEach>
                <div class="row">
                    <div class="col s6 offset-s6 page-title bold">Arquivo inicial</div>
                </div>
                <div class="row">
                    <div class="col s3">${ilcd.status[0].notify.notifyDate}</div>
                    <div class="col offset-s3">
	                    <c:set var="pathFile" value="${ilcd.status[0].archive.pathFile}" />
                        <i class="material-icons page-title">insert_drive_file</i>
                        	<a href="<%=Strings.BASE%>/ilcd/${pathFile}/?name=ILCD.zip">
                        		ILCD.zip
                        	</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
    <script type="application/javascript" src="<%=Strings.BASE%>/assets/jquery-3.2.1.min.js"></script>
    <script type="application/javascript" src="<%=Strings.BASE%>/assets/materialize/js/materialize.min.js"></script>
    <script>
    </script>
</body>

</html>
