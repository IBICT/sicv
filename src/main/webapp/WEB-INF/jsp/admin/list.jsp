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

        <title>SICV - ACV | Banco Nacional de Inventários dos inventários brasileiros do Ciclo de Vida (ICVs)</title>

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

            function setPerfil(id, selectObject) {
                var value = selectObject.value;
                console.log(id);
                console.log(value);
                $.ajax({
                    url: '<%=Strings.BASE%>/admin/users/setperfil',
                    type: 'POST',
                    data: { id: id, perfil: value },
                    success: function (response) {
                        if(response == "true") {
                            location.reload();
                        } else {
                            alert("Falha ao mudar perfil !!!");
                        }
                    }
                });
            }

            $(document).ready(function () {
                $('#list').DataTable({
                    "ajax": "<%=Strings.BASE%>/admin/users/users.json",
                    "columns": [
                        {"data": "id"},
                        {"data": "userName"},
                        {"data": "email"},
                        {"data": "firstName"},
                        {"data": "lastName"},
                        {"data": function (data, type, row, meta) {
                                var options = ["<option " + (data.perfil === "ADMINISTRADOR" ? "selected" : "") + ">ADMINISTRADOR</option>", "<option " + (data.perfil === "USUARIO" ? "selected" : "") + ">USUARIO</option>", "<option " + (data.perfil === "REVISOR TECNICO" ? "selected" : "") + ">REVISOR TECNICO</option>", "<option " + (data.perfil === "REVISOR DE QUALIDADE" ? "selected" : "") + ">REVISOR DE QUALIDADE</option>"];
                                var select = '<select onchange="setPerfil(' + data.id + ',' + 'this' + ')">' + options + '</select>';

                                return select;
                            }
                        },
                        {"data": function (data, type, row, meta) {
                                return '<td><button class="button primary cycle-button"><span class="mif-eye"></span></button><button class="button warning cycle-button"><span class="mif-pencil"></span></button><button class="button alert cycle-button"><span class="mif-bin"></span></button></td>';
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
                        <h1 class="text-light"></h1>
                        <hr class="thin bg-grayLighter"  />
                        <hr class="thin bg-grayLighter" />
                        <table id="list" class="dataTable border bordered" data-auto-width="false">
                            <thead>
                                <tr>
                                    <td class="sortable-column">ID</td>
                                    <td class="sortable-column">Nome de Usuario</td>
                                    <td class="sortable-column">Email</td>
                                    <td class="sortable-column">Nome</td>
                                    <td class="sortable-column">Sobrenome</td>
                                    <td class="sortable-column">Perfil</td>
                                    <td class="sortable-column">Opções</td>
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