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

            .hr-question {
                border-top: 1px dashed #008692;
                border-bottom: 0;
                color: #fff;
                background-color: #fff;
                height: 4px;
            }
        </style>
        <link rel="stylesheet" href="steps.css">
    </head>

    <body>

        <nav>
            <div class="nav-wrapper">
                <a href="#" class="brand-logo"><img src="img/logo.png" alt="SICV"> Importador de Inventários</a>
            </div>
        </nav>

        <div class="row user-menu">
            <div class="col s1 item-menu"><a href="<%=Strings.BASE%>" class="link-menu">Meus Inventários</a></div>
            <div class="col s1 item-menu"><a href="<%=Strings.BASE%>/qualityreview" class="link-menu" style="color:#1bc3d8;">Revisão Qualidata</a></div>
            <div class="col s1 offset-s7 item-menu3"><a href="#" class="link-menu2"><i class="material-icons">notifications</i><span class="notif-num">1</span></a></div>
            <div class="col s1 item-menu2"><a href="#" class=""><span class="link-menu">Perfil:</span> <span class="link-menu3">${username}</span></a></div>
            <div class="col s1 item-menu2"><a href="<%=Strings.BASE%>/logout" class="link-menu">SAIR</a></div>
        </div>

        <div class="row sicv-container">

        </div>
        <div class="row  sicv-container">
            <form method="post">
                <div class="row">
                    <div class="row">
                        <div class="col s6">
                            <h5 class="page-title">Check list Qualidata</h5>
                        </div>
                    </div>
                    <div class="col s9">
                        <div class="row">
                            <div class="col s9">
                                <h5 style="color:#006b7b">Requisitos gerais </h5>
                            </div>
                            <div class="col s3">
                            </div>
                        </div>
                        <div class="row">
                            <div class="row" style="margin:0px;">
                                <div class="col s9">
                                    <p style="margin:0;font-size:18px;">O conjunto de dados está em inglês?</p>
                                </div>
                                <div class="col s3">

                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s2">
                                    <p>
                                        <input class="with-gap" name="q1" value="true" type="radio" id="q1" />
                                        <label for="q1">Sim</label>
                                    </p>
                                </div>
                                <div class="col s2">
                                    <p>
                                        <input class="with-gap" name="q1" value="false" type="radio" id="q2" />
                                        <label for="q2">Não</label>
                                    </p>
                                </div>
                                <div class="col s3 offset-s5">
                                    Não
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <textarea name="comment1" class="col s9" style="resize: none; height:60px; border: 2px #008491 solid;" id="q1c" cols="30" rows="20"></textarea>
                                <div class="col s3">
                                    <textarea disabled style="resize:none; border:0; height:60px;" name="" id="" cols="30" rows="10">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper 
                                    </textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="row" style="margin:0px;">
                                <div class="col s9">
                                    <p style="margin:0;font-size:18px;">A identificação do conjunto de dados segue o padrão Nome do produto_tecnologia_outra especificação?</p>
                                </div>
                                <div class="col s3">

                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s2">
                                    <p>
                                        <input class="with-gap" name="q2" value="true" type="radio" id="q3" />
                                        <label for="q3">Sim</label>
                                    </p>
                                </div>
                                <div class="col s2">
                                    <p>
                                        <input class="with-gap" name="q2" value="false" type="radio" id="q4" />
                                        <label for="q4">Não</label>
                                    </p>
                                </div>
                                <div class="col s3 offset-s5">
                                    Sim
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <textarea class="col s9" style="resize: none; height:60px; border: 2px #008491 solid;" name="comment2" id="q1c" cols="30" rows="20"></textarea>
                                <div class="col s3">
                                    <textarea disabled style="resize:none; border:0; height:60px;" name="" id="" cols="30" rows="10">
                                    </textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="row" style="margin:0px;">
                                <div class="col s9">
                                    <p style="margin:0;font-size:18px;">As citações e referências estão completas ?</p>
                                </div>
                                <div class="col s3">

                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s2">
                                    <p>
                                        <input class="with-gap" name="q3" value="true" type="radio" id="q5" />
                                        <label for="q5">Sim</label>
                                    </p>
                                </div>
                                <div class="col s2">
                                    <p>
                                        <input class="with-gap" name="q3" value="false" type="radio" id="q6" />
                                        <label for="q6">Não</label>
                                    </p>
                                </div>
                                <div class="col s3 offset-s5">
                                    Sim
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <textarea name="comment3" class="col s9" style="resize: none; height:60px; border: 2px #008491 solid;" name="comment1" id="q1c" cols="30" rows="20"></textarea>
                                <div class="col s3">
                                    <textarea disabled style="resize:none; border:0; height:60px;" name="" id="" cols="30" rows="10">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper 
                                    </textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="row" style="margin:0px;">
                                <div class="col s9">
                                    <p style="margin:0;font-size:18px;">Os campos de administração são informados ?</p>
                                </div>
                                <div class="col s3">

                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s2">
                                    <p>
                                        <input class="with-gap" name="q4" value="true" type="radio" id="q7" />
                                        <label for="q7">Sim</label>
                                    </p>
                                </div>
                                <div class="col s2">
                                    <p>
                                        <input class="with-gap" name="q4" value="false" type="radio" id="q8" />
                                        <label for="q8">Não</label>
                                    </p>
                                </div>
                                <div class="col s3 offset-s5">
                                    Sim
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <textarea name="comment4" class="col s9" style="resize: none; height:60px; border: 2px #008491 solid;" name="comment1" id="q1c" cols="30" rows="20"></textarea>
                                <div class="col s3">
                                    <textarea disabled style="resize:none; border:0; height:60px;" name="" id="" cols="30" rows="10">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper 
                                    </textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="row" style="margin:0px;">
                                <div class="col s9">
                                    <p style="margin:0;font-size:18px;">É informada a cobertura temporal do conjunto de dados ?</p>
                                </div>
                                <div class="col s3">

                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s2">
                                    <p>
                                        <input class="with-gap" name="q5" value="true" type="radio" id="q9" />
                                        <label for="q9">Sim</label>
                                    </p>
                                </div>
                                <div class="col s2">
                                    <p>
                                        <input class="with-gap" name="q5" value="false" type="radio" id="q10" />
                                        <label for="q10">Não</label>
                                    </p>
                                </div>
                                <div class="col s3 offset-s5">
                                    Sim
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <textarea name="comment5" class="col s9" style="resize: none; height:60px; border: 2px #008491 solid;" name="comment1" id="q1c" cols="30" rows="20"></textarea>
                                <div class="col s3">
                                    <textarea disabled style="resize:none; border:0; height:60px;" name="" id="" cols="30" rows="10">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper 
                                    </textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="row" style="margin:0px;">
                                <div class="col s9">
                                    <p style="margin:0;font-size:18px;">É informado o período de validade do conjunto de dados ?</p>
                                </div>
                                <div class="col s3">

                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s2">
                                    <p>
                                        <input class="with-gap" name="q6" value="true" type="radio" id="q11" />
                                        <label for="q11">Sim</label>
                                    </p>
                                </div>
                                <div class="col s2">
                                    <p>
                                        <input class="with-gap" name="q6" value="false" type="radio" id="q12" />
                                        <label for="q12">Não</label>
                                    </p>
                                </div>
                                <div class="col s3 offset-s5">
                                    Sim
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <textarea name="comment6" class="col s9" style="resize: none; height:60px; border: 2px #008491 solid;" name="comment1" id="q1c" cols="30" rows="20"></textarea>
                                <div class="col s3">
                                    <textarea disabled style="resize:none; border:0; height:60px;" name="" id="" cols="30" rows="10">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper 
                                    </textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="row" style="margin:0px;">
                                <div class="col s9">
                                    <p style="margin:0;font-size:18px;">A cobertura tecnológica é informada ?</p>
                                </div>
                                <div class="col s3">

                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s2">
                                    <p>
                                        <input class="with-gap" name="q7" value="true" type="radio" id="q13" />
                                        <label for="q13">Sim</label>
                                    </p>
                                </div>
                                <div class="col s2">
                                    <p>
                                        <input class="with-gap" name="q7" value="false" type="radio" id="q14" />
                                        <label for="q14">Não</label>
                                    </p>
                                </div>
                                <div class="col s3 offset-s5">
                                    Sim
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <textarea name="comment7" class="col s9" style="resize: none; height:60px; border: 2px #008491 solid;" name="comment1" id="q1c" cols="30" rows="20"></textarea>
                                <div class="col s3">
                                    <textarea disabled style="resize:none; border:0; height:60px;" name="" id="" cols="30" rows="10">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper 
                                    </textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="row" style="margin:0px;">
                                <div class="col s9">
                                    <p style="margin:0;font-size:18px;">A descrição da tecnologia é apresentada ?</p>
                                </div>
                                <div class="col s3">

                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s2">
                                    <p>
                                        <input class="with-gap" name="q8" value="true" type="radio" id="q15" />
                                        <label for="q15">Sim</label>
                                    </p>
                                </div>
                                <div class="col s2">
                                    <p>
                                        <input class="with-gap" name="q8" value="false" type="radio" id="q16" />
                                        <label for="q16">Não</label>
                                    </p>
                                </div>
                                <div class="col s3 offset-s5">
                                    Sim
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <textarea name="comment8" class="col s9" style="resize: none; height:60px; border: 2px #008491 solid;" name="comment1" id="q1c" cols="30" rows="20"></textarea>
                                <div class="col s3">
                                    <textarea disabled style="resize:none; border:0; height:60px;" name="" id="" cols="30" rows="10">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper 
                                    </textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="row" style="margin:0px;">
                                <div class="col s9">
                                    <p style="margin:0;font-size:18px;">A cobertura geográfica é informada ?</p>
                                </div>
                                <div class="col s3">

                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s2">
                                    <p>
                                        <input class="with-gap" name="q9" value="true" type="radio" id="q17" />
                                        <label for="q17">Sim</label>
                                    </p>
                                </div>
                                <div class="col s2">
                                    <p>
                                        <input class="with-gap" name="q9" value="false" type="radio" id="q18" />
                                        <label for="q18">Não</label>
                                    </p>
                                </div>
                                <div class="col s3 offset-s5">
                                    Sim
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <textarea name="comment9" class="col s9" style="resize: none; height:60px; border: 2px #008491 solid;" name="comment1" id="q1c" cols="30" rows="20"></textarea>
                                <div class="col s3">
                                    <textarea disabled style="resize:none; border:0; height:60px;" name="" id="" cols="30" rows="10">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper 
                                    </textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="row" style="margin:0px;">
                                <div class="col s9">
                                    <p style="margin:0;font-size:18px;">É informada a representatividade do conjunto de dados ?</p>
                                </div>
                                <div class="col s3">

                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s2">
                                    <p>
                                        <input class="with-gap" name="q10" value="true" type="radio" id="q19" />
                                        <label for="q19">Sim</label>
                                    </p>
                                </div>
                                <div class="col s2">
                                    <p>
                                        <input class="with-gap" name="q10" value="false" type="radio" id="q20" />
                                        <label for="q20">Não</label>
                                    </p>
                                </div>
                                <div class="col s3 offset-s5">
                                    Sim
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <textarea name="comment10" class="col s9" style="resize: none; height:60px; border: 2px #008491 solid;" name="comment1" id="q1c" cols="30" rows="20"></textarea>
                                <div class="col s3">
                                    <textarea disabled style="resize:none; border:0; height:60px;" name="" id="" cols="30" rows="10">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper 
                                    </textarea>
                                </div>
                            </div>
                        </div>
                        <hr class="hr-question" />
                        <div class="row">
                            <div class="col s9">
                                <h5 style="color:#006b7b">Requisitos de Métodos e Processos</h5>
                            </div>
                        </div>
                        <div class="row">
                            <div class="row" style="margin:0px;">
                                <div class="col s9">
                                    <p style="margin:0;font-size:18px;">Informada a abordagem utilizada ?</p>
                                </div>
                                <div class="col s3">

                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s2">
                                    <p>
                                        <input class="with-gap" name="q11" value="true" type="radio" id="q21" />
                                        <label for="q21">Sim</label>
                                    </p>
                                </div>
                                <div class="col s2">
                                    <p>
                                        <input class="with-gap" name="q11" value="false" type="radio" id="q22" />
                                        <label for="q22">Não</label>
                                    </p>
                                </div>
                                <div class="col s3 offset-s5">
                                    Sim
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <textarea name="comment11" class="col s9" style="resize: none; height:60px; border: 2px #008491 solid;" name="comment1" id="q1c" cols="30" rows="20"></textarea>
                                <div class="col s3">
                                    <textarea disabled style="resize:none; border:0; height:60px;" name="" id="" cols="30" rows="10">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper 
                                    </textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="row" style="margin:0px;">
                                <div class="col s9">
                                    <p style="margin:0;font-size:18px;">Foi aplicado critério de corte? Se sim, qual foi o critério utilizado ?</p>
                                </div>
                                <div class="col s3">

                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s2">
                                    <p>
                                        <input class="with-gap" name="q12" value="true" type="radio" id="q23" />
                                        <label for="q23">Sim</label>
                                    </p>
                                </div>
                                <div class="col s2">
                                    <p>
                                        <input class="with-gap" name="q12" value="false" type="radio" id="q24" />
                                        <label for="q24">Não</label>
                                    </p>
                                </div>
                                <div class="col s3 offset-s5">
                                    Sim
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <textarea name="comment12" class="col s9" style="resize: none; height:60px; border: 2px #008491 solid;" name="comment1" id="q1c" cols="30" rows="20"></textarea>
                                <div class="col s3">
                                    <textarea disabled style="resize:none; border:0; height:60px;" name="" id="" cols="30" rows="10">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper 
                                    </textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="row" style="margin:0px;">
                                <div class="col s9">
                                    <p style="margin:0;font-size:18px;">Houve agregação dos dados? Qual o nível de agregação utilizado ?</p>
                                </div>
                                <div class="col s3">

                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s2">
                                    <p>
                                        <input class="with-gap" name="q13" value="true" type="radio" id="q25" />
                                        <label for="q25">Sim</label>
                                    </p>
                                </div>
                                <div class="col s2">
                                    <p>
                                        <input class="with-gap" name="q13" value="false" type="radio" id="q26" />
                                        <label for="q26">Não</label>
                                    </p>
                                </div>
                                <div class="col s3 offset-s5">
                                    Sim
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <textarea name="comment13" class="col s9" style="resize: none; height:60px; border: 2px #008491 solid;" name="comment1" id="q1c" cols="30" rows="20"></textarea>
                                <div class="col s3">
                                    <textarea disabled style="resize:none; border:0; height:60px;" name="" id="" cols="30" rows="10">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper 
                                    </textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="row" style="margin:0px;">
                                <div class="col s9">
                                    <p style="margin:0;font-size:18px;">O fluxograma do sistema do produto foi apresentado, incluindo as fronteiras do conjunto de dados ?</p>
                                </div>
                                <div class="col s3">

                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s2">
                                    <p>
                                        <input class="with-gap" name="q14" value="true" type="radio" id="q27" />
                                        <label for="q27">Sim</label>
                                    </p>
                                </div>
                                <div class="col s2">
                                    <p>
                                        <input class="with-gap" name="q14" value="false" type="radio" id="q28" />
                                        <label for="q28">Não</label>
                                    </p>
                                </div>
                                <div class="col s3 offset-s5">
                                    Sim
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <textarea name="comment14" class="col s9" style="resize: none; height:60px; border: 2px #008491 solid;" name="comment1" id="q1c" cols="30" rows="20"></textarea>
                                <div class="col s3">
                                    <textarea disabled style="resize:none; border:0; height:60px;" name="" id="" cols="30" rows="10">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper 
                                    </textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="row" style="margin:0px;">
                                <div class="col s9">
                                    <p style="margin:0;font-size:18px;">As conexões dos fluxos intermediários com os processos elementares secundários foram apresentadas ?</p>
                                </div>
                                <div class="col s3">

                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s2">
                                    <p>
                                        <input class="with-gap" name="q15" value="true" type="radio" id="q29" />
                                        <label for="q29">Sim</label>
                                    </p>
                                </div>
                                <div class="col s2">
                                    <p>
                                        <input class="with-gap" name="q15" value="false" type="radio" id="q30" />
                                        <label for="q30">Não</label>
                                    </p>
                                </div>
                                <div class="col s3 offset-s5">
                                    Sim
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <textarea name="comment15" class="col s9" style="resize: none; height:60px; border: 2px #008491 solid;" name="comment1" id="q1c" cols="30" rows="20"></textarea>
                                <div class="col s3">
                                    <textarea disabled style="resize:none; border:0; height:60px;" name="" id="" cols="30" rows="10">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper 
                                    </textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="row" style="margin:0px;">
                                <div class="col s9">
                                    <p style="margin:0;font-size:18px;">O conjunto de dados representa um sistema multifuncional? Se sim, como lidou com a multifuncionalidade ?</p>
                                </div>
                                <div class="col s3">

                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s2">
                                    <p>
                                        <input class="with-gap" name="q16" value="true" type="radio" id="q31" />
                                        <label for="q31">Sim</label>
                                    </p>
                                </div>
                                <div class="col s2">
                                    <p>
                                        <input class="with-gap" name="q16" value="false" type="radio" id="q32" />
                                        <label for="q32">Não</label>
                                    </p>
                                </div>
                                <div class="col s3 offset-s5">
                                    Sim
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <textarea name="comment16" class="col s9" style="resize: none; height:60px; border: 2px #008491 solid;" name="comment1" id="q1c" cols="30" rows="20"></textarea>
                                <div class="col s3">
                                    <textarea disabled style="resize:none; border:0; height:60px;" name="" id="" cols="30" rows="10">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper 
                                    </textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="row" style="margin:0px;">
                                <div class="col s9">
                                    <p style="margin:0;font-size:18px;">Foi considerado o uso da terra (ocupação e transformação)? Se sim, qual foi o método utilizado para transformação do uso da terra ?</p>
                                </div>
                                <div class="col s3">

                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s2">
                                    <p>
                                        <input class="with-gap" name="q17" value="true" type="radio" id="q33" />
                                        <label for="q33">Sim</label>
                                    </p>
                                </div>
                                <div class="col s2">
                                    <p>
                                        <input class="with-gap" name="q17" value="false" type="radio" id="q34" />
                                        <label for="q34">Não</label>
                                    </p>
                                </div>
                                <div class="col s3 offset-s5">
                                    Sim
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <textarea name="comment17" class="col s9" style="resize: none; height:60px; border: 2px #008491 solid;" name="comment1" id="q1c" cols="30" rows="20"></textarea>
                                <div class="col s3">
                                    <textarea disabled style="resize:none; border:0; height:60px;" name="" id="" cols="30" rows="10">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper 
                                    </textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="row" style="margin:0px;">
                                <div class="col s9">
                                    <p style="margin:0;font-size:18px;">Os dados foram validados de alguma forma ? Qual foi o método utilizado ?</p>
                                </div>
                                <div class="col s3">

                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s2">
                                    <p>
                                        <input class="with-gap" name="q18" value="true" type="radio" id="q35" />
                                        <label for="q35">Sim</label>
                                    </p>
                                </div>
                                <div class="col s2">
                                    <p>
                                        <input class="with-gap" name="q18" value="false" type="radio" id="q36" />
                                        <label for="q36">Não</label>
                                    </p>
                                </div>
                                <div class="col s3 offset-s5">
                                    Sim
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <textarea name="comment18" class="col s9" style="resize: none; height:60px; border: 2px #008491 solid;" name="comment1" id="q1c" cols="30" rows="20"></textarea>
                                <div class="col s3">
                                    <textarea disabled style="resize:none; border:0; height:60px;" name="" id="" cols="30" rows="10">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper 
                                    </textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="row" style="margin:0px;">
                                <div class="col s9">
                                    <p style="margin:0;font-size:18px;">Se o balanço de massa foi realizado, quanto foi fechado nos processos elementares primários ?</p>
                                </div>
                                <div class="col s3">

                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s2">
                                    <p>
                                        <input class="with-gap" name="q19" value="true" type="radio" id="q37" />
                                        <label for="q37">Sim</label>
                                    </p>
                                </div>
                                <div class="col s2">
                                    <p>
                                        <input class="with-gap" name="q19" value="false" type="radio" id="q38" />
                                        <label for="q38">Não</label>
                                    </p>
                                </div>
                                <div class="col s3 offset-s5">
                                    Sim
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <textarea name="comment19" class="col s9" style="resize: none; height:60px; border: 2px #008491 solid;" name="comment1" id="q1c" cols="30" rows="20"></textarea>
                                <div class="col s3">
                                    <textarea disabled style="resize:none; border:0; height:60px;" name="" id="" cols="30" rows="10">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper 
                                    </textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="row" style="margin:0px;">
                                <div class="col s9">
                                    <p style="margin:0;font-size:18px;">Se o balanço de água foi realizado, quanto foi fechado nos processos elementares primários ?</p>
                                </div>
                                <div class="col s3">

                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s2">
                                    <p>
                                        <input class="with-gap" name="q20" value="true" type="radio" id="q39" />
                                        <label for="q39">Sim</label>
                                    </p>
                                </div>
                                <div class="col s2">
                                    <p>
                                        <input class="with-gap" name="q20" value="false" type="radio" id="q40" />
                                        <label for="q40">Não</label>
                                    </p>
                                </div>
                                <div class="col s3 offset-s5">
                                    Sim
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <textarea name="comment20" class="col s9" style="resize: none; height:60px; border: 2px #008491 solid;" name="comment1" id="q1c" cols="30" rows="20"></textarea>
                                <div class="col s3">
                                    <textarea disabled style="resize:none; border:0; height:60px;" name="" id="" cols="30" rows="10">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper 
                                    </textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="row" style="margin:0px;">
                                <div class="col s9">
                                    <p style="margin:0;font-size:18px;">Se o balanço de energia foi realizado, quanto foi fechado nos processos elementares primários ?</p>
                                </div>
                                <div class="col s3">

                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s2">
                                    <p>
                                        <input class="with-gap" name="q21" value="true" type="radio" id="q41" />
                                        <label for="q41">Sim</label>
                                    </p>
                                </div>
                                <div class="col s2">
                                    <p>
                                        <input class="with-gap" name="q21" value="false" type="radio" id="q42" />
                                        <label for="q42">Não</label>
                                    </p>
                                </div>
                                <div class="col s3 offset-s5">
                                    Sim
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <textarea name="comment21" class="col s9" style="resize: none; height:60px; border: 2px #008491 solid;" name="comment1" id="q1c" cols="30" rows="20"></textarea>
                                <div class="col s3">
                                    <textarea disabled style="resize:none; border:0; height:60px;" name="" id="" cols="30" rows="10">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper 
                                    </textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="row" style="margin:0px;">
                                <div class="col s9">
                                    <p style="margin:0;font-size:18px;">Foi adotado algum método para analisar a qualidade dos dados? Se sim, qual ?</p>
                                </div>
                                <div class="col s3">

                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s2">
                                    <p>
                                        <input class="with-gap" name="q22" value="true" type="radio" id="q43" />
                                        <label for="q43">Sim</label>
                                    </p>
                                </div>
                                <div class="col s2">
                                    <p>
                                        <input class="with-gap" name="q22" value="false" type="radio" id="q44" />
                                        <label for="q44">Não</label>
                                    </p>
                                </div>
                                <div class="col s3 offset-s5">
                                    Sim
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <textarea name="comment22" class="col s9" style="resize: none; height:60px; border: 2px #008491 solid;" name="comment1" id="q1c" cols="30" rows="20"></textarea>
                                <div class="col s3">
                                    <textarea disabled style="resize:none; border:0; height:60px;" name="" id="" cols="30" rows="10">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper 
                                    </textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="row" style="margin:0px;">
                                <div class="col s9">
                                    <p style="margin:0;font-size:18px;">Os bens de capital foram incluídos ?</p>
                                </div>
                                <div class="col s3">

                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s2">
                                    <p>
                                        <input class="with-gap" name="q23" type="radio" value="true" id="q45" />
                                        <label for="q45">Sim</label>
                                    </p>
                                </div>
                                <div class="col s2">
                                    <p>
                                        <input class="with-gap" name="q23" type="radio" value="false" id="q46" />
                                        <label for="q46">Não</label>
                                    </p>
                                </div>
                                <div class="col s3 offset-s5">
                                    Sim
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <textarea name="comment23" class="col s9" style="resize: none; height:60px; border: 2px #008491 solid;" name="comment1" id="q1c" cols="30" rows="20"></textarea>
                                <div class="col s3">
                                    <textarea disabled style="resize:none; border:0; height:60px;" name="" id="" cols="30" rows="10">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper 
                                    </textarea>
                                </div>
                            </div>
                        </div>
                        <hr class="hr-question" />
                        <div class="row">
                            <div class="col s9">
                                <h5 style="color:#006b7b">Requisitos de Fluxos</h5>
                            </div>
                        </div>
                        <div class="row">
                            <div class="row" style="margin:0px;">
                                <div class="col s9">
                                    <p style="margin:0;font-size:18px;">A identificação dos fluxos seguiu o padrão definido no Guia? Em caso negativo, adequar.</p>
                                </div>
                                <div class="col s3">

                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s2">
                                    <p>
                                        <input class="with-gap" name="q24" type="radio" value="true" id="q47" />
                                        <label for="q47">Sim</label>
                                    </p>
                                </div>
                                <div class="col s2">
                                    <p>
                                        <input class="with-gap" name="q24" type="radio" value="false" id="q48" />
                                        <label for="q48">Não</label>
                                    </p>
                                </div>
                                <div class="col s3 offset-s5">
                                    Sim
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <textarea name="comment24" class="col s9" style="resize: none; height:60px; border: 2px #008491 solid;" name="comment1" id="q1c" cols="30" rows="20"></textarea>
                                <div class="col s3">
                                    <textarea disabled style="resize:none; border:0; height:60px;" name="" id="" cols="30" rows="10">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper 
                                    </textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="row" style="margin:0px;">
                                <div class="col s9">
                                    <p style="margin:0;font-size:18px;">O fluxo de referência foi informado ?</p>
                                </div>
                                <div class="col s3">

                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s2">
                                    <p>
                                        <input class="with-gap" name="q25" type="radio" value="true" id="q49" />
                                        <label for="q49">Sim</label>
                                    </p>
                                </div>
                                <div class="col s2">
                                    <p>
                                        <input class="with-gap" name="q25" type="radio" value="false" id="q50" />
                                        <label for="q50">Não</label>
                                    </p>
                                </div>
                                <div class="col s3 offset-s5">
                                    Sim
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <textarea name="comment25" class="col s9" style="resize: none; height:60px; border: 2px #008491 solid;" name="comment1" id="q1c" cols="30" rows="20"></textarea>
                                <div class="col s3">
                                    <textarea disabled style="resize:none; border:0; height:60px;" name="" id="" cols="30" rows="10">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper 
                                    </textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="row" style="margin:0px;">
                                <div class="col s9">
                                    <p style="margin:0;font-size:18px;">As unidades estão no Sistema Internacional (SI)? Se não, descrever as possíveis relações com as unidades do SI.</p>
                                </div>
                                <div class="col s3">

                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s2">
                                    <p>
                                        <input class="with-gap" name="q26" type="radio" value="true" id="q51" />
                                        <label for="q51">Sim</label>
                                    </p>
                                </div>
                                <div class="col s2">
                                    <p>
                                        <input class="with-gap" name="q26" type="radio" value="false" id="q52" />
                                        <label for="q52">Não</label>
                                    </p>
                                </div>
                                <div class="col s3 offset-s5">
                                    Sim
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <textarea name="comment26" class="col s9" style="resize: none; height:60px; border: 2px #008491 solid;" name="comment1" id="q1c" cols="30" rows="20"></textarea>
                                <div class="col s3">
                                    <textarea disabled style="resize:none; border:0; height:60px;" name="" id="" cols="30" rows="10">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper 
                                    </textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="row" style="margin:0px;">
                                <div class="col s9">
                                    <p style="margin:0;font-size:18px;">Cada fluxo tecnológico está especificado por região ?</p>
                                </div>
                                <div class="col s3">

                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s2">
                                    <p>
                                        <input class="with-gap" name="q27" type="radio" value="true" id="q53" />
                                        <label for="q53">Sim</label>
                                    </p>
                                </div>
                                <div class="col s2">
                                    <p>
                                        <input class="with-gap" name="q27" type="radio" value="false" id="q54" />
                                        <label for="q54">Não</label>
                                    </p>
                                </div>
                                <div class="col s3 offset-s5">
                                    Sim
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <textarea name="comment27" class="col s9" style="resize: none; height:60px; border: 2px #008491 solid;" name="comment1" id="q1c" cols="30" rows="20"></textarea>
                                <div class="col s3">
                                    <textarea disabled style="resize:none; border:0; height:60px;" name="" id="" cols="30" rows="10">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper 
                                    </textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="row" style="margin:0px;">
                                <div class="col s9">
                                    <p style="margin:0;font-size:18px;">São informados os compartimentos e subcompartimentos ?</p>
                                </div>
                                <div class="col s3">

                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s2">
                                    <p>
                                        <input class="with-gap" name="q28" type="radio" value="true" id="q55" />
                                        <label for="q55">Sim</label>
                                    </p>
                                </div>
                                <div class="col s2">
                                    <p>
                                        <input class="with-gap" name="q28" type="radio" value="false" id="q56" />
                                        <label for="q56">Não</label>
                                    </p>
                                </div>
                                <div class="col s3 offset-s5">
                                    Sim
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <textarea name="comment28" class="col s9" style="resize: none; height:60px; border: 2px #008491 solid;" name="comment1" id="q1c" cols="30" rows="20"></textarea>
                                <div class="col s3">
                                    <textarea disabled style="resize:none; border:0; height:60px;" name="" id="" cols="30" rows="10">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper 
                                    </textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="row" style="margin:0px;">
                                <div class="col s9">
                                    <p style="margin:0;font-size:18px;">Há informação da origem e destino dos fluxos de água ?</p>
                                </div>
                                <div class="col s3">

                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s2">
                                    <p>
                                        <input class="with-gap" name="q29" type="radio" value="true" id="q57" />
                                        <label for="q57">Sim</label>
                                    </p>
                                </div>
                                <div class="col s2">
                                    <p>
                                        <input class="with-gap" name="q29" type="radio" value="false" id="q58" />
                                        <label for="q58">Não</label>
                                    </p>
                                </div>
                                <div class="col s3 offset-s5">
                                    Sim
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <textarea name="comment29" class="col s9" style="resize: none; height:60px; border: 2px #008491 solid;" name="comment1" id="q1c" cols="30" rows="20"></textarea>
                                <div class="col s3">
                                    <textarea disabled style="resize:none; border:0; height:60px;" name="" id="" cols="30" rows="10">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper 
                                    </textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="row" style="margin:0px;">
                                <div class="col s9">
                                    <p style="margin:0;font-size:18px;">Os materiais particulados foram separados em frações ?</p>
                                </div>
                                <div class="col s3">

                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s2">
                                    <p>
                                        <input class="with-gap" name="q30" type="radio" value="true" id="q59" />
                                        <label for="q59">Sim</label>
                                    </p>
                                </div>
                                <div class="col s2">
                                    <p>
                                        <input class="with-gap" name="q30" type="radio" value="false" id="q60" />
                                        <label for="q60">Não</label>
                                    </p>
                                </div>
                                <div class="col s3 offset-s5">
                                    Sim
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <textarea name="comment30" class="col s9" style="resize: none; height:60px; border: 2px #008491 solid;" name="comment1" id="q1c" cols="30" rows="20"></textarea>
                                <div class="col s3">
                                    <textarea disabled style="resize:none; border:0; height:60px;" name="" id="" cols="30" rows="10">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper 
                                    </textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="row" style="margin:0px;">
                                <div class="col s9">
                                    <p style="margin:0;font-size:18px;">Os compostos orgânicos voláteis (COV) foram discriminados ?</p>
                                </div>
                                <div class="col s3">

                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s2">
                                    <p>
                                        <input class="with-gap" name="q31" type="radio" value="true" id="q61" />
                                        <label for="q61">Sim</label>
                                    </p>
                                </div>
                                <div class="col s2">
                                    <p>
                                        <input class="with-gap" name="q31" type="radio" value="false" id="q62" />
                                        <label for="q62">Não</label>
                                    </p>
                                </div>
                                <div class="col s3 offset-s5">
                                    Sim
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <textarea name="comment31" class="col s9" style="resize: none; height:60px; border: 2px #008491 solid;" name="comment1" id="q1c" cols="30" rows="20"></textarea>
                                <div class="col s3">
                                    <textarea disabled style="resize:none; border:0; height:60px;" name="" id="" cols="30" rows="10">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper 
                                    </textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="row" style="margin:0px;">
                                <div class="col s9">
                                    <p style="margin:0;font-size:18px;">Os hidrocarbonetos aromáticos policíclicos (PAH) foram discriminados ?</p>
                                </div>
                                <div class="col s3">

                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s2">
                                    <p>
                                        <input class="with-gap" name="q32" type="radio" value="true" id="q63" />
                                        <label for="q63">Sim</label>
                                    </p>
                                </div>
                                <div class="col s2">
                                    <p>
                                        <input class="with-gap" name="q32" type="radio" value="false" id="q64" />
                                        <label for="q64">Não</label>
                                    </p>
                                </div>
                                <div class="col s3 offset-s5">
                                    Sim
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <textarea name="comment32" class="col s9" style="resize: none; height:60px; border: 2px #008491 solid;" name="comment1" id="q1c" cols="30" rows="20"></textarea>
                                <div class="col s3">
                                    <textarea disabled style="resize:none; border:0; height:60px;" name="" id="" cols="30" rows="10">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper 
                                    </textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="row" style="margin:0px;">
                                <div class="col s9">
                                    <p style="margin:0;font-size:18px;">As dioxinas e furanos foram discriminados ?</p>
                                </div>
                                <div class="col s3">

                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s2">
                                    <p>
                                        <input class="with-gap" name="q33" type="radio" value="true" id="q65" />
                                        <label for="q65">Sim</label>
                                    </p>
                                </div>
                                <div class="col s2">
                                    <p>
                                        <input class="with-gap" name="q33" type="radio" value="false" id="q66" />
                                        <label for="q66">Não</label>
                                    </p>
                                </div>
                                <div class="col s3 offset-s5">
                                    Sim
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <textarea  name="comment33" class="col s9" style="resize: none; height:60px; border: 2px #008491 solid;" name="comment1" id="q1c" cols="30" rows="20"></textarea>
                                <div class="col s3">
                                    <textarea disabled style="resize:none; border:0; height:60px;" name="" id="" cols="30" rows="10">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper 
                                    </textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="row" style="margin:0px;">
                                <div class="col s9">
                                    <p style="margin:0;font-size:18px;">As fontes de CO2 e CH4 foram discriminadas ?</p>
                                </div>
                                <div class="col s3">

                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s2">
                                    <p>
                                        <input class="with-gap" name="q34" type="radio" value="true" id="q67" />
                                        <label for="q67">Sim</label>
                                    </p>
                                </div>
                                <div class="col s2">
                                    <p>
                                        <input class="with-gap" name="q34" type="radio" value="false" id="q68" />
                                        <label for="q68">Não</label>
                                    </p>
                                </div>
                                <div class="col s3 offset-s5">
                                    Sim
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <textarea  name="comment34" class="col s9" style="resize: none; height:60px; border: 2px #008491 solid;" name="comment1" id="q1c" cols="30" rows="20"></textarea>
                                <div class="col s3">
                                    <textarea disabled style="resize:none; border:0; height:60px;" name="" id="" cols="30" rows="10">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper 
                                    </textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="row" style="margin:0px;">
                                <div class="col s9">
                                    <p style="margin:0;font-size:18px;">As emissões de longo prazo foram informadas ?</p>
                                </div>
                                <div class="col s3">

                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s2">
                                    <p>
                                        <input class="with-gap" name="q35" type="radio" value="true" id="q69" />
                                        <label for="q69">Sim</label>
                                    </p>
                                </div>
                                <div class="col s2">
                                    <p>
                                        <input class="with-gap" name="q35" type="radio" value="false" id="q70" />
                                        <label for="q70">Não</label>
                                    </p>
                                </div>
                                <div class="col s3 offset-s5">
                                    Sim
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <textarea  name="comment35" class="col s9" style="resize: none; height:60px; border: 2px #008491 solid;" name="comment1" id="q1c" cols="30" rows="20"></textarea>
                                <div class="col s3">
                                    <textarea disabled style="resize:none; border:0; height:60px;" name="" id="" cols="30" rows="10">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper 
                                    </textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="row" style="margin:0px;">
                                <div class="col s9">
                                    <p style="margin:0;font-size:18px;">As emissões diretas de CO2 de MUT foram incluídas e discriminadas ?</p>
                                </div>
                                <div class="col s3">

                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s2">
                                    <p>
                                        <input class="with-gap" name="q36" type="radio" value="true" id="q71" />
                                        <label for="q71">Sim</label>
                                    </p>
                                </div>
                                <div class="col s2">
                                    <p>
                                        <input class="with-gap" name="q36" type="radio" value="false" id="q72" />
                                        <label for="q72">Não</label>
                                    </p>
                                </div>
                                <div class="col s3 offset-s5">
                                    Sim
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <textarea  name="comment36" class="col s9" style="resize: none; height:60px; border: 2px #008491 solid;" name="comment1" id="q1c" cols="30" rows="20"></textarea>
                                <div class="col s3">
                                    <textarea disabled style="resize:none; border:0; height:60px;" name="" id="" cols="30" rows="10">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper 
                                    </textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="row" style="margin:0px;">
                                <div class="col s9">
                                    <p style="margin:0;font-size:18px;">Foram incluídos os dados do transporte ?</p>
                                </div>
                                <div class="col s3">

                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s2">
                                    <p>
                                        <input class="with-gap" name="q37" type="radio" value="true" id="q73" />
                                        <label for="q73">Sim</label>
                                    </p>
                                </div>
                                <div class="col s2">
                                    <p>
                                        <input class="with-gap" name="q37" type="radio" value="false" id="q74" />
                                        <label for="q74">Não</label>
                                    </p>
                                </div>
                                <div class="col s3 offset-s5">
                                    Sim
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <textarea  name="comment37" class="col s9" style="resize: none; height:60px; border: 2px #008491 solid;" name="comment1" id="q1c" cols="30" rows="20"></textarea>
                                <div class="col s3">
                                    <textarea disabled style="resize:none; border:0; height:60px;" name="" id="" cols="30" rows="10">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper 
                                    </textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="row" style="margin:0px;">
                                <div class="col s9">
                                    <p style="margin:0;font-size:18px;">Foram informados os dados faltantes ?</p>
                                </div>
                                <div class="col s3">

                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s2">
                                    <p>
                                        <input class="with-gap" name="q38" type="radio" value="true" id="q75" />
                                        <label for="q75">Sim</label>
                                    </p>
                                </div>
                                <div class="col s2">
                                    <p>
                                        <input class="with-gap" name="q38" type="radio" value="false" id="q76" />
                                        <label for="q76">Não</label>
                                    </p>
                                </div>
                                <div class="col s3 offset-s5">
                                    Sim
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <textarea  name="comment38" class="col s9" style="resize: none; height:60px; border: 2px #008491 solid;" name="comment1" id="q1c" cols="30" rows="20"></textarea>
                                <div class="col s3">
                                    <textarea disabled style="resize:none; border:0; height:60px;" name="" id="" cols="30" rows="10">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper 
                                    </textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="row" style="margin:0px;">
                                <div class="col s9">
                                    <p style="margin:0;font-size:18px;">Foram informados os tipos de dados para cada fluxo ?</p>
                                </div>
                                <div class="col s3">

                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s2">
                                    <p>
                                        <input class="with-gap" name="q39" type="radio" value="true" id="q77" />
                                        <label for="q77">Sim</label>
                                    </p>
                                </div>
                                <div class="col s2">
                                    <p>
                                        <input class="with-gap" name="q39" type="radio" value="false" id="q78" />
                                        <label for="q78">Não</label>
                                    </p>
                                </div>
                                <div class="col s3 offset-s5">
                                    Sim
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <textarea  name="comment39" class="col s9" style="resize: none; height:60px; border: 2px #008491 solid;" name="comment1" id="q1c" cols="30" rows="20"></textarea>
                                <div class="col s3">
                                    <textarea disabled style="resize:none; border:0; height:60px;" name="" id="" cols="30" rows="10">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper 
                                    </textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="row" style="margin:0px;">
                                <div class="col s9">
                                    <p style="margin:0;font-size:18px;">Foi informada a incerteza dos dados para cada fluxo ?</p>
                                </div>
                                <div class="col s3">

                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s2">
                                    <p>
                                        <input class="with-gap" name="q40" type="radio" value="true" id="q79" />
                                        <label for="q79">Sim</label>
                                    </p>
                                </div>
                                <div class="col s2">
                                    <p>
                                        <input class="with-gap" name="q40" type="radio" value="false" id="q80" />
                                        <label for="q80">Não</label>
                                    </p>
                                </div>
                                <div class="col s3 offset-s5">
                                    Sim
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <textarea  name="comment40" class="col s9" style="resize: none; height:60px; border: 2px #008491 solid;" name="comment1" id="q1c" cols="30" rows="20"></textarea>
                                <div class="col s3">
                                    <textarea disabled style="resize:none; border:0; height:60px;" name="" id="" cols="30" rows="10">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper 
                                    </textarea>
                                </div>
                            </div>
                        </div>
                        <hr class="hr-question" />
                        <div class="row">
                            <div class="col s9">
                                <h5 style="color:#006b7b">Requisitos de Revisão</h5>
                            </div>
                        </div>
                        <div class="row">
                            <div class="row" style="margin:0px;">
                                <div class="col s9">
                                    <p style="margin:0;font-size:18px;">Caso tenha havido revisão crítica de terceira parte, as informações necessárias foram fornecidas ?</p>
                                </div>
                                <div class="col s3">

                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s2">
                                    <p>
                                        <input class="with-gap" name="q41" type="radio" value="true" id="q81" />
                                        <label for="q81">Sim</label>
                                    </p>
                                </div>
                                <div class="col s2">
                                    <p>
                                        <input class="with-gap" name="q41" type="radio" value="false" id="q82" />
                                        <label for="q82">Não</label>
                                    </p>
                                </div>
                                <div class="col s3 offset-s5">
                                    Sim
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <textarea  name="comment41" class="col s9" style="resize: none; height:60px; border: 2px #008491 solid;" name="comment1" id="q1c" cols="30" rows="20"></textarea>
                                <div class="col s3">
                                    <textarea disabled style="resize:none; border:0; height:60px;" name="" id="" cols="30" rows="10">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper 
                                    </textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="row" style="margin:0px;">
                                <div class="col s9">
                                    <p style="margin:0;font-size:18px;">Se houve revisão crítica, o relatório da revisão pode ser disponibilizado para os revisores do SICV, junto com o conjunto de dados ?</p>
                                </div>
                                <div class="col s3">

                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s2">
                                    <p>
                                        <input class="with-gap" name="q42" type="radio" value="true" id="q83" />
                                        <label for="q83">Sim</label>
                                    </p>
                                </div>
                                <div class="col s2">
                                    <p>
                                        <input class="with-gap" name="q42" type="radio" value="false" id="q84" />
                                        <label for="q84">Não</label>
                                    </p>
                                </div>
                                <div class="col s3 offset-s5">
                                    Sim
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <textarea  name="comment42" class="col s9" style="resize: none; height:60px; border: 2px #008491 solid;" name="comment1" id="q1c" cols="30" rows="20"></textarea>
                                <div class="col s3">
                                    <textarea disabled style="resize:none; border:0; height:60px;" name="" id="" cols="30" rows="10">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper 
                                    </textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col s3">
                        <h5 style="color:#7c7c7c;">Salvo automaticamente</h5>
                        <div class="row">
                            23/08/2017 às 17h45
                        </div>
                        <div class="row">
                            <button onclick="enviar(1)" style="background-color:#27bec3;" class="btn col s6">Salvar e fechar</button>
                        </div>
                        <div class="row">
                            <p>
                                <input class="with-gap" name="group2" type="radio" id="test1" />
                                <label for="test1">aprovado</label>
                            </p>
                            <p>
                                <input class="with-gap" name="group2" type="radio" id="test2" />
                                <label for="test2">aprovado com correções</label>
                            </p>
                            <p>
                                <input class="with-gap" name="group2" type="radio" id="test3" />
                                <label for="test3">reprovado</label>
                            </p>
                        </div>
                        <div class="row">
                            <button onclick="enviar(2)" style="background-color:#006b7b;" class="btn col s6">SUBMETER</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <script type="application/javascript" src="<%=Strings.BASE%>/assets/jquery-3.2.1.min.js"></script>
        <script type="application/javascript" src="<%=Strings.BASE%>/assets/materialize/js/materialize.min.js"></script>
        <script>
                                function getData() {
                                    var data = {};
                                    $("form").serializeArray().map(function (x) {
                                        data[x.name] = x.value;
                                    });
                                    return data;
                                }
                                function enviar(tipo) {
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
                                        
                                        var input2 = $("<input />")
                                                .attr("type", "hidden")
                                                .attr("name", "tipo").val(tipo);
                                        $('form').append($(input2));
                                    });
                                }
                                $(document).ready(function () {
                                    
                                });
        </script>
    </body>

</html>