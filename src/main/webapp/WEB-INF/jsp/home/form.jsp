<%@page import="br.com.ibict.acv.sicv.model.User"%>
<%@page import="br.com.ibict.acv.sicv.controller.HomeController"%>
<%@page import="resources.Strings"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="pt-BR">
    <head>
    
        <style>
        html {
            font-family: 'Titillium Web', "Roboto", sans-serif;
        }
        
        .page-title {
            color: #00697c;
        }
        
        .btn-import {
            background-color: #accc5f;
        }
        
    </style>
    
        <title>SICV - ACV | Banco Nacional de Inventários dos inventários brasileiros do Ciclo de Vida (ICVs)</title>
        <script src="<%=Strings.BASE%>/assets/bootstrap-3.3.7/js/ie-emulation-modes-warning.js"></script>

		<link href="<%=Strings.BASE%>/assets/css/defaultNotifications.css" rel="stylesheet">
        <!-- Bootstrap core CSS -->
		<link href="<%=Strings.BASE%>/assets/bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" href="<%=Strings.BASE%>/assets/materialize/css/materialize.min.css">
    </head>
    <body>

	<jsp:include page="/WEB-INF/jsp/partials/nav.jsp" />
	<div class="headerDiv">
        <jsp:include page="/WEB-INF/jsp/partials/header.jsp" />
	</div>
	<div class="principalDiv">
			
		    <!-- Modal Structure -->
		    <div id="modal1" class=" modal-fixed-footer full-screen">
		        <div class="modal-content">
		            <div class="row full-screen">
				        <form class="col s12 formILCD" method="POST" action="<%=Strings.BASE%>/ilcd/new" enctype="multipart/form-data" id="teste">
		            		<h4 class="page-title">Submissão Inventário</h4>
		                    <div class="row" id="authorsClone">
								<div id="divAuthorEmail" class="row">
			                        <div class="input-field col s3">
			                        	<div>
			                        		<input placeholder="" id="author" type="text" class="validate aut" name="authors[0].name" />
				                            <label for="author">Autor</label>
			                        	</div>
	
			                        </div>
			                        <div class="input-field col s3">
			                        	<div>
			                        		<input placeholder="" id="email" type="text" class="validate mail" name="authors[0].email" />
				                            <label for="email">E-mail</label>
			                            </div>
			                        </div>
		                    	</div>
		                    </div>
							<div class="row col s12" style="margin-top: -3%;">
		                       	 <button class="waves-effect waves-light btn" id="btnAuthor">Acrescentar autor +</button>
							</div>
		                    <div class="row">
		                        <div class="input-field col s6">
		                            <input placeholder="" id="title" type="text" class="validate" name="title">
		                            <label for="first_name">Título do inventário</label>
		                        </div>
		                    </div>
		                    <div class="row">
		                        <div class="input-field col s6">
		                            <input placeholder="" id="category" type="text" class="validate" name="category">
		                            <label for="category">Categoria</label>
		                        </div>
		                    </div>
		                    <div class="row ">
		                        <div class="col s10">
	                            <label for="textarea1">Descrição</label>
		                            <textarea id="textarea1" class="validate" data-length="255" rows="4" name="description"></textarea>
		                        </div>
		                    </div>
		                    <div class="row col s12">
								<h6>Sugestão Revisor Técnico</h6>
									<div class="col s5">
										<input type="checkbox" id="conflitosRevisores" required="required" />
										<label for="conflitosRevisores">Não há conflitos de interesses entre os revisores</label>
									</div>
		                    </div>
		                    <div class="row">
		                        <div class="input-field col s3">
		                            <input placeholder="" id="review1" type="text" class="validate">
		                            <label for="first_name">Revisor técnico 1</label>
		                        </div>
		                        <div class="input-field col s3">
		                            <input placeholder="" id="email_review1" type="text" class="validate">
		                            <label for="first_name">E-mail</label>
		                        </div>
		                        <div class="input-field col s3">
		                            <input placeholder="" id="phone_review1" type="text" class="validate">
		                            <label for="first_name">Telefone</label>
		                        </div>
		                    </div>
		                    <div class="row">
		                        <div class="input-field col s3">
		                            <input placeholder="" id="review2" type="text" class="validate">
		                            <label for="first_name">Revisor técnico 2</label>
		                        </div>
		                        <div class="input-field col s3">
		                            <input placeholder="" id="email_review2" type="text" class="validate">
		                            <label for="first_name">E-mail</label>
		                        </div>
		                        <div class="input-field col s3">
		                            <input placeholder="" id="phone_review2" type="text" class="validate">
		                            <label for="first_name">Telefone</label>
		                        </div>
		                    </div>
		                    <div class="row">
	                            <div class="file-field input-field col s4" style="bottom: 25px;">
	                                <span class="btn">File</span>
	                                <input type="file" class="btn" name="file" id="file">
		                            <div class="file-path-wrapper">
		                                <input placeholder="Escolha arquivo em formato ILCD" class="file-path validate" type="text" required="required" disabled="disabled">
		                            </div>
	                            </div>
		                        <div class="col s4">
		                            <input type="checkbox" id="termosEnvio" required="required" />
		                            <label for="termosEnvio">Li e aceito os termos de uso</label>
		                        </div>
		                        <div class="col offset-s1">
<!-- 									<a href="#!" class="modal-close btn-flat waves-effect waves-red">CANCELAR</a> -->
									<input type="submit" value="ENVIAR" class="waves-effect waves-light btn" id="btnSubmit">
		                        </div>
		                    </div>
						</form>
	
		            </div>

		        </div>
		    
	    </div>
		
		
	</div>

        <script type="application/javascript" src="<%=Strings.BASE%>/assets/jquery-3.2.1.min.js"></script>
        <script type="application/javascript" src="<%=Strings.BASE%>/assets/materialize/js/materialize.min.js"></script>
        <script type="application/javascript" src="<%=Strings.BASE%>/assets/formILCD.js"></script>
        <style>
        	.full-screen{
	       	    width: 90%;
			    height: 90% !important;
			    max-height: 90%;
		    	margin: 0 auto;
		    	top: 5% !important;
			    
        	}
		</style>

        <script>
	        $(document).ready(function(){
        		var i = 1;
	        	$('#btnAuthor').click(function(){
	        		var clone2 = $('#divAuthorEmail').clone();
	        		$(clone2).find(".aut").val("");
	        		$(clone2).find(".mail").val("");
	        		$(clone2).appendTo("#authorsClone");
	        		$(clone2).attr("id","divAuthorEmail"+i);
	        		$(clone2).find(".aut").attr("name","authors[" + i + "].author");
	        		$(clone2).find(".mail").attr("name","authors[" + i + "].email");
	        		i++;
	        	});
	        });
			
        </script>
    </body>
</html>
