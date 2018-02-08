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
    <link rel="stylesheet" href="<%=Strings.BASE%>/assets/css/fonts.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="<%=Strings.BASE%>/assets/font/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="<%=Strings.BASE%>/assets/steps.css">
    <style>
		
		html {
            font-family: 'Titillium Web', "Roboto", sans-serif;
            color: #999;
        }
        
        hr{
        	border-top: 2px solid #eee;
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
            color: #9AC240;
        }
        
        .red-title {
            color: #C3697C;
        }
        
        .btn-save {
            background-color: #4dbcc4;
        }
        
       .btn-anexar {
        	background-color: #00697c;
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
		    max-width: 50%;
		    width: 50%;
		    text-align: center;
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
        .file-field input.file-path, input.file-path:focus, input.file-path:DISABLED, input[type=text]:not(.browser-default):disabled{
        	border: 1px solid #BDBDBD !important;
        	width: 284px !important;
        }
        .file-field .file-path-wrapper{
			overflow: visible;
        }
		/* Tabs */
		.headerStatus {
		    font-weight: 300;
		    line-height: normal;
		    font-size: 20px;
		    color: #3D3D3D;
		}
		
		.fa-angle-right {
			font-size: 18px;
			line-height: 18px;
			color: #00697C;
			width: 12px;
			height: 18px;
			font-style: normal;
		}
		
        .btn {
            background-color: #4DBCC4 !important;
            margin-left: 10px !important;
            font-size: 16px !important;
            text-transform: none !important;
            font-weight: bold;
            height: 34px;
            width: 182px;
            letter-spacing: .2px;
            padding: 0px !important;
            line-height: 0px;
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
            <div class="col s7">
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
            
            <div class="col s5">
                    <div class="headerStatus">
	                    <div>
	                        <h5>Acompanhamento de revisões</h5> 
	                    </div>
                    </div>
                    <ul class="nav nav-tabs" style="padding: 1px;border-bottom:5px solid #4DBCC4;">
                        <li class="active">
                            <a  href="#1" data-toggle="tab" title="Revisão Qualidata">Revisão Qualidata</a>
                        </li>
                        <li>
                            <a href="#2" data-toggle="tab" title="Revisão Técnica">Revisão Técnica</a>
                        </li>
                    </ul> 

                    <div class="tab-content " >
                           <div class="tab-pane active" id="1">
								<c:choose>
                            		<c:when test="${lastStatusQ.result == 1 or lastStatusQ.result == 3}">
                            			<c:if test="${lastStatusQ.result == 1}">
	                            			<div class="col yellow-title bold" style="padding: 0;">Aprovado</div>
											<div class="row">
											</div>
											<div class="row">
									 			<c:set var="pathFile" value="${lastStatusQ.archive.pathFile}" />
									 			<i class="fa fa-angle-right"></i>
												 <a href="<%=Strings.BASE%>/ilcd/${pathFile}/?name=ILCD.zip">
												 	<i class="fa fa-file-archive-o" style="margin-right: 5px;" aria-hidden="true"></i>
												 	 ILCD.zip
												 </a>
											</div>
											<hr>
										</c:if>
										<c:if test="${lastStatusQ.result == 3}">
	                            			<div class="col red-title bold" style="padding: 0;">Reprovado</div>
											<div class="row">
											</div>
											<div class="row">
									 			<c:set var="pathFile" value="${lastStatusQ.archive.pathFile}" />
									 			<i class="fa fa-angle-right"></i>
												 <a href="<%=Strings.BASE%>/ilcd/${pathFile}/?name=ILCD.zip">
												 	<i class="fa fa-file-archive-o" style="margin-right: 5px;" aria-hidden="true"></i>
												 	 ILCD.zip
												 </a>
											</div>
											<hr>
										</c:if>
                            		</c:when>
                            		<c:when test="${lastStatusUser.previous.result == 2}">
		                            	<c:if test="${lastStatusUser.archive != null}">
		                           		    <div class="row" style="margin: 10px 0;">
		                                           <i style="font-size: 14px;">Enviado para  nova revisão</i>
		                                    </div>
		                                    <div class="row">
												<i class="fa fa-angle-right" aria-hidden="true" style="color: #00697C;"></i>
												<a href="<%=Strings.BASE%>/ilcd/${lastStatusUser.previous.archive.pathFile}/?name=ILCD.zip"><i class="fa fa-file-archive-o" style="margin-right: 5px;" aria-hidden="true"></i> ILCD.zip</a>
		                                    </div>
		                                    <hr />
		                            	</c:if>
		                               	<c:if test="${lastStatusUser.archive == null}">
		                                   	<div class="row input field">
		                                   		<div class="row input-field">
		                                    		<i>Anexar arquivos com as correções sugeridas</i>
		                                   		</div>
		                                   	</div>
		                                    <div class="row">
			                                    <form action="<%=Strings.BASE%>/ilcd/newAdjust/${lastStatusUser.id}" enctype="multipart/form-data" method="post">
			                                        <div class="file-field input-field" style="bottom: 25px;margin-left: -10px;">
														<span class="btn">Anexar ILCD *</span> <input type="file" class="btn" name="file" id="file" required="required">
														<div class="file-path-wrapper" style="padding-left: 0px;">
															<input placeholder="Escolha arquivo em formato ILCD" class="file-path validate" type="text" disabled="disabled" style="padding-left: 15px;">
														</div>
													</div>
													<div class="file-field input-field" style="bottom: 25px; margin-left: -10px; margin-top: -5px;">
														<span class="btn">Escolher Arquivo</span> <input type="file" class="btn" name="fileComplement" id="fileComplement">
														<div class="file-path-wrapper" style="padding-left: 0px;">
															<input placeholder="Gráfico, fluxograma" class="file-path validate" type="text" disabled="disabled" style="padding-left: 15px;">
														</div>
														<button class="btn" style="float: right;">Enviar</button>
													</div>
			                                    </form>
		                                    </div>
											<hr>
		                               	</c:if>
                            		</c:when>
                            	</c:choose>
								
		                        <c:forEach var="statu" items="${statusHistory}"> 
									<div class="row" style="margin: 10px 0;">
									<div class="col s6">
									    <b style="color: #00697C;font-size: 14px;">
									    	Aprovado com correções
									    </b>
									</div>
									  	<div class="col s6">
										    <a style="font-size: 14px; color: #6B6B6A;" href="<%=Strings.BASE%>/qualityreview/${statu.previous.id}/view">
												<i style="color: #00697C; margin-right: 5px;" class="fa fa-file-text-o" aria-hidden="true"></i>
												<b style="color: #00697C;font-size: 14px;">	Ver revisão	</b>
											</a>
											- ${statu.previous.requestDateString}
									 	</div>
									</div>
									
									<div class="row">
									    <div>
									    	<i class="fa fa-angle-right" aria-hidden="true" style="color: #00697C;"></i>
									  		<a href="<%=Strings.BASE%>/ilcd/${statu.previous.archive.pathFile}?name=ILCD.zip"><i class="fa fa-file-archive-o" style="margin-right: 5px;" aria-hidden="true"></i> ILCD.zip</a>
									    </div>
									
									    <div class="col offset-s1 s6">
									    </div>
									</div>
									<hr>

		                        </c:forEach>
								
								<div class="row">
									<div class="col page-title bold" style="padding: 0;">Arquivo inicial</div> - ${initialStatus.notify.notifyDate}
									<div class="row">
									</div>
									<div class="row">
							 			<c:set var="pathFile" value="${initialStatus.archive.pathFile}" />
							 			<i class="fa fa-angle-right"></i>
										 <a href="<%=Strings.BASE%>/ilcd/${pathFile}/?name=ILCD.zip">
										 	<i class="fa fa-file-archive-o" style="margin-right: 5px;" aria-hidden="true"></i>
										 	 ILCD.zip
										 </a>
									</div>
								</div>
                           </div>
                           <div class="tab-pane" id="2">
								<c:choose>
                            		<c:when test="${lastStatusT.result == 1 or lastStatusQ.result == 3}">
                            			<c:if test="${lastStatusT.result == 1}">
	                            			<div class="col yellow-title bold" style="padding: 0;">Aprovado</div>
											<div class="row">
											</div>
											<div class="row">
									 			<c:set var="pathFile" value="${lastStatusT.archive.pathFile}" />
									 			<i class="fa fa-angle-right"></i>
												 <a href="<%=Strings.BASE%>/ilcd/${pathFile}/?name=ILCD.zip">
												 	<i class="fa fa-file-archive-o" style="margin-right: 5px;" aria-hidden="true"></i>
												 	 ILCD.zip
												 </a>
											</div>
											<hr>
										</c:if>
										<c:if test="${lastStatusT.result == 3}">
	                            			<div class="col red-title bold" style="padding: 0;">Reprovado</div>
											<div class="row">
											</div>
											<div class="row">
									 			<c:set var="pathFile" value="${lastStatusT.archive.pathFile}" />
									 			<i class="fa fa-angle-right"></i>
												 <a href="<%=Strings.BASE%>/ilcd/${pathFile}/?name=ILCD.zip">
												 	<i class="fa fa-file-archive-o" style="margin-right: 5px;" aria-hidden="true"></i>
												 	 ILCD.zip
												 </a>
											</div>
											<hr>
										</c:if>
                            		</c:when>
                            		<c:when test="${lastStatusUserT.previous.result == 2}">
		                            	<c:if test="${lastStatusUserT.archive != null}">
		                           		    <div class="row" style="margin: 10px 0;">
		                                           <i style="font-size: 14px;">Enviado para  nova revisão</i>
		                                    </div>
		                                    <div class="row">
												<i class="fa fa-angle-right" aria-hidden="true" style="color: #00697C;"></i>
												<a href="<%=Strings.BASE%>/ilcd/${lastStatusUserT.previous.archive.pathFile}/?name=ILCD.zip"><i class="fa fa-file-archive-o" style="margin-right: 5px;" aria-hidden="true"></i> ILCD.zip</a>
		                                    </div>
		                                    <hr />
		                            	</c:if>
		                               	<c:if test="${lastStatusUserT.archive == null}">
		                                   	<div class="row input field">
		                                   		<div class="row input-field">
		                                    		<i>Anexar arquivos com as correções sugeridas</i>
		                                   		</div>
		                                   	</div>
		                                    <div class="row">
			                                    <form action="<%=Strings.BASE%>/ilcd/newAdjust/${lastStatusUserT.id}" enctype="multipart/form-data" method="post">
			                                        <div class="file-field input-field" style="bottom: 25px;margin-left: -10px;">
														<span class="btn">Anexar ILCD *</span> <input type="file" class="btn" name="file" id="file" required="required">
														<div class="file-path-wrapper" style="padding-left: 0px;">
															<input placeholder="Escolha arquivo em formato ILCD" class="file-path validate" type="text" disabled="disabled" style="padding-left: 15px;">
														</div>
													</div>
													<div class="file-field input-field" style="bottom: 25px; margin-left: -10px; margin-top: -5px;">
														<span class="btn">Escolher Arquivo</span> <input type="file" class="btn" name="fileComplement" id="fileComplement">
														<div class="file-path-wrapper" style="padding-left: 0px;">
															<input placeholder="Gráfico, fluxograma" class="file-path validate" type="text" disabled="disabled" style="padding-left: 15px;">
														</div>
														<button class="btn" style="float: right;">Enviar</button>
													</div>
			                                    </form>
		                                    </div>
											<hr>
		                               	</c:if>
                            		</c:when>
                            	</c:choose>
                            	
                            	<c:forEach var="statusT" items="${statusHistoryT}"> 
									<div class="row" style="margin: 10px 0;">
									<div class="col s6">
									    <b style="color: #00697C;font-size: 14px;">
									    	Aprovado com correções
									    </b>
									</div>
									  	<div class="col s6">
										    <a style="font-size: 14px; color: #6B6B6A;" href="<%=Strings.BASE%>/qualityreview/${statusT.previous.id}/view">
												<i style="color: #00697C; margin-right: 5px;" class="fa fa-file-text-o" aria-hidden="true"></i>
												<b style="color: #00697C;font-size: 14px;">	Ver revisão	</b>
											</a>
											- ${statusT.previous.requestDateString}
									 	</div>
									</div>
									
									<div class="row">
									    <div>
									    	<i class="fa fa-angle-right" aria-hidden="true" style="color: #00697C;"></i>
									  		<a href="<%=Strings.BASE%>/ilcd/${statusT.previous.archive.pathFile}?name=ILCD.zip"><i class="fa fa-file-archive-o" style="margin-right: 5px;" aria-hidden="true"></i> ILCD.zip</a>
									    </div>
									
									    <div class="col offset-s1 s6">
									    </div>
									</div>
									<hr>

		                        </c:forEach>
								
								<c:if test="${initialStatusT != null}">
									<div class="row">
										<div class="col page-title bold" style="padding: 0;">Arquivo inicial</div> - ${initialStatusT.notify.notifyDate}
										<div class="row">
										</div>
										<div class="row">
								 			<c:set var="pathFile" value="${initialStatusT.archive.pathFile}" />
								 			<i class="fa fa-angle-right"></i>
											 <a href="<%=Strings.BASE%>/ilcd/${pathFile}/?name=ILCD.zip">
											 	<i class="fa fa-file-archive-o" style="margin-right: 5px;" aria-hidden="true"></i>
											 	 ILCD.zip
											 </a>
										</div>
									</div>
								</c:if>
                           </div>
		                    <div class="row">
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
