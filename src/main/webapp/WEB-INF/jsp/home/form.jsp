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
        
        .container {
            //margin: 10px 50px;
        }
        
        .page-title {
            color: #00697c;
        }
        
        .btn-import {
            background-color: #accc5f;
        }
        
        .user-menu {
            border-bottom: 2px solid silver;
            margin: 60px 80px 20px 80px;
            height: 30px;
        }
        
        .item-menu {
            border-right: 2px solid silver;
            height: 30px;
        }
        
        .item-menu2 {
            text-align: center;
            border-left: 2px solid silver;
            height: 30px;
        }
        
        .item-menu3 {
            text-align: right;
            height: 30px;
        }
        
        .link-menu {
            color: #00697c;
            font-weight: bold;
            font-size: 16px;
        }
        
        .link-menu2 {
            color: #c3697c;
            font-weight: bold;
            font-size: 16px;
        }
        
        .link-menu3 {
            color: #00697c;
            font-size: 16px;
        }
        
        .notif-num {
            position: relative;
            top: -5px;
        }
        
        .sicv-container {
            margin: 0px 80px 0px 80px;
        }
        
        .sicv-table-th {
            color: #4dbcc4;
            border-bottom: 1px solid silver;
            border-top: 1px solid black;
        }
        
        .sicv-table-td {
            border-bottom: 1px solid silver;
        }
    </style>
    
        <title>SICV - ACV | Banco Nacional de Inventários dos inventários brasileiros do Ciclo de Vida (ICVs)</title>
        <script src="<%=Strings.BASE%>/assets/bootstrap-3.3.7/js/ie-emulation-modes-warning.js"></script>

		<link href="<%=Strings.BASE%>/assets/css/defaultNotifications.css" rel="stylesheet">
        <!-- Bootstrap core CSS -->
		<link
			href="<%=Strings.BASE%>/assets/bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
			<link rel="stylesheet" href="<%=Strings.BASE%>assets/materialize/css/materialize.min.css">
    </head>
    <body>

	<div style="width: 85%; margin-left:5%;">
		<table class="table">
			<thead>
				<tr style="border-bottom:1px solid black">
					<td class="tdCenterHeader" onclick="">Meus Inventários</td>
					<td class="tdCenterHeader" style="color: #4dbcc4;" >Revisão Qualidata</td>
					<td class="tdCenterHeader" style="color: #accc5f;" >Revisão Técnica</td>
					<td class="tdCenterHeader" >Gestão</td>
					<td class="tdAlertHeader"><span class="glyphicon glyphicon-bell"></span> 1</td>
					<td class="sortable-column tdCenterHeader" >Perfil: ${nome}</td>
					<td class="sortable-column" style="text-align: center; width:1%; white-space:nowrap;" 
					onclick="location.href='<%=Strings.BASE%>/logout'" >
						SAIR
					</td>
				</tr>
			</thead>		
		</table>
		
			
		    <!-- Modal Structure -->
		    <div id="modal1" class=" modal-fixed-footer full-screen">
		        <div class="modal-content">
		            <div class="row full-screen">
				        <form class="col s12 formILCD" method="POST" action="<%=Strings.BASE%>ilcd/new" enctype="multipart/form-data" id="teste">
		            		<h4 class="page-title">Submissão Inventário</h4>
		                    <div class="row">
		                        <div class="input-field col s3">
		                            <input placeholder="" id="first_name" type="text" class="validate" name="name">
		                            <label for="first_name">Autor</label>
  								
		                            <button class="waves-effect waves-light btn">Acrescentar autor +
		                            </button>
		                        
		                        </div>
		                        <div class="input-field col s3">
		                            <input placeholder="" id="email" type="text" class="validate" name="email">
		                            <label for="email">E-mail</label>
		                        </div>
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
		                    <div class="row">
		                        <h5>Sugestão Revisor</h5>
		                        <h6 class="page-title">Conflitos de interesses</h6>
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
		                        <div class="">
		                            <div class="file-field input-field">
		                                <span class="btn">File</span>
		                                <input type="file" class="btn" name="file" id="file">
			                            <div class="file-path-wrapper col s3">
			                                <input placeholder="Escolha arquivo em formato ILCD" class="file-path validate" type="text" required="required">
			                            </div>
		                            </div>
			                        <div class="col s4">
			                            <input type="checkbox" id="test5" required="required" />
			                            <label for="test5">Li e aceito os termos de uso</label>
			                        </div>
			                        <div class="col offset-s1">
<!-- 									<a href="#!" class="modal-close btn-flat waves-effect waves-red">CANCELAR</a> -->
										<input type="submit" value="ENVIAR" class="waves-effect waves-light btn" id="btnSubmit">
			                        </div>
		                        </div>
		                    </div>
						</form>
	
		            </div>

		        </div>
		    
	    </div>
		
		
	</div>

        <script type="application/javascript" src="<%=Strings.BASE%>/assets/jquery-3.2.1.min.js"></script>
        <script type="application/javascript" src="<%=Strings.BASE%>/assets/materialize/js/materialize.min.js"></script>
        <script type="application/javascript" src="<%=Strings.BASE%>/assets/teste.js"></script>
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
            
        </script>
    </body>
</html>
