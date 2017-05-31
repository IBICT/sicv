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

        <link rel='shortcut icon' type='image/x-icon' href='../favicon.ico' />

        <title>SICV - ACV | Banco Nacional de Invent�rios dos invent�rios brasileiros do Ciclo de Vida (ICVs)</title>

        <link href="<%=Strings.BASE%>/assets/metro-ui3.0.17/css/metro.css" rel="stylesheet">
        <link href="<%=Strings.BASE%>/assets/metro-ui3.0.17/css/metro-icons.css" rel="stylesheet">
        <link href="<%=Strings.BASE%>/assets/metro-ui3.0.17/css/metro-responsive.css" rel="stylesheet">

        <script src="<%=Strings.BASE%>/assets/metro-ui3.0.17/js/jquery-2.1.3.min.js"></script>
        <script src="<%=Strings.BASE%>/assets/metro-ui3.0.17/js/jquery.dataTables.min.js"></script>

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

        <script>

            var ilcd = "${ilcd}";

            $(document).ready(function () {
                var table = $('#list').DataTable({
                    "ajax": "<%=Strings.BASE%>/admin/ilcd/revisor-qualidade.json",
                    "columns": [
                        {"data": "firstName"},
                        {"data": "lastName"},
                        {"data": "jobPositon"},
                        {"data": "gender"},
                        {"data": "country"},
                        {"data": "email"},
                        {"data": "telefone"}
                    ]
                });

                $('#list tbody').on('click', 'tr', function () {
                    var data = table.row(this).data();
                    solicitacao(data);

                });

            });

            function solicitacao(data) {
                var ask = window.confirm("Deseja enviar uma solicita��o de homologa��o para " + data.firstName + " " + data.lastName + " ?");
                if (ask) {
                    window.alert("Solicita��o enviada com sucesso.");
                    document.location.href = "<%=Strings.BASE%>/admin/ilcd";
                }
            }

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
        <div class="app-bar fixed-top darcula" data-role="appbar">
            <a class="app-bar-element branding"><span class="mif-stack"></span> Sicv</a>
            <span class="app-bar-divider"></span>
            <ul class="app-bar-menu">
                <li><a href="/sicv/home">Dashboard</a></li>
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
                        <h1 class="text-light">Selecione um revisor de qualidade</h1>
                        <hr class="thin bg-grayLighter"  />
                        <hr class="thin bg-grayLighter" />
                        <table id="list" class="dataTable border bordered hovered" data-auto-width="false">
                            <thead>
                                <tr>
                                    <td class="sortable-column">Nome</td>
                                    <td class="sortable-column">Sobre Nome</td>
                                    <td class="sortable-column">Profiss�o</td>
                                    <td class="sortable-column">Sexo</td>
                                    <td class="sortable-column">Pa�s</td>
                                    <td class="sortable-column">E-mail</td>
                                    <td class="sortable-column">Telefone</td>
                                </tr>
                            </thead>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
</html>