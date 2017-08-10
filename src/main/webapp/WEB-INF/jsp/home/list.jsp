<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@page import="br.com.ibict.acv.sicv.model.User"%>
<%@page import="br.com.ibict.acv.sicv.controller.HomeController"%>
<%@page import="resources.Strings"%>
<sec:authorize var="loggedIn" access="isAuthenticated()" />

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

        <title>SICV - ACV | Banco Nacional de Inventários dos inventários brasileiros do Ciclo de Vida (ICVs)</title>

        <!-- Bootstrap core CSS -->
        <link href="<%=Strings.BASE%>/assets/bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="<%=Strings.BASE%>/assets/bootstrap-3.3.7/css/carousel.css" rel="stylesheet">

        <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
        <link href="<%=Strings.BASE%>/assets/bootstrap-3.3.7/css/ie10-viewport-bug-workaround.css" rel="stylesheet">

        <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
        <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
        <script src="<%=Strings.BASE%>/assets/bootstrap-3.3.7/js/ie-emulation-modes-warning.js"></script>

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <body class="bg-steel">

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
                                <c:if test="${loggedIn}">
                                	<%
										User user = (User) HomeController.session().getAttribute("user");
                                	%>
								
                                	<%="<li><a href=\"" + Strings.BASE + "/logout\">" + user.getFirstName() + "</a></li>"%>
								</c:if>
                                <c:if test="${not loggedIn}">
									<li><a href="<%=Strings.BASE%>/login">Login</a></li>
								</c:if>


                            </ul>
                        </div>
                    </div>
                </nav>

            </div>
        </div>
        <div class="container marketing" style="margin-top: 100px;">
			<c:if test="${loggedIn}">
	            <%
                    User user = (User) HomeController.session().getAttribute("user");
	            %>

            	<%="<a href=\"" + Strings.BASE + "/ilcd/new\" class=\"btn btn-primary\" style=\"margin-bottom: 10px\">NOVO</a>"%>
			</c:if>
			
            <table id="list" class="table table-striped table-bordered" cellspacing="0" data-auto-width="false">
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

            <hr class="featurette-divider">

            <!-- /END THE FEATURETTES -->

            <!-- FOOTER -->
            <footer>
                <p class="pull-right"><a href="#">Back to top</a></p>
                <p>&copy; 2016 Company, Inc. &middot; <a href="#">Privacy</a> &middot; <a href="#">Terms</a></p>
            </footer>
        </div>

        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/1.10.15/js/dataTables.bootstrap.min.js"></script>
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
    </body>
</html>