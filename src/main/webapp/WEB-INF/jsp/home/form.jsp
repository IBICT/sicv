<%@page import="br.com.ibict.acv.sicv.model.User"%>
<%@page import="br.com.ibict.acv.sicv.controller.HomeController"%>
<%@page import="resources.Strings"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <title>SICV - ACV | Banco Nacional de Inventários dos inventários brasileiros do Ciclo de Vida (ICVs)</title>
        <script src="<%=Strings.BASE%>/assets/bootstrap-3.3.7/js/ie-emulation-modes-warning.js"></script>

		<link href="<%=Strings.BASE%>/assets/css/defaultNotifications.css" rel="stylesheet">
        <!-- Bootstrap core CSS -->
		<link href="<%=Strings.BASE%>/assets/bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" href="<%=Strings.BASE%>/assets/materialize/css/materialize.min.css">
    	<link rel="stylesheet" href="<%=Strings.BASE%>/assets/font/font-awesome/css/font-awesome.min.css">
    	<link rel="stylesheet" href="<%=Strings.BASE%>/assets/css/fonts.css">
		
        <style>
	        html {
	            font-family: 'Titillium Web', "Roboto", sans-serif;
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
	        .btn-enviar {
	            background-color: #00697C !important;
	            margin-left: 10px !important;
	            border-radius: 5px !important;
	            font-size: 16px !important;
	            text-transform: none !important;
	            font-weight: bold;
	            height: 49px;
	            width: 182px;
	            letter-spacing: .2px;
	            padding: 0px !important;
	            line-height: 0px;
	        }
	        
	        .btn-addAuthor {
	            background-color: #4DBCC4 !important;
	            border-radius: 5px !important;
	            font-size: 16px !important;
	            font-weight: bold;
	            text-align: center;
	            color: white;
	            padding-top: 10px;
	            height: 49px;
	            width: 182px;
	            letter-spacing: .2px;
	        }
	        
	        .btn-salvar {
	            background-color: transparent !important;
	            margin-left: 10px !important;
	            border-radius: 5px !important;
	            border: 1px solid #4DBCC4;
	            font-size: 16px !important;
	            text-transform: none !important;
	            color: #4DBCC4;
	            font-weight: bold;
	            height: 49px;
	            width: 182px;
	            letter-spacing: .2px;
	            padding: 0px !important;
	            line-height: 0px;
	        }
	        
	        .page-title {
	            color: #00697C;
	            font-size: 27px;
	            margin-left: 11px;
	        }
	        
	        .input-field input{
				font-size: 18px !important;
			}
	        
	        .btn-import {
	            background-color: #accc5f;
	        }

	        textarea{
	        	height: auto;
	        }

	        .file-field input.file-path, input.file-path:focus, input.file-path:DISABLED, input[type=text]:not(.browser-default):disabled{
	        	border: 1px solid #BDBDBD !important;
	        	width: 95% !important;
	        }
	        .select-wrapper span.caret{
		   		display: none;
		    }
		   
		    .fa-chevron-down{
			    position: absolute;
			    right: 0;
			    top: 40px;
			    bottom: 0;
			    height: 10px;
			    margin: auto 15px;
			    font-size: 10px;
			    line-height: 10px;
		    }
	        
	    </style>
    </head>
    <body>

	<jsp:include page="/WEB-INF/jsp/partials/nav.jsp" />
	<div class="headerDiv">
        <jsp:include page="/WEB-INF/jsp/partials/header.jsp" />
	</div>
	<div class="principalForm">
			
        <form class="col s12 formILCD" method="POST" action="<%=Strings.BASE%>/ilcd/new" enctype="multipart/form-data" id="teste">
          		<h4 class="page-title">Submissão Inventário</h4>
        		<h6 style="font-size: 15px;margin-left: 11px;font-weight: bold;">Autores <b style="color: red;">*</b></h6>
				<div class="row" id="authorsClone">
					<div id="divAuthorEmail" class="row">
	                   <div class="input-field col s4">
	                  		<input placeholder="Author" id="author" type="text" class="validate aut" name="authors[0].name" />
	                   </div>
	                   <div class="input-field col s8">
	                  		<input placeholder="E-mail" id="email" type="text" class="validate mail" name="authors[0].email" />
	                   </div>
	              	</div>
				</div>
				<div class="row" style="margin-top: -33px;margin-left: 10px;cursor: pointer;">
					<div class="btn-addAuthor" id="btnAuthor">Acrescentar autor +</div>
				</div>
				<div class="row">
				    <div class="input-field col s6">
						<h6 style="font-size: 15px;"><b>Título do inventário </b><b style="color: red;">*</b>
							<p style="color:#3D3D3D; font-size: 14px;font-style: italic;margin-top: 8px;">(Seguir padrão ”Nome do produto_tecnologia_ outra especificação” conforme Qualidata p. 25)
						</h6>
				        <input placeholder="Nome do produto_tecnologia_ outra especificação" id="title" type="text" class="validate" name="title">
				    </div>
				    <div class="input-field col s6">
					    <h6 style="font-size: 15px;"><b>Categoria </b><b style="color: red;">*</b>
					    	<p style="color:#3D3D3D; font-size: 14px;font-style: italic;margin-top: 8px;">CNA / Software
					    </h6>
					    <i class="fa fa-chevron-down"></i>
				        <select required="required" name="category" class="validate">
							<option value="" selected disabled="disabled"></option>
							<option value="Categoria">Categoria1</option>
							<option value="Categoria">Categoria2</option>
							<option value="Categoria">Categoria3</option>
							<option value="Categoria">Categoria4</option>
					    </select>
				    </div>
				</div>
				<div class="row ">
				    <div class="col s12">
			    		<h6 style="font-size: 15px;font-style: italic;"><b style="font-style: normal !important;">Descrição </b><b style="color: red;">*</b> (Seguir orientações do Guia Qualidata p. 27)</h6>
				        <textarea id="textarea1" class="validate" data-length="800" maxlength="800" rows="5" name="description" ></textarea>
				    </div>
				</div>
				<div class="row">
				    <div class="col s6">
						<h6 style="font-size: 15px;"><b>Possui Revisão técnica / crítica de terceira parte? </b><b style="color: red;">*</b></h6>
						<input class="with-gap" name="hasReview" type="radio" id="yesReview" value="true" onclick="showFileInput();"/>
						<label for="yesReview" style="color: #3D3D3D;">Sim</label>
						<input class="with-gap" name="hasReview" type="radio" id="noReview"  value="false" checked="checked" onclick="hiddeFileInput();"/>
						<label for="noReview" style="margin-left: 30px;color: #3D3D3D;">Não</label>
				    </div>
				</div>

				<div class="row" hidden="" id="fileInput">
					<div class="file-field input-field col s6" style="bottom: 25px; margin-left: -10px">
						<span class="btn">Escolher Arquivo</span> <input type="file" class="btn" name="review" id="review">
						<div class="file-path-wrapper" style="padding-left: 0px;">
							<input placeholder="Escolha arquivo em formato PDF" class="file-path validate" type="text" disabled="disabled" style="padding-left: 15px;">
						</div>
					</div>
					<div class="col s6">
						<h6 style="color: #00697C;font-style: italic;margin-top: -12px;" class="col s12">A Revisão de terceira parte deve ser realizada por profissional ou equipe capacitada em ACV e que não pertence à equipe original 
							executora do estudo. (Consultar Qualidata p. 43)
						 </h6>
					</div>
				</div>
				
				<div class="row">
				    <div class="col s12">
						<h6 style="font-size: 15px;"><b>Sugestão Revisor Técnico (se houver) </b>
							<p style="color:#3D3D3D; font-size: 14px;font-style: italic;margin-top: 8px;">Conflito de interesse: O revisor sugerido não pode ter qualquer envolvimento na realização do estudo, assim como vínculo parental e/ou profissional com seus autores.
						</h6>
				    </div>
				</div>

                <div class="row">
                    <div class="input-field col s4">
                        <input placeholder="Revisor Técnico 1" id="review1" type="text" class="validate">
                    </div>
                    <div class="input-field col s4">
                        <input placeholder="E-mail" id="email_review1" type="text" class="validate">
                    </div>
                    <div class="input-field col s4">
                        <input placeholder="Telefone" id="phone_review1" type="text" class="validate">
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s4">
                        <input placeholder="Revisor Técnico 2" id="review2" type="text" class="validate">
                    </div>
                    <div class="input-field col s4">
                        <input placeholder="E-mail" id="email_review2" type="text" class="validate">
                    </div>
                    <div class="input-field col s4">
                        <input placeholder="Telefone" id="phone_review2" type="text" class="validate">
                    </div>
                </div>
                <div class="row">
				    <div class="col s12">
						<h6 style="font-size: 15px;"><b>Upload Arquivo ILCD? </b><b style="color: red;">*</b></h6>
				    </div>
				</div>
				<div class="row">
					<div class="file-field input-field col s6" style="bottom: 25px; margin-left: -10px">
						<span class="btn">Escolher Arquivo</span> <input type="file" class="btn" name="file" id="file">
						<div class="file-path-wrapper" style="padding-left: 0px;">
							<input placeholder="Escolha arquivo em formato ILCD" class="file-path validate" type="text" disabled="disabled" style="padding-left: 15px;">
						</div>
					</div>
					<div class="col s6">
						<h6 style="color: #00697C;font-style: italic;margin-top: -12px;" class="col s12">Declaração: Declaro que respeitei os “Requisitos de qualidade 
							de conjuntos de dados para Banco Nacional de Inventários de Ciclo de Vida- Guia Qualitada” na construção e/ ou adequação deste inventário
						 </h6>
					</div>
				</div>
                <div class="row" style="margin-top: 15px;">
				    <div class="col s12">
						<h6 style="font-size: 15px;"><b>Upload de arquivo complementar </b><b style="color: red;">*</b></h6>
				    </div>
				</div>
				<div class="row">
					<div class="file-field input-field col s6" style="bottom: 25px; margin-left: -10px">
						<span class="btn">Escolher Arquivo</span> <input type="file" class="btn" name="fileComplement" id="fileComplement">
						<div class="file-path-wrapper" style="padding-left: 0px;">
							<input placeholder="Gráfico, fluxograma" class="file-path validate" type="text" disabled="disabled" style="padding-left: 15px;">
						</div>
					</div>
	            	<div class="col" style="float: right;margin-top: 50px;">
						<input type="submit" value="SALVAR" class="btn btn-salvar" id="btnSubmit">
						<input type="submit" value="ENVIAR" class="btn btn-enviar" id="btnSubmit">
					</div>
				</div>
	            
	           
		</form>
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
	        	$('select').material_select();
		    	$("select[required]").css({position: "absolute", display: "inline", height: 0, padding: 0, width: 0});
		    	
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
			function showFileInput(){
				$('#fileInput').show(500);
			}
			function hiddeFileInput(){
				$('#fileInput').hide(500);
			}
			
        </script>
    </body>
</html>
