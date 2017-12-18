<%@page import="resources.Strings"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="pt-BR">

    <head>
        <meta charset="UTF-8">
        <title>Home</title>
        <link rel="stylesheet" href="<%=Strings.BASE%>assets/materialize/css/materialize.min.css">
        <link href="https://fonts.googleapis.com/css?family=Titillium+Web" rel="stylesheet">
        
        <link rel="stylesheet" href="steps.css">
    </head>

    <body>

        <nav>
            <div class="nav-wrapper">
                <a href="#" class="brand-logo"><img src="img/logo.png" alt="SICV"> Importador de Inventários</a>
            </div>
        </nav>

        <div class="container">

            <div>
                <a href="#">Meus Inventários</a> |
                <a href="#">Notificação</a> |
                <a href="#">Perfil</a> |
                <a href="#">Sair</a>
            </div>

            <h4 class="page-title">Perfil</h4>
            <div class="row">
                <form class="col s12">
                    <div class="row">
                        <div class="input-field col s6">
                            <h6 class="page-title">Informações pessoais</h6>
                        </div>
                        <div class="input-field col s6">
                            <h6 class="page-title">Informações de login</h6>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s6">
                            <input placeholder="" id="first_name" type="text" class="validate">
                            <label for="first_name">Nome</label>
                        </div>
                        <div class="input-field col s6">
                            <input placeholder="" id="first_name" type="text" class="validate">
                            <label for="first_name">Senha</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s3">
                            <input placeholder="" id="first_name" type="text" class="validate">
                            <label for="first_name">E-mail</label>
                        </div>
                        <div class="input-field col s3">
                            <input placeholder="" id="first_name" type="text" class="validate">
                            <label for="first_name">Telefone</label>
                        </div>
                        <div class="input-field col s6">
                            <input placeholder="" id="first_name" type="text" class="validate">
                            <label for="first_name">Nova Senha</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s6">
                            <input placeholder="" id="first_name" type="text" class="validate">
                            <label for="first_name">Instituição</label>
                        </div>
                        <div class="input-field col s6">
                            <input placeholder="" id="first_name" type="text" class="validate">
                            <label for="first_name">Confirmar nova senha</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s3">
                            <input placeholder="" id="first_name" type="text" class="validate">
                            <label for="first_name">Cidade</label>
                        </div>
                        <div class="input-field col s3">
                            <input placeholder="" id="first_name" type="text" class="validate">
                            <label for="first_name">País</label>
                        </div>
                        <div class="input-field col s6">
                            <input class="waves-effect waves-light btn" value="Salvar alterações" type="submit" >
                        </div>
                    </div>
                </form>
            </div>

        </div>

		<script type="application/javascript" src="<%=Strings.BASE%>/assets/jquery-3.2.1.min.js"></script>
        <script type="application/javascript" src="<%=Strings.BASE%>/assets/materialize/js/materialize.min.js"></script>
    </body>

</html>
