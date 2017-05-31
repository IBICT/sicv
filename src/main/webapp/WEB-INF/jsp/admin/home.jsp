<%-- 
    Document   : home
    Created on : 11/05/2017, 09:48:46
    Author     : Deivdy.Silva
--%>
<%@page import="br.com.ibict.acv.sicv.helper.URLHelper"%>
<%@page import="br.com.ibict.acv.sicv.model.User"%>
<%@page import="resources.Strings"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    User user = (User) request.getSession().getAttribute("user");
    String name = user.getFirstName();
%>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
        <meta name="description" content="Tela de Login" />
        <meta name="keywords" content="HTML, CSS, JS, JavaScript, framework, metro, front-end, frontend, web development" />
        <meta name="author" content="Deivdy William Silva" />

        <title>SICV - ACV | Banco Nacional de Inventários dos inventários brasileiros do Ciclo de Vida (ICVs)</title>

        <link rel="stylesheet" href="<%=Strings.BASE%>/assets/metro-ui3.0.17/css/metro.css" />
        <link rel="stylesheet" href="<%=Strings.BASE%>/assets/metro-ui3.0.17/css/metro-icons.css" />
        <link rel="stylesheet" href="<%=Strings.BASE%>/assets/metro-ui3.0.17/css/metro-responsive.css" />

        <script src="<%=Strings.BASE%>/assets/metro-ui3.0.17/js/jquery-2.1.3.min.js"></script>
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
        </style>

        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <script type="text/javascript">

            // Load the Visualization API and the corechart package.
            google.charts.load('current', {'packages': ['corechart']});

            // Set a callback to run when the Google Visualization API is loaded.
            google.charts.setOnLoadCallback(drawChart);

            // Callback that creates and populates a data table,
            // instantiates the pie chart, passes in the data and
            // draws it.
            function drawChart() {

                // Create the data table.
                var data = new google.visualization.DataTable();
                data.addColumn('string', 'Topping');
                data.addColumn('number', 'Slices');
                data.addRows([
                    ['Aprovados', 3],
                    ['Reprovados', 1],
                    ['Em Homologação', 1],
                    ['Aguardando Homologação', 1]
                ]);

                // Set chart options
                var options = {'title': 'Ilcd Status',
                    'width': 400,
                    'height': 300};

                // Instantiate and draw our chart, passing in some options.
                var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
                chart.draw(data, options);
            }

            google.charts.setOnLoadCallback(drawChart2);
            function drawChart2() {
                var data = google.visualization.arrayToDataTable([
                    ['Mes', 'Acessos'],
                    ['Janeiro', 7],
                    ['Fevereiro', 22],
                    ['Março', 58],
                    ['Abril', 120],
                ]);

                var options = {
                    title: 'Nivel de Acessos',
                    hAxis: {title: 'Mes', titleTextStyle: {color: '#333'}},
                    vAxis: {minValue: 0}
                };

                var chart = new google.visualization.AreaChart(document.getElementById('chart_div2'));
                chart.draw(data, options);
            }

            google.charts.load('current', {'packages': ['geochart']});
            google.charts.setOnLoadCallback(drawRegionsMap);

            function drawRegionsMap() {

                var data = google.visualization.arrayToDataTable([
                    ['Country', 'Acessos'],
                    ['Germany', 3],
                    ['United States', 1],
                    ['Brazil', 205],
                    ['Canada', 0],
                    ['France', 0],
                    ['RU', 0]
                ]);

                var options = {'title': 'Acessos por região',
                    'width': 400,
                    'height': 300};

                var chart = new google.visualization.GeoChart(document.getElementById('regions_div'));

                chart.draw(data, options);
            }
        </script>
    </head>
    <body class="bg-steel">
        <div class="app-bar fixed-top darcula" data-role="appbar">
            <a class="app-bar-element branding"><span class="mif-stack"></span> Sicv</a>
            <span class="app-bar-divider"></span>
            <ul class="app-bar-menu">
                <li><a href="">Dashboard</a></li>
                <li><a href="<%=Strings.BASE%>/admin/users">Usuarios</a></li>
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
                        <li><a href="/sicv/ilcd/new">Novo</a></li>
                        <li><a href="/sicv/ilcd">Listar Todos</a></li>
                        <li class="divider"></li>
                    </ul>
                </li>
                <li><a href="">QualiData</a></li>
                <li><a href="">Messagens</a></li>
                <li>
                    <a href="" class="dropdown-toggle">Ajuda</a>
                    <ul class="d-menu" data-role="dropdown">
                        <li><a href="">Documentação</a></li>
                        <li><a href="">Reportar bug</a></li>
                        <li class="divider"></li>
                        <li><a href="">Sobre</a></li>
                    </ul>
                </li>
            </ul>
            <div class="app-bar-element place-right">
                <span class="dropdown-toggle"><span class="mif-user"></span><%=name%></span>
                <div class="app-bar-drop-container padding10 place-right no-margin-top block-shadow fg-dark" data-role="dropdown" data-no-close="true" style="width: 220px">
                    <h2 class="text-light">Definições rápidas</h2>
                    <ul class="unstyled-list fg-dark">
                        <li><a href="" class="fg-white1 fg-hover-yellow">Perfil</a></li>
                        <li><a href="" class="fg-white2 fg-hover-yellow">Configurações</a></li>
                        <li><a href="" class="fg-white2 fg-hover-yellow">Segurança</a></li>
                        <li><a href="" class="fg-white3 fg-hover-yellow">Saída</a></li>
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
                                    <span class="title">USUÁRIO</span>
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
                        <p>${pageContext.request.contextPath}</p>
                        <c:set var="scheme" value="${pageContext.request.scheme}"/>
                        <c:set var="serverPort" value="${pageContext.request.serverPort}"/>
                        <c:set var="port" value=":${serverPort}"/>
                        <p>${scheme}://${pageContext.request.serverName}${port}</p>
                        <div class="row cells2">
                            <div class="cell">
                                <div id="chart_div"></div>
                            </div>
                            <div class="cell offset4">
                                <div id="regions_div"></div>
                            </div>
                        </div>
                        <div class="row">
                            <div id="chart_div2" style="width: 100%; height: 500px;"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
