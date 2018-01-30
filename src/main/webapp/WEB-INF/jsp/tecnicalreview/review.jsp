<%@page import="br.com.ibict.acv.sicv.model.Homologacao"%>
<%@page import="java.util.Calendar"%>
<%@page import="br.com.ibict.acv.sicv.model.Ilcd"%>
<%@page import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@page import="resources.Strings"%>
<%@page import="br.com.ibict.acv.sicv.model.User"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String base = Strings.BASE;
    pageContext.setAttribute("base", base);
%>
<c:set var="link" value="${base}/authorIlcd" />
<sec:authorize access="hasAuthority('USER')" var="isUser" />

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

        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" href="<%=Strings.BASE%>/assets/font/font-awesome/css/font-awesome.min.css">
        <link href="<%=Strings.BASE%>/assets/bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="<%=Strings.BASE%>/assets/materialize/css/materialize2.css">

        <style>
            html {
                font-family: 'Titillium Web', "Roboto", sans-serif;
            }
            .hr-question {
                border-top: 1px dashed #008692;
                border-bottom: 0;
                color: #fff;
                background-color: #fff;
                height: 4px;
            }
            .file-field .file-path-wrapper {
                overflow: hidden;
                padding-left: 0;
                margin-bottom: 0;
                padding-right: 130px;
            }

            .file-field input.file-path {
                margin-bottom: 0;
                border: 1px solid #6B6B6B;
                padding-bottom: 0;
                padding-left: 10px;
            }
            .file-field .btn {
                background-color: #00697C;
                border-radius: 0;
                padding-bottom: 0px;
                height: 3.1rem;
            }
            input[type="text"].valid:not(.browser-default) {
                border: 1px solid #6B6B6B;
            }

        </style>
    </head>

    <body>

        <jsp:include page="/WEB-INF/jsp/partials/nav.jsp"/>
        <div class="headerDiv">
            <jsp:include page="/WEB-INF/jsp/partials/header.jsp" />
        </div>

        <div class="principalDiv">

            <div class="row">
                <form method="post" enctype="multipart/form-data">
                    <div class="row">
                        <div class="row">
                            <div class="col s6">
                                <div style="color: #00697C; font-size: 27px;">
                                    Check list Qualidata
                                </div>
                                <hr />
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
                                        <p style="margin:0;font-size:18px;">Introdução</p>
                                    </div>
                                    <div class="col s3">

                                    </div>
                                </div>
                                <div class="row" style="margin:0px;">
                                    <textarea name="comment1" class="col s6" style="resize: none; height:60px; border: 2px #008491 solid;" id="q1c" cols="30" rows="20">${qualiData1.comment1}</textarea>
                                    <div class="col s6">
                                        <textarea disabled style="resize:none; border:0; height:60px;" name="" id="" cols="30" rows="10"></textarea>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="row" style="margin:0px;">
                                    <div class="col s9">
                                        <p style="margin:0;font-size:18px;">Relatório</p>
                                    </div>
                                    <div class="col s3">

                                    </div>
                                </div>
                                <div class="row" style="margin:0px;">
                                    <textarea name="comment2" class="col s6" style="resize: none; height:60px; border: 2px #008491 solid;" id="q1c" cols="30" rows="20">${qualiData1.comment2}</textarea>
                                    <div class="col s6">
                                        <textarea disabled style="resize:none; border:0; height:60px;" name="" id="" cols="30" rows="10">
                                        </textarea>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="row" style="margin:0px;">
                                    <div class="col s9">
                                        <p style="margin:0;font-size:18px;">Conclusão</p>
                                    </div>
                                    <div class="col s3">

                                    </div>
                                </div>
                                <div class="row" style="margin:0px;">
                                    <textarea name="comment3" class="col s6" style="resize: none; height:60px; border: 2px #008491 solid;" id="q1c" cols="30" rows="20">${qualiData1.comment3}</textarea>
                                    <div class="col s6">
                                        <textarea disabled style="resize:none; border:0; height:60px;" name="" id="" cols="30" rows="10"> 
                                        </textarea>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col s6">
                                    Anexar arquivo complementar
                                </div>
                            </div>
                            <div class="row">
                                <div class="row" style="margin:0px;">
                                    <div class="col s9" style="padding-left: 0;">
                                        <div class="file-field input-field">
                                            <div class="btn z-depth-0">
                                                <span>Escolher arquivo</span>
                                                <input type="file" name="file">
                                            </div>
                                            <div class="file-path-wrapper">
                                                <input class="file-path validate" type="text">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col s3">
                            <h5 style="color:#7c7c7c;">Salvo automaticamente</h5>
                            <div class="row">
                                <fmt:formatDate value="${status.endDate}" pattern="dd/MM/yyyy 'às' hh'h'mm"/>
                            </div>
                            <div class="row">
                                <button onclick="enviar(1)" style="background-color:#27bec3;" class="btn col s12">Salvar e fechar</button>
                            </div>
                            <div class="row">
                                <p>
                                    <input class="with-gap" name="resultado" value="1" type="radio" id="test1" />
                                    <label for="test1">aprovado</label>
                                </p>
                                <p>
                                    <input class="with-gap" name="resultado" value="2" type="radio" id="test2" />
                                    <label for="test2">aprovado com correções</label>
                                </p>
                                <p>
                                    <input class="with-gap" name="resultado" value="3" type="radio" id="test3" />
                                    <label for="test3">reprovado</label>
                                </p>
                            </div>
                            <div class="row">
                                <button onclick="enviar(2)" style="background-color:#006b7b;" class="btn col s12">SUBMETER</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <script type="application/javascript" src="<%=Strings.BASE%>/assets/jquery-3.2.1.min.js"></script>
        <script type="application/javascript" src="<%=Strings.BASE%>/assets/materialize/js/materialize.min.js"></script>
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
                                            data['id'] = ${not empty qualiData1.id ? qualiData1.id:'null'};
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