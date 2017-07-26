<%@page import="br.com.ibict.acv.sicv.model.User"%>
<%@page import="br.com.ibict.acv.sicv.HomeController"%>
<%@page import="resources.Strings"%>
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

        <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
        <link href="<%=Strings.BASE%>/assets/bootstrap-3.3.7/css/ie10-viewport-bug-workaround.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="<%=Strings.BASE%>/assets/bootstrap-3.3.7/css/carousel.css" rel="stylesheet">

        <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
        <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
        <script src="<%=Strings.BASE%>/assets/bootstrap-3.3.7/js/ie-emulation-modes-warning.js"></script>

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <body>

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
                                <%
                                    if (HomeController.session().getAttribute("user") != null) {
                                        User user = (User) HomeController.session().getAttribute("user");
                                %>

                                <%="<li><a href=\"" + Strings.BASE + "/logout\">" + user.getFirstName() + "</a></li>"%>

                                <%
                                } else {
                                %>

                                <li><a href="<%=Strings.BASE%>/login">Login</a></li>

                                <%
                                    }
                                %>

                            </ul>
                        </div>
                    </div>
                </nav>

            </div>
        </div>

        <div class="container marketing" style="margin-top: 100px">                        
            <form action="<%=Strings.BASE%>/ilcd/new" method="POST" enctype="multipart/form-data">
                <div class="grid">
                    <br />
                    <div class="row">
                        <div class="input-control checkbox"><span class="caption">ILCD File: </span></div>
                        <div class="input-control file" data-role="input">
                            <input name="file" type="file" />
                        </div>
                    </div>
                    
                    <br /><br />
                    <a href="#">Termos de aceite</a><br />
                    <div class="checkbox">
                        <label>
                            <input type="checkbox"> Concordo com os termos acima.
                        </label>
                    </div>

                    <div class="row" style="margin-top: 10px;">
                        <input class="btn btn-primary" style="margin-right: 20px;" value="Salvar" type="submit" /><a href="/admin/ilcd" class="btn btn-default">Cancelar</a>
                    </div>

                </div>
            </form>

            <hr class="featurette-divider">

            <!-- /END THE FEATURETTES -->


            <!-- FOOTER -->
            <footer>
                <p class="pull-right"><a href="#">Back to top</a></p>
                <p>&copy; 2016 Company, Inc. &middot; <a href="#">Privacy</a> &middot; <a href="#">Terms</a></p>
            </footer>
        </div>

        <script src="<%=Strings.BASE%>/assets/metro-ui3.0.17/js/jquery-2.1.3.min.js"></script>

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
                    $(this).find("input[name^='q']").each(function () {
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
    </body>
</html>
