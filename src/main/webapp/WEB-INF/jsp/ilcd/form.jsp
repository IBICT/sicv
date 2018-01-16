<%@page import="resources.Strings"%>
<!DOCTYPE html>
<html>
    <head>

        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
        <meta name="description" content="Metro, a sleek, intuitive, and powerful framework for faster and easier web development for Windows Metro Style." />
        <meta name="keywords" content="HTML, CSS, JS, JavaScript, framework, metro, front-end, frontend, web development" />
        <meta name="author" content="Sergey Pimenov and Metro UI CSS contributors" />

        <link rel='shortcut icon' type='image/x-icon' href='../favicon.ico' />

        <title>Sicv2</title>

        <link rel="stylesheet" href="<%=Strings.BASE%>/assets/metro-ui3.0.17/css/metro.css" />
        <link rel="stylesheet" href="<%=Strings.BASE%>/assets/metro-ui3.0.17/css/metro-icons.css" />
        <link rel="stylesheet" href="<%=Strings.BASE%>/assets/metro-ui3.0.17/css/metro-responsive.css" />

        <script src="<%=Strings.BASE%>/assets/metro-ui3.0.17/js/jquery-2.1.3.min.js"></script>
        <script src="<%=Strings.BASE%>/assets/metro-ui3.0.17/js/jquery.dataTables.min.js"></script>

        <script src="<%=Strings.BASE%>/assets/metro-ui3.0.17/js/metro.js}"></script>

        <style>
            html, body {
                height: 100%;
            }
            body {
            }
            .page-content {
                padding-top: 3.125rem;
                min-height: 100%;
                background-color: #71b1d1;
            }
            .table .input-control.checkbox {
                line-height: 1;
                min-height: 0;
                height: auto;
            }

            @media screen and (max-width: 800px){
                #cell-sidebar {
                    flex-basis: 52px;
                }
                #cell-content {
                    flex-basis: calc(100% - 52px);
                }
            }
        </style>
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
                    $(this).find("input[name^='q']").each(function() { 
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

    </head>
    <body class="bg-steel">
        <div class="app-bar fixed-top darcula" data-role="appbar">
            <a class="app-bar-element branding"><span class="mif-stack"></span> Sicv</a>
            <span class="app-bar-divider"></span>
            <ul class="app-bar-menu">
                <li><a href="">Dashboard</a></li>
                <li>
                    <a href="" class="dropdown-toggle">Bases</a>
                    <ul class="d-menu" data-role="dropdown">
                        <li><a href="">Listar Todos</a></li>
                        <li><a href="">Novo base</a></li>
                        <li class="divider"></li>
                    </ul>
                </li>
                <li>
                    <a href="" class="dropdown-toggle">ILCDs</a>
                    <ul class="d-menu" data-role="dropdown">
                        <li><a href="/ilcd/new">Novo</a></li>
                        <li><a href="/ilcd/">Listar Todos</a></li>
                        <li class="divider"></li>
                    </ul>
                </li>
                <li><a href="">QualiData</a></li>
                <li><a href="">Messagens</a></li>
                <li>
                    <a href="" class="dropdown-toggle">Ajuda</a>
                    <ul class="d-menu" data-role="dropdown">
                        <li><a href="">Documenta��o</a></li>
                        <li><a href="">Reportar bug</a></li>
                        <li class="divider"></li>
                        <li><a href="">Sobre</a></li>
                    </ul>
                </li>
            </ul>

            <div class="app-bar-element place-right">
                <span class="dropdown-toggle"><span class="mif-user"></span> User Name</span>
                <div class="app-bar-drop-container padding10 place-right no-margin-top block-shadow fg-dark" data-role="dropdown" data-no-close="true" style="width: 220px">
                    <h2 class="text-light">Defini��es r�pidas</h2>
                    <ul class="unstyled-list fg-dark">
                        <li><a href="" class="fg-white1 fg-hover-yellow">Perfil</a></li>
                        <li><a href="" class="fg-white2 fg-hover-yellow">Configura��es</a></li>
                        <li><a href="" class="fg-white2 fg-hover-yellow">Seguran�a</a></li>
                        <li><a href="" class="fg-white3 fg-hover-yellow">Sa�da</a></li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="page-content">
            <div class="flex-grid no-responsive-future" style="height: 100%;">
                <div class="row" style="height: 100%">
                    <div class="cell size-x200" id="cell-sidebar" style="background-color: #71b1d1; height: 100%">
                        <ul class="sidebar">
                            <li><a href="#">
                                    <span class="mif-apps icon"></span>
                                    <span class="title">TODOS OS ITENS</span>
                                    <span class="counter">0</span>
                                </a></li>
                            <li><a href="#">
                                    <span class="mif-database icon"></span>
                                    <span class="title">ILCD Bases</span>
                                    <span class="counter">0</span>
                                </a></li>
                            <li><a href="#">
                                    <span class="mif-file-binary icon"></span>
                                    <span class="title">ILCD</span>
                                    <span class="counter">0</span>
                                </a></li>
                            <li><a href="#">
                                    <span class="mif-user icon"></span>
                                    <span class="title">USU�RIO</span>
                                    <span class="counter">0</span>
                                </a></li>
                            <li><a href="#">
                                    <span class="mif-apps icon"></span>
                                    <span class="title">TODOS OS ITENS</span>
                                    <span class="counter">0</span>
                                </a></li>
                        </ul>
                    </div>
                    <div class="cell auto-size padding20 bg-white" id="cell-content">
                        <h3>Requisitos gerais</h3>
                        <hr class="thin bg-grayLighter" />

                        <form action="<%=Strings.BASE%>/admin/ilcd/new" method="POST" enctype="multipart/form-data">
                            <div class="grid">

                                <div class="row">
                                    <h4 class="text-light" style="margin-right: 20px;"><span style="color: red;">*</span> O conjunto de dados est� em ingl�s?</h4>
                                    <label class="input-control radio small-check" style="margin-right: 20px;">
                                        <input name="q1" value="sim" type="radio" />
                                        <span class="check"></span>
                                        <span class="caption">Sim</span>
                                    </label>
                                    <label class="input-control radio small-check" style="margin-right: 20px;">
                                        <input name="q1" value="n�o" type="radio" />
                                        <span class="check"></span>
                                        <span class="caption">N�o</span>
                                    </label>
                                    <div class="input-control checkbox"><span class="caption">Coment�rio</span></div>
                                    <div class="input-control text">
                                        <input type="text" />
                                    </div>
                                </div>

                                <div class="row">
                                    <h4 class="text-light" style="margin-right: 20px;"><span style="color: red;">*</span> A identifica��o do conjunto de dados segue o padr�o Nome do produto_tecnologia_outra especifica��o?</h4>
                                    <label class="input-control radio small-check" style="margin-right: 20px;">
                                        <input name="q2"  value="sim" type="radio" />
                                        <span class="check"></span>
                                        <span class="caption">Sim</span>
                                    </label>
                                    <label class="input-control radio small-check" style="margin-right: 20px;">
                                        <input name="q2"  value="n�o" type="radio" />
                                        <span class="check"></span>
                                        <span class="caption">N�o</span>
                                    </label>
                                    <div class="input-control checkbox"><span class="caption">Coment�rio</span></div>
                                    <div class="input-control text">
                                        <input type="text" />
                                    </div>
                                </div>

                                <div class="row">
                                    <h4 class="text-light" style="margin-right: 20px;"><span style="color: red;">*</span> As cita��es e refer�ncias est�o completas?</h4>
                                    <label class="input-control radio small-check" style="margin-right: 20px;">
                                        <input name="q3"  value="sim" type="radio" />
                                        <span class="check"></span>
                                        <span class="caption">Sim</span>
                                    </label>
                                    <label class="input-control radio small-check" style="margin-right: 20px;">
                                        <input name="q3"  value="n�o" type="radio" />
                                        <span class="check"></span>
                                        <span class="caption">N�o</span>
                                    </label>
                                    <div class="input-control checkbox"><span class="caption">Coment�rio</span></div>
                                    <div class="input-control text">
                                        <input type="text" />
                                    </div>
                                </div>

                                <div class="row">
                                    <h4 class="text-light" style="margin-right: 20px;"><span style="color: red;">*</span> Os campos de administra��o s�o informados?</h4>
                                    <label class="input-control radio small-check" style="margin-right: 20px;">
                                        <input name="q4"  value="sim" type="radio" />
                                        <span class="check"></span>
                                        <span class="caption">Sim</span>
                                    </label>
                                    <label class="input-control radio small-check" style="margin-right: 20px;">
                                        <input name="q4"  value="n�o" type="radio" />
                                        <span class="check"></span>
                                        <span class="caption">N�o</span>
                                    </label>
                                    <div class="input-control checkbox"><span class="caption">Coment�rio</span></div>
                                    <div class="input-control text">
                                        <input type="text" />
                                    </div>
                                </div>

                                <div class="row">
                                    <h4 class="text-light" style="margin-right: 20px;"><span style="color: red;">*</span> � informada a cobertura temporal do conjunto de dados?</h4>
                                    <label class="input-control radio small-check" style="margin-right: 20px;">
                                        <input name="q5"  value="sim" type="radio" />
                                        <span class="check"></span>
                                        <span class="caption">Sim</span>
                                    </label>
                                    <label class="input-control radio small-check" style="margin-right: 20px;">
                                        <input name="q5" value="n�o" type="radio" />
                                        <span class="check"></span>
                                        <span class="caption">N�o</span>
                                    </label>
                                    <div class="input-control checkbox"><span class="caption">Coment�rio</span></div>
                                    <div class="input-control text">
                                        <input type="text" />
                                    </div>
                                </div>

                                <div class="row">
                                    <h4 class="text-light" style="margin-right: 20px;"> � informado o per�odo de validade do conjunto de dados?</h4>
                                    <label class="input-control radio small-check" style="margin-right: 20px;">
                                        <input name="q6" value="sim" type="radio" />
                                        <span class="check"></span>
                                        <span class="caption">Sim</span>
                                    </label>
                                    <label class="input-control radio small-check" style="margin-right: 20px;">
                                        <input name="q6" value="n�o" type="radio" />
                                        <span class="check"></span>
                                        <span class="caption">N�o</span>
                                    </label>
                                    <div class="input-control checkbox"><span class="caption">Coment�rio</span></div>
                                    <div class="input-control text">
                                        <input type="text" />
                                    </div>
                                </div>

                                <div class="row">
                                    <h4 class="text-light" style="margin-right: 20px;"><span style="color: red;">*</span> A cobertura tecnol�gica � informada?</h4>
                                    <label class="input-control radio small-check" style="margin-right: 20px;">
                                        <input name="q7" value="sim" type="radio" />
                                        <span class="check"></span>
                                        <span class="caption">Sim</span>
                                    </label>
                                    <label class="input-control radio small-check" style="margin-right: 20px;">
                                        <input name="q7" value="n�o" type="radio" />
                                        <span class="check"></span>
                                        <span class="caption">N�o</span>
                                    </label>
                                    <div class="input-control checkbox"><span class="caption">Coment�rio</span></div>
                                    <div class="input-control text">
                                        <input type="text" />
                                    </div>
                                </div>

                                <div class="row">
                                    <h4 class="text-light" style="margin-right: 20px;"><span style="color: red;">*</span> A descri��o da tecnologia � apresentada?</h4>
                                    <label class="input-control radio small-check" style="margin-right: 20px;">
                                        <input name="q8" value="sim" type="radio" />
                                        <span class="check"></span>
                                        <span class="caption">Sim</span>
                                    </label>
                                    <label class="input-control radio small-check" style="margin-right: 20px;">
                                        <input name="q8" value="n�o" type="radio" />
                                        <span class="check"></span>
                                        <span class="caption">N�o</span>
                                    </label>
                                    <div class="input-control checkbox"><span class="caption">Coment�rio</span></div>
                                    <div class="input-control text">
                                        <input type="text" />
                                    </div>
                                </div>

                                <div class="row">
                                    <h4 class="text-light" style="margin-right: 20px;"><span style="color: red;">*</span> A cobertura geogr�fica � informada?</h4>
                                    <label class="input-control radio small-check" style="margin-right: 20px;">
                                        <input name="q9" value="sim" type="radio" />
                                        <span class="check"></span>
                                        <span class="caption">Sim</span>
                                    </label>
                                    <label class="input-control radio small-check" style="margin-right: 20px;">
                                        <input name="q9" value="n�o" type="radio" />
                                        <span class="check"></span>
                                        <span class="caption">N�o</span>
                                    </label>
                                    <div class="input-control checkbox"><span class="caption">Coment�rio</span></div>
                                    <div class="input-control text">
                                        <input type="text" />
                                    </div>
                                </div>

                                <div class="row">
                                    <h4 class="text-light" style="margin-right: 20px;"><span style="color: red;">*</span> � informada a representatividade do conjunto de dados?</h4>
                                    <label class="input-control radio small-check" style="margin-right: 20px;">
                                        <input name="q10" value="sim" type="radio" />
                                        <span class="check"></span>
                                        <span class="caption">Sim</span>
                                    </label>
                                    <label class="input-control radio small-check" style="margin-right: 20px;">
                                        <input name="q10" value="n�o" type="radio" />
                                        <span class="check"></span>
                                        <span class="caption">N�o</span>
                                    </label>
                                    <div class="input-control checkbox"><span class="caption">Coment�rio</span></div>
                                    <div class="input-control text">
                                        <input type="text" />
                                    </div>
                                </div>

                                <h3>Requisitos de M�todo e Processos</h3>

                                <div class="row">
                                    <h4 class="text-light" style="margin-right: 20px;"><span style="color: red;">*</span> Informada a abordagem utilizada?</h4>
                                    <label class="input-control radio small-check" style="margin-right: 20px;">
                                        <input name="q11" value="sim" type="radio" />
                                        <span class="check"></span>
                                        <span class="caption">Sim</span>
                                    </label>
                                    <label class="input-control radio small-check" style="margin-right: 20px;">
                                        <input name="q11" value="n�o" type="radio" />
                                        <span class="check"></span>
                                        <span class="caption">N�o</span>
                                    </label>
                                    <div class="input-control checkbox"><span class="caption">Coment�rio</span></div>
                                    <div class="input-control text">
                                        <input type="text" />
                                    </div>
                                </div>

                                <div class="row">
                                    <h4 class="text-light" style="margin-right: 20px;"><span style="color: red;">*</span> Foi aplicado crit�rio de corte? Se sim, qual foi o crit�rio utilizado?</h4>
                                    <label class="input-control radio small-check" style="margin-right: 20px;">
                                        <input name="q12" value="sim" type="radio" />
                                        <span class="check"></span>
                                        <span class="caption">Sim</span>
                                    </label>
                                    <label class="input-control radio small-check" style="margin-right: 20px;">
                                        <input name="q12" value="n�o" type="radio" />
                                        <span class="check"></span>
                                        <span class="caption">N�o</span>
                                    </label>
                                    <div class="input-control checkbox"><span class="caption">Qual?</span></div>
                                    <div class="input-control text">
                                        <input type="text" />
                                    </div>
                                </div>

                                <div class="row">
                                    <h4 class="text-light" style="margin-right: 20px;"><span style="color: red;">*</span> Houve agrega��o dos dados? Qual o n�vel de agrega��o utilizado?</h4>
                                    <label class="input-control radio small-check" style="margin-right: 20px;">
                                        <input name="q13" value="sim" type="radio" />
                                        <span class="check"></span>
                                        <span class="caption">Sim</span>
                                    </label>
                                    <label class="input-control radio small-check" style="margin-right: 20px;">
                                        <input name="q13" value="n�o" type="radio" />
                                        <span class="check"></span>
                                        <span class="caption">N�o</span>
                                    </label>
                                    <div class="input-control checkbox"><span class="caption">Qual?</span></div>
                                    <div class="input-control text">
                                        <input type="text" />
                                    </div>
                                </div>

                                <div class="row">
                                    <h4 class="text-light" style="margin-right: 20px;"><span style="color: red;">*</span> O fluxograma do sistema do produto foi apresentado, incluindo as fronteiras do conjunto de dados?</h4>
                                    <label class="input-control radio small-check" style="margin-right: 20px;">
                                        <input name="q14" value="sim" type="radio" />
                                        <span class="check"></span>
                                        <span class="caption">Sim</span>
                                    </label>
                                    <label class="input-control radio small-check" style="margin-right: 20px;">
                                        <input name="q14" value="n�o" type="radio" />
                                        <span class="check"></span>
                                        <span class="caption">N�o</span>
                                    </label>
                                    <div class="input-control checkbox"><span class="caption">Coment�rio</span></div>
                                    <div class="input-control text">
                                        <input type="text" />
                                    </div>
                                </div>

                                <div class="row">
                                    <h4 class="text-light" style="margin-right: 20px;"><span style="color: red;">*</span> As conex�es dos fluxos intermedi�rios com os processos elementares secund�rios foram apresentadas?</h4>
                                    <label class="input-control radio small-check" style="margin-right: 20px;">
                                        <input name="q15" value="sim" type="radio" />
                                        <span class="check"></span>
                                        <span class="caption">Sim</span>
                                    </label>
                                    <label class="input-control radio small-check" style="margin-right: 20px;">
                                        <input name="q15" value="n�o" type="radio" />
                                        <span class="check"></span>
                                        <span class="caption">N�o</span>
                                    </label>
                                    <div class="input-control checkbox"><span class="caption">Coment�rio</span></div>
                                    <div class="input-control text">
                                        <input type="text" />
                                    </div>
                                </div>

                                <div class="row">
                                    <h4 class="text-light" style="margin-right: 20px;"><span style="color: red;">*</span> O conjunto de dados representa um sistema multifuncional?</h4>
                                    <label class="input-control radio small-check" style="margin-right: 20px;">
                                        <input name="q16" value="sim" type="radio" />
                                        <span class="check"></span>
                                        <span class="caption">Sim</span>
                                    </label>
                                    <label class="input-control radio small-check" style="margin-right: 20px;">
                                        <input name="q16" value="n�o" type="radio" />
                                        <span class="check"></span>
                                        <span class="caption">N�o</span>
                                    </label>
                                    <div class="input-control checkbox"><span class="caption">Como lidou com a multifuncionalidade?</span></div>
                                    <div class="input-control text">
                                        <input type="text" />
                                    </div>
                                </div>

                                <div class="row">
                                    <h4 class="text-light" style="margin-right: 20px;"><span style="color: red;">*</span> Foi considerado o uso da terra (ocupa��o e transforma��o)?</h4>
                                    <label class="input-control radio small-check" style="margin-right: 20px;">
                                        <input name="q17" value="sim" type="radio" />
                                        <span class="check"></span>
                                        <span class="caption">Sim</span>
                                    </label>
                                    <label class="input-control radio small-check" style="margin-right: 20px;">
                                        <input name="q17" value="n�o" type="radio" />
                                        <span class="check"></span>
                                        <span class="caption">N�o</span>
                                    </label>
                                    <div class="input-control checkbox"><span class="caption">Qual foi o m�todo utilizado para transforma��o do uso da terra?</span></div>
                                    <div class="input-control text">
                                        <input type="text" />
                                    </div>
                                </div>

                                <div class="row">
                                    <h4 class="text-light" style="margin-right: 20px;"><span style="color: red;">*</span> Os dados foram validados de alguma forma?</h4>
                                    <label class="input-control radio small-check" style="margin-right: 20px;">
                                        <input name="q18" value="sim" type="radio" />
                                        <span class="check"></span>
                                        <span class="caption">Sim</span>
                                    </label>
                                    <label class="input-control radio small-check" style="margin-right: 20px;">
                                        <input name="q18" value="n�o" type="radio" />
                                        <span class="check"></span>
                                        <span class="caption">N�o</span>
                                    </label>
                                    <div class="input-control checkbox"><span class="caption">Qual foi o m�todo utilizado?</span></div>
                                    <div class="input-control text">
                                        <input type="text" />
                                    </div>
                                </div>

                                <div class="row">
                                    <h4 class="text-light" style="margin-right: 20px;"><span style="color: red;">*</span> Se o balan�o de massa foi realizado, quanto foi fechado nos processos elementares prim�rios?</h4>
                                    <label class="input-control radio small-check" style="margin-right: 20px;">
                                        <input name="q19" value="sim" type="radio" />
                                        <span class="check"></span>
                                        <span class="caption">Sim</span>
                                    </label>
                                    <label class="input-control radio small-check" style="margin-right: 20px;">
                                        <input name="q19" value="n�o" type="radio" />
                                        <span class="check"></span>
                                        <span class="caption">N�o</span>
                                    </label>
                                    <div class="input-control checkbox"><span class="caption">Quanto? (0 a 100%)</span></div>
                                    <div class="input-control text">
                                        <input type="text" />
                                    </div>
                                </div>

                                <div class="row">
                                    <h4 class="text-light" style="margin-right: 20px;"><span style="color: red;">*</span> Se o balan�o de �gua foi realizado, quanto foi fechado nos processos elementares prim�rios?</h4>
                                    <label class="input-control radio small-check" style="margin-right: 20px;">
                                        <input name="q20" value="sim" type="radio" />
                                        <span class="check"></span>
                                        <span class="caption">Sim</span>
                                    </label>
                                    <label class="input-control radio small-check" style="margin-right: 20px;">
                                        <input name="q20" value="n�o" type="radio" />
                                        <span class="check"></span>
                                        <span class="caption">N�o</span>
                                    </label>
                                    <div class="input-control checkbox"><span class="caption">Quanto? (0 a 100%)</span></div>
                                    <div class="input-control text">
                                        <input type="text" />
                                    </div>
                                </div>

                                <div class="row">
                                    <h4 class="text-light" style="margin-right: 20px;"><span style="color: red;">*</span> Se o balan�o de energia foi realizado, quanto foi fechado nos processos elementares prim�rios?</h4>
                                    <label class="input-control radio small-check" style="margin-right: 20px;">
                                        <input name="q21" value="sim" type="radio" />
                                        <span class="check"></span>
                                        <span class="caption">Sim</span>
                                    </label>
                                    <label class="input-control radio small-check" style="margin-right: 20px;">
                                        <input name="q21" value="n�o" type="radio" />
                                        <span class="check"></span>
                                        <span class="caption">N�o</span>
                                    </label>
                                    <div class="input-control checkbox"><span class="caption">Quanto? (0 a 100%)</span></div>
                                    <div class="input-control text">
                                        <input type="text" />
                                    </div>
                                </div>

                                <div class="row">
                                    <h4 class="text-light" style="margin-right: 20px;"><span style="color: red;">*</span> Foi adotado algum m�todo para analisar a qualidade dos dados?</h4>
                                    <label class="input-control radio small-check" style="margin-right: 20px;">
                                        <input name="q22" value="sim" type="radio" />
                                        <span class="check"></span>
                                        <span class="caption">Sim</span>
                                    </label>
                                    <label class="input-control radio small-check" style="margin-right: 20px;">
                                        <input name="q22" value="n�o" type="radio" />
                                        <span class="check"></span>
                                        <span class="caption">N�o</span>
                                    </label>
                                    <div class="input-control checkbox"><span class="caption">Qual?</span></div>
                                    <div class="input-control text">
                                        <input type="text" />
                                    </div>
                                </div>

                                <div class="row">
                                    <h4 class="text-light" style="margin-right: 20px;"><span style="color: red;">*</span> Os bens de capital foram inclu�dos?</h4>
                                    <label class="input-control radio small-check" style="margin-right: 20px;">
                                        <input name="q23" value="sim" type="radio" />
                                        <span class="check"></span>
                                        <span class="caption">Sim</span>
                                    </label>
                                    <label class="input-control radio small-check" style="margin-right: 20px;">
                                        <input name="q23" value="n�o" type="radio" />
                                        <span class="check"></span>
                                        <span class="caption">N�o</span>
                                    </label>
                                    <div class="input-control checkbox"><span class="caption">Coment�rio</span></div>
                                    <div class="input-control text">
                                        <input type="text" />
                                    </div>
                                </div>


                                <h3>Requisitos de Fluxos</h3>

                                <div class="row">
                                    <h4 class="text-light" style="margin-right: 20px;"><span style="color: red;">*</span> A identifica��o dos fluxos seguiu o padr�o definido no Guia? Em caso negativo, adequar.</h4>
                                    <label class="input-control radio small-check" style="margin-right: 20px;">
                                        <input name="q24" value="sim" type="radio" />
                                        <span class="check"></span>
                                        <span class="caption">Sim</span>
                                    </label>
                                    <label class="input-control radio small-check" style="margin-right: 20px;">
                                        <input name="q24" value="n�o" type="radio" />
                                        <span class="check"></span>
                                        <span class="caption">N�o</span>
                                    </label>
                                    <div class="input-control checkbox"><span class="caption">Coment�rio</span></div>
                                    <div class="input-control text">
                                        <input type="text" />
                                    </div>
                                </div>

                                <div class="row">
                                    <h4 class="text-light" style="margin-right: 20px;"><span style="color: red;">*</span> O fluxo de refer�ncia foi informado?</h4>
                                    <label class="input-control radio small-check" style="margin-right: 20px;">
                                        <input name="q25" value="sim" type="radio" />
                                        <span class="check"></span>
                                        <span class="caption">Sim</span>
                                    </label>
                                    <label class="input-control radio small-check" style="margin-right: 20px;">
                                        <input name="q25" value="n�o" type="radio" />
                                        <span class="check"></span>
                                        <span class="caption">N�o</span>
                                    </label>
                                    <div class="input-control checkbox"><span class="caption">Coment�rio</span></div>
                                    <div class="input-control text">
                                        <input type="text" />
                                    </div>
                                </div>

                                <div class="row">
                                    <h4 class="text-light" style="margin-right: 20px;"><span style="color: red;">*</span> As unidades est�o no Sistema Internacional (SI)?</h4>
                                    <label class="input-control radio small-check" style="margin-right: 20px;">
                                        <input name="q26" value="sim" type="radio" />
                                        <span class="check"></span>
                                        <span class="caption">Sim</span>
                                    </label>
                                    <label class="input-control radio small-check" style="margin-right: 20px;">
                                        <input name="q26" value="n�o" type="radio" />
                                        <span class="check"></span>
                                        <span class="caption">N�o</span>
                                    </label>
                                    <div class="input-control checkbox"><span class="caption">Se n�o, descrever as poss�veis rela��es com as unidades do SI.</span></div>
                                    <div class="input-control text">
                                        <input type="text" />
                                    </div>
                                </div>

                                <div class="row">
                                    <h4 class="text-light" style="margin-right: 20px;"><span style="color: red;">*</span> Cada fluxo tecnol�gico est� especificado por regi�o?</h4>
                                    <label class="input-control radio small-check" style="margin-right: 20px;">
                                        <input name="q27" value="sim" type="radio" />
                                        <span class="check"></span>
                                        <span class="caption">Sim</span>
                                    </label>
                                    <label class="input-control radio small-check" style="margin-right: 20px;">
                                        <input name="q27" value="n�o" type="radio" />
                                        <span class="check"></span>
                                        <span class="caption">N�o</span>
                                    </label>
                                    <div class="input-control checkbox"><span class="caption">Coment�rio</span></div>
                                    <div class="input-control text">
                                        <input type="text" />
                                    </div>
                                </div>

                                <div class="row">
                                    <h4 class="text-light" style="margin-right: 20px;"><span style="color: red;">*</span> S�o informados os compartimentos e subcompartimentos?</h4>
                                    <label class="input-control radio small-check" style="margin-right: 20px;">
                                        <input name="q28" value="sim" type="radio" />
                                        <span class="check"></span>
                                        <span class="caption">Sim</span>
                                    </label>
                                    <label class="input-control radio small-check" style="margin-right: 20px;">
                                        <input name="q28" value="n�o" type="radio" />
                                        <span class="check"></span>
                                        <span class="caption">N�o</span>
                                    </label>
                                    <div class="input-control checkbox"><span class="caption">Coment�rio</span></div>
                                    <div class="input-control text">
                                        <input type="text" />
                                    </div>
                                </div>

                                <div class="row">
                                    <h4 class="text-light" style="margin-right: 20px;">H� informa��o da origem e destino dos fluxos de �gua?</h4>
                                    <label class="input-control radio small-check" style="margin-right: 20px;">
                                        <input name="q29" value="sim" type="radio" />
                                        <span class="check"></span>
                                        <span class="caption">Sim</span>
                                    </label>
                                    <label class="input-control radio small-check" style="margin-right: 20px;">
                                        <input name="q29" value="n�o" type="radio" />
                                        <span class="check"></span>
                                        <span class="caption">N�o</span>
                                    </label>
                                    <div class="input-control checkbox"><span class="caption">Coment�rio</span></div>
                                    <div class="input-control text">
                                        <input type="text" />
                                    </div>
                                </div>

                                <div class="row">
                                    <h4 class="text-light" style="margin-right: 20px;">Os materiais particulados foram separados em fra��es?</h4>
                                    <label class="input-control radio small-check" style="margin-right: 20px;">
                                        <input name="q30" value="sim" type="radio" />
                                        <span class="check"></span>
                                        <span class="caption">Sim</span>
                                    </label>
                                    <label class="input-control radio small-check" style="margin-right: 20px;">
                                        <input name="q30" value="n�o" type="radio" />
                                        <span class="check"></span>
                                        <span class="caption">N�o</span>
                                    </label>
                                    <div class="input-control checkbox"><span class="caption">Coment�rio</span></div>
                                    <div class="input-control text">
                                        <input type="text" />
                                    </div>
                                </div>

                                <div class="row">
                                    <h4 class="text-light" style="margin-right: 20px;">Os compostos org�nicos vol�teis (COV) foram discriminados?</h4>
                                    <label class="input-control radio small-check" style="margin-right: 20px;">
                                        <input name="q31" value="sim" type="radio" />
                                        <span class="check"></span>
                                        <span class="caption">Sim</span>
                                    </label>
                                    <label class="input-control radio small-check" style="margin-right: 20px;">
                                        <input name="q31" value="n�o" type="radio" />
                                        <span class="check"></span>
                                        <span class="caption">N�o</span>
                                    </label>
                                    <div class="input-control checkbox"><span class="caption">Coment�rio</span></div>
                                    <div class="input-control text">
                                        <input type="text" />
                                    </div>
                                </div>

                                <div class="row">
                                    <h4 class="text-light" style="margin-right: 20px;">Os hidrocarbonetos arom�ticos polic�clicos (PAH) foram discriminados?</h4>
                                    <label class="input-control radio small-check" style="margin-right: 20px;">
                                        <input name="q32" value="sim" type="radio" />
                                        <span class="check"></span>
                                        <span class="caption">Sim</span>
                                    </label>
                                    <label class="input-control radio small-check" style="margin-right: 20px;">
                                        <input name="q32" value="n�o" type="radio" />
                                        <span class="check"></span>
                                        <span class="caption">N�o</span>
                                    </label>
                                    <div class="input-control checkbox"><span class="caption">Coment�rio</span></div>
                                    <div class="input-control text">
                                        <input type="text" />
                                    </div>
                                </div>

                                <div class="row">
                                    <h4 class="text-light" style="margin-right: 20px;">As dioxinas e furanos foram discriminados?</h4>
                                    <label class="input-control radio small-check" style="margin-right: 20px;">
                                        <input name="q33" value="sim" type="radio" />
                                        <span class="check"></span>
                                        <span class="caption">Sim</span>
                                    </label>
                                    <label class="input-control radio small-check" style="margin-right: 20px;">
                                        <input name="q33" value="n�o" type="radio" />
                                        <span class="check"></span>
                                        <span class="caption">N�o</span>
                                    </label>
                                    <div class="input-control checkbox"><span class="caption">Coment�rio</span></div>
                                    <div class="input-control text">
                                        <input type="text" />
                                    </div>
                                </div>

                                <div class="row">
                                    <h4 class="text-light" style="margin-right: 20px;"><span style="color: red;">*</span> As fontes de CO2 e CH4 foram discriminadas?</h4>
                                    <label class="input-control radio small-check" style="margin-right: 20px;">
                                        <input name="q34" value="sim" type="radio" />
                                        <span class="check"></span>
                                        <span class="caption">Sim</span>
                                    </label>
                                    <label class="input-control radio small-check" style="margin-right: 20px;">
                                        <input name="q34" value="n�o" type="radio" />
                                        <span class="check"></span>
                                        <span class="caption">N�o</span>
                                    </label>
                                    <div class="input-control checkbox"><span class="caption">Coment�rio</span></div>
                                    <div class="input-control text">
                                        <input type="text" />
                                    </div>
                                </div>

                                <div class="row">
                                    <h4 class="text-light" style="margin-right: 20px;">As emiss�es de longo prazo foram informadas?</h4>
                                    <label class="input-control radio small-check" style="margin-right: 20px;">
                                        <input name="q35" value="sim" type="radio" />
                                        <span class="check"></span>
                                        <span class="caption">Sim</span>
                                    </label>
                                    <label class="input-control radio small-check" style="margin-right: 20px;">
                                        <input name="q35" value="n�o" type="radio" />
                                        <span class="check"></span>
                                        <span class="caption">N�o</span>
                                    </label>
                                    <div class="input-control checkbox"><span class="caption">Coment�rio</span></div>
                                    <div class="input-control text">
                                        <input type="text" />
                                    </div>
                                </div>

                                <div class="row">
                                    <h4 class="text-light" style="margin-right: 20px;"><span style="color: red;">*</span> As emiss�es diretas de CO2 de MUT foram inclu�das e discriminadas?</h4>
                                    <label class="input-control radio small-check" style="margin-right: 20px;">
                                        <input name="q36" value="sim" type="radio" />
                                        <span class="check"></span>
                                        <span class="caption">Sim</span>
                                    </label>
                                    <label class="input-control radio small-check" style="margin-right: 20px;">
                                        <input name="q36" value="n�o" type="radio" />
                                        <span class="check"></span>
                                        <span class="caption">N�o</span>
                                    </label>
                                    <div class="input-control checkbox"><span class="caption">Coment�rio</span></div>
                                    <div class="input-control text">
                                        <input type="text" />
                                    </div>
                                </div>

                                <div class="row">
                                    <h4 class="text-light" style="margin-right: 20px;"><span style="color: red;">*</span> Foram inclu�dos os dados do transporte?</h4>
                                    <label class="input-control radio small-check" style="margin-right: 20px;">
                                        <input name="q37" value="sim" type="radio" />
                                        <span class="check"></span>
                                        <span class="caption">Sim</span>
                                    </label>
                                    <label class="input-control radio small-check" style="margin-right: 20px;">
                                        <input name="q37" value="n�o" type="radio" />
                                        <span class="check"></span>
                                        <span class="caption">N�o</span>
                                    </label>
                                    <div class="input-control checkbox"><span class="caption">Coment�rio</span></div>
                                    <div class="input-control text">
                                        <input type="text" />
                                    </div>
                                </div>

                                <div class="row">
                                    <h4 class="text-light" style="margin-right: 20px;"><span style="color: red;">*</span> Foram informados os dados faltantes?</h4>
                                    <label class="input-control radio small-check" style="margin-right: 20px;">
                                        <input name="q38" value="sim" type="radio" />
                                        <span class="check"></span>
                                        <span class="caption">Sim</span>
                                    </label>
                                    <label class="input-control radio small-check" style="margin-right: 20px;">
                                        <input name="q38" value="n�o" type="radio" />
                                        <span class="check"></span>
                                        <span class="caption">N�o</span>
                                    </label>
                                    <div class="input-control checkbox"><span class="caption">Coment�rio</span></div>
                                    <div class="input-control text">
                                        <input type="text" />
                                    </div>
                                </div>

                                <div class="row">
                                    <h4 class="text-light" style="margin-right: 20px;"><span style="color: red;">*</span> Foram informados os tipos de dados para cada fluxo?</h4>
                                    <label class="input-control radio small-check" style="margin-right: 20px;">
                                        <input name="q39" value="sim" type="radio" />
                                        <span class="check"></span>
                                        <span class="caption">Sim</span>
                                    </label>
                                    <label class="input-control radio small-check" style="margin-right: 20px;">
                                        <input name="q39" value="n�o" type="radio" />
                                        <span class="check"></span>
                                        <span class="caption">N�o</span>
                                    </label>
                                    <div class="input-control checkbox"><span class="caption">Coment�rio</span></div>
                                    <div class="input-control text">
                                        <input type="text" />
                                    </div>
                                </div>

                                <div class="row">
                                    <h4 class="text-light" style="margin-right: 20px;"><span style="color: red;">*</span> Foi informada a incerteza dos dados para cada fluxo?</h4>
                                    <label class="input-control radio small-check" style="margin-right: 20px;">
                                        <input name="q40" value="sim" type="radio" />
                                        <span class="check"></span>
                                        <span class="caption">Sim</span>
                                    </label>
                                    <label class="input-control radio small-check" style="margin-right: 20px;">
                                        <input name="q40" value="n�o" type="radio" />
                                        <span class="check"></span>
                                        <span class="caption">N�o</span>
                                    </label>
                                    <div class="input-control checkbox"><span class="caption">Coment�rio</span></div>
                                    <div class="input-control text">
                                        <input type="text" />
                                    </div>
                                </div>

                                <h3>Requisitos de Revis�o</h3>

                                <div class="row">
                                    <h4 class="text-light" style="margin-right: 20px;"><span style="color: red;">*</span> Caso tenha havido revis�o cr�tica de terceira parte, as informa��es necess�rias foram fornecidas?</h4>
                                    <label class="input-control radio small-check" style="margin-right: 20px;">
                                        <input name="q41" value="sim" type="radio" />
                                        <span class="check"></span>
                                        <span class="caption">Sim</span>
                                    </label>
                                    <label class="input-control radio small-check" style="margin-right: 20px;">
                                        <input name="q41" value="n�o" type="radio" />
                                        <span class="check"></span>
                                        <span class="caption">N�o</span>
                                    </label>
                                    <div class="input-control checkbox"><span class="caption">Coment�rio</span></div>
                                    <div class="input-control text">
                                        <input type="text" />
                                    </div>
                                </div>

                                <div class="row">
                                    <h4 class="text-light" style="margin-right: 20px;"><span style="color: red;">*</span> Se houve revis�o cr�tica, o relat�rio da revis�o pode ser disponibilizado para os revisores do SICV, junto com o conjunto de dados?</h4>
                                    <label class="input-control radio small-check" style="margin-right: 20px;">
                                        <input name="q42" value="sim" type="radio" />
                                        <span class="check"></span>
                                        <span class="caption">Sim</span>
                                    </label>
                                    <label class="input-control radio small-check" style="margin-right: 20px;">
                                        <input name="q42" value="n�o" type="radio" />
                                        <span class="check"></span>
                                        <span class="caption">N�o</span>
                                    </label>
                                    <div class="input-control checkbox"><span class="caption">Coment�rio</span></div>
                                    <div class="input-control text">
                                        <input type="text" />
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="input-control checkbox"><span class="caption">ILCD File: </span></div>
                                    <div class="input-control file" data-role="input">
                                        <input name="file" type="file" />
                                        <button type="button" class="button"><span class="mif-folder"></span></button>
                                    </div>
                                </div>

                                <div class="row">
                                    <input class="button primary" style="margin-right: 20px;" value="Salvar" type="submit" /><a href="/admin/ilcd" class="button warning">Cancelar</a>
                                </div>

                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
