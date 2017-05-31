<%@page import="resources.Strings"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <meta name="description" content="Metro, a sleek, intuitive, and powerful framework for faster and easier web development for Windows Metro Style.">
        <meta name="keywords" content="HTML, CSS, JS, JavaScript, framework, metro, front-end, frontend, web development">
        <meta name="author" content="Sergey Pimenov and Metro UI CSS contributors">

        <title>SICV - ACV | Banco Nacional de Inventários dos inventários brasileiros do Ciclo de Vida (ICVs)</title>
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css" />
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
        
        <script>

            $(document).ready(function () {
                $('#list').DataTable({
                    "ajax": "<%=Strings.BASE%>/ilcds.json",
                    "columns": [
                        {"data": "id"},
                        {"data": "name"},
                        {"data": "location"},
                        {"data": "clasification"},
                        {"data": function (data, type, row, meta) {
                                var d = new Date(data.yearToReference);
                                var y = d.getFullYear();
                                return y;
                            }
                        },
                        {"data": function (data, type, row, meta) {
                                var d = new Date(data.yearToValidate);
                                var y = d.getFullYear();
                                return y;
                            }
                        },
                        {"data": function (data, type, row, meta) {
                                return '<a href="<%=Strings.BASE%>/ilcd/' + data.pathFile + '" class="button success cycle-button">Download</a>';
                            }
                        }
                    ]
                });
            });

            $(function () {
                $('.sidebar').on('click', 'li', function () {
                    if (!$(this).hasClass('active')) {
                        $('.sidebar li').removeClass('active');
                        $(this).addClass('active');
                    }
                })
            })
        </script>
    </head>
    <body class="bg-steel">
        <table id="list" class="dataTable border bordered" data-auto-width="false">
            <thead>
                <tr>
                    <td class="sortable-column">ID</td>
                    <td class="sortable-column">Nome</td>
                    <td class="sortable-column">Local</td>
                    <td class="sortable-column">Classificação</td>
                    <td class="sortable-column">Ano de referência</td>
                    <td class="sortable-column">Válido até</td>
                    <td class="sortable-column"></td>
                </tr>
            </thead>
        </table>
    </body>
</html>