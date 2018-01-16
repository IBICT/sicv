<%-- 
    Document   : home
    Created on : 11/05/2017, 09:48:46
    Author     : Deivdy.Silva
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@page import="resources.Strings"%>
<%@page import="br.com.ibict.acv.sicv.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="apple-touch-icon" sizes="57x57" href="<%=Strings.BASE%>/assets/images/favicon/apple-icon-57x57.png" />

<!DOCTYPE html>
<html lang="pt-BR">

    <head>
        <meta charset="UTF-8">
        <title>SICV</title>

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

        <link rel="stylesheet" href="<%=Strings.BASE%>/assets/materialize/css/materialize.min.css">
        <link href="https://fonts.googleapis.com/css?family=Titillium+Web" rel="stylesheet">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" href="<%=Strings.BASE%>/assets/steps.css">

        <style>
            html {
                font-family: 'Titillium Web', "Roboto", sans-serif;
            }

            nav {
                background-color: #4dbcc4;
            }

            nav .brand-logo {
                margin-left: 50px;
            }

            nav .brand-logo img {
                margin-right: 20px;
                vertical-align: middle;
            }

            .container {
            }

            .page-title {
                color: #00697c;
            }

            .btn-import {
                background-color: #accc5f;
            }

            .user-menu {
                border-bottom: 2px solid silver;
                margin: 60px 80px 20px 80px;
                height: 30px;
            }

            .item-menu {
                border-right: 2px solid silver;
                height: 30px;
            }

            .item-menu2 {
                text-align: center;
                border-left: 2px solid silver;
                height: 30px;
            }

            .item-menu3 {
                text-align: right;
                height: 30px;
            }

            .link-menu {
                color: #00697c;
                font-weight: bold;
                font-size: 16px;
            }

            .link-menu2 {
                color: #c3697c;
                font-weight: bold;
                font-size: 16px;
            }

            .link-menu3 {
                color: #00697c;
                font-size: 16px;
            }

            .notif-num {
                position: relative;
                top: -5px;
            }

            .sicv-container {
                margin: 0px 80px 0px 80px;
            }

            .sicv-table-th {
                color: #4dbcc4;
                border-bottom: 1px solid silver;
                border-top: 1px solid black;
            }

            .sicv-table-td {
                border-bottom: 1px solid silver;
            }
        </style>
        <link rel="stylesheet" href="steps.css">
    </head>

    <body>

        <jsp:include page="/WEB-INF/jsp/partials/nav.jsp" />
        <div class="headerDiv">
            <jsp:include page="/WEB-INF/jsp/partials/header.jsp" />
        </div>

        <div class="row  sicv-container">


            <div class="row">
                <h5> O conjunto de dados está em inglês? ${qualiData.q1?"S":"N"}</h5>
                ${qualiData.comment1}
                <hr />
            </div>
            <div class="row">
                <h5> A identificação do conjunto de dados segue o padrão Nome do produto_tecnologia_outra especificação? ${qualiData.q2?"S":"N"}</h5>
                ${qualiData.comment2}
                <hr />
            </div>
            <div class="row">
                <h5> As citações e referências estão completas ? ${qualiData.q3?"S":"N"}</h5>
                ${qualiData.comment3}
                <hr />
            </div>
            <div class="row">
                <h5>Os campos de administração são informados ?  ${qualiData.q4?"S":"N"}</h5>
                ${qualiData.comment4}
                <hr />
            </div>

            <div class="row">
                <h5>É informada a cobertura temporal do conjunto de dados ? ${qualiData.q5?"S":"N"}</h5>
                ${qualiData.comment5}
                <hr />
            </div>
            <div class="row">
                <h5>É informado o período de validade do conjunto de dados ?  ${qualiData.q6?"S":"N"}</h5>
                ${qualiData.comment6}
                <hr />
            </div>
            <div class="row">
                <h5>A cobertura tecnológica é informada ?  ${qualiData.q7?"S":"N"}</h5>
                ${qualiData.comment7}
                <hr />
            </div>
            <div class="row">
                <h5>A descrição da tecnologia é apresentada ?  ${qualiData.q8?"S":"N"}</h5>
                ${qualiData.comment8}
                <hr />
            </div>
            <div class="row">
                <h5>A cobertura geográfica é informada ?  ${qualiData.q9?"S":"N"}</h5>
                ${qualiData.comment9}
                <hr />
            </div>
            <div class="row">
                <h5>É informada a representatividade do conjunto de dados ?  ${qualiData.q10?"S":"N"}</h5>
                ${qualiData.comment10}
                <hr />
            </div>

            <div class="row">
                <h5>Informada a abordagem utilizada ?  ${qualiData.q11?"S":"N"}</h5>
                ${qualiData.comment11}
                <hr />
            </div>
            <div class="row">
                <h5>Foi aplicado critério de corte? Se sim, qual foi o critério utilizado ?  ${qualiData.q12?"S":"N"}</h5>
                ${qualiData.comment12}
                <hr />
            </div>
            <div class="row">
                <h5>Houve agregação dos dados? Qual o nível de agregação utilizado ? ${qualiData.q13?"S":"N"}</h5>
                ${qualiData.comment13}
                <hr />
            </div>
            <div class="row">
                <h5>O fluxograma do sistema do produto foi apresentado, incluindo as fronteiras do conjunto de dados ? ${qualiData.q14?"S":"N"}</h5>
                ${qualiData.comment14}
                <hr />
            </div>
            <div class="row">
                <h5>As conexões dos fluxos intermediários com os processos elementares secundários foram apresentadas ? ${qualiData.q15?"S":"N"}</h5>
                ${qualiData.comment15}
                <hr />
            </div>
            <div class="row">
                <h5>O conjunto de dados representa um sistema multifuncional? Se sim, como lidou com a multifuncionalidade ? ${qualiData.q16?"S":"N"}</h5>
                ${qualiData.comment16}
                <hr />
            </div>
            <div class="row">
                <h5>Foi considerado o uso da terra (ocupação e transformação)? Se sim, qual foi o método utilizado para transformação do uso da terra ? ${qualiData.q17?"S":"N"}</h5>
                ${qualiData.comment17}
                <hr />
            </div>
            <div class="row">
                <h5>Os dados foram validados de alguma forma ? Qual foi o método utilizado ? ${qualiData.q18?"S":"N"}</h5>
                ${qualiData.comment18}
                <hr />
            </div>
            <div class="row">
                <h5>Se o balanço de massa foi realizado, quanto foi fechado nos processos elementares primários ? ${qualiData.q19?"S":"N"}</h5>
                ${qualiData.comment19}
                <hr />
            </div>
            <div class="row">
                <h5>Se o balanço de água foi realizado, quanto foi fechado nos processos elementares primários ? ${qualiData.q20?"S":"N"}</h5>
                ${qualiData.comment20}
                <hr />
            </div>

            <div class="row">
                <h5>Se o balanço de energia foi realizado, quanto foi fechado nos processos elementares primários ? ${qualiData.q21?"S":"N"}</h5>
                ${qualiData.comment21}
                <hr />
            </div>
            <div class="row">
                <h5>Foi adotado algum método para analisar a qualidade dos dados? Se sim, qual ? ${qualiData.q22?"S":"N"}</h5>
                ${qualiData.comment22}
                <hr />
            </div>
            <div class="row">
                <h5>Os bens de capital foram incluídos ? ${qualiData.q23?"S":"N"}</h5>
                ${qualiData.comment23}
                <hr />
            </div>
            <div class="row">
                <h5>A identificação dos fluxos seguiu o padrão definido no Guia? Em caso negativo, adequar. ${qualiData.q24?"S":"N"}</h5>
                ${qualiData.comment24}
                <hr />
            </div>
            <div class="row">
                <h5>O fluxo de referência foi informado ? ${qualiData.q25?"S":"N"}</h5>
                ${qualiData.comment25}
                <hr />
            </div>
            <div class="row">
                <h5>As unidades estão no Sistema Internacional (SI)? Se não, descrever as possíveis relações com as unidades do SI. ${qualiData.q26?"S":"N"}</h5>
                ${qualiData.comment26}
                <hr />
            </div>
            <div class="row">
                <h5>Cada fluxo tecnológico está especificado por região ? ${qualiData.q27?"S":"N"}</h5>
                <!--ARRUMAR-->
                ${qualiData.comment28} 
                <!--ARRUMAR-->
                <hr />
            </div>
            <div class="row">
                <h5>São informados os compartimentos e subcompartimentos ? ${qualiData.q28?"S":"N"}</h5>
                ${qualiData.comment28}
                <hr />
            </div>
            <div class="row">
                <h5>Há informação da origem e destino dos fluxos de água ? ${qualiData.q29?"S":"N"}</h5>
                ${qualiData.comment29}
                <hr />
            </div>
            <div class="row">
                <h5>Os materiais particulados foram separados em frações ? ${qualiData.q30?"S":"N"}</h5>
                ${qualiData.comment30}
                <hr />
            </div>

            <div class="row">
                <h5>Os compostos orgânicos voláteis (COV) foram discriminados ? ${qualiData.q31?"S":"N"}</h5>
                ${qualiData.comment31}
                <hr />
            </div>
            <div class="row">
                <h5>Os hidrocarbonetos aromáticos policíclicos (PAH) foram discriminados ? ${qualiData.q32?"S":"N"}</h5>
                ${qualiData.comment32}
                <hr />
            </div>
            <div class="row">
                <h5>As dioxinas e furanos foram discriminados ? ${qualiData.q33?"S":"N"}</h5>
                ${qualiData.comment33}
                <hr />
            </div>
            <div class="row">
                <h5>As fontes de CO2 e CH4 foram discriminadas ? ${qualiData.q34?"S":"N"}</h5>
                ${qualiData.comment34}
                <hr />
            </div>
            <div class="row">
                <h5>As emissões de longo prazo foram informadas ? ${qualiData.q35?"S":"N"}</h5>
                ${qualiData.comment35}
                <hr />
            </div>
            <div class="row">
                <h5>As emissões diretas de CO2 de MUT foram incluídas e discriminadas ? ${qualiData.q36?"S":"N"}</h5>
                ${qualiData.comment36}
                <hr />
            </div>
            <div class="row">
                <h5>Foram incluídos os dados do transporte ? ${qualiData.q37?"S":"N"}</h5>
                ${qualiData.comment37}
                <hr />
            </div>
            <div class="row">
                <h5>Foram informados os dados faltantes ? ${qualiData.q38?"S":"N"}</h5>
                ${qualiData.comment38}
                <hr />
            </div>
            <div class="row">
                <h5>Foram informados os tipos de dados para cada fluxo ? ${qualiData.q39?"S":"N"}</h5>
                ${qualiData.comment39}
                <hr />
            </div>
            <div class="row">
                <h5>Foi informada a incerteza dos dados para cada fluxo ? ${qualiData.q40?"S":"N"}</h5>
                ${qualiData.comment40}
                <hr />
            </div>
            <div class="row">
                <h5>Caso tenha havido revisão crítica de terceira parte, as informações necessárias foram fornecidas ? ${qualiData.q41?"S":"N"}</h5>
                ${qualiData.comment41}
                <hr />
            </div>
            <div class="row">
                <h5>Se houve revisão crítica, o relatório da revisão pode ser disponibilizado para os revisores do SICV, junto com o conjunto de dados ? ${qualiData.q42?"S":"N"}</h5>
                ${qualiData.comment42}
                <hr />
            </div>

        </div>
        <script type="application/javascript" src="<%=Strings.BASE%>/assets/jquery-3.2.1.min.js"></script>
        <script type="application/javascript" src="<%=Strings.BASE%>/assets/materialize/js/materialize.min.js"></script>
        <script>
            $(document).ready(function () {
                // the "href" attribute of the modal trigger must specify the modal ID that wants to be triggered
                $('.modal').modal();
            });
        </script>
    </body>

</html>