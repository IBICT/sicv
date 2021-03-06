<%@page import="resources.Strings"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="pt-BR">

    <head>
        <meta charset="UTF-8">
        <title>Home</title>
  		<link href="<%=Strings.BASE%>/assets/bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" href="<%=Strings.BASE%>/assets/font/font-awesome/css/font-awesome.min.css">
		<link rel="stylesheet" href="<%=Strings.BASE%>/assets/materialize/css/materialize.min.css">
        <style>
            html {
                font-family: 'Titillium Web', "Roboto", sans-serif;
            }

            .page-title {
                color: #00697c;
            }
			.btn {
                background-color: #00697C !important;
                font-size: 16px !important;
                border-radius: 5px !important;
                text-transform: none !important;
                font-weight: bold;
                height: 32px;
                width: 307px;
                letter-spacing: .2px;
                padding: 0px;
                line-height: 0px;
            }
            
            .input-field{
            	margin-top: -0.7rem;
            }
            
            .input-field input{
				font-size: 18px !important;
			}
			
			/* label underline focus color */
			.input-field input:focus, .input-field input[type=select]:focus, .input-field input[type=password]:focus{
			  border-bottom: .2px solid #4dbcc4 !important;
			  box-shadow: 0 1px 0 0 #4dbcc4;
			}
			
			/* valid color */
			.input-field input[type=text].valid, .input-field input[type=select].valid, .input-field input[type=password].valid {
			  border-bottom: .2px solid #4dbcc4 !important;
			  box-shadow: 0 1px 0 0 #4dbcc4;
			}
            
        </style>
    </head>

    <body>

        <jsp:include page="/WEB-INF/jsp/partials/header.jsp" />

		<div class="principalDiv">
            
			<form class="userForm" action="<%=Strings.BASE%>/admin/insertProfile" method="POST">

				 <div class="row">
					<div class="input-field page-title col s4">
				    	<h6><b>Cadastro novo usuário</b></h6>
					</div>
				 </div>
				<div class="row">
					<div class="input-field col s6">
				       <input placeholder="Nome*" id="first_name" name="firstName" type="text" class="validate" required="required">
					</div>
					<div class="input-field col s6">
						<input placeholder="Sobrenome*" id="last_name" name="lastName" type="text" class="validate" required="required">
					</div>

				</div>
                 <div class="row">
    	             <div class="row">
						<div class="input-field col s12">
						    <input placeholder="E-mail*" id="email" name="email" type="text" class="validate" required="required" onblur="existEmail(event);">
							<div style="float: left;">
			                	<input style="float: left;background: #00697C;" id="btnSubmit" disabled="disabled" class="btn btn-lg btn-primary" type="submit" value="Cadastrar usuário" /><br />
		                	</div>
						</div>
					</div>
				</div>
                 
             </form>
		</div>
        <script type="application/javascript" src="<%=Strings.BASE%>/assets/jquery-3.2.1.min.js"></script>
        <script type="application/javascript" src="<%=Strings.BASE%>/assets/materialize/js/materialize.min.js"></script>
		
        <script>
        
	        $(document).ready(function () {

       			$("form").submit(function() {
       				var result = {};
					$.each($('form').serializeArray(), function() {
						result[this.name] = this.value;
					});

					// reference to form object
					$(":input[value='']").attr('disabled', true);						
					var input = $("<input />").attr("type", "hidden").attr(
							"name", "profile").val(JSON.stringify(result));
					$('form').append($(input));
       			});
			});
	        
			function existEmail(e) {
				var mail = $('#email').val();
				var pattern = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
			    if ((e.keyCode >= 9 && e.keyCode <= 45) || (e.keyCode >= 91 && e.keyCode <= 93) || (e.keyCode >= 112 && e.keyCode <= 145)){
			    	if(e.keyCode != 32)
			        	e.preventDefault();
			    }
				//verify if is a valid pattern mail
				else if(pattern.test(mail)){
				    $.ajax({
				        type: "post",
				        url: '/sicv/register/getUser',
				        data: { email: mail},
				        success: function (result) {
				        	if(result == true){
				            	if(!$('#email').hasClass('invalid')){
					        		$('#email').removeClass('valid');
					            	$('#email').addClass('invalid');
				            	}
				            	alert("Email já cadastrado");
				            	$("#btnSubmit").attr("disabled","disabled");
				        	}
				            if(result == false){
				            	if(!$('#email').hasClass('valid')){
					            	$('#email').addClass('valid');
					        		$('#email').removeClass('invalid');
				            	}
				            	alert("Email válido");
				            	$("#btnSubmit").removeAttr("disabled");
				            }
				        },
				        error: function (response) {
				        }
				    });
				}
				else{
		        	if(!$('#email').hasClass('invalid')){
		        		$('#email').removeClass('valid');
		            	$('#email').addClass('invalid');
		            	$("#btnSubmit").attr("disabled","disabled");
		        	}
				}
			}
            
        </script>

    </body>

</html>
