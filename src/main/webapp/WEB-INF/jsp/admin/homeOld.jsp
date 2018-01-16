<%-- 
    Document   : home
    Created on : 11/05/2017, 09:48:46
    Author     : Deivdy.Silva
--%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page import="br.com.ibict.acv.sicv.helper.URLHelper"%>
<%@page import="br.com.ibict.acv.sicv.model.User"%>
<%@page import="resources.Strings"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        
        <jsp:include page="/WEB-INF/jsp/partials/styles.jsp" />
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
    </head>
    <body>
        <jsp:include page="/WEB-INF/jsp/partials/header.jsp" />
        
        <div class="page-content">
            <div class="flex-grid no-responsive-future">
                <div class="row">
                    <jsp:include page="/WEB-INF/jsp/partials/nav.jsp" />
                    <div class="cell auto-size padding20 bg-white" id="cell-content">
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
        <jsp:include page="/WEB-INF/jsp/partials/scriptsLibs.jsp" />
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <script type="text/javascript">

            $(document).ready(function () {
                $.getJSON("<%=Strings.BASE%>/admin/notification.json", function (data) {
                    if (data.data.length > 0)
                        metroDialog.create({
                            title: "Notificação",
                            content: "Solicitação para homologação.",
                            actions: [
                                {
                                    title: "Ver",
                                    onclick: function (el) {
                                        //$(el).data('dialog').close();
                                        window.location = "<%=Strings.BASE%>/admin/homologacao/"+data.data[0].id;
                                    }
                                },
                                {
                                    title: "Fechar",
                                    cls: "js-dialog-close"
                                }
                            ],
                            options: {// dialog options
                            }
                        });

                });
            });

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
    </body>
</html>
