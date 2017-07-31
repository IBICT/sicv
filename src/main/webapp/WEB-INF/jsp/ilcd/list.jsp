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

        <link rel='shortcut icon' type='image/x-icon' href='../favicon.ico' />

        <title>SICV - ACV | Banco Nacional de Invent�rios dos invent�rios brasileiros do Ciclo de Vida (ICVs)</title>

        <link href="<%=Strings.BASE%>/assets/metro-ui3.0.17/css/metro.css" rel="stylesheet">
        <link href="<%=Strings.BASE%>/assets/metro-ui3.0.17/css/metro-icons.css" rel="stylesheet">
        <link href="<%=Strings.BASE%>/assets/metro-ui3.0.17/css/metro-responsive.css" rel="stylesheet">
        <link href="<%=Strings.BASE%>/assets/metro-ui3.0.17/css/metro-schemes.css" rel="stylesheet">
        <link href="<%=Strings.BASE%>/assets/metro-ui3.0.17/css/metro-colors.css" rel="stylesheet">

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

            var homologacao = null;

            $(document).ready(function () {
                $('#list').DataTable({
                    "ajax": "<%=Strings.BASE%>/admin/ilcd/ilcd.json",
                    "columns": [
                        {"data": "id"},
                        {"data": "name"},
                        {"data": function (data, type, row, meta) {
                                return '<a href="#">' + data.user.email + '</a>';
                            }
                        },
                        {"data": function (data, type, row, meta) {

                                if (data.homologacao) {
                                    //console.log(data.homologacao);
                                    switch (data.homologacao.status) {
                                        case 1:
                                            return '<button class="cycle-button" onclick="metroDialog.toggle(\'#dialog\')" onmouseout="$(this).popover(\'show\')" data-role="popover" data-popover-position="bottom" data-popover-text="Enviado para o usu�rio ' + data.homologacao.user.userName + ' des de ' + data.homologacao.lastModifier + '" data-popover-background="bg-white" data-popover-color="fg-black"><span class="mif-paper-plane fg-gray mif-ani-hover-float"></span></button>';
                                            break;
                                        case 2:
                                            return '<button class="cycle-button" data-role="popover" data-popover-position="bottom" data-popover-text="Em analise de qualidade por usu�rio ' + data.homologacao.user.userName + ' des de ' + data.homologacao.lastModifier + '" data-popover-background="bg-white" data-popover-color="fg-black"><span class="mif-user"></span></button>';
                                            break;
                                        case 3:
                                            return '<button class="cycle-button" onclick="openCustom(\'' + encodeURIComponent(JSON.stringify(data)) + '\')" ><span class="mif-envelop"></span></button>';
                                            break;
                                        case 4:
                                            return '<button class="cycle-button"><span class="mif-pause"></span></button>';
                                            break;
                                        case 5:
                                            return '<button class="cycle-button" onclick="inviteStatus(\'' + encodeURIComponent(JSON.stringify(data)) + '\')" onmouseout="$(this).popover(\'show\')" data-role="popover" data-popover-position="bottom" data-popover-text="Enviado para o usu�rio ' + data.homologacao.user.userName + ' des de ' + data.homologacao.lastModifier + '" data-popover-background="bg-white" data-popover-color="fg-black"><span class="mif-paper-plane fg-gray mif-ani-hover-float"></span></button>';
                                            break;
                                        case 6:
                                            return '<button class="cycle-button"><span class="mif-envelop"></span></button>';
                                            break;
                                        case 7:
                                            return '<button class="cycle-button" onclick="technicalReviewerDialog(\'' + encodeURIComponent(JSON.stringify(data)) + '\')" onmouseout="$(this).popover(\'show\')" data-role="popover" data-popover-position="bottom" data-popover-text="Enviado por ' + data.homologacao.user.userName + ' des de ' + data.homologacao.lastModifier + '" data-popover-background="bg-white" data-popover-color="fg-black"><span class="mif-envelop fg-gray mif-ani-hover-shake"></span></button>';
                                            break;
                                        default:
                                            return '<button class="cycle-button"><span class="mif-bug"></span></button>';
                                            break;
                                    }
                                }
                                else
                                    return '<a href="<%=Strings.BASE%>/admin/ilcd/homologacao/' + data.id + '" class="button primary cycle-button"><span class="mif-play"></span></a>';
                            }
                        },
                        {"data": function (data, type, row, meta) {
                                return '<td><a href="<%=Strings.BASE%>/admin/ilcd/files/' + data.pathFile + '" class="button success cycle-button"><span class="mif-file-download"></span></a></td>';
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
            });
            
            function inviteStatus(data) {
                var obj = JSON.parse(decodeURIComponent(data));
                console.log(obj);
                $("#dialog2userName").html("<a href='#'>" + obj.homologacao.user.firstName + " (" + obj.homologacao.user.email + ")</a>");
                $("#dialog2dateInvite").html(obj.homologacao.lastModifier);
                //$("#btn-confirm").attr("onclick","sendInvite(" + data.id + ")");
                metroDialog.toggle('#dialog2');
            }
            
            function technicalReviewerDialog(data) {
                var obj = JSON.parse(decodeURIComponent(data));
                console.log(obj);
                $("#user-technical-reviewer-dialog").html("<a href='#'>" + obj.homologacao.user.firstName + " (" + obj.homologacao.user.email + ")</a>");
                $("#lastModifier-technical-reviewer-dialog").html(obj.homologacao.lastModifier);
                $("#link_technical-reviewer-dialog").attr("href","<%=Strings.BASE%>/admin/technicalreviewer/" + obj.id + "/parecer");
                metroDialog.toggle('#technical-reviewer-dialog');
            }

            function openCustom(data) {

                var obj = JSON.parse(decodeURIComponent(data));
                //console.log(obj);
                metroDialog.create({
                    title: "Revis�o de qualidade concluida.",
                    content: "A revis�o de qualidade foi concluida pelo usuario " + obj.homologacao.user.userName + " em " + obj.homologacao.lastModifier + ".",
                    actions: [
                        {
                            title: "Ver Parecer",
                            onclick: function (el) {
                                window.location = "<%=Strings.BASE%>/admin/homologacao/" + obj.id + "/parecer";
                            }
                        },
                        {
                            title: "Aprovar",
                            onclick: function (el) {
                                window.location = "<%=Strings.BASE%>/admin/homologacao/" + obj.id + "/aprovarqualidata";
                            }
                        },
                        {
                            title: "Reprovar",
                            onclick: function (el) {
                                window.location = "<%=Strings.BASE%>/admin/homologacao/" + obj.id + "/reprovarqualidata";
                            }
                        },
                        {
                            title: "Cancel",
                            cls: "js-dialog-close"
                        }
                    ],
                    options: {
                    }
                });
            }
        </script>
    </head>
    <body>
        <div class="app-bar fixed-top" data-role="appbar">
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
                        <h1 class="text-light"></h1>
                        <hr class="thin bg-grayLighter"  />
                        <a href="/ilcd/new" class="button primary"><span class="mif-plus"></span> Novo</a>
                        <hr class="thin bg-grayLighter" />
                        <table id="list" class="dataTable border bordered" data-auto-width="false">
                            <thead>
                                <tr>
                                    <td class="sortable-column">ID</td>
                                    <td class="sortable-column">Nome</td>
                                    <td class="sortable-column">Usu�rio</td>
                                    <td class="sortable-column">Status</td>
                                    <td class="sortable-column">Op��es</td>
                                </tr>
                            </thead>
                        </table>
                    </div>
                </div>
            </div>
            <div data-role="dialog" id="dialog" class="padding20" data-close-button="true" data-windows-style="true" data-overlay="true" data-overlay-color="op-dark" data-overlay-click-close="true">
                <div class="container">
                    <h1>Simple dialog</h1>
                    <p>
                        Dialog :: Metro UI CSS - The front-end framework for developing projects on the web in Windows Metro Style
                    </p>
                    <p>
                        <button class="button">Cancelar solicita��o</button><a href="<%=Strings.BASE%>/admin/ilcd/homologacao/' + data.id + '" class="button">Reenviar solicita��o</a>
                    </p>
                </div>
            </div>
        </div>
        <div data-role="dialog" id="dialog2" class="padding20" data-close-button="true" data-windows-style="true" data-overlay="true" data-overlay-color="op-dark" data-overlay-click-close="true">
            <div class="container">
                <h1>Convite enviado</h1>
                <p>
                    Convite enviado para o usuario <span id="dialog2userName"></span> des de <span id="dialog2dateInvite"></span>.
                </p>
                <p>
                    <button id="btn-confirm" onclick="sendInvite()" class="button primary">Reenviar</button> <button onclick="metroDialog.close('#dialog2')" class="button danger">Cancelar</button>
                </p>
            </div>
        </div>
        <div data-role="dialog" id="technical-reviewer-dialog" class="padding20" data-close-button="true" data-windows-style="true" data-overlay="true" data-overlay-color="op-dark" data-overlay-click-close="true">
            <div class="container">
                <h1>Revis�o tecnica concluida</h1>
                <p>
                    A revis�o de tecnica foi concluida pelo usuario <span id="user-technical-reviewer-dialog"></span> em <span id="lastModifier-technical-reviewer-dialog"></span>.
                </p>
                <p>
                    <a id="link_technical-reviewer-dialog" style="margin-right: 10px;" class="button primary">Ver Parecer</a><button onclick="metroDialog.close('#technical-reviewer-dialog')" class="button">Cancel</button>
                </p>
            </div>
        </div>
    </body>
</html>
</html>