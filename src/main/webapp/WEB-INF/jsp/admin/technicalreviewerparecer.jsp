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

        <title>SICV - ACV | Banco Nacional de Inventários dos inventários brasileiros do Ciclo de Vida (ICVs)</title>

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
                        <li><a href="#">Documentação</a></li>
                        <li><a href="#">Reportar bug</a></li>
                        <li class="divider"></li>
                        <li><a href="#">Sobre</a></li>
                    </ul>
                </li>
            </ul>
            <div class="app-bar-element place-right">
                <span class="dropdown-toggle"><span class="mif-user"></span><%=name%></span>
                <div class="app-bar-drop-container padding10 place-right no-margin-top block-shadow fg-dark" data-role="dropdown" data-no-close="true" style="width: 220px">
                    <h2 class="text-light">Definições rápidas</h2>
                    <ul class="unstyled-list fg-dark">
                        <li><a href="<%=Strings.BASE%>/admin/perfil" class="fg-white1 fg-hover-yellow">Perfil</a></li>
                        <li><a href="<%=Strings.BASE%>/admin/config" class="fg-white2 fg-hover-yellow">Configurações</a></li>
                        <li><a href="<%=Strings.BASE%>/admin/security" class="fg-white2 fg-hover-yellow">Segurança</a></li>
                        <li><a href="<%=Strings.BASE%>/logout" class="fg-white3 fg-hover-yellow">Saída</a></li>
                    </ul>
                </div>
            </div>
        </div>

        <div id="container" class="page-content">

            <div class="grid">
                <div class="row">
                    <div class="aprova">
                        <button id="btn_aprovar" class="button warning" onclick="metroDialog.toggle('#dialog')">Aprovar</button>
                        <button id="btn_reprovar" class="button danger" onclick="metroDialog.toggle('#dialog2')">Reprovar</button>
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
                        <td id="ilcdID">${ilcd.getId()}</td>
                    </tr>
                </tbody>
                <thead>
                    <tr>
                        <th class="sortable-column">Nome</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td id="ilcdName">${ilcd.getTitle()}</td>
                    </tr>
                </tbody>
                <thead>
                    <tr>
                        <th class="sortable-column">Tipe</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td id="ilcdType">${ilcd.getType()}</td>
                    </tr>
                </tbody>
                <thead>
                    <tr>
                        <th class="sortable-column">Local</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td id="ilcdLocation">${ilcd.getLocation()}</td>
                    </tr>
                </tbody>
                <thead>
                    <tr>
                        <th class="sortable-column">Classificação</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td id="ilcdClassification">${ilcd.getClasification()}</td>
                    </tr>
                </tbody>
                <thead>
                    <tr>
                        <th class="sortable-column">Parecer tecnico</th>
                    </tr>
                </thead>
            </table>
            <div class="row" style="margin-left:10px;">
                <br /><div class="input-control textarea"><textarea id="parecer-text" disabled="">${ilcd.getHomologacao().getTechnicalReviewer().getComment()}</textarea></div>
            </div>
        </div>
        <div data-role="dialog" id="dialog" class="padding20" data-close-button="true" data-windows-style="true" data-overlay="true" data-overlay-color="op-dark" data-overlay-click-close="true">
            <div class="container">
                <h1>Aprovar</h1>
                <p>
                    Você tem certeza que deseja aprovar a revisão de tecnica ?
                </p>
                <p>
                    <a href="<%=Strings.BASE%>/admin/technicalreviewer/${ilcd.getId()}/parecer/aprovar" id="link_aprovar" style="margin-right: 10px;" class="button primary">SIM</a><button onclick="metroDialog.close('#dialog')" class="button danger">NÃO</button>
                </p>
            </div>
        </div>
        <div data-role="dialog" id="dialog2" class="padding20" data-close-button="true" data-windows-style="true" data-overlay="true" data-overlay-color="op-dark" data-overlay-click-close="true">
            <div class="container">
                <h1>Reprovar</h1>
                <p>
                    Você tem certeza que deseja reprovar a revisão de tecnica ?
                </p>
                <p>
                    <a id="link_reprovar" style="margin-right: 10px;" class="button primary">SIM</a><button onclick="metroDialog.close('#dialog2')" class="button danger">NÃO</button>
                </p>
            </div>
        </div>
    </body>
</html>