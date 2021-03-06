<%@page import="br.com.ibict.acv.sicv.model.User"%>
<%@page import="resources.Strings"%>
<%
    User user = (User) request.getSession().getAttribute("user");
    String name = user.getFirstName();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <meta name="description" content="Metro, a sleek, intuitive, and powerful framework for faster and easier web development for Windows Metro Style.">
        <meta name="keywords" content="HTML, CSS, JS, JavaScript, framework, metro, front-end, frontend, web development">
        <meta name="author" content="Sergey Pimenov and Metro UI CSS contributors">

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

        <link href="<%=Strings.BASE%>/assets/metro-ui3.0.17/css/metro.css" rel="stylesheet">
        <link href="<%=Strings.BASE%>/assets/metro-ui3.0.17/css/metro-icons.css" rel="stylesheet">
        <link href="<%=Strings.BASE%>/assets/metro-ui3.0.17/css/metro-responsive.css" rel="stylesheet">
        <link href="<%=Strings.BASE%>/assets/metro-ui3.0.17/css/metro-schemes.css" rel="stylesheet">
        <link href="<%=Strings.BASE%>/assets/metro-ui3.0.17/css/metro-colors.css" rel="stylesheet">

        <script src="<%=Strings.BASE%>/assets/metro-ui3.0.17/js/jquery-2.1.3.min.js"></script>
        <script src="<%=Strings.BASE%>/assets/metro-ui3.0.17/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <script src="<%=Strings.BASE%>/assets/metro-ui3.0.17/js/metro.js"></script>

        <style>
            html, body {
                height: 100%;
            }
            body {
            }
            .page-content {
                padding-top: 3.125rem;
                min-height: 100%;
                height: 100%;
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

            #chart_donut {
                margin-top: 100px;
                margin-bottom: 100px;
                margin-left: 100px;
                float: left;
            }

            #chart_div {
                margin: 0;
                float: left;
            }

            .aprova {
                width: 220px;
                float: left;
                margin-top: 80px;
                margin-left: 20px;
            }
            .aprova .button {
                width: 200px;
            }

        </style>

        <script>
            var obj = ${json};
            var positivo = 0;
            var negativo = 0;
            var porcentage = 0;
            $(document).ready(function () {

                $("#btn_baixar").attr("href", "<%=Strings.BASE%>/admin/ilcd/files/" + obj.id);
                $("#link_aprovar").attr("href", "<%=Strings.BASE%>/admin/homologacao/" + obj.id + "/aprovarqualidata");
                $("#link_reprovar").attr("href", "<%=Strings.BASE%>/admin/homologacao/" + obj.id + "/reprovarqualidata");

                $("#ilcdID").html(obj.id);
                $("#ilcdName").html(obj.name);
                $("#ilcdType").html(obj.type);
                $("#ilcdLocation").html(obj.location);
                $("#ilcdClassification").html(obj.clasification);
                var questions = JSON.parse(obj.json1);
                console.log(questions);
                console.log(positivo);
                $.each(questions, function (key, value) {
                    if (value == "true") {
                        positivo++;
                    }
                    $("#" + key).html(value == "true" ? "Sim":"N&atilde;o");
                });
                console.log(positivo);
                porcentage = Math.round((positivo / 42) * 100);
                $("#chart_donut").attr("data-value", porcentage);
                //questions.each(function( index, element ) {
                //$("#container").append(index);
                //console.log(index);
                //});
            });


            google.charts.load('current', {'packages': ['corechart']});
            google.charts.setOnLoadCallback(drawChart);
            function drawChart() {
                var data = new google.visualization.DataTable();
                data.addColumn('string', 'Topping');
                data.addColumn('number', 'Slices');
                data.addRows([
                    ['Sim', positivo],
                    ['N�o', 42 - positivo],
                ]);
                var options = {'title': 'Parecer de qualidade',
                    'width': 400,
                    'height': 300
                };
                var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
                chart.draw(data, options);
            }
        </script>
    </head>
    <body>
        <div class="app-bar fixed-top darcula" data-role="appbar">
            <a class="app-bar-element branding"><span class="mif-stack"></span> Sicv</a>
            <span class="app-bar-divider"></span>
            <ul class="app-bar-menu">
                <li><a href="<%=Strings.BASE%>/admin/">Dashboard</a></li>
                <li><a href="<%=Strings.BASE%>/admin/users/">Usuarios</a></li>
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
                        <li><a href="<%=Strings.BASE%>/admin/ilcd/">Listar Todos</a></li>
                        <li class="divider"></li>
                    </ul>
                </li>
                <li><a href="#">QualiData</a></li>
                <li><a href="#">Messagens</a></li>
                <li>
                    <a href="" class="dropdown-toggle">Ajuda</a>
                    <ul class="d-menu" data-role="dropdown">
                        <li><a href="#">Documenta��o</a></li>
                        <li><a href="#">Reportar bug</a></li>
                        <li class="divider"></li>
                        <li><a href="#">Sobre</a></li>
                    </ul>
                </li>
            </ul>
            <div class="app-bar-element place-right">
                <span class="dropdown-toggle"><span class="mif-user"></span><%=name%></span>
                <div class="app-bar-drop-container padding10 place-right no-margin-top block-shadow fg-dark" data-role="dropdown" data-no-close="true" style="width: 220px">
                    <h2 class="text-light">Defini��es r�pidas</h2>
                    <ul class="unstyled-list fg-dark">
                        <li><a href="<%=Strings.BASE%>/admin/perfil" class="fg-white1 fg-hover-yellow">Perfil</a></li>
                        <li><a href="<%=Strings.BASE%>/admin/config" class="fg-white2 fg-hover-yellow">Configura��es</a></li>
                        <li><a href="<%=Strings.BASE%>/admin/security" class="fg-white2 fg-hover-yellow">Seguran�a</a></li>
                        <li><a href="<%=Strings.BASE%>/logout" class="fg-white3 fg-hover-yellow">Sa�da</a></li>
                    </ul>
                </div>
            </div>
        </div>

        <div id="container" class="page-content">

            <div class="grid">
                <div class="row">
                    <div id="chart_donut" data-role="donut" data-animate="10" id="donut2"></div>
                    <div id="chart_div"></div>
                    <div class="aprova">
                        <button id="btn_aprovar" class="button warning" onclick="metroDialog.toggle('#dialog')">Aprovar</button>
                        <button id="btn_reprovar" class="button danger" onclick="metroDialog.toggle('#dialog2')">Reprovar</button>
                        <a id="btn_baixar" class="button success">Baixar PDF</a>
                    </div>
                </div>
            </div>

            <table class="table">
                <thead>
                    <tr>
                        <th class="sortable-column">ID</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td id="ilcdID"></td>
                    </tr>
                </tbody>
                <thead>
                    <tr>
                        <th class="sortable-column">Nome</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td id="ilcdName"></td>
                    </tr>
                </tbody>
                <thead>
                    <tr>
                        <th class="sortable-column">Tipe</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td id="ilcdType"></td>
                    </tr>
                </tbody>
                <thead>
                    <tr>
                        <th class="sortable-column">Local</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td id="ilcdLocation"></td>
                    </tr>
                </tbody>
                <thead>
                    <tr>
                        <th class="sortable-column">Classifica��o</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td id="ilcdClassification"></td>
                    </tr>
                </tbody>
                <thead>
                    <tr>
                        <th class="sortable-column">Qualidata</th>
                    </tr>
                </thead>
            </table>
            <div class="row" style="margin-left:10px;">
                <h4 class="text-light" style="margin-right: 20px;">O conjunto de dados est� em ingl�s?</h4>
                <h3 id="q1"></h3>
                <span class="caption">Coment�rio</span>
                <br /><div class="input-control textarea"><textarea disabled=""></textarea></div>
            </div>

            <div class="row" style="margin-left:10px;">
                <h4 class="text-light" style="margin-right: 20px;">A identifica��o do conjunto de dados segue o padr�o Nome do produto_tecnologia_outra especifica��o?</h4>
                <h3 id="q2"></h3>
                <span class="caption">Coment�rio</span>
                <br /><div class="input-control textarea"><textarea disabled=""></textarea></div>
            </div>

            <div class="row" style="margin-left:10px;">
                <h4 class="text-light" style="margin-right: 20px;">As cita��es e refer�ncias est�o completas?</h4>
                <h3 id="q3"></h3>
                <span class="caption">Coment�rio</span>
                <br /><div class="input-control textarea"><textarea disabled=""></textarea></div>
            </div>

            <div class="row" style="margin-left:10px;">
                <h4 class="text-light" style="margin-right: 20px;">Os campos de administra��o s�o informados?</h4>
                <h3 id="q4"></h3>
                <span class="caption">Coment�rio</span>
                <br /><div class="input-control textarea"><textarea disabled=""></textarea></div>
            </div>

            <div class="row" style="margin-left:10px;">
                <h4 class="text-light" style="margin-right: 20px;">� informada a cobertura temporal do conjunto de dados?</h4>
                <h3 id="q5"></h3>
                <span class="caption">Coment�rio</span>
                <br /><div class="input-control textarea"><textarea disabled=""></textarea></div>
            </div>

            <div class="row" style="margin-left:10px;">
                <h4 class="text-light" style="margin-right: 20px;">� informado o per�odo de validade do conjunto de dados?</h4>
                <h3 id="q6"></h3>
                <span class="caption">Coment�rio</span>
                <br /><div class="input-control textarea"><textarea disabled=""></textarea></div>
            </div>

            <div class="row" style="margin-left:10px;">
                <h4 class="text-light" style="margin-right: 20px;">A cobertura tecnol�gica � informada?</h4>
                <h3 id="q7"></h3>
                <span class="caption">Coment�rio</span>
                <br /><div class="input-control textarea"><textarea disabled=""></textarea></div>
            </div>

            <div class="row" style="margin-left:10px;">
                <h4 class="text-light" style="margin-right: 20px;">A descri��o da tecnologia � apresentada?</h4>
                <h3 id="q8"></h3>
                <span class="caption">Coment�rio</span>
                <br /><div class="input-control textarea"><textarea disabled=""></textarea></div>
            </div>

            <div class="row" style="margin-left:10px;">
                <h4 class="text-light" style="margin-right: 20px;">A cobertura geogr�fica � informada?</h4>
                <h3 id="q9"></h3>
                <span class="caption">Coment�rio</span>
                <br /><div class="input-control textarea"><textarea disabled=""></textarea></div>
            </div>

            <div class="row" style="margin-left:10px;">
                <h4 class="text-light" style="margin-right: 20px;">� informada a representatividade do conjunto de dados?</h4>
                <h3 id="q10"></h3>
                <span class="caption">Coment�rio</span>
                <br /><div class="input-control textarea"><textarea disabled=""></textarea></div>
            </div>

            <h3>Requisitos de M�todo e Processos</h3>

            <div class="row" style="margin-left:10px;">
                <h4 class="text-light" style="margin-right: 20px;">Informada a abordagem utilizada?</h4>
                <h3 id="q11"></h3>
                <span class="caption">Coment�rio</span>
                <br /><div class="input-control textarea"><textarea disabled=""></textarea></div>
            </div>

            <div class="row" style="margin-left:10px;">
                <h4 class="text-light" style="margin-right: 20px;">Foi aplicado crit�rio de corte? Se sim, qual foi o crit�rio utilizado?</h4>
                <h3 id="q12"></h3>
                <span class="caption">Qual?</span>
                <br /><div class="input-control textarea"><textarea disabled=""></textarea></div>
            </div>

            <div class="row" style="margin-left:10px;">
                <h4 class="text-light" style="margin-right: 20px;">Houve agrega��o dos dados? Qual o n�vel de agrega��o utilizado?</h4>
                <h3 id="q13"></h3>
                <span class="caption">Qual?</span>
                <br /><div class="input-control textarea"><textarea disabled=""></textarea></div>
            </div>

            <div class="row" style="margin-left:10px;">
                <h4 class="text-light" style="margin-right: 20px;">O fluxograma do sistema do produto foi apresentado, incluindo as fronteiras do conjunto de dados?</h4>
                <h3 id="q14"></h3>
                <span class="caption">Coment�rio</span>
                <br /><div class="input-control textarea"><textarea disabled=""></textarea></div>
            </div>

            <div class="row" style="margin-left:10px;">
                <h4 class="text-light" style="margin-right: 20px;">As conex�es dos fluxos intermedi�rios com os processos elementares secund�rios foram apresentadas?</h4>
                <h3 id="q15"></h3>
                <span class="caption">Coment�rio</span>
                <br /><div class="input-control textarea"><textarea disabled=""></textarea></div>
            </div>

            <div class="row" style="margin-left:10px;">
                <h4 class="text-light" style="margin-right: 20px;">O conjunto de dados representa um sistema multifuncional?</h4>
                <h3 id="q16"></h3>
                <span class="caption">Como lidou com a multifuncionalidade?</span>
                <br /><div class="input-control textarea"><textarea disabled=""></textarea></div>
            </div>

            <div class="row" style="margin-left:10px;">
                <h4 class="text-light" style="margin-right: 20px;">Foi considerado o uso da terra (ocupa��o e transforma��o)?</h4>
                <h3 id="q17"></h3>
                <span class="caption">Qual foi o m�todo utilizado para transforma��o do uso da terra?</span>
                <br /><div class="input-control textarea"><textarea disabled=""></textarea></div>
            </div>

            <div class="row" style="margin-left:10px;">
                <h4 class="text-light" style="margin-right: 20px;">Os dados foram validados de alguma forma?</h4>
                <h3 id="q18"></h3>
                <span class="caption">Qual foi o m�todo utilizado?</span>
                <br /><div class="input-control textarea"><textarea disabled=""></textarea></div>
            </div>

            <div class="row" style="margin-left:10px;">
                <h4 class="text-light" style="margin-right: 20px;">Se o balan�o de massa foi realizado, quanto foi fechado nos processos elementares prim�rios?</h4>
                <h3 id="q19"></h3>
                <span class="caption">Quanto? (0 a 100%)</span>
                <br /><div class="input-control textarea"><textarea disabled=""></textarea></div>
            </div>

            <div class="row" style="margin-left:10px;">
                <h4 class="text-light" style="margin-right: 20px;">Se o balan�o de �gua foi realizado, quanto foi fechado nos processos elementares prim�rios?</h4>
                <h3 id="q20"></h3>
                <span class="caption">Quanto? (0 a 100%)</span>
                <br /><div class="input-control textarea"><textarea disabled=""></textarea></div>
            </div>

            <div class="row" style="margin-left:10px;">
                <h4 class="text-light" style="margin-right: 20px;">Se o balan�o de energia foi realizado, quanto foi fechado nos processos elementares prim�rios?</h4>
                <h3 id="q21"></h3>
                <span class="caption">Quanto? (0 a 100%)</span>
                <br /><div class="input-control textarea"><textarea disabled=""></textarea></div>
            </div>

            <div class="row" style="margin-left:10px;">
                <h4 class="text-light" style="margin-right: 20px;">Foi adotado algum m�todo para analisar a qualidade dos dados?</h4>
                <h3 id="q22"></h3>
                <span class="caption">Qual?</span>
                <br /><div class="input-control textarea"><textarea disabled=""></textarea></div>
            </div>

            <div class="row" style="margin-left:10px;">
                <h4 class="text-light" style="margin-right: 20px;">Os bens de capital foram inclu�dos?</h4>
                <h3 id="q23"></h3>
                <span class="caption">Coment�rio</span>
                <br /><div class="input-control textarea"><textarea disabled=""></textarea></div>
            </div>


            <h3>Requisitos de Fluxos</h3>

            <div class="row" style="margin-left:10px;">
                <h4 class="text-light" style="margin-right: 20px;">A identifica��o dos fluxos seguiu o padr�o definido no Guia? Em caso negativo, adequar.</h4>
                <h3 id="q24"></h3>
                <span class="caption">Coment�rio</span>
                <br /><div class="input-control textarea"><textarea disabled=""></textarea></div>
            </div>

            <div class="row" style="margin-left:10px;">
                <h4 class="text-light" style="margin-right: 20px;">O fluxo de refer�ncia foi informado?</h4>
                <h3 id="q25"></h3>
                <span class="caption">Coment�rio</span>
                <br /><div class="input-control textarea"><textarea disabled=""></textarea></div>
            </div>

            <div class="row" style="margin-left:10px;">
                <h4 class="text-light" style="margin-right: 20px;">As unidades est�o no Sistema Internacional (SI)?</h4>
                <h3 id="q26"></h3>
                <span class="caption">Se n�o, descrever as poss�veis rela��es com as unidades do SI.</span>
                <br /><div class="input-control textarea"><textarea disabled=""></textarea></div>
            </div>

            <div class="row" style="margin-left:10px;">
                <h4 class="text-light" style="margin-right: 20px;">Cada fluxo tecnol�gico est� especificado por regi�o?</h4>
                <h3 id="q27"></h3>
                <span class="caption">Coment�rio</span>
                <br /><div class="input-control textarea"><textarea disabled=""></textarea></div>
            </div>

            <div class="row" style="margin-left:10px;">
                <h4 class="text-light" style="margin-right: 20px;">S�o informados os compartimentos e subcompartimentos?</h4>
                <h3 id="q28"></h3>
                <span class="caption">Coment�rio</span>
                <br /><div class="input-control textarea"><textarea disabled=""></textarea></div>
            </div>

            <div class="row" style="margin-left:10px;">
                <h4 class="text-light" style="margin-right: 20px;">H� informa��o da origem e destino dos fluxos de �gua?</h4>
                <h3 id="q29"></h3>
                <span class="caption">Coment�rio</span>
                <br /><div class="input-control textarea"><textarea disabled=""></textarea></div>
            </div>

            <div class="row" style="margin-left:10px;">
                <h4 class="text-light" style="margin-right: 20px;">Os materiais particulados foram separados em fra��es?</h4>
                <h3 id="q30"></h3>
                <span class="caption">Coment�rio</span>
                <br /><div class="input-control textarea"><textarea disabled=""></textarea></div>
            </div>

            <div class="row" style="margin-left:10px;">
                <h4 class="text-light" style="margin-right: 20px;">Os compostos org�nicos vol�teis (COV) foram discriminados?</h4>
                <h3 id="q31"></h3>
                <span class="caption">Coment�rio</span>
                <br /><div class="input-control textarea"><textarea disabled=""></textarea></div>
            </div>

            <div class="row" style="margin-left:10px;">
                <h4 class="text-light" style="margin-right: 20px;">Os hidrocarbonetos arom�ticos polic�clicos (PAH) foram discriminados?</h4>
                <h3 id="q32"></h3>
                <span class="caption">Coment�rio</span>
                <br /><div class="input-control textarea"><textarea disabled=""></textarea></div>
            </div>

            <div class="row" style="margin-left:10px;">
                <h4 class="text-light" style="margin-right: 20px;">As dioxinas e furanos foram discriminados?</h4>
                <h3 id="q33"></h3>
                <span class="caption">Coment�rio</span>
                <br /><div class="input-control textarea"><textarea disabled=""></textarea></div>
            </div>

            <div class="row" style="margin-left:10px;">
                <h4 class="text-light" style="margin-right: 20px;">As fontes de CO2 e CH4 foram discriminadas?</h4>
                <h3 id="q34"></h3>
                <span class="caption">Coment�rio</span>
                <br /><div class="input-control textarea"><textarea disabled=""></textarea></div>
            </div>

            <div class="row" style="margin-left:10px;">
                <h4 class="text-light" style="margin-right: 20px;">As emiss�es de longo prazo foram informadas?</h4>
                <h3 id="q35"></h3>
                <span class="caption">Coment�rio</span>
                <br /><div class="input-control textarea"><textarea disabled=""></textarea></div>
            </div>

            <div class="row" style="margin-left:10px;">
                <h4 class="text-light" style="margin-right: 20px;">As emiss�es diretas de CO2 de MUT foram inclu�das e discriminadas?</h4>
                <h3 id="q36"></h3>
                <span class="caption">Coment�rio</span>
                <br /><div class="input-control textarea"><textarea disabled=""></textarea></div>
            </div>

            <div class="row" style="margin-left:10px;">
                <h4 class="text-light" style="margin-right: 20px;">Foram inclu�dos os dados do transporte?</h4>
                <h3 id="q37"></h3>
                <span class="caption">Coment�rio</span>
                <br /><div class="input-control textarea"><textarea disabled=""></textarea></div>
            </div>

            <div class="row" style="margin-left:10px;">
                <h4 class="text-light" style="margin-right: 20px;">Foram informados os dados faltantes?</h4>
                <h3 id="q38"></h3>
                <span class="caption">Coment�rio</span>
                <br /><div class="input-control textarea"><textarea disabled=""></textarea></div>
            </div>

            <div class="row" style="margin-left:10px;">
                <h4 class="text-light" style="margin-right: 20px;">Foram informados os tipos de dados para cada fluxo?</h4>
                <h3 id="q39"></h3>
                <span class="caption">Coment�rio</span>
                <br /><div class="input-control textarea"><textarea disabled=""></textarea></div>
            </div>

            <div class="row" style="margin-left:10px;">
                <h4 class="text-light" style="margin-right: 20px;">Foi informada a incerteza dos dados para cada fluxo?</h4>
                <h3 id="q40"></h3>
                <span class="caption">Coment�rio</span>
                <br /><div class="input-control textarea"><textarea disabled=""></textarea></div>
            </div>

            <h3>Requisitos de Revis�o</h3>

            <div class="row" style="margin-left:10px;">
                <h4 class="text-light" style="margin-right: 20px;">Caso tenha havido revis�o cr�tica de terceira parte, as informa��es necess�rias foram fornecidas?</h4>
                <h3 id="q41"></h3>
                <span class="caption">Coment�rio</span>
                <br /><div class="input-control textarea"><textarea disabled=""></textarea></div>
            </div>

            <div class="row" style="margin-left:10px;">
                <h4 class="text-light" style="margin-right: 20px;">Se houve revis�o cr�tica, o relat�rio da revis�o pode ser disponibilizado para os revisores do SICV, junto com o conjunto de dados?</h4>
                <h3 id="q42"></h3>
                <span class="caption">Coment�rio</span>
                <br /><div class="input-control textarea"><textarea disabled=""></textarea></div>
            </div>
        </div>
        <div data-role="dialog" id="dialog" class="padding20" data-close-button="true" data-windows-style="true" data-overlay="true" data-overlay-color="op-dark" data-overlay-click-close="true">
            <div class="container">
                <h1>Aprovar</h1>
                <p>
                    Voc� tem certeza que deseja aprovar a revis�o de qualidade ?
                </p>
                <p>
                    <a id="link_aprovar" style="margin-right: 10px;" class="button primary">SIM</a><button onclick="metroDialog.close('#dialog')" class="button danger">N�O</button>
                </p>
            </div>
        </div>
        <div data-role="dialog" id="dialog2" class="padding20" data-close-button="true" data-windows-style="true" data-overlay="true" data-overlay-color="op-dark" data-overlay-click-close="true">
            <div class="container">
                <h1>Reprovar</h1>
                <p>
                    Voc� tem certeza que deseja reprovar a revis�o de qualidade ?
                </p>
                <p>
                    <a id="link_reprovar" style="margin-right: 10px;" class="button primary">SIM</a><button onclick="metroDialog.close('#dialog2')" class="button danger">N�O</button>
                </p>
            </div>
        </div>
    </body>
</html>