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
    <link rel="stylesheet" href="<%=Strings.BASE%>/assets/steps.css">
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
        
        hr{
        	border-top: 0.5px solid #6B6B6B;
        }
		
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
		
		/* Tabs */
		.nav-tabs>li {
		    min-width: 5px;
		    max-width: 33%;
		}
		.nav-tabs>li>a {
		    padding: 2px 10px;
		    text-overflow: ellipsis;
		    white-space: nowrap;
		    overflow: hidden;
		    width: 100%;
		}
		.nav-tabs>li.disable>a {
		    color: white;
		    background-color: #E0E0E0;
		    pointer-events: none;
		}
		.nav-tabs>li.disable:hover{
		    cursor: not-allowed;
		}
		.nav-tabs>li.active>a {
		    color: white;
		    background-color: #4DBCC4;
		}
		.nav-tabs>li>a {
		    color: white;
		    background-color: #A3D3D6;
		}
		.nav-tabs>li.active>a:hover, .nav-tabs>li.active>a:focus{
		    color: white;
		    background-color: #4DBCC4;
		}
		/* Tabs */
		
		.headerStatus {
		    font-family: Titillium Web;
		    font-style: normal;
		    font-weight: 300;
		    line-height: normal;
		    font-size: 20px;
		    color: #3D3D3D;
		}
        
    </style>

</head>

<body>
	<jsp:include page="/WEB-INF/jsp/partials/nav.jsp" />
	<div class="headerDiv">
        <jsp:include page="/WEB-INF/jsp/partials/header.jsp" />
	</div>
    <div class="row" style="width: 90%;">
        <div class="row">
		    <div class="row">
		        <h5 class="page-title">${ilcd.name}</h5>
			    <hr />
		    </div>
            <div class="col s6">
	            <div style="padding-bottom: 2%;">
	                <h5>Usuário</h5>
	                <h6 class="page-title bold italic">${user.firstName} ${user.lastName}</h6>
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
            
            <div class="col s4">
                    <div class="headerStatus">
                        Acompanhamento de revisões 
                    </div>
                    <ul class="nav nav-tabs" style="padding: 1px;border-bottom:5px solid #4DBCC4;">
                        <li class="active">
                            <a  href="#1" data-toggle="tab" title="Revisão Qualidata">Revisão Qualidata</a>
                        </li>
                        <li>
                            <a href="#2" data-toggle="tab" title="Revisão Técnica">Revisão Técnica</a>
                        </li>
                        <li class="disable">
                            <a href="#3" disabled data-toggle="tab" title="Publicar">Publicar</a>
                        </li>
                    </ul> 

                    <div class="tab-content " >
                        <c:forEach var="statu" items="${status}"> 
                            <div class="tab-pane active" id="1">
                                <c:choose>
                                    <c:when test="${statu.type == 0}">
                                        <div class="row" style="color: #00697C; margin: 10px 0;">
                                            Envio do autor
                                        </div>
                                        <div class="row">
                                            <div class="col s1">
                                                <i class="fa fa-angle-right" aria-hidden="true" style="color: #00697C;"></i>
                                            </div>
                                            <div class="col s4">
                                                <a href="#"><i class="fa fa-file-archive-o" style="margin-right: 5px;" aria-hidden="true"></i> ILCD.zip</a>
                                            </div>
                                            <div class="col offset-s1 s6">
                                                <a href="<%=Strings.BASE%>/gestor/${ilcd.id}/invite" class="btn" title="Convidar Revisor" style="color: #fff; background-color: #00697C; border-radius: 5px; padding: 0 10px; text-transform: none; font-weight: bold; text-overflow: ellipsis; white-space: nowrap; overflow: hidden; width: 100%; min-width: 50px;">Convidar Revisor</a>
                                            </div>
                                        </div>
                                    </c:when>
                                    <c:when test="${statu.type == 1}">
                                        <div class="row" style="color: #00697C; margin: 10px 0;">
                                            Enviado para  <a href="#" style="color: #00697C; font-weight: bold; margin: 0 10px;">${statu.revisor.firstName}</a> <a href="#" style="color:#6B6B6A;text-decoration: underline;">Cancelar Convite</a>
                                        </div>
                                        <hr />
                                    </c:when>
                                </c:choose>
                            </div>
                            <div class="tab-pane" id="2">
                            </div>
                            <div class="tab-pane" id="3">
                            </div>
                        </c:forEach>
                    </div>
                    
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
    </div>
    <script type="application/javascript" src="<%=Strings.BASE%>/assets/jquery-3.2.1.min.js"></script>
    <script type="application/javascript" src="<%=Strings.BASE%>/assets/bootstrap-3.3.7/js/bootstrap.min.js"></script>
    <script type="application/javascript" src="<%=Strings.BASE%>/assets/materialize/js/materialize.min.js"></script>
    <script>
    </script>
</body>

</html>

<%--             <div class="col s6">
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
                </c:forEach> --%>