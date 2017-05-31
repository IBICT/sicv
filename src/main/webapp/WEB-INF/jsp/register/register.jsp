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
        

    </head>

    <body>

        <div>
            <form method="post">
                
                <p>Informações de Login</p><br />
                <input type="text" name="userName" placeholder="USUAIO" required="" /><br />
                
                <input type="email" name="email" placeholder="EMAIL" required="" /><br />
                <input type="password" name="senha" placeholder="SENHA" required="" /><br />
                <input type="password" placeholder="CONFIRMAR SENHA" required="" /><br />
                
                <p>Informações pessoais</p><br />
                <select name="title">
                    <option>Por favor, selecione</option>
                    <option>Senhor</option>
                    <option>Senhora</option>
                    <option>Nao Informado</option>
                </select><br />
                <input type="text" name="firstName" placeholder="NOME" required="" /><br />
                <input type="text" name="lastName" placeholder="SOBRE NOME" required="" /><br />
                <p>Sexo: </p>
                <label>Feminino</label> <input type="radio" name="gender" value="F" />
                <label>Masculino</label> <input type="radio" name="gender" value="M" /><br />
                <p>Pais: </p>
                <select name="country">
                    <option>Brasil</option>
                </select><br />
                
                <input type="text" name="jobPositon" placeholder="Profissão" /><br />
                <input type="text" name="telefone" placeholder="Telefone" /><br />
                <input type="text" name="instituicao" placeholder="Nome da instituição" /><br />
                
                <p>Finalidade</p><br />
                <label>Profissional</label> <input type="radio" name="dsPurpose" value="1" />
                <label>Pesquisa</label> <input type="radio" name="dsPurpose" value="2" />
                <label>Educacional</label> <input type="radio" name="dsPurpose" value="3" />
                <label>Outra</label> <input type="radio" name="dsPurpose" /> <input type="text" /><br />
                
                <p>Termo de aceite:</p><br />
                <a href="#">Termos de Uso</a><br />
                <a href="#">Politica de Privacidade</a><br />
                <input type="checkbox" /> <label>Concordo com os termos acima.</label><br />
                
                <input type="submit" value="ENVIAR" /><br />
            </form>
        </div>
    </body>

</html>