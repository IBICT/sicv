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
                //margin: 10px 50px;
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
                                <input class="with-gap" name="q1" type="radio" id="q1y" />
                                <label for="q1">Sim</label>
                            </p>
                        </div>
                        <div class="col s2">
                            <p>
                                <input class="with-gap" name="q1" type="radio" id="q2n" />
                                <label for="q1">Não</label>
                            </p>
                        </div>
                        <div class="col s3 offset-s5">
                            Não
                        </div>
                    </div>
                    <div class="row" style="margin:0px;">
                        <textarea class="col s9" style="resize: none; height:60px; border: 2px #008491 solid;" name="comment1" id="q1c" cols="30" rows="20"></textarea>
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
                                <input class="with-gap" name="q2" type="radio" id="q1y" />
                                <label for="q2">Sim</label>
                            </p>
                        </div>
                        <div class="col s2">
                            <p>
                                <input class="with-gap" name="q2" type="radio" id="q2n" />
                                <label for="q2">Não</label>
                            </p>
                        </div>
                        <div class="col s3 offset-s5">
                            Sim
                        </div>
                    </div>
                    <div class="row" style="margin:0px;">
                        <textarea class="col s9" style="resize: none; height:60px; border: 2px #008491 solid;" name="comment1" id="q1c" cols="30" rows="20"></textarea>
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
                                <input class="with-gap" name="q3" type="radio" id="q1y" />
                                <label for="q3">Sim</label>
                            </p>
                        </div>
                        <div class="col s2">
                            <p>
                                <input class="with-gap" name="q3" type="radio" id="q2n" />
                                <label for="q3">Não</label>
                            </p>
                        </div>
                        <div class="col s3 offset-s5">
                            Sim
                        </div>
                    </div>
                    <div class="row" style="margin:0px;">
                        <textarea class="col s9" style="resize: none; height:60px; border: 2px #008491 solid;" name="comment1" id="q1c" cols="30" rows="20"></textarea>
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
                                <input class="with-gap" name="q4" type="radio" id="q1y" />
                                <label for="q1y">Sim</label>
                            </p>
                        </div>
                        <div class="col s2">
                            <p>
                                <input class="with-gap" name="q4" type="radio" id="q2n" />
                                <label for="q2n">Não</label>
                            </p>
                        </div>
                        <div class="col s3 offset-s5">
                            Sim
                        </div>
                    </div>
                    <div class="row" style="margin:0px;">
                        <textarea class="col s9" style="resize: none; height:60px; border: 2px #008491 solid;" name="comment1" id="q1c" cols="30" rows="20"></textarea>
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
                                <input class="with-gap" name="q5" type="radio" id="q1y" />
                                <label for="q1y">Sim</label>
                            </p>
                        </div>
                        <div class="col s2">
                            <p>
                                <input class="with-gap" name="q5" type="radio" id="q2n" />
                                <label for="q2n">Não</label>
                            </p>
                        </div>
                        <div class="col s3 offset-s5">
                            Sim
                        </div>
                    </div>
                    <div class="row" style="margin:0px;">
                        <textarea class="col s9" style="resize: none; height:60px; border: 2px #008491 solid;" name="comment1" id="q1c" cols="30" rows="20"></textarea>
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
                                <input class="with-gap" name="q6" type="radio" id="q1y" />
                                <label for="q1y">Sim</label>
                            </p>
                        </div>
                        <div class="col s2">
                            <p>
                                <input class="with-gap" name="q6" type="radio" id="q2n" />
                                <label for="q2n">Não</label>
                            </p>
                        </div>
                        <div class="col s3 offset-s5">
                            Sim
                        </div>
                    </div>
                    <div class="row" style="margin:0px;">
                        <textarea class="col s9" style="resize: none; height:60px; border: 2px #008491 solid;" name="comment1" id="q1c" cols="30" rows="20"></textarea>
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
                                <input class="with-gap" name="q7" type="radio" id="q1y" />
                                <label for="q1y">Sim</label>
                            </p>
                        </div>
                        <div class="col s2">
                            <p>
                                <input class="with-gap" name="q7" type="radio" id="q2n" />
                                <label for="q2n">Não</label>
                            </p>
                        </div>
                        <div class="col s3 offset-s5">
                            Sim
                        </div>
                    </div>
                    <div class="row" style="margin:0px;">
                        <textarea class="col s9" style="resize: none; height:60px; border: 2px #008491 solid;" name="comment1" id="q1c" cols="30" rows="20"></textarea>
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
                                <input class="with-gap" name="q8" type="radio" id="q1y" />
                                <label for="q1y">Sim</label>
                            </p>
                        </div>
                        <div class="col s2">
                            <p>
                                <input class="with-gap" name="q8" type="radio" id="q2n" />
                                <label for="q2n">Não</label>
                            </p>
                        </div>
                        <div class="col s3 offset-s5">
                            Sim
                        </div>
                    </div>
                    <div class="row" style="margin:0px;">
                        <textarea class="col s9" style="resize: none; height:60px; border: 2px #008491 solid;" name="comment1" id="q1c" cols="30" rows="20"></textarea>
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
                                <input class="with-gap" name="q9" type="radio" id="q1y" />
                                <label for="q1y">Sim</label>
                            </p>
                        </div>
                        <div class="col s2">
                            <p>
                                <input class="with-gap" name="q9" type="radio" id="q2n" />
                                <label for="q2n">Não</label>
                            </p>
                        </div>
                        <div class="col s3 offset-s5">
                            Sim
                        </div>
                    </div>
                    <div class="row" style="margin:0px;">
                        <textarea class="col s9" style="resize: none; height:60px; border: 2px #008491 solid;" name="comment1" id="q1c" cols="30" rows="20"></textarea>
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
                                <input class="with-gap" name="q10" type="radio" id="q1y" />
                                <label for="q1y">Sim</label>
                            </p>
                        </div>
                        <div class="col s2">
                            <p>
                                <input class="with-gap" name="q10" type="radio" id="q2n" />
                                <label for="q2n">Não</label>
                            </p>
                        </div>
                        <div class="col s3 offset-s5">
                            Sim
                        </div>
                    </div>
                    <div class="row" style="margin:0px;">
                        <textarea class="col s9" style="resize: none; height:60px; border: 2px #008491 solid;" name="comment1" id="q1c" cols="30" rows="20"></textarea>
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
                                <input class="with-gap" name="q11" type="radio" id="q1y" />
                                <label for="q1y">Sim</label>
                            </p>
                        </div>
                        <div class="col s2">
                            <p>
                                <input class="with-gap" name="q11" type="radio" id="q2n" />
                                <label for="q2n">Não</label>
                            </p>
                        </div>
                        <div class="col s3 offset-s5">
                            Sim
                        </div>
                    </div>
                    <div class="row" style="margin:0px;">
                        <textarea class="col s9" style="resize: none; height:60px; border: 2px #008491 solid;" name="comment1" id="q1c" cols="30" rows="20"></textarea>
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
                                <input class="with-gap" name="q12" type="radio" id="q1y" />
                                <label for="q1y">Sim</label>
                            </p>
                        </div>
                        <div class="col s2">
                            <p>
                                <input class="with-gap" name="q12" type="radio" id="q2n" />
                                <label for="q2n">Não</label>
                            </p>
                        </div>
                        <div class="col s3 offset-s5">
                            Sim
                        </div>
                    </div>
                    <div class="row" style="margin:0px;">
                        <textarea class="col s9" style="resize: none; height:60px; border: 2px #008491 solid;" name="comment1" id="q1c" cols="30" rows="20"></textarea>
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
                                <input class="with-gap" name="q13" type="radio" id="q1y" />
                                <label for="q1y">Sim</label>
                            </p>
                        </div>
                        <div class="col s2">
                            <p>
                                <input class="with-gap" name="q13" type="radio" id="q2n" />
                                <label for="q2n">Não</label>
                            </p>
                        </div>
                        <div class="col s3 offset-s5">
                            Sim
                        </div>
                    </div>
                    <div class="row" style="margin:0px;">
                        <textarea class="col s9" style="resize: none; height:60px; border: 2px #008491 solid;" name="comment1" id="q1c" cols="30" rows="20"></textarea>
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
                                <input class="with-gap" name="q14" type="radio" id="q1y" />
                                <label for="q1y">Sim</label>
                            </p>
                        </div>
                        <div class="col s2">
                            <p>
                                <input class="with-gap" name="q14" type="radio" id="q2n" />
                                <label for="q2n">Não</label>
                            </p>
                        </div>
                        <div class="col s3 offset-s5">
                            Sim
                        </div>
                    </div>
                    <div class="row" style="margin:0px;">
                        <textarea class="col s9" style="resize: none; height:60px; border: 2px #008491 solid;" name="comment1" id="q1c" cols="30" rows="20"></textarea>
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
                                <input class="with-gap" name="q15" type="radio" id="q1y" />
                                <label for="q1y">Sim</label>
                            </p>
                        </div>
                        <div class="col s2">
                            <p>
                                <input class="with-gap" name="q15" type="radio" id="q2n" />
                                <label for="q2n">Não</label>
                            </p>
                        </div>
                        <div class="col s3 offset-s5">
                            Sim
                        </div>
                    </div>
                    <div class="row" style="margin:0px;">
                        <textarea class="col s9" style="resize: none; height:60px; border: 2px #008491 solid;" name="comment1" id="q1c" cols="30" rows="20"></textarea>
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
                                <input class="with-gap" name="q16" type="radio" id="q1y" />
                                <label for="q1y">Sim</label>
                            </p>
                        </div>
                        <div class="col s2">
                            <p>
                                <input class="with-gap" name="q16" type="radio" id="q2n" />
                                <label for="q2n">Não</label>
                            </p>
                        </div>
                        <div class="col s3 offset-s5">
                            Sim
                        </div>
                    </div>
                    <div class="row" style="margin:0px;">
                        <textarea class="col s9" style="resize: none; height:60px; border: 2px #008491 solid;" name="comment1" id="q1c" cols="30" rows="20"></textarea>
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
                                <input class="with-gap" name="q17" type="radio" id="q1y" />
                                <label for="q1y">Sim</label>
                            </p>
                        </div>
                        <div class="col s2">
                            <p>
                                <input class="with-gap" name="q17" type="radio" id="q2n" />
                                <label for="q2n">Não</label>
                            </p>
                        </div>
                        <div class="col s3 offset-s5">
                            Sim
                        </div>
                    </div>
                    <div class="row" style="margin:0px;">
                        <textarea class="col s9" style="resize: none; height:60px; border: 2px #008491 solid;" name="comment1" id="q1c" cols="30" rows="20"></textarea>
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
                                <input class="with-gap" name="q18" type="radio" id="q1y" />
                                <label for="q1y">Sim</label>
                            </p>
                        </div>
                        <div class="col s2">
                            <p>
                                <input class="with-gap" name="q18" type="radio" id="q2n" />
                                <label for="q2n">Não</label>
                            </p>
                        </div>
                        <div class="col s3 offset-s5">
                            Sim
                        </div>
                    </div>
                    <div class="row" style="margin:0px;">
                        <textarea class="col s9" style="resize: none; height:60px; border: 2px #008491 solid;" name="comment1" id="q1c" cols="30" rows="20"></textarea>
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
                                <input class="with-gap" name="q19" type="radio" id="q1y" />
                                <label for="q1y">Sim</label>
                            </p>
                        </div>
                        <div class="col s2">
                            <p>
                                <input class="with-gap" name="q19" type="radio" id="q2n" />
                                <label for="q2n">Não</label>
                            </p>
                        </div>
                        <div class="col s3 offset-s5">
                            Sim
                        </div>
                    </div>
                    <div class="row" style="margin:0px;">
                        <textarea class="col s9" style="resize: none; height:60px; border: 2px #008491 solid;" name="comment1" id="q1c" cols="30" rows="20"></textarea>
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
                                <input class="with-gap" name="q20" type="radio" id="q1y" />
                                <label for="q1y">Sim</label>
                            </p>
                        </div>
                        <div class="col s2">
                            <p>
                                <input class="with-gap" name="q20" type="radio" id="q2n" />
                                <label for="q2n">Não</label>
                            </p>
                        </div>
                        <div class="col s3 offset-s5">
                            Sim
                        </div>
                    </div>
                    <div class="row" style="margin:0px;">
                        <textarea class="col s9" style="resize: none; height:60px; border: 2px #008491 solid;" name="comment1" id="q1c" cols="30" rows="20"></textarea>
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
                                <input class="with-gap" name="q21" type="radio" id="q1y" />
                                <label for="q1y">Sim</label>
                            </p>
                        </div>
                        <div class="col s2">
                            <p>
                                <input class="with-gap" name="q21" type="radio" id="q2n" />
                                <label for="q2n">Não</label>
                            </p>
                        </div>
                        <div class="col s3 offset-s5">
                            Sim
                        </div>
                    </div>
                    <div class="row" style="margin:0px;">
                        <textarea class="col s9" style="resize: none; height:60px; border: 2px #008491 solid;" name="comment1" id="q1c" cols="30" rows="20"></textarea>
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
                                <input class="with-gap" name="q22" type="radio" id="q1y" />
                                <label for="q1y">Sim</label>
                            </p>
                        </div>
                        <div class="col s2">
                            <p>
                                <input class="with-gap" name="q22" type="radio" id="q2n" />
                                <label for="q2n">Não</label>
                            </p>
                        </div>
                        <div class="col s3 offset-s5">
                            Sim
                        </div>
                    </div>
                    <div class="row" style="margin:0px;">
                        <textarea class="col s9" style="resize: none; height:60px; border: 2px #008491 solid;" name="comment1" id="q1c" cols="30" rows="20"></textarea>
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
                                <input class="with-gap" name="q23" type="radio" id="q1y" />
                                <label for="q1y">Sim</label>
                            </p>
                        </div>
                        <div class="col s2">
                            <p>
                                <input class="with-gap" name="q23" type="radio" id="q2n" />
                                <label for="q2n">Não</label>
                            </p>
                        </div>
                        <div class="col s3 offset-s5">
                            Sim
                        </div>
                    </div>
                    <div class="row" style="margin:0px;">
                        <textarea class="col s9" style="resize: none; height:60px; border: 2px #008491 solid;" name="comment1" id="q1c" cols="30" rows="20"></textarea>
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
                                <input class="with-gap" name="q24" type="radio" id="q1y" />
                                <label for="q1y">Sim</label>
                            </p>
                        </div>
                        <div class="col s2">
                            <p>
                                <input class="with-gap" name="q24" type="radio" id="q2n" />
                                <label for="q2n">Não</label>
                            </p>
                        </div>
                        <div class="col s3 offset-s5">
                            Sim
                        </div>
                    </div>
                    <div class="row" style="margin:0px;">
                        <textarea class="col s9" style="resize: none; height:60px; border: 2px #008491 solid;" name="comment1" id="q1c" cols="30" rows="20"></textarea>
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
                                <input class="with-gap" name="q25" type="radio" id="q1y" />
                                <label for="q1y">Sim</label>
                            </p>
                        </div>
                        <div class="col s2">
                            <p>
                                <input class="with-gap" name="q25" type="radio" id="q2n" />
                                <label for="q2n">Não</label>
                            </p>
                        </div>
                        <div class="col s3 offset-s5">
                            Sim
                        </div>
                    </div>
                    <div class="row" style="margin:0px;">
                        <textarea class="col s9" style="resize: none; height:60px; border: 2px #008491 solid;" name="comment1" id="q1c" cols="30" rows="20"></textarea>
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
                                <input class="with-gap" name="q26" type="radio" id="q1y" />
                                <label for="q1y">Sim</label>
                            </p>
                        </div>
                        <div class="col s2">
                            <p>
                                <input class="with-gap" name="q26" type="radio" id="q2n" />
                                <label for="q2n">Não</label>
                            </p>
                        </div>
                        <div class="col s3 offset-s5">
                            Sim
                        </div>
                    </div>
                    <div class="row" style="margin:0px;">
                        <textarea class="col s9" style="resize: none; height:60px; border: 2px #008491 solid;" name="comment1" id="q1c" cols="30" rows="20"></textarea>
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
                                <input class="with-gap" name="q27" type="radio" id="q1y" />
                                <label for="q1y">Sim</label>
                            </p>
                        </div>
                        <div class="col s2">
                            <p>
                                <input class="with-gap" name="q27" type="radio" id="q2n" />
                                <label for="q2n">Não</label>
                            </p>
                        </div>
                        <div class="col s3 offset-s5">
                            Sim
                        </div>
                    </div>
                    <div class="row" style="margin:0px;">
                        <textarea class="col s9" style="resize: none; height:60px; border: 2px #008491 solid;" name="comment1" id="q1c" cols="30" rows="20"></textarea>
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
                                <input class="with-gap" name="q28" type="radio" id="q1y" />
                                <label for="q1y">Sim</label>
                            </p>
                        </div>
                        <div class="col s2">
                            <p>
                                <input class="with-gap" name="q28" type="radio" id="q2n" />
                                <label for="q2n">Não</label>
                            </p>
                        </div>
                        <div class="col s3 offset-s5">
                            Sim
                        </div>
                    </div>
                    <div class="row" style="margin:0px;">
                        <textarea class="col s9" style="resize: none; height:60px; border: 2px #008491 solid;" name="comment1" id="q1c" cols="30" rows="20"></textarea>
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
                                <input class="with-gap" name="q29" type="radio" id="q1y" />
                                <label for="q1y">Sim</label>
                            </p>
                        </div>
                        <div class="col s2">
                            <p>
                                <input class="with-gap" name="q29" type="radio" id="q2n" />
                                <label for="q2n">Não</label>
                            </p>
                        </div>
                        <div class="col s3 offset-s5">
                            Sim
                        </div>
                    </div>
                    <div class="row" style="margin:0px;">
                        <textarea class="col s9" style="resize: none; height:60px; border: 2px #008491 solid;" name="comment1" id="q1c" cols="30" rows="20"></textarea>
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
                                <input class="with-gap" name="q30" type="radio" id="q1y" />
                                <label for="q1y">Sim</label>
                            </p>
                        </div>
                        <div class="col s2">
                            <p>
                                <input class="with-gap" name="q30" type="radio" id="q2n" />
                                <label for="q2n">Não</label>
                            </p>
                        </div>
                        <div class="col s3 offset-s5">
                            Sim
                        </div>
                    </div>
                    <div class="row" style="margin:0px;">
                        <textarea class="col s9" style="resize: none; height:60px; border: 2px #008491 solid;" name="comment1" id="q1c" cols="30" rows="20"></textarea>
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
                                <input class="with-gap" name="q31" type="radio" id="q1y" />
                                <label for="q1y">Sim</label>
                            </p>
                        </div>
                        <div class="col s2">
                            <p>
                                <input class="with-gap" name="q31" type="radio" id="q2n" />
                                <label for="q2n">Não</label>
                            </p>
                        </div>
                        <div class="col s3 offset-s5">
                            Sim
                        </div>
                    </div>
                    <div class="row" style="margin:0px;">
                        <textarea class="col s9" style="resize: none; height:60px; border: 2px #008491 solid;" name="comment1" id="q1c" cols="30" rows="20"></textarea>
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
                                <input class="with-gap" name="q32" type="radio" id="q1y" />
                                <label for="q1y">Sim</label>
                            </p>
                        </div>
                        <div class="col s2">
                            <p>
                                <input class="with-gap" name="q32" type="radio" id="q2n" />
                                <label for="q2n">Não</label>
                            </p>
                        </div>
                        <div class="col s3 offset-s5">
                            Sim
                        </div>
                    </div>
                    <div class="row" style="margin:0px;">
                        <textarea class="col s9" style="resize: none; height:60px; border: 2px #008491 solid;" name="comment1" id="q1c" cols="30" rows="20"></textarea>
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
                                <input class="with-gap" name="q33" type="radio" id="q1y" />
                                <label for="q1y">Sim</label>
                            </p>
                        </div>
                        <div class="col s2">
                            <p>
                                <input class="with-gap" name="q33" type="radio" id="q2n" />
                                <label for="q2n">Não</label>
                            </p>
                        </div>
                        <div class="col s3 offset-s5">
                            Sim
                        </div>
                    </div>
                    <div class="row" style="margin:0px;">
                        <textarea class="col s9" style="resize: none; height:60px; border: 2px #008491 solid;" name="comment1" id="q1c" cols="30" rows="20"></textarea>
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
                                <input class="with-gap" name="q34" type="radio" id="q1y" />
                                <label for="q1y">Sim</label>
                            </p>
                        </div>
                        <div class="col s2">
                            <p>
                                <input class="with-gap" name="q34" type="radio" id="q2n" />
                                <label for="q2n">Não</label>
                            </p>
                        </div>
                        <div class="col s3 offset-s5">
                            Sim
                        </div>
                    </div>
                    <div class="row" style="margin:0px;">
                        <textarea class="col s9" style="resize: none; height:60px; border: 2px #008491 solid;" name="comment1" id="q1c" cols="30" rows="20"></textarea>
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
                                <input class="with-gap" name="q35" type="radio" id="q1y" />
                                <label for="q1y">Sim</label>
                            </p>
                        </div>
                        <div class="col s2">
                            <p>
                                <input class="with-gap" name="q35" type="radio" id="q2n" />
                                <label for="q2n">Não</label>
                            </p>
                        </div>
                        <div class="col s3 offset-s5">
                            Sim
                        </div>
                    </div>
                    <div class="row" style="margin:0px;">
                        <textarea class="col s9" style="resize: none; height:60px; border: 2px #008491 solid;" name="comment1" id="q1c" cols="30" rows="20"></textarea>
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
                                <input class="with-gap" name="q36" type="radio" id="q1y" />
                                <label for="q1y">Sim</label>
                            </p>
                        </div>
                        <div class="col s2">
                            <p>
                                <input class="with-gap" name="q36" type="radio" id="q2n" />
                                <label for="q2n">Não</label>
                            </p>
                        </div>
                        <div class="col s3 offset-s5">
                            Sim
                        </div>
                    </div>
                    <div class="row" style="margin:0px;">
                        <textarea class="col s9" style="resize: none; height:60px; border: 2px #008491 solid;" name="comment1" id="q1c" cols="30" rows="20"></textarea>
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
                                <input class="with-gap" name="q37" type="radio" id="q1y" />
                                <label for="q1y">Sim</label>
                            </p>
                        </div>
                        <div class="col s2">
                            <p>
                                <input class="with-gap" name="q37" type="radio" id="q2n" />
                                <label for="q2n">Não</label>
                            </p>
                        </div>
                        <div class="col s3 offset-s5">
                            Sim
                        </div>
                    </div>
                    <div class="row" style="margin:0px;">
                        <textarea class="col s9" style="resize: none; height:60px; border: 2px #008491 solid;" name="comment1" id="q1c" cols="30" rows="20"></textarea>
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
                                <input class="with-gap" name="q38" type="radio" id="q1y" />
                                <label for="q1y">Sim</label>
                            </p>
                        </div>
                        <div class="col s2">
                            <p>
                                <input class="with-gap" name="q38" type="radio" id="q2n" />
                                <label for="q2n">Não</label>
                            </p>
                        </div>
                        <div class="col s3 offset-s5">
                            Sim
                        </div>
                    </div>
                    <div class="row" style="margin:0px;">
                        <textarea class="col s9" style="resize: none; height:60px; border: 2px #008491 solid;" name="comment1" id="q1c" cols="30" rows="20"></textarea>
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
                                <input class="with-gap" name="q39" type="radio" id="q1y" />
                                <label for="q1y">Sim</label>
                            </p>
                        </div>
                        <div class="col s2">
                            <p>
                                <input class="with-gap" name="q39" type="radio" id="q2n" />
                                <label for="q2n">Não</label>
                            </p>
                        </div>
                        <div class="col s3 offset-s5">
                            Sim
                        </div>
                    </div>
                    <div class="row" style="margin:0px;">
                        <textarea class="col s9" style="resize: none; height:60px; border: 2px #008491 solid;" name="comment1" id="q1c" cols="30" rows="20"></textarea>
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
                                <input class="with-gap" name="q40" type="radio" id="q1y" />
                                <label for="q1y">Sim</label>
                            </p>
                        </div>
                        <div class="col s2">
                            <p>
                                <input class="with-gap" name="q40" type="radio" id="q2n" />
                                <label for="q2n">Não</label>
                            </p>
                        </div>
                        <div class="col s3 offset-s5">
                            Sim
                        </div>
                    </div>
                    <div class="row" style="margin:0px;">
                        <textarea class="col s9" style="resize: none; height:60px; border: 2px #008491 solid;" name="comment1" id="q1c" cols="30" rows="20"></textarea>
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
                                <input class="with-gap" name="q41" type="radio" id="q1y" />
                                <label for="q1y">Sim</label>
                            </p>
                        </div>
                        <div class="col s2">
                            <p>
                                <input class="with-gap" name="q41" type="radio" id="q2n" />
                                <label for="q2n">Não</label>
                            </p>
                        </div>
                        <div class="col s3 offset-s5">
                            Sim
                        </div>
                    </div>
                    <div class="row" style="margin:0px;">
                        <textarea class="col s9" style="resize: none; height:60px; border: 2px #008491 solid;" name="comment1" id="q1c" cols="30" rows="20"></textarea>
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
                                <input class="with-gap" name="q42" type="radio" id="q1y" />
                                <label for="q1y">Sim</label>
                            </p>
                        </div>
                        <div class="col s2">
                            <p>
                                <input class="with-gap" name="q42" type="radio" id="q2n" />
                                <label for="q2n">Não</label>
                            </p>
                        </div>
                        <div class="col s3 offset-s5">
                            Sim
                        </div>
                    </div>
                    <div class="row" style="margin:0px;">
                        <textarea class="col s9" style="resize: none; height:60px; border: 2px #008491 solid;" name="comment1" id="q1c" cols="30" rows="20"></textarea>
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
                    <button style="background-color:#27bec3;" class="btn col s6">Salvar e fechar</button>
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
                    <button style="background-color:#006b7b;" class="btn col s6">SUBMETER</button>
                </div>
            </div>
        </div>
    </div>
        <script type="application/javascript" src="<%=Strings.BASE%>/assets/jquery-3.2.1.min.js"></script>
        <script type="application/javascript" src="<%=Strings.BASE%>/assets/materialize/js/materialize.min.js"></script>

    </body>

</html>