<%@page import="br.com.ibict.acv.sicv.model.User"%>
<%@page import="br.com.ibict.acv.sicv.controller.HomeController"%>
<%@page import="resources.Strings"%>
<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="Tela de Login" />
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

        <title>SICV - ACV | Banco Nacional de Invent�rios dos invent�rios brasileiros do Ciclo de Vida (ICVs)</title>

        <!-- Bootstrap core CSS -->
        <link href="<%=Strings.BASE%>/assets/bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">

        <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
        <link href="<%=Strings.BASE%>/assets/bootstrap-3.3.7/css/ie10-viewport-bug-workaround.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="<%=Strings.BASE%>/assets/bootstrap-3.3.7/css/carousel.css" rel="stylesheet">

        <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
        <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
        <script src="<%=Strings.BASE%>/assets/bootstrap-3.3.7/js/ie-emulation-modes-warning.js"></script>

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <body>

        <div class="navbar-wrapper">
            <div class="container">

                <nav class="navbar navbar-inverse navbar-static-top">
                    <div class="container">
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                            <a class="navbar-brand" href="<%=Strings.BASE%>">SICV</a>
                        </div>
                        <div id="navbar" class="navbar-collapse collapse">
                            <ul class="nav navbar-nav">
                                <li><a href="<%=Strings.BASE%>">HOME</a></li>
                                <li class="active"><a href="<%=Strings.BASE%>/ilcd">ILCD</a></li>
                            </ul>
                            <ul class="nav navbar-nav navbar-right">
                                <%
                                    if (HomeController.session().getAttribute("user") != null) {
                                        User user = (User) HomeController.session().getAttribute("user");
                                %>

                                <%="<li><a href=\"" + Strings.BASE + "/logout\">" + user.getFirstName() + "</a></li>"%>

                                <%
                                } else {
                                %>

                                <li><a href="<%=Strings.BASE%>/login">Login</a></li>

                                <%
                                    }
                                %>

                            </ul>
                        </div>
                    </div>
                </nav>

            </div>
        </div>

        <div class="container marketing" style="margin-top: 100px">                        
            <form action="<%=Strings.BASE%>/admin/homologacao/${id}/qualidata" method="POST">
                <div class="grid">

                    <div class="row">
                        <h4 class="text-light" style="margin-right: 20px;"><span style="color: red;">*</span> O conjunto de dados est� em ingl�s?</h4>
                        <label class="input-control radio small-check" style="margin-right: 20px;">
                            <input name="q1" value="true" type="radio" />
                            <span class="check"></span>
                            <span class="caption">Sim</span>
                        </label>
                        <label class="input-control radio small-check" style="margin-right: 20px;">
                            <input name="q1" value="false" type="radio" />
                            <span class="check"></span>
                            <span class="caption">N�o</span>
                        </label>
                        <div class="input-control checkbox"><span class="caption">Coment�rio</span></div>
                        <div class="input-control text">
                            <input type="text" />
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <h4 class="text-light" style="margin-right: 20px;"><span style="color: red;">*</span> A identifica��o do conjunto de dados segue o padr�o Nome do produto_tecnologia_outra especifica��o?</h4>
                        <label class="input-control radio small-check" style="margin-right: 20px;">
                            <input name="q2"  value="true" type="radio" />
                            <span class="check"></span>
                            <span class="caption">Sim</span>
                        </label>
                        <label class="input-control radio small-check" style="margin-right: 20px;">
                            <input name="q2"  value="false" type="radio" />
                            <span class="check"></span>
                            <span class="caption">N�o</span>
                        </label>
                        <div class="input-control checkbox"><span class="caption">Coment�rio</span></div>
                        <div class="input-control text">
                            <input type="text" />
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <h4 class="text-light" style="margin-right: 20px;"><span style="color: red;">*</span> As cita��es e refer�ncias est�o completas?</h4>
                        <label class="input-control radio small-check" style="margin-right: 20px;">
                            <input name="q3"  value="true" type="radio" />
                            <span class="check"></span>
                            <span class="caption">Sim</span>
                        </label>
                        <label class="input-control radio small-check" style="margin-right: 20px;">
                            <input name="q3"  value="false" type="radio" />
                            <span class="check"></span>
                            <span class="caption">N�o</span>
                        </label>
                        <div class="input-control checkbox"><span class="caption">Coment�rio</span></div>
                        <div class="input-control text">
                            <input type="text" />
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <h4 class="text-light" style="margin-right: 20px;"><span style="color: red;">*</span> Os campos de administra��o s�o informados?</h4>
                        <label class="input-control radio small-check" style="margin-right: 20px;">
                            <input name="q4"  value="true" type="radio" />
                            <span class="check"></span>
                            <span class="caption">Sim</span>
                        </label>
                        <label class="input-control radio small-check" style="margin-right: 20px;">
                            <input name="q4"  value="false" type="radio" />
                            <span class="check"></span>
                            <span class="caption">N�o</span>
                        </label>
                        <div class="input-control checkbox"><span class="caption">Coment�rio</span></div>
                        <div class="input-control text">
                            <input type="text" />
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <h4 class="text-light" style="margin-right: 20px;"><span style="color: red;">*</span> � informada a cobertura temporal do conjunto de dados?</h4>
                        <label class="input-control radio small-check" style="margin-right: 20px;">
                            <input name="q5"  value="true" type="radio" />
                            <span class="check"></span>
                            <span class="caption">Sim</span>
                        </label>
                        <label class="input-control radio small-check" style="margin-right: 20px;">
                            <input name="q5" value="false" type="radio" />
                            <span class="check"></span>
                            <span class="caption">N�o</span>
                        </label>
                        <div class="input-control checkbox"><span class="caption">Coment�rio</span></div>
                        <div class="input-control text">
                            <input type="text" />
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <h4 class="text-light" style="margin-right: 20px;"> � informado o per�odo de validade do conjunto de dados?</h4>
                        <label class="input-control radio small-check" style="margin-right: 20px;">
                            <input name="q6" value="true" type="radio" />
                            <span class="check"></span>
                            <span class="caption">Sim</span>
                        </label>
                        <label class="input-control radio small-check" style="margin-right: 20px;">
                            <input name="q6" value="false" type="radio" />
                            <span class="check"></span>
                            <span class="caption">N�o</span>
                        </label>
                        <div class="input-control checkbox"><span class="caption">Coment�rio</span></div>
                        <div class="input-control text">
                            <input type="text" />
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <h4 class="text-light" style="margin-right: 20px;"><span style="color: red;">*</span> A cobertura tecnol�gica � informada?</h4>
                        <label class="input-control radio small-check" style="margin-right: 20px;">
                            <input name="q7" value="true" type="radio" />
                            <span class="check"></span>
                            <span class="caption">Sim</span>
                        </label>
                        <label class="input-control radio small-check" style="margin-right: 20px;">
                            <input name="q7" value="false" type="radio" />
                            <span class="check"></span>
                            <span class="caption">N�o</span>
                        </label>
                        <div class="input-control checkbox"><span class="caption">Coment�rio</span></div>
                        <div class="input-control text">
                            <input type="text" />
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <h4 class="text-light" style="margin-right: 20px;"><span style="color: red;">*</span> A descri��o da tecnologia � apresentada?</h4>
                        <label class="input-control radio small-check" style="margin-right: 20px;">
                            <input name="q8" value="true" type="radio" />
                            <span class="check"></span>
                            <span class="caption">Sim</span>
                        </label>
                        <label class="input-control radio small-check" style="margin-right: 20px;">
                            <input name="q8" value="false" type="radio" />
                            <span class="check"></span>
                            <span class="caption">N�o</span>
                        </label>
                        <div class="input-control checkbox"><span class="caption">Coment�rio</span></div>
                        <div class="input-control text">
                            <input type="text" />
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <h4 class="text-light" style="margin-right: 20px;"><span style="color: red;">*</span> A cobertura geogr�fica � informada?</h4>
                        <label class="input-control radio small-check" style="margin-right: 20px;">
                            <input name="q9" value="true" type="radio" />
                            <span class="check"></span>
                            <span class="caption">Sim</span>
                        </label>
                        <label class="input-control radio small-check" style="margin-right: 20px;">
                            <input name="q9" value="false" type="radio" />
                            <span class="check"></span>
                            <span class="caption">N�o</span>
                        </label>
                        <div class="input-control checkbox"><span class="caption">Coment�rio</span></div>
                        <div class="input-control text">
                            <input type="text" />
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <h4 class="text-light" style="margin-right: 20px;"><span style="color: red;">*</span> � informada a representatividade do conjunto de dados?</h4>
                        <label class="input-control radio small-check" style="margin-right: 20px;">
                            <input name="q10" value="true" type="radio" />
                            <span class="check"></span>
                            <span class="caption">Sim</span>
                        </label>
                        <label class="input-control radio small-check" style="margin-right: 20px;">
                            <input name="q10" value="false" type="radio" />
                            <span class="check"></span>
                            <span class="caption">N�o</span>
                        </label>
                        <div class="input-control checkbox"><span class="caption">Coment�rio</span></div>
                        <div class="input-control text">
                            <input type="text" />
                        </div>
                    </div>
                    <br />
                    <h3>Requisitos de M�todo e Processos</h3>

                    <div class="row">
                        <h4 class="text-light" style="margin-right: 20px;"><span style="color: red;">*</span> Informada a abordagem utilizada?</h4>
                        <label class="input-control radio small-check" style="margin-right: 20px;">
                            <input name="q11" value="true" type="radio" />
                            <span class="check"></span>
                            <span class="caption">Sim</span>
                        </label>
                        <label class="input-control radio small-check" style="margin-right: 20px;">
                            <input name="q11" value="false" type="radio" />
                            <span class="check"></span>
                            <span class="caption">N�o</span>
                        </label>
                        <div class="input-control checkbox"><span class="caption">Coment�rio</span></div>
                        <div class="input-control text">
                            <input type="text" />
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <h4 class="text-light" style="margin-right: 20px;"><span style="color: red;">*</span> Foi aplicado crit�rio de corte? Se sim, qual foi o crit�rio utilizado?</h4>
                        <label class="input-control radio small-check" style="margin-right: 20px;">
                            <input name="q12" value="true" type="radio" />
                            <span class="check"></span>
                            <span class="caption">Sim</span>
                        </label>
                        <label class="input-control radio small-check" style="margin-right: 20px;">
                            <input name="q12" value="false" type="radio" />
                            <span class="check"></span>
                            <span class="caption">N�o</span>
                        </label>
                        <div class="input-control checkbox"><span class="caption">Qual?</span></div>
                        <div class="input-control text">
                            <input type="text" />
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <h4 class="text-light" style="margin-right: 20px;"><span style="color: red;">*</span> Houve agrega��o dos dados? Qual o n�vel de agrega��o utilizado?</h4>
                        <label class="input-control radio small-check" style="margin-right: 20px;">
                            <input name="q13" value="true" type="radio" />
                            <span class="check"></span>
                            <span class="caption">Sim</span>
                        </label>
                        <label class="input-control radio small-check" style="margin-right: 20px;">
                            <input name="q13" value="false" type="radio" />
                            <span class="check"></span>
                            <span class="caption">N�o</span>
                        </label>
                        <div class="input-control checkbox"><span class="caption">Qual?</span></div>
                        <div class="input-control text">
                            <input type="text" />
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <h4 class="text-light" style="margin-right: 20px;"><span style="color: red;">*</span> O fluxograma do sistema do produto foi apresentado, incluindo as fronteiras do conjunto de dados?</h4>
                        <label class="input-control radio small-check" style="margin-right: 20px;">
                            <input name="q14" value="true" type="radio" />
                            <span class="check"></span>
                            <span class="caption">Sim</span>
                        </label>
                        <label class="input-control radio small-check" style="margin-right: 20px;">
                            <input name="q14" value="false" type="radio" />
                            <span class="check"></span>
                            <span class="caption">N�o</span>
                        </label>
                        <div class="input-control checkbox"><span class="caption">Coment�rio</span></div>
                        <div class="input-control text">
                            <input type="text" />
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <h4 class="text-light" style="margin-right: 20px;"><span style="color: red;">*</span> As conex�es dos fluxos intermedi�rios com os processos elementares secund�rios foram apresentadas?</h4>
                        <label class="input-control radio small-check" style="margin-right: 20px;">
                            <input name="q15" value="true" type="radio" />
                            <span class="check"></span>
                            <span class="caption">Sim</span>
                        </label>
                        <label class="input-control radio small-check" style="margin-right: 20px;">
                            <input name="q15" value="false" type="radio" />
                            <span class="check"></span>
                            <span class="caption">N�o</span>
                        </label>
                        <div class="input-control checkbox"><span class="caption">Coment�rio</span></div>
                        <div class="input-control text">
                            <input type="text" />
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <h4 class="text-light" style="margin-right: 20px;"><span style="color: red;">*</span> O conjunto de dados representa um sistema multifuncional?</h4>
                        <label class="input-control radio small-check" style="margin-right: 20px;">
                            <input name="q16" value="true" type="radio" />
                            <span class="check"></span>
                            <span class="caption">Sim</span>
                        </label>
                        <label class="input-control radio small-check" style="margin-right: 20px;">
                            <input name="q16" value="false" type="radio" />
                            <span class="check"></span>
                            <span class="caption">N�o</span>
                        </label>
                        <div class="input-control checkbox"><span class="caption">Como lidou com a multifuncionalidade?</span></div>
                        <div class="input-control text">
                            <input type="text" />
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <h4 class="text-light" style="margin-right: 20px;"><span style="color: red;">*</span> Foi considerado o uso da terra (ocupa��o e transforma��o)?</h4>
                        <label class="input-control radio small-check" style="margin-right: 20px;">
                            <input name="q17" value="true" type="radio" />
                            <span class="check"></span>
                            <span class="caption">Sim</span>
                        </label>
                        <label class="input-control radio small-check" style="margin-right: 20px;">
                            <input name="q17" value="false" type="radio" />
                            <span class="check"></span>
                            <span class="caption">N�o</span>
                        </label>
                        <div class="input-control checkbox"><span class="caption">Qual foi o m�todo utilizado para transforma��o do uso da terra?</span></div>
                        <div class="input-control text">
                            <input type="text" />
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <h4 class="text-light" style="margin-right: 20px;"><span style="color: red;">*</span> Os dados foram validados de alguma forma?</h4>
                        <label class="input-control radio small-check" style="margin-right: 20px;">
                            <input name="q18" value="true" type="radio" />
                            <span class="check"></span>
                            <span class="caption">Sim</span>
                        </label>
                        <label class="input-control radio small-check" style="margin-right: 20px;">
                            <input name="q18" value="false" type="radio" />
                            <span class="check"></span>
                            <span class="caption">N�o</span>
                        </label>
                        <div class="input-control checkbox"><span class="caption">Qual foi o m�todo utilizado?</span></div>
                        <div class="input-control text">
                            <input type="text" />
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <h4 class="text-light" style="margin-right: 20px;"><span style="color: red;">*</span> Se o balan�o de massa foi realizado, quanto foi fechado nos processos elementares prim�rios?</h4>
                        <label class="input-control radio small-check" style="margin-right: 20px;">
                            <input name="q19" value="true" type="radio" />
                            <span class="check"></span>
                            <span class="caption">Sim</span>
                        </label>
                        <label class="input-control radio small-check" style="margin-right: 20px;">
                            <input name="q19" value="false" type="radio" />
                            <span class="check"></span>
                            <span class="caption">N�o</span>
                        </label>
                        <div class="input-control checkbox"><span class="caption">Quanto? (0 a 100%)</span></div>
                        <div class="input-control text">
                            <input type="text" />
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <h4 class="text-light" style="margin-right: 20px;"><span style="color: red;">*</span> Se o balan�o de �gua foi realizado, quanto foi fechado nos processos elementares prim�rios?</h4>
                        <label class="input-control radio small-check" style="margin-right: 20px;">
                            <input name="q20" value="true" type="radio" />
                            <span class="check"></span>
                            <span class="caption">Sim</span>
                        </label>
                        <label class="input-control radio small-check" style="margin-right: 20px;">
                            <input name="q20" value="false" type="radio" />
                            <span class="check"></span>
                            <span class="caption">N�o</span>
                        </label>
                        <div class="input-control checkbox"><span class="caption">Quanto? (0 a 100%)</span></div>
                        <div class="input-control text">
                            <input type="text" />
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <h4 class="text-light" style="margin-right: 20px;"><span style="color: red;">*</span> Se o balan�o de energia foi realizado, quanto foi fechado nos processos elementares prim�rios?</h4>
                        <label class="input-control radio small-check" style="margin-right: 20px;">
                            <input name="q21" value="true" type="radio" />
                            <span class="check"></span>
                            <span class="caption">Sim</span>
                        </label>
                        <label class="input-control radio small-check" style="margin-right: 20px;">
                            <input name="q21" value="false" type="radio" />
                            <span class="check"></span>
                            <span class="caption">N�o</span>
                        </label>
                        <div class="input-control checkbox"><span class="caption">Quanto? (0 a 100%)</span></div>
                        <div class="input-control text">
                            <input type="text" />
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <h4 class="text-light" style="margin-right: 20px;"><span style="color: red;">*</span> Foi adotado algum m�todo para analisar a qualidade dos dados?</h4>
                        <label class="input-control radio small-check" style="margin-right: 20px;">
                            <input name="q22" value="true" type="radio" />
                            <span class="check"></span>
                            <span class="caption">Sim</span>
                        </label>
                        <label class="input-control radio small-check" style="margin-right: 20px;">
                            <input name="q22" value="false" type="radio" />
                            <span class="check"></span>
                            <span class="caption">N�o</span>
                        </label>
                        <div class="input-control checkbox"><span class="caption">Qual?</span></div>
                        <div class="input-control text">
                            <input type="text" />
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <h4 class="text-light" style="margin-right: 20px;"><span style="color: red;">*</span> Os bens de capital foram inclu�dos?</h4>
                        <label class="input-control radio small-check" style="margin-right: 20px;">
                            <input name="q23" value="true" type="radio" />
                            <span class="check"></span>
                            <span class="caption">Sim</span>
                        </label>
                        <label class="input-control radio small-check" style="margin-right: 20px;">
                            <input name="q23" value="false" type="radio" />
                            <span class="check"></span>
                            <span class="caption">N�o</span>
                        </label>
                        <div class="input-control checkbox"><span class="caption">Coment�rio</span></div>
                        <div class="input-control text">
                            <input type="text" />
                        </div>
                    </div>
                    <br />

                    <h3>Requisitos de Fluxos</h3>

                    <div class="row">
                        <h4 class="text-light" style="margin-right: 20px;"><span style="color: red;">*</span> A identifica��o dos fluxos seguiu o padr�o definido no Guia? Em caso negativo, adequar.</h4>
                        <label class="input-control radio small-check" style="margin-right: 20px;">
                            <input name="q24" value="true" type="radio" />
                            <span class="check"></span>
                            <span class="caption">Sim</span>
                        </label>
                        <label class="input-control radio small-check" style="margin-right: 20px;">
                            <input name="q24" value="false" type="radio" />
                            <span class="check"></span>
                            <span class="caption">N�o</span>
                        </label>
                        <div class="input-control checkbox"><span class="caption">Coment�rio</span></div>
                        <div class="input-control text">
                            <input type="text" />
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <h4 class="text-light" style="margin-right: 20px;"><span style="color: red;">*</span> O fluxo de refer�ncia foi informado?</h4>
                        <label class="input-control radio small-check" style="margin-right: 20px;">
                            <input name="q25" value="true" type="radio" />
                            <span class="check"></span>
                            <span class="caption">Sim</span>
                        </label>
                        <label class="input-control radio small-check" style="margin-right: 20px;">
                            <input name="q25" value="false" type="radio" />
                            <span class="check"></span>
                            <span class="caption">N�o</span>
                        </label>
                        <div class="input-control checkbox"><span class="caption">Coment�rio</span></div>
                        <div class="input-control text">
                            <input type="text" />
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <h4 class="text-light" style="margin-right: 20px;"><span style="color: red;">*</span> As unidades est�o no Sistema Internacional (SI)?</h4>
                        <label class="input-control radio small-check" style="margin-right: 20px;">
                            <input name="q26" value="true" type="radio" />
                            <span class="check"></span>
                            <span class="caption">Sim</span>
                        </label>
                        <label class="input-control radio small-check" style="margin-right: 20px;">
                            <input name="q26" value="false" type="radio" />
                            <span class="check"></span>
                            <span class="caption">N�o</span>
                        </label>
                        <div class="input-control checkbox"><span class="caption">Se n�o, descrever as poss�veis rela��es com as unidades do SI.</span></div>
                        <div class="input-control text">
                            <input type="text" />
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <h4 class="text-light" style="margin-right: 20px;"><span style="color: red;">*</span> Cada fluxo tecnol�gico est� especificado por regi�o?</h4>
                        <label class="input-control radio small-check" style="margin-right: 20px;">
                            <input name="q27" value="true" type="radio" />
                            <span class="check"></span>
                            <span class="caption">Sim</span>
                        </label>
                        <label class="input-control radio small-check" style="margin-right: 20px;">
                            <input name="q27" value="false" type="radio" />
                            <span class="check"></span>
                            <span class="caption">N�o</span>
                        </label>
                        <div class="input-control checkbox"><span class="caption">Coment�rio</span></div>
                        <div class="input-control text">
                            <input type="text" />
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <h4 class="text-light" style="margin-right: 20px;"><span style="color: red;">*</span> S�o informados os compartimentos e subcompartimentos?</h4>
                        <label class="input-control radio small-check" style="margin-right: 20px;">
                            <input name="q28" value="true" type="radio" />
                            <span class="check"></span>
                            <span class="caption">Sim</span>
                        </label>
                        <label class="input-control radio small-check" style="margin-right: 20px;">
                            <input name="q28" value="false" type="radio" />
                            <span class="check"></span>
                            <span class="caption">N�o</span>
                        </label>
                        <div class="input-control checkbox"><span class="caption">Coment�rio</span></div>
                        <div class="input-control text">
                            <input type="text" />
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <h4 class="text-light" style="margin-right: 20px;">H� informa��o da origem e destino dos fluxos de �gua?</h4>
                        <label class="input-control radio small-check" style="margin-right: 20px;">
                            <input name="q29" value="true" type="radio" />
                            <span class="check"></span>
                            <span class="caption">Sim</span>
                        </label>
                        <label class="input-control radio small-check" style="margin-right: 20px;">
                            <input name="q29" value="false" type="radio" />
                            <span class="check"></span>
                            <span class="caption">N�o</span>
                        </label>
                        <div class="input-control checkbox"><span class="caption">Coment�rio</span></div>
                        <div class="input-control text">
                            <input type="text" />
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <h4 class="text-light" style="margin-right: 20px;">Os materiais particulados foram separados em fra��es?</h4>
                        <label class="input-control radio small-check" style="margin-right: 20px;">
                            <input name="q30" value="true" type="radio" />
                            <span class="check"></span>
                            <span class="caption">Sim</span>
                        </label>
                        <label class="input-control radio small-check" style="margin-right: 20px;">
                            <input name="q30" value="false" type="radio" />
                            <span class="check"></span>
                            <span class="caption">N�o</span>
                        </label>
                        <div class="input-control checkbox"><span class="caption">Coment�rio</span></div>
                        <div class="input-control text">
                            <input type="text" />
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <h4 class="text-light" style="margin-right: 20px;">Os compostos org�nicos vol�teis (COV) foram discriminados?</h4>
                        <label class="input-control radio small-check" style="margin-right: 20px;">
                            <input name="q31" value="true" type="radio" />
                            <span class="check"></span>
                            <span class="caption">Sim</span>
                        </label>
                        <label class="input-control radio small-check" style="margin-right: 20px;">
                            <input name="q31" value="false" type="radio" />
                            <span class="check"></span>
                            <span class="caption">N�o</span>
                        </label>
                        <div class="input-control checkbox"><span class="caption">Coment�rio</span></div>
                        <div class="input-control text">
                            <input type="text" />
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <h4 class="text-light" style="margin-right: 20px;">Os hidrocarbonetos arom�ticos polic�clicos (PAH) foram discriminados?</h4>
                        <label class="input-control radio small-check" style="margin-right: 20px;">
                            <input name="q32" value="true" type="radio" />
                            <span class="check"></span>
                            <span class="caption">Sim</span>
                        </label>
                        <label class="input-control radio small-check" style="margin-right: 20px;">
                            <input name="q32" value="false" type="radio" />
                            <span class="check"></span>
                            <span class="caption">N�o</span>
                        </label>
                        <div class="input-control checkbox"><span class="caption">Coment�rio</span></div>
                        <div class="input-control text">
                            <input type="text" />
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <h4 class="text-light" style="margin-right: 20px;">As dioxinas e furanos foram discriminados?</h4>
                        <label class="input-control radio small-check" style="margin-right: 20px;">
                            <input name="q33" value="true" type="radio" />
                            <span class="check"></span>
                            <span class="caption">Sim</span>
                        </label>
                        <label class="input-control radio small-check" style="margin-right: 20px;">
                            <input name="q33" value="false" type="radio" />
                            <span class="check"></span>
                            <span class="caption">N�o</span>
                        </label>
                        <div class="input-control checkbox"><span class="caption">Coment�rio</span></div>
                        <div class="input-control text">
                            <input type="text" />
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <h4 class="text-light" style="margin-right: 20px;"><span style="color: red;">*</span> As fontes de CO2 e CH4 foram discriminadas?</h4>
                        <label class="input-control radio small-check" style="margin-right: 20px;">
                            <input name="q34" value="true" type="radio" />
                            <span class="check"></span>
                            <span class="caption">Sim</span>
                        </label>
                        <label class="input-control radio small-check" style="margin-right: 20px;">
                            <input name="q34" value="false" type="radio" />
                            <span class="check"></span>
                            <span class="caption">N�o</span>
                        </label>
                        <div class="input-control checkbox"><span class="caption">Coment�rio</span></div>
                        <div class="input-control text">
                            <input type="text" />
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <h4 class="text-light" style="margin-right: 20px;">As emiss�es de longo prazo foram informadas?</h4>
                        <label class="input-control radio small-check" style="margin-right: 20px;">
                            <input name="q35" value="true" type="radio" />
                            <span class="check"></span>
                            <span class="caption">Sim</span>
                        </label>
                        <label class="input-control radio small-check" style="margin-right: 20px;">
                            <input name="q35" value="false" type="radio" />
                            <span class="check"></span>
                            <span class="caption">N�o</span>
                        </label>
                        <div class="input-control checkbox"><span class="caption">Coment�rio</span></div>
                        <div class="input-control text">
                            <input type="text" />
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <h4 class="text-light" style="margin-right: 20px;"><span style="color: red;">*</span> As emiss�es diretas de CO2 de MUT foram inclu�das e discriminadas?</h4>
                        <label class="input-control radio small-check" style="margin-right: 20px;">
                            <input name="q36" value="true" type="radio" />
                            <span class="check"></span>
                            <span class="caption">Sim</span>
                        </label>
                        <label class="input-control radio small-check" style="margin-right: 20px;">
                            <input name="q36" value="false" type="radio" />
                            <span class="check"></span>
                            <span class="caption">N�o</span>
                        </label>
                        <div class="input-control checkbox"><span class="caption">Coment�rio</span></div>
                        <div class="input-control text">
                            <input type="text" />
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <h4 class="text-light" style="margin-right: 20px;"><span style="color: red;">*</span> Foram inclu�dos os dados do transporte?</h4>
                        <label class="input-control radio small-check" style="margin-right: 20px;">
                            <input name="q37" value="true" type="radio" />
                            <span class="check"></span>
                            <span class="caption">Sim</span>
                        </label>
                        <label class="input-control radio small-check" style="margin-right: 20px;">
                            <input name="q37" value="false" type="radio" />
                            <span class="check"></span>
                            <span class="caption">N�o</span>
                        </label>
                        <div class="input-control checkbox"><span class="caption">Coment�rio</span></div>
                        <div class="input-control text">
                            <input type="text" />
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <h4 class="text-light" style="margin-right: 20px;"><span style="color: red;">*</span> Foram informados os dados faltantes?</h4>
                        <label class="input-control radio small-check" style="margin-right: 20px;">
                            <input name="q38" value="true" type="radio" />
                            <span class="check"></span>
                            <span class="caption">Sim</span>
                        </label>
                        <label class="input-control radio small-check" style="margin-right: 20px;">
                            <input name="q38" value="false" type="radio" />
                            <span class="check"></span>
                            <span class="caption">N�o</span>
                        </label>
                        <div class="input-control checkbox"><span class="caption">Coment�rio</span></div>
                        <div class="input-control text">
                            <input type="text" />
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <h4 class="text-light" style="margin-right: 20px;"><span style="color: red;">*</span> Foram informados os tipos de dados para cada fluxo?</h4>
                        <label class="input-control radio small-check" style="margin-right: 20px;">
                            <input name="q39" value="true" type="radio" />
                            <span class="check"></span>
                            <span class="caption">Sim</span>
                        </label>
                        <label class="input-control radio small-check" style="margin-right: 20px;">
                            <input name="q39" value="false" type="radio" />
                            <span class="check"></span>
                            <span class="caption">N�o</span>
                        </label>
                        <div class="input-control checkbox"><span class="caption">Coment�rio</span></div>
                        <div class="input-control text">
                            <input type="text" />
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <h4 class="text-light" style="margin-right: 20px;"><span style="color: red;">*</span> Foi informada a incerteza dos dados para cada fluxo?</h4>
                        <label class="input-control radio small-check" style="margin-right: 20px;">
                            <input name="q40" value="true" type="radio" />
                            <span class="check"></span>
                            <span class="caption">Sim</span>
                        </label>
                        <label class="input-control radio small-check" style="margin-right: 20px;">
                            <input name="q40" value="false" type="radio" />
                            <span class="check"></span>
                            <span class="caption">N�o</span>
                        </label>
                        <div class="input-control checkbox"><span class="caption">Coment�rio</span></div>
                        <div class="input-control text">
                            <input type="text" />
                        </div>
                    </div>
                    <br />
                    <h3>Requisitos de Revis�o</h3>

                    <div class="row">
                        <h4 class="text-light" style="margin-right: 20px;"><span style="color: red;">*</span> Caso tenha havido revis�o cr�tica de terceira parte, as informa��es necess�rias foram fornecidas?</h4>
                        <label class="input-control radio small-check" style="margin-right: 20px;">
                            <input name="q41" value="true" type="radio" />
                            <span class="check"></span>
                            <span class="caption">Sim</span>
                        </label>
                        <label class="input-control radio small-check" style="margin-right: 20px;">
                            <input name="q41" value="false" type="radio" />
                            <span class="check"></span>
                            <span class="caption">N�o</span>
                        </label>
                        <div class="input-control checkbox"><span class="caption">Coment�rio</span></div>
                        <div class="input-control text">
                            <input type="text" />
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <h4 class="text-light" style="margin-right: 20px;"><span style="color: red;">*</span> Se houve revis�o cr�tica, o relat�rio da revis�o pode ser disponibilizado para os revisores do SICV, junto com o conjunto de dados?</h4>
                        <label class="input-control radio small-check" style="margin-right: 20px;">
                            <input name="q42" value="true" type="radio" />
                            <span class="check"></span>
                            <span class="caption">Sim</span>
                        </label>
                        <label class="input-control radio small-check" style="margin-right: 20px;">
                            <input name="q42" value="false" type="radio" />
                            <span class="check"></span>
                            <span class="caption">N�o</span>
                        </label>
                        <div class="input-control checkbox"><span class="caption">Coment�rio</span></div>
                        <div class="input-control text">
                            <input type="text" />
                        </div>
                    </div>
                    <br />

                    <textarea class="form-control" rows="3"></textarea>
                    <br />
                    <div class="row" style="margin-top: 10px;">
                        <a href="/admin/ilcd" class="btn btn-default">Cancelar</a>
                        <input class="btn btn-primary" style="margin-right: 20px;" value="Enviar" type="submit" />
                    </div>

                </div>
            </form>

            <hr class="featurette-divider">

            <!-- /END THE FEATURETTES -->


            <!-- FOOTER -->
            <footer>
                <p class="pull-right"><a href="#">Back to top</a></p>
                <p>&copy; 2016 Company, Inc. &middot; <a href="#">Privacy</a> &middot; <a href="#">Terms</a></p>
            </footer>
        </div>

        <script src="<%=Strings.BASE%>/assets/metro-ui3.0.17/js/jquery-2.1.3.min.js"></script>

        <script>
            function getData() {
                var data = {};
                $("form").serializeArray().map(function (x) {
                    data[x.name] = x.value;
                });
                return data;
            }
            $(document).ready(function () {
                $("form").submit(function () {
                    var data = getData();
                    $(this).find("input[name^='q']").each(function () {
                        $(this).val('');
                    });
                    $(":input[value='']").attr('disabled', true);
                    var input = $("<input />")
                            .attr("type", "hidden")
                            .attr("name", "json").val(JSON.stringify(data));
                    $('form').append($(input));
                });
            });
        </script>
    </body>
</html>
