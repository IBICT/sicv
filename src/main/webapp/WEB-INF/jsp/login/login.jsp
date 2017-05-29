<%-- 
    Document   : login
    Created on : 10/05/2017, 16:23:25
    Author     : Deivdy.Silva
--%>

<%@page import="resources.Strings"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
        <meta name="description" content="Tela de Login" />
        <meta name="keywords" content="HTML, CSS, JS, JavaScript, framework, metro, front-end, frontend, web development" />
        <meta name="author" content="Deivdy William Silva" />
        
        <link rel="apple-touch-icon" sizes="57x57" href="${Strings.BASE}/assets/images/favicon/apple-icon-57x57.png" />
        <link rel="apple-touch-icon" sizes="60x60" href="${Strings.BASE}/assets/images/favicon/apple-icon-60x60.png" />
        <link rel="apple-touch-icon" sizes="72x72" href="${Strings.BASE}/assets/images/favicon/apple-icon-72x72.png" />
        <link rel="apple-touch-icon" sizes="76x76" href="${Strings.BASE}/assets/images/favicon/apple-icon-76x76.png" />
        <link rel="apple-touch-icon" sizes="114x114" href="${Strings.BASE}/assets/images/favicon/apple-icon-114x114.png" />
        <link rel="apple-touch-icon" sizes="120x120" href="${Strings.BASE}/assets/images/favicon/apple-icon-120x120.png" />
        <link rel="apple-touch-icon" sizes="144x144" href="${Strings.BASE}/assets/images/favicon/apple-icon-144x144.png" />
        <link rel="apple-touch-icon" sizes="152x152" href="${Strings.BASE}/assets/images/favicon/apple-icon-152x152.png" />
        <link rel="apple-touch-icon" sizes="180x180" href="${Strings.BASE}/assets/images/favicon/apple-icon-180x180.png" />
        <link rel="icon" type="image/png" sizes="192x192" href="${Strings.BASE}/assets/images/favicon/android-icon-192x192.png" />
        <link rel="icon" type="image/png" sizes="32x32" href="${Strings.BASE}/assets/images/favicon/favicon-32x32.png" />
        <link rel="icon" type="image/png" sizes="96x96" href="${Strings.BASE}/assets/images/favicon/favicon-96x96.png" />
        <link rel="icon" type="image/png" sizes="16x16" href="${Strings.BASE}/assets/images/favicon/favicon-16x16.png" />
        <link rel="manifest" href="${Strings.BASE}/assets/images/favicon/manifest.json" />
        <meta name="msapplication-TileColor" content="#ffffff" />
        <meta name="msapplication-TileImage" content="${Strings.BASE}/assets/images/favicon/ms-icon-144x144.png" />
        <meta name="theme-color" content="#ffffff" />
        
        <title>SICV - ACV | Banco Nacional de Inventários dos inventários brasileiros do Ciclo de Vida (ICVs)</title>
        
        <link rel="stylesheet" href="${Strings.BASE}/assets/metro-ui3.0.17/css/metro.css" />
        <link rel="stylesheet" href="${Strings.BASE}/assets/metro-ui3.0.17/css/metro-icons.css" />
        <link rel="stylesheet" href="${Strings.BASE}/assets/metro-ui3.0.17/css/metro-responsive.css" />

        <script src="${Strings.BASE}/assets/metro-ui3.0.17/js/jquery-2.1.3.min.js"></script>
        <script src="${Strings.BASE}/assets/metro-ui3.0.17/js/metro.js"></script>

        <style>
            .login-form {
                width: 25rem;
                height: 18.75rem;
                position: fixed;
                top: 50%;
                margin-top: -9.375rem;
                left: 50%;
                margin-left: -12.5rem;
                background-color: #ffffff;
                opacity: 0;
                -webkit-transform: scale(.8);
                transform: scale(.8);
            }
        </style>

        <script>
            $(function () {
                var form = $(".login-form");

                form.css({
                    opacity: 1,
                    "-webkit-transform": "scale(1)",
                    "transform": "scale(1)",
                    "-webkit-transition": ".5s",
                    "transition": ".5s"
                });
            });
        </script>

    </head>

    <body class="bg-darkTeal">

        <div class="login-form padding20 block-shadow">
            <form action="${Strings.BASE}/admin/login" method="post">
                <h1 class="text-light">Login to service</h1>
                <hr class="thin" />
                <br />
                <div class="input-control text full-size" data-role="input">
                    <label for="user_login">User email:</label>
                    <input type="text" name="email" id="user_login" />
                    <button class="button helper-button clear"><span class="mif-cross"></span></button>
                </div>
                <br />
                <br />
                <div class="input-control password full-size" data-role="input">
                    <label for="user_password">User password:</label>
                    <input type="password" name="password" id="user_password" />
                    <button class="button helper-button reveal"><span class="mif-looks"></span></button>
                </div>
                <br />
                <br />
                <div class="form-actions">
                    <button type="submit" class="button primary">Login to...</button>
                </div>
            </form>
        </div>
    </body>

</html>