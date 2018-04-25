<%@page import="resources.Strings"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="Tela de Cadastro" />
        <meta name="keywords" content="HTML, CSS, JS, JavaScript, framework, bootstrap, front-end, frontend, web development" />
        <meta name="author" content="Deivdy William Silva" />

        <link rel="apple-touch-icon" sizes="57x57" href="<%=Strings.BASE%>/assets/images/favicon/apple-icon-57x57.png" />
        <link rel="apple-touch-icon" sizes="60x60" href="<%=Strings.BASE%>/assets/images/favicon/apple-icon-60x60.png" />
        <link rel="apple-touch-icon" sizes="72x72" href="<%=Strings.BASE%>/assets/images/favicon/apple-icon-72x72.png" />
        <link rel="apple-touch-icon" sizes="76x76" href="<%=Strings.BASE%>/assets/images/favicon/apple-icon-76x76.png" />
        <link rel="apple-touch-icon" sizes="114x114" href="<%=Strings.BASE%>/assets/images/favicon/apple-icon-114x114.png" />
        <link rel="apple-touch-icon" sizes="120x120" href="<%=Strings.BASE%>/assets/images/favicon/apple-icon-120x120.png" />
        <link rel="apple-touch-icon" sizes="144x144" href="<%=Strings.BASE%>/assets/images/favicon/apple-icon-144x144.png" />
        <link rel="apple-touch-icon" sizes="152x152" href="<%=Strings.BASE%>/assets/images/favicon/apple-icon-152x152.png" />
        <link rel="apple-touch-icon" sizes="180x180" href="<%=Strings.BASE%>/assets/images/favicon/apple-icon-180x180.png" />
        <link rel="icon" type="image/png" sizes="192x192" href="<%=Strings.BASE%>/assets/images/favicon/android-icon-192x192.png" />
        <link rel="icon" type="image/png" sizes="32x32" href="<%=Strings.BASE%>/assets/images/favicon/favicon-32x32.png" />
        <link rel="icon" type="image/png" sizes="96x96" href="<%=Strings.BASE%>/assets/images/favicon/favicon-96x96.png" />
        <link rel="icon" type="image/png" sizes="16x16" href="<%=Strings.BASE%>/assets/images/favicon/favicon-16x16.png" />
        <link rel="manifest" href="<%=Strings.BASE%>/assets/images/favicon/manifest.json" />
        <meta name="msapplication-TileColor" content="#ffffff" />
        <meta name="msapplication-TileImage" content="<%=Strings.BASE%>/assets/images/favicon/ms-icon-144x144.png" />
        <meta name="theme-color" content="#ffffff" />

        <title>SICV - ACV | Banco Nacional de Inventários dos inventários brasileiros do Ciclo de Vida (ICVs)</title>

   		<link rel="stylesheet" href="<%=Strings.BASE%>/assets/materialize/css/materialize.min.css">
   		<link rel="stylesheet" href="<%=Strings.BASE%>/assets/font/font-awesome/css/font-awesome.min.css">
        <link rel="stylesheet" href="<%=Strings.BASE%>/assets/css/fonts.css">
        <link rel="stylesheet" href="<%=Strings.BASE%>/assets/css/passwordsCheck.css">
        
    </head>
    	<style>
			.logoSICVLogin {
				display: block;
				margin: 0 auto;
				text-align: center;
				font-size: 33px;
				color: white;
				font-family: 'TitilliumWeb-ExtraLight', sans-serif !important;
			}
			
			/* label color */
			.input-field input {
				font-size: 18px !important;
				color: #00697C;
				border-bottom: .2px solid #4DBCC4 !important;
				box-shadow: none !important;
				font-weight: bold;
			}
			
			/* label focus color */
			.input-field input:focus {
				color: #00697C !important;
				border-bottom: 2px solid #4DBCC4 !important;
				box-shadow: 1px solid #4DBCC4 !important;
				font-weight: bold;
			}
			
			input[type=email].invalid:not(.browser-default),input[type=text].invalid:not(.browser-default), input[type=password].invalid:not(.browser-default){
				border-bottom: 1px solid #F44336 !important;
			}
			
			input[type=text].valid:not(.browser-default){
				font-size: 18px !important;
				color: #00697C;
				border-bottom: .2px solid #4DBCC4 !important;
				box-shadow: none !important;
				font-weight: bold;
			}
			
			[type="checkbox"].filled-in:not(:checked)+label:after, [type="checkbox"].filled-in:checked+label:after{
				background: #FFFFFF !important;
				border: 2px solid #00697C !important;
			}
			
			[type="checkbox"].filled-in:checked+label:before {
				border-right: 2px solid #4dbcc4 !important;
				border-bottom: 2px solid #4dbcc4 !important;
			}
			
			.register-form {
				font-family: 'TitilliumWeb-ExtraLight', sans-serif !important;
				background-color: white !important;
				color: #4DBCC4;
			}
			
			.select-wrapper span.caret {
				display: none;
			}
			
			.select-wrapper input.select-dropdown {
				color: #888C8C;
			}
			
			.select-wrapper input.select-dropdown ul.dropdown-content li.active.selected{
				color: black !important;
			}
			
			.dropdown-content {
				background-color: #4DBCC4;
			}
			
			.select-dropdown li span {
				color: white !important;
				font-weight: bold;
			}
			
			.fa-chevron-down {
				position: absolute;
				right: 0;
				top: 0;
				bottom: 15px;
				height: 10px;
				margin: auto 15px;
				font-size: 10px;
				line-height: 10px;
			}
			
			.btn {
				float: right;
				background: #00697C;
				color: white !important;
				border: none;
				border-radius: 5px;
				text-transform: none;
				font-weight: bold;
			}

			::placeholder { /* Most modern browsers support this now. */
				color: #888C8C;
			}
			
			.terms{
				color: #4DBCC4;
				font-size: 16px !important;
				font-weight: bold;
				text-decoration: underline;
			}
		</style>

    <body>
		<div class="modal" id="modal-terms_SICV" style="overflow-y: hidden;max-height: 90%;">
		    <div class="modal-content">
		        <object type="application/pdf" data="documents/terms_SICV.pdf" width="100%" height="500" style="height: 85vh;">No Support</object>
			</div>
		</div><!-- /.modal -->
		
		<div class="modal" id="modal-privacyPolicy_SICV" style="overflow-y: hidden;max-height: 90%;">
		    <div class="modal-content">
		        <object type="application/pdf" data="documents/privacyPolicy_SICV.pdf" width="100%" height="500" style="height: 85vh;">No Support</object>
		    </div><!-- /.modal-content -->
		</div><!-- /.modal -->
		<div style="background-color: #4dbcc4;height: 193px;" class="logoSICVLogin">
			<img alt="SICV" style="margin-top: 50px;" src="<%=Strings.BASE%>/assets/images/logoSICVLogin.png">
			<h4>Importador de Inventários</h4>
		</div>
		
		<div class="register-form">
		
            <form method="post" action="<%=Strings.BASE%>/register" style="margin-left: 13%;">
	            
	            <div class="input-field col s4" style="left:0.75rem;">
	            	<b style="color: #00697C;font-size: 20px">CADASTRO </b><a href="<%=Strings.BASE%>/" style="color: #00697C;font-size: 20px;">| Já possuo cadastro</a>
	            </div>
	            
				<div class="row">
					<div class="input-field col s4">
				    	<label for="title" style="color: #4DBCC4;font-size: 20px;"><b>Informação Pessoal</b></label>
					</div>
				</div>
	
				<div class="row">
					<div class="input-field col s3">
					    <input placeholder="Nome*" id="first_name" name="firstName" type="text" class="validate" required="required">
					</div>
					<div class="input-field col s5">
						<input placeholder="Sobrenome*" id="last_name" name="lastName" type="text" class="validate" required="required">
					</div>
					<div class="input-field col s2">
						<input placeholder="Telefone*" id="phone" name="phone" type="text" class="validate" required="" /><br />
					</div>
				</div>
				
				<div class="row">
					<div class="input-field col s5">
		                <input placeholder="E-mail*" id="email" name="email" type="email" class="validate" required="" onblur="existEmail(event);"/><br />
					</div>
					<div class="input-field col s5">
						<input placeholder="Afiliação*" id="organization" name="organization" type="text" class="validate" required="">
					</div>
				</div>
				<div class="row">
					<div class="input-field col s4">
						<i class="fa fa-chevron-down"></i>
						<select required="required" name="country">
							<option value="" disabled selected>Nacionalidade*</option>
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
						    <option value="Brazil">Brasil</option>
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
					<div class="input-field col s2">
						<i class="fa fa-chevron-down"></i>
						<select required="required" name="language">
							<option value="" disabled selected>Idioma*</option>
							<option value="Português">Português</option>
						    <option value="Inglês">Inglês</option>
						    <option value="Espanhol">Espanhol</option>
						    <option value="Alemão">Alemão</option>
						    <option value="Italiano">Italiano</option>
						    <option value="Francês">Francês</option>
					    </select>
				    </div>
					<div class="input-field col s4">
						<input placeholder="Outro idioma" id="otherLanguage" name="otherLanguage" type="text">
					</div>
				</div>

				<div class="row">
					<div class="input-field col s4">
				    	<label for="title" style="color: #4DBCC4;"><b>Formação e Currículo</b></label>
					</div>
				</div>
	
				<div class="row">
					<div class="input-field col s3">
						<i class="fa fa-chevron-down"></i>
						<select required="required" name="title">
							<option value="" disabled selected>Grau*</option>
							<option value="Bacharel">Bacharel ( Bel. )</option>
						    <option value="Doutor">Doutor ( Dr. )</option>
						    <option value="Especialista">Especialista ( Esp. )</option>
						    <option value="Graduando">Graduando ( Grad. )</option>
						    <option value="Mestre">Mestre ( Ms. )</option>
						    <option value="Tecnologo">Tecnólogo ( Tec. )</option>
					    </select>
				    </div>
					<div class="input-field col s4">
						<input placeholder="Área*(ex:Ciências Florestais)" id="area" name="jobPosition" class="validate" type="text" required="required">
					</div>
					<div class="input-field col s3">
						<input placeholder="Orcid" id="orcid" name="orcid" type="text"/><br />
					</div>
				</div>
				
				<div class="row">
					<div class="input-field col s7">
		                <input placeholder="Currículo (adicionar link do perfil no Currículo lattes, Linkedin ou ResearchGate)" 
		                id="curriculum" name="curriculum" type="text" /><br />
					</div>
				</div>
				<div class="row">
					<div class="input-field col s7">
		                <input placeholder="Áreas de interesse (ex: agroindústria, metalúrgica, eletroeletrônicos, etc)"  
		                id="dsPurpose" name="dsPurpose" type="text"/><br />
					</div>
					<div class="col s5" style="margin-top: -8px;">
		                <a href="#modal-terms_SICV" class="modal-trigger terms">Termos de Uso</a><br />
	    	            <a href="#modal-privacyPolicy_SICV" class="modal-trigger terms">Politica de Privacidade</a><br />
	                    <input type="checkbox" class="filled-in" id="termosAcima" required="required" />
	                    <label for="termosAcima" style="color: #00697C;"><i><b>Concordo com os termos acima.</b></i></label>
	                </div>
				</div>
				
				<div class="row">
					<div class="input-field col s3">
				    	<label for="title" style="color: #4DBCC4;"><b>Definir Senha</b></label>
					</div>
				</div>
				
				<div class="row">
					<div class="input-field col s5">
						<input placeholder="Senha* " id="password" name="senha" type="password" class="validate" required="required">
						<span id="result"></span>
					</div>
					<div class="input-field col s5">
						<input placeholder="Confirmar Senha* " id="confirm" type="password" class="validate" required="required" onkeyup="validPass()">
						<span id="resultConfirm"></span>
	                <div style="float: right;">
		                <input class="btn" type="submit" value="Submeter Cadastro" /><br />
	                </div>
					</div>
				</div>

            </form>
        </div>
		
		<script type="application/javascript" src="<%=Strings.BASE%>/assets/jquery-3.2.1.min.js"></script>
		<script type="application/javascript" src="<%=Strings.BASE%>/assets/materialize/js/materialize.min.js"></script>
		<script type="application/javascript" src="<%=Strings.BASE%>/assets/passwordsCheck.js"></script>
		<script type="text/javascript">
			$(document).ready(function() {
		    	$('select').material_select();
		    	$("select[required]").css({display: "inline", height: 0, padding: 0, width: 0, position: 'absolute'});
			});
			$(document).ready(function(){
			    $('.modal').modal();
			});
			
			function validPass() {
				pass = document.getElementById('password').value;
				confirmPass = document.getElementById('confirm').value;
				if (pass != confirmPass) {
					$('#confirm').addClass('invalid');
				} else {
					$('#confirm').removeClass('invalid');
					$('#confirm').addClass('valid');
				}
			}
			
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
				        url: 'register/getUser',
				        data: { email: mail},
				        success: function (result) {
				        	if(result == true){
				            	if(!$('#email').hasClass('invalid')){
					        		$('#email').removeClass('valid');
					            	$('#email').addClass('invalid');
				            	}
				            	alert("Email já cadastrado");
				        	}
				            if(result == false){
				            	if(!$('#email').hasClass('valid')){
					            	$('#email').addClass('valid');
					        		$('#email').removeClass('invalid');
				            	}
				            	alert("Email válido");
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
		        	}
				}
			}
			
		</script>
    </body>

</html>