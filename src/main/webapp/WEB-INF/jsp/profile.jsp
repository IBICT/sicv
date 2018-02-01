<%@page import="resources.Strings"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String base = Strings.BASE;
	pageContext.setAttribute("base", base);
%>

<c:set var="link" value="${base}/profile" />
<c:if test="${isAdmin}">
	<c:set var="link" value="${base}/admin/profile" />
</c:if>

<!DOCTYPE html>
<html lang="pt-BR">

    <head>
        <meta charset="UTF-8">
        <title>Home</title>
  		<link href="<%=Strings.BASE%>/assets/bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="<%=Strings.BASE%>/assets/font/font-awesome/css/font-awesome.min.css">
		<link rel="stylesheet" href="<%=Strings.BASE%>/assets/materialize/css/materialize.min.css">
		<link rel="stylesheet" href="<%=Strings.BASE%>/assets/css/fonts.css">
        <style>
            html {
                font-family: 'Titillium Web', "Roboto", sans-serif;
            }

            .page-title {
                color: #00697c;
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

            .btn-import {
                background-color: #accc5f;
            }
            
			.element {
			  display: inline-flex;
			  align-items: center;
			}

			i.fa-pencil {
			  cursor: pointer;
			  color: #00697C;
			}

			i:hover {
			  opacity: 0.6;
			}	        
            
            #image_src {
			  width: 26px;
			  height: 26px;
			  margin-right: 100px;
			  opacity: 0;
			  filter: alpha(opacity=0); /* IE 5-7 */
			}

		   .select-wrapper span.caret{
		   		display: none;
		   }
		   .fa-chevron-down{
			    position: absolute;
			    right: 0;
			    top: 0;
			    bottom: 15px;
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
            
			<form class="userForm" action="${link}" method="POST">
                <input id="id" name="id" type="text" class="validate" value="${user.id}" hidden="true">
				<input id="registrationKey" name="registrationKey" type="text" class="validate" value="${user.registrationKey}" hidden="true">
                <input id="passwordHashSalt" name="passwordHashSalt" type="text" class="validate" value="${user.passwordHashSalt}" hidden="true">
				<input id="superAdminPermission" name="superAdminPermission" type="text" class="validate" value="${user.superAdminPermission}" hidden="true">
				<input id="qntdNotificacoes" name="qntdNotificacoes" type="text" class="validate" value="${user.qntdNotificacoes}" hidden="true">

				 <div class="row">
					<div class="input-field page-title col s4">
				    	<h6><b>PERFIL</b></h6>
					</div>
				 </div>
				 <div>
					<div class="row">
						<div class="input-field col s4 offset-s3">
					       <input placeholder="Nome*" id="first_name" name="firstName" type="text" class="validate" value="${user.firstName}">
						</div>
						<div class="input-field col s5">
							<input placeholder="Sobrenome*" id="last_name" name="lastName" type="text" class="validate" value="${user.lastName}">
						</div>

					</div>
				 </div>
                 <div class="row">
	                 <div>
	                 	<div class="col s2 offset-s1">
							<i class="fa fa-user-circle" style="color: #EBF4F5;border-radius: 50%;font-size:142px;margin-top: -25px;"></i>
							<div class="element">
								<i class="fa fa-pencil"></i>
							</div>
							<input type="file" name="image_src" id="image_src">
	                 	</div>
    	             </div>
    	             <div class="row">
						<div class="input-field col s6">
						    <input placeholder="E-mail*" id="email" name="email" type="text" class="validate" value="${user.email}" required="required">
						</div>
						<div class="input-field col s3">
						    <input placeholder="Telefone*" id="phone" name="phone" type="text" class="validate" value="${user.phone}" required="required">
						</div>
	                 	<div class="row">
							<div class="input-field col s6">
								<input placeholder="Afiliação*" id="organization" name="organization" type="text" class="validate" value="${user.organization}" required="">
							</div>
							
							<div class="input-field col s3">
								<i class="fa fa-chevron-down"></i>
								<select required="required" name="country" class="validate">
									<option value="${user.country}" selected>${user.country}*</option>
									<option value="Afghanistan">Afghanistan</option>
								    <option value="Albania">Albania</option>
								    <option value="Algeria">Algeria</option>
								    <option value="American Samoa">American Samoa</option>
								    <option value="Andorra">Andorra</option>
								    <option value="Angola">Angola</option>
								    <option value="Anguilla">Anguilla</option>
								    <option value="Antartica">Antarctica</option>
								    <option value="Antigua and Barbuda">Antigua and Barbuda</option>
								    <option value="Argentina">Argentina</option>
								    <option value="Armenia">Armenia</option>
								    <option value="Aruba">Aruba</option>
								    <option value="Australia">Australia</option>
								    <option value="Austria">Austria</option>
								    <option value="Azerbaijan">Azerbaijan</option>
								    <option value="Bahamas">Bahamas</option>
								    <option value="Bahrain">Bahrain</option>
								    <option value="Bangladesh">Bangladesh</option>
								    <option value="Barbados">Barbados</option>
								    <option value="Belarus">Belarus</option>
								    <option value="Belgium">Belgium</option>
								    <option value="Belize">Belize</option>
								    <option value="Benin">Benin</option>
								    <option value="Bermuda">Bermuda</option>
								    <option value="Bhutan">Bhutan</option>
								    <option value="Bolivia">Bolivia</option>
								    <option value="Bosnia and Herzegowina">Bosnia and Herzegowina</option>
								    <option value="Botswana">Botswana</option>
								    <option value="Bouvet Island">Bouvet Island</option>
								    <option value="Brazil">Brazil</option>
								    <option value="British Indian Ocean Territory">British Indian Ocean Territory</option>
								    <option value="Brunei Darussalam">Brunei Darussalam</option>
								    <option value="Bulgaria">Bulgaria</option>
								    <option value="Burkina Faso">Burkina Faso</option>
								    <option value="Burundi">Burundi</option>
								    <option value="Cambodia">Cambodia</option>
								    <option value="Cameroon">Cameroon</option>
								    <option value="Canada">Canada</option>
								    <option value="Cape Verde">Cape Verde</option>
								    <option value="Cayman Islands">Cayman Islands</option>
								    <option value="Central African Republic">Central African Republic</option>
								    <option value="Chad">Chad</option>
								    <option value="Chile">Chile</option>
								    <option value="China">China</option>
								    <option value="Christmas Island">Christmas Island</option>
								    <option value="Cocos Islands">Cocos (Keeling) Islands</option>
								    <option value="Colombia">Colombia</option>
								    <option value="Comoros">Comoros</option>
								    <option value="Congo">Congo</option>
								    <option value="Congo">Congo, the Democratic Republic of the</option>
								    <option value="Cook Islands">Cook Islands</option>
								    <option value="Costa Rica">Costa Rica</option>
								    <option value="Cota D'Ivoire">Cote d'Ivoire</option>
								    <option value="Croatia">Croatia (Hrvatska)</option>
								    <option value="Cuba">Cuba</option>
								    <option value="Cyprus">Cyprus</option>
								    <option value="Czech Republic">Czech Republic</option>
								    <option value="Denmark">Denmark</option>
								    <option value="Djibouti">Djibouti</option>
								    <option value="Dominica">Dominica</option>
								    <option value="Dominican Republic">Dominican Republic</option>
								    <option value="East Timor">East Timor</option>
								    <option value="Ecuador">Ecuador</option>
								    <option value="Egypt">Egypt</option>
								    <option value="El Salvador">El Salvador</option>
								    <option value="Equatorial Guinea">Equatorial Guinea</option>
								    <option value="Eritrea">Eritrea</option>
								    <option value="Estonia">Estonia</option>
								    <option value="Ethiopia">Ethiopia</option>
								    <option value="Falkland Islands">Falkland Islands (Malvinas)</option>
								    <option value="Faroe Islands">Faroe Islands</option>
								    <option value="Fiji">Fiji</option>
								    <option value="Finland">Finland</option>
								    <option value="France">France</option>
								    <option value="France Metropolitan">France, Metropolitan</option>
								    <option value="French Guiana">French Guiana</option>
								    <option value="French Polynesia">French Polynesia</option>
								    <option value="French Southern Territories">French Southern Territories</option>
								    <option value="Gabon">Gabon</option>
								    <option value="Gambia">Gambia</option>
								    <option value="Georgia">Georgia</option>
								    <option value="Germany">Germany</option>
								    <option value="Ghana">Ghana</option>
								    <option value="Gibraltar">Gibraltar</option>
								    <option value="Greece">Greece</option>
								    <option value="Greenland">Greenland</option>
								    <option value="Grenada">Grenada</option>
								    <option value="Guadeloupe">Guadeloupe</option>
								    <option value="Guam">Guam</option>
								    <option value="Guatemala">Guatemala</option>
								    <option value="Guinea">Guinea</option>
								    <option value="Guinea-Bissau">Guinea-Bissau</option>
								    <option value="Guyana">Guyana</option>
								    <option value="Haiti">Haiti</option>
								    <option value="Heard and McDonald Islands">Heard and Mc Donald Islands</option>
								    <option value="Holy See">Holy See (Vatican City State)</option>
								    <option value="Honduras">Honduras</option>
								    <option value="Hong Kong">Hong Kong</option>
								    <option value="Hungary">Hungary</option>
								    <option value="Iceland">Iceland</option>
								    <option value="India">India</option>
								    <option value="Indonesia">Indonesia</option>
								    <option value="Iran">Iran (Islamic Republic of)</option>
								    <option value="Iraq">Iraq</option>
								    <option value="Ireland">Ireland</option>
								    <option value="Israel">Israel</option>
								    <option value="Italy">Italy</option>
								    <option value="Jamaica">Jamaica</option>
								    <option value="Japan">Japan</option>
								    <option value="Jordan">Jordan</option>
								    <option value="Kazakhstan">Kazakhstan</option>
								    <option value="Kenya">Kenya</option>
								    <option value="Kiribati">Kiribati</option>
								    <option value="Democratic People's Republic of Korea">Korea, Democratic People's Republic of</option>
								    <option value="Korea">Korea, Republic of</option>
								    <option value="Kuwait">Kuwait</option>
								    <option value="Kyrgyzstan">Kyrgyzstan</option>
								    <option value="Lao">Lao People's Democratic Republic</option>
								    <option value="Latvia">Latvia</option>
								    <option value="Lebanon">Lebanon</option>
								    <option value="Lesotho">Lesotho</option>
								    <option value="Liberia">Liberia</option>
								    <option value="Libyan Arab Jamahiriya">Libyan Arab Jamahiriya</option>
								    <option value="Liechtenstein">Liechtenstein</option>
								    <option value="Lithuania">Lithuania</option>
								    <option value="Luxembourg">Luxembourg</option>
								    <option value="Macau">Macau</option>
								    <option value="Macedonia">Macedonia, The Former Yugoslav Republic of</option>
								    <option value="Madagascar">Madagascar</option>
								    <option value="Malawi">Malawi</option>
								    <option value="Malaysia">Malaysia</option>
								    <option value="Maldives">Maldives</option>
								    <option value="Mali">Mali</option>
								    <option value="Malta">Malta</option>
								    <option value="Marshall Islands">Marshall Islands</option>
								    <option value="Martinique">Martinique</option>
								    <option value="Mauritania">Mauritania</option>
								    <option value="Mauritius">Mauritius</option>
								    <option value="Mayotte">Mayotte</option>
								    <option value="Mexico">Mexico</option>
								    <option value="Micronesia">Micronesia, Federated States of</option>
								    <option value="Moldova">Moldova, Republic of</option>
								    <option value="Monaco">Monaco</option>
								    <option value="Mongolia">Mongolia</option>
								    <option value="Montserrat">Montserrat</option>
								    <option value="Morocco">Morocco</option>
								    <option value="Mozambique">Mozambique</option>
								    <option value="Myanmar">Myanmar</option>
								    <option value="Namibia">Namibia</option>
								    <option value="Nauru">Nauru</option>
								    <option value="Nepal">Nepal</option>
								    <option value="Netherlands">Netherlands</option>
								    <option value="Netherlands Antilles">Netherlands Antilles</option>
								    <option value="New Caledonia">New Caledonia</option>
								    <option value="New Zealand">New Zealand</option>
								    <option value="Nicaragua">Nicaragua</option>
								    <option value="Niger">Niger</option>
								    <option value="Nigeria">Nigeria</option>
								    <option value="Niue">Niue</option>
								    <option value="Norfolk Island">Norfolk Island</option>
								    <option value="Northern Mariana Islands">Northern Mariana Islands</option>
								    <option value="Norway">Norway</option>
								    <option value="Oman">Oman</option>
								    <option value="Pakistan">Pakistan</option>
								    <option value="Palau">Palau</option>
								    <option value="Panama">Panama</option>
								    <option value="Papua New Guinea">Papua New Guinea</option>
								    <option value="Paraguay">Paraguay</option>
								    <option value="Peru">Peru</option>
								    <option value="Philippines">Philippines</option>
								    <option value="Pitcairn">Pitcairn</option>
								    <option value="Poland">Poland</option>
								    <option value="Portugal">Portugal</option>
								    <option value="Puerto Rico">Puerto Rico</option>
								    <option value="Qatar">Qatar</option>
								    <option value="Reunion">Reunion</option>
								    <option value="Romania">Romania</option>
								    <option value="Russia">Russian Federation</option>
								    <option value="Rwanda">Rwanda</option>
								    <option value="Saint Kitts and Nevis">Saint Kitts and Nevis</option> 
								    <option value="Saint LUCIA">Saint LUCIA</option>
								    <option value="Saint Vincent">Saint Vincent and the Grenadines</option>
								    <option value="Samoa">Samoa</option>
								    <option value="San Marino">San Marino</option>
								    <option value="Sao Tome and Principe">Sao Tome and Principe</option> 
								    <option value="Saudi Arabia">Saudi Arabia</option>
								    <option value="Senegal">Senegal</option>
								    <option value="Seychelles">Seychelles</option>
								    <option value="Sierra">Sierra Leone</option>
								    <option value="Singapore">Singapore</option>
								    <option value="Slovakia">Slovakia (Slovak Republic)</option>
								    <option value="Slovenia">Slovenia</option>
								    <option value="Solomon Islands">Solomon Islands</option>
								    <option value="Somalia">Somalia</option>
								    <option value="South Africa">South Africa</option>
								    <option value="South Georgia">South Georgia and the South Sandwich Islands</option>
								    <option value="Span">Spain</option>
								    <option value="SriLanka">Sri Lanka</option>
								    <option value="St. Helena">St. Helena</option>
								    <option value="St. Pierre and Miguelon">St. Pierre and Miquelon</option>
								    <option value="Sudan">Sudan</option>
								    <option value="Suriname">Suriname</option>
								    <option value="Svalbard">Svalbard and Jan Mayen Islands</option>
								    <option value="Swaziland">Swaziland</option>
								    <option value="Sweden">Sweden</option>
								    <option value="Switzerland">Switzerland</option>
								    <option value="Syria">Syrian Arab Republic</option>
								    <option value="Taiwan">Taiwan, Province of China</option>
								    <option value="Tajikistan">Tajikistan</option>
								    <option value="Tanzania">Tanzania, United Republic of</option>
								    <option value="Thailand">Thailand</option>
								    <option value="Togo">Togo</option>
								    <option value="Tokelau">Tokelau</option>
								    <option value="Tonga">Tonga</option>
								    <option value="Trinidad and Tobago">Trinidad and Tobago</option>
								    <option value="Tunisia">Tunisia</option>
								    <option value="Turkey">Turkey</option>
								    <option value="Turkmenistan">Turkmenistan</option>
								    <option value="Turks and Caicos">Turks and Caicos Islands</option>
								    <option value="Tuvalu">Tuvalu</option>
								    <option value="Uganda">Uganda</option>
								    <option value="Ukraine">Ukraine</option>
								    <option value="United Arab Emirates">United Arab Emirates</option>
								    <option value="United Kingdom">United Kingdom</option>
								    <option value="United States">United States</option>
								    <option value="United States Minor Outlying Islands">United States Minor Outlying Islands</option>
								    <option value="Uruguay">Uruguay</option>
								    <option value="Uzbekistan">Uzbekistan</option>
								    <option value="Vanuatu">Vanuatu</option>
								    <option value="Venezuela">Venezuela</option>
								    <option value="Vietnam">Viet Nam</option>
								    <option value="Virgin Islands (British)">Virgin Islands (British)</option>
								    <option value="Virgin Islands (U.S)">Virgin Islands (U.S.)</option>
								    <option value="Wallis and Futana Islands">Wallis and Futuna Islands</option>
								    <option value="Western Sahara">Western Sahara</option>
								    <option value="Yemen">Yemen</option>
								    <option value="Yugoslavia">Yugoslavia</option>
								    <option value="Zambia">Zambia</option>
								    <option value="Zimbabwe">Zimbabwe</option>
							    </select>
							</div>
		                 	<div class="row">
			                 	<div class="input-field col s4">
			                 		<i class="fa fa-chevron-down"></i>
									<select required="required" name="language">
										<option value="${user.language}" selected>${user.language}*</option>
										<option value="Português">Português</option>
									    <option value="Inglês">Inglês</option>
									    <option value="Espanhol">Espanhol</option>
									    <option value="Alemão">Alemão</option>
									    <option value="Italiano">Italiano</option>
									    <option value="Francês">Francês</option>
								    </select>
							    </div>
								<div class="input-field col s5">
									<input placeholder="Outro idioma" id="otherLanguage" name="otherLanguage" type="text" class="validate" value="${user.otherLanguage}">
								</div>
							</div>
	                 	</div>
	                 	</div>
                 </div>
                 
				<div class="row">
					<div class="input-field col s4">
				    	<h6 style="color: #3D3D3D;"><b>Formação e Currículo</b></h6>
					</div>
				</div>
				
				<div class="row">
					<div class="input-field col s3">
						<i class="fa fa-chevron-down"></i>
						<select required="required" name="title" class="validate">
							<option value="${user.title}" selected>${user.title}*</option>
							<option value="Bel">Bel.</option>
						    <option value="Dr">Dr.</option>
						    <option value="Graduando">Graduando</option>
						    <option value="Ms">Ms.</option>
						    <option value="Especialista">Especialista</option>
					    </select>
				    </div>
					<div class="input-field col s5">
						<input placeholder="Área*(ex:Ciências Florestais)" id="area" name="jobPosition" type="text" class="validate" required="required" value="${user.jobPosition}">
					</div>
					<div class="input-field col s4">
						<input placeholder="Orcid" id="orcid" name="orcid" type="text" class="validate"/><br />
					</div>
				</div>
                 
                <div class="row">
					<div class="input-field col s8">
		                <input placeholder="Currículo* (adicionar link do perfil no Currículo lattes, Linkedin ou ResearchGate)" 
		                id="curriculum" name="curriculum" type="text" class="validate" required="" value="${user.curriculum}"/><br />
					</div>
				</div>
				<div class="row">
					<div class="input-field col s8">
		                <input placeholder="Áreas de interesse (ex: agroindústria, metalúrgica, eletroeletrônicos, etc)"  
		                id="dsPurpose" name="dsPurpose" type="text" class="validate" value="${user.dsPurpose}"/><br />
					</div>
				</div>
				
				<div class="row" ${isAdmin ? 'hidden' : ''}>
					<div class="input-field col s3">
				    	<h6 style="color: #3D3D3D;"><b>Definir Senha</b></h6>
					</div>
				</div>
			
				<div class="row" ${isAdmin ? 'hidden' : ''}>
					<div class="input-field col s6">
						<input placeholder="Senha " id="password" name="plainPassword" type="password" class="validate" value="${user.plainPassword}">
					</div>
				</div>
				<div class="row">
					<div class="input-field col s6">
						<input placeholder="Nova senha " id="confirm" name="newPassword" type="password" class="validate" ${isAdmin ? 'hidden' : ''}>
						<div style="float: left;">
		                	<input style="float: left;background: #00697C;" class="btn btn-lg btn-primary" type="submit" value="Salvar Alterações" /><br />
	                	</div>
	                </div>
                    <div class="input-field col s6" >
                        <input placeholder="Confirmar nova senha" id="confirm" type="password" class="validate" ${isAdmin ? 'hidden' : ''}>
                    </div>
				</div>
                 
             </form>
		</div>
        <script type="application/javascript" src="<%=Strings.BASE%>/assets/jquery-3.2.1.min.js"></script>
        <script type="application/javascript" src="<%=Strings.BASE%>/assets/materialize/js/materialize.min.js"></script>
		
        <script>
        
	        $(document).ready(function () {
	        	$('select').material_select();
		    	$("select[required]").css({position: "absolute", display: "inline", height: 0, padding: 0, width: 0});
		    	
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
            
	        $("i").click(function () {
        	  $("input[type='file']").trigger('click');
        	});

        	$('input[type="file"]').on('change', function() {
        	  var val = $(this).val();
        	  $(this).siblings('span').text(val);
        	})

        </script>

    </body>

</html>
