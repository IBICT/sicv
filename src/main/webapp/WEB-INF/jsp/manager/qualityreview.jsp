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
        <link rel="stylesheet" href="<%=Strings.BASE%>/assets/materialize/css/materialize.min.css">

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
            
            .question {
                font-weight: bold;
            }
            
            .response {
                color : #6B6B6A;
                font-size: 15px;
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
                <div class="row">
                    <div class="row">
                        <div class="col s6">
                            <div style="color: #00697C; font-size: 27px;">
                                Check list Qualidata
                            </div>
                            <hr />
                        </div>
                    </div>
                    <div class="col s12">
                        <div class="row">
                            <div class="col s9">
                                <h5 style="color:#006b7b">Requisitos gerais </h5>
                            </div>

                        </div>
                        <div class="row">
                            <div class="row" style="margin:0px;">
                                <div class="col s12">
                                    <p class="question" style="margin:0;font-size:18px;">O conjunto de dados está em inglês?</p>
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s2">
                                    <p>
                                        <input ${qualiData.q1 ? "checked":""} disabled class="with-gap" name="q1" value="true" type="radio" id="q1" />
                                        <label for="q1">Sim</label>
                                    </p>
                                </div>
                                <div class="col s2">
                                    <p>
                                        <input ${not empty qualiData.q1 and not qualiData.q1 ? "checked":""} disabled class="with-gap" name="q1" value="false" type="radio" id="q2" />
                                        <label for="q2">Não</label>
                                    </p>
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s12">
                                    <textarea class="response" disabled style="resize:none; border:0; height:60px;" name="" id="" cols="30" rows="10">${qualiData.comment1}</textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="row" style="margin:0px;">
                                <div class="col s12">
                                    <p class="question" style="margin:0;font-size:18px;">A identificação do conjunto de dados segue o padrão Nome do produto_tecnologia_outra especificação?</p>
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s2">
                                    <p>
                                        <input ${qualiData.q2 ? "checked":""} disabled class="with-gap" name="q2" value="true" type="radio" id="q3" />
                                        <label for="q3">Sim</label>
                                    </p>
                                </div>
                                <div class="col s2">
                                    <p>
                                        <input ${not empty qualiData.q2 and not qualiData.q2 ? "checked":""} disabled class="with-gap" name="q2" value="false" type="radio" id="q4" />
                                        <label for="q4">Não</label>
                                    </p>
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s12">
                                    <textarea class="response" disabled style="resize:none; border:0; height:60px;" name="" id="" cols="30" rows="10">${qualiData.comment2}</textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="row" style="margin:0px;">
                                <div class="col s12">
                                    <p class="question" style="margin:0;font-size:18px;">As citações e referências estão completas ?</p>
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s2">
                                    <p>
                                        <input ${qualiData.q3 ? "checked":""} disabled class="with-gap" name="q3" value="true" type="radio" id="q5" />
                                        <label for="q5">Sim</label>
                                    </p>
                                </div>
                                <div class="col s2">
                                    <p>
                                        <input ${not empty qualiData.q3 and not qualiData.q3 ? "checked":""} disabled class="with-gap" name="q3" value="false" type="radio" id="q6" />
                                        <label for="q6">Não</label>
                                    </p>
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s12">
                                    <textarea class="response" disabled style="resize:none; border:0; height:60px;" name="" id="" cols="30" rows="10">${qualiData.comment3}</textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="row" style="margin:0px;">
                                <div class="col s12">
                                    <p class="question" style="margin:0;font-size:18px;">Os campos de administração são informados ?</p>
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s2">
                                    <p>
                                        <input ${qualiData.q4 ? "checked":""} disabled class="with-gap" name="q4" value="true" type="radio" id="q7" />
                                        <label for="q7">Sim</label>
                                    </p>
                                </div>
                                <div class="col s2">
                                    <p>
                                        <input ${not empty qualiData.q4 and not qualiData.q4 ? "checked":""} disabled class="with-gap" name="q4" value="false" type="radio" id="q8" />
                                        <label for="q8">Não</label>
                                    </p>
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s12">
                                    <textarea class="response" disabled style="resize:none; border:0; height:60px;" name="" id="" cols="30" rows="10">${qualiData.comment4}</textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="row" style="margin:0px;">
                                <div class="col s12">
                                    <p class="question" style="margin:0;font-size:18px;">É informada a cobertura temporal do conjunto de dados ?</p>
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s2">
                                    <p>
                                        <input ${qualiData.q5 ? "checked":""} disabled class="with-gap" name="q5" value="true" type="radio" id="q9" />
                                        <label for="q9">Sim</label>
                                    </p>
                                </div>
                                <div class="col s2">
                                    <p>
                                        <input ${not empty qualiData.q5 and not qualiData.q5 ? "checked":""} disabled class="with-gap" name="q5" value="false" type="radio" id="q10" />
                                        <label for="q10">Não</label>
                                    </p>
                                </div>

                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s12">
                                    <textarea class="response" disabled style="resize:none; border:0; height:60px;" name="" id="" cols="30" rows="10">${qualiData.comment5}</textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="row" style="margin:0px;">
                                <div class="col s12">
                                    <p class="question" style="margin:0;font-size:18px;">É informado o período de validade do conjunto de dados ?</p>
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s2">
                                    <p>
                                        <input ${qualiData.q6 ? "checked":""} disabled class="with-gap" name="q6" value="true" type="radio" id="q11" />
                                        <label for="q11">Sim</label>
                                    </p>
                                </div>
                                <div class="col s2">
                                    <p>
                                        <input ${not empty qualiData.q6 and not qualiData.q6 ? "checked":""} disabled class="with-gap" name="q6" value="false" type="radio" id="q12" />
                                        <label for="q12">Não</label>
                                    </p>
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s12">
                                    <textarea class="response" disabled style="resize:none; border:0; height:60px;" name="" id="" cols="30" rows="10">${qualiData.comment6}</textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="row" style="margin:0px;">
                                <div class="col s12">
                                    <p class="question" style="margin:0;font-size:18px;">A cobertura tecnológica é informada ?</p>
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s2">
                                    <p>
                                        <input ${qualiData.q7 ? "checked":""} disabled class="with-gap" name="q7" value="true" type="radio" id="q13" />
                                        <label for="q13">Sim</label>
                                    </p>
                                </div>
                                <div class="col s2">
                                    <p>
                                        <input ${not empty qualiData.q7 and not qualiData.q7 ? "checked":""} disabled class="with-gap" name="q7" value="false" type="radio" id="q14" />
                                        <label for="q14">Não</label>
                                    </p>
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s12">
                                    <textarea class="response" disabled style="resize:none; border:0; height:60px;" name="" id="" cols="30" rows="10">${qualiData.comment7}</textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="row" style="margin:0px;">
                                <div class="col s12">
                                    <p class="question" style="margin:0;font-size:18px;">A descrição da tecnologia é apresentada ?</p>
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s2">
                                    <p>
                                        <input ${qualiData.q8 ? "checked":""} disabled class="with-gap" name="q8" value="true" type="radio" id="q15" />
                                        <label for="q15">Sim</label>
                                    </p>
                                </div>
                                <div class="col s2">
                                    <p>
                                        <input ${not empty qualiData.q8 and not qualiData.q8 ? "checked":""} disabled class="with-gap" name="q8" value="false" type="radio" id="q16" />
                                        <label for="q16">Não</label>
                                    </p>
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s12">
                                    <textarea class="response" disabled style="resize:none; border:0; height:60px;" name="" id="" cols="30" rows="10">${qualiData.comment8}</textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="row" style="margin:0px;">
                                <div class="col s12">
                                    <p class="question" style="margin:0;font-size:18px;">A cobertura geográfica é informada ?</p>
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s2">
                                    <p>
                                        <input ${qualiData.q9 ? "checked":""} disabled class="with-gap" name="q9" value="true" type="radio" id="q17" />
                                        <label for="q17">Sim</label>
                                    </p>
                                </div>
                                <div class="col s2">
                                    <p>
                                        <input ${not empty qualiData.q9 and not qualiData.q9 ? "checked":""} disabled class="with-gap" name="q9" value="false" type="radio" id="q18" />
                                        <label for="q18">Não</label>
                                    </p>
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s12">
                                    <textarea class="response" disabled style="resize:none; border:0; height:60px;" name="" id="" cols="30" rows="10">${qualiData.comment9}</textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="row" style="margin:0px;">
                                <div class="col s12">
                                    <p class="question" style="margin:0;font-size:18px;">É informada a representatividade do conjunto de dados ?</p>
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s2">
                                    <p>
                                        <input ${qualiData.q10 ? "checked":""} disabled class="with-gap" name="q10" value="true" type="radio" id="q19" />
                                        <label for="q19">Sim</label>
                                    </p>
                                </div>
                                <div class="col s2">
                                    <p>
                                        <input ${not empty qualiData.q10 and not qualiData.q10 ? "checked":""} disabled class="with-gap" name="q10" value="false" type="radio" id="q20" />
                                        <label for="q20">Não</label>
                                    </p>
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s12">
                                    <textarea class="response" disabled style="resize:none; border:0; height:60px;" name="" id="" cols="30" rows="10">${qualiData.comment10}</textarea>
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
                                <div class="col s12">
                                    <p class="question" style="margin:0;font-size:18px;">Informada a abordagem utilizada ?</p>
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s2">
                                    <p>
                                        <input ${qualiData.q11 ? "checked":""} disabled class="with-gap" name="q11" value="true" type="radio" id="q21" />
                                        <label for="q21">Sim</label>
                                    </p>
                                </div>
                                <div class="col s2">
                                    <p>
                                        <input ${not empty qualiData.q11 and not qualiData.q11 ? "checked":""} disabled class="with-gap" name="q11" value="false" type="radio" id="q22" />
                                        <label for="q22">Não</label>
                                    </p>
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s12">
                                    <textarea class="response" disabled style="resize:none; border:0; height:60px;" name="" id="" cols="30" rows="10">${qualiData.comment11}</textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="row" style="margin:0px;">
                                <div class="col s12">
                                    <p class="question" style="margin:0;font-size:18px;">Foi aplicado critério de corte? Se sim, qual foi o critério utilizado ?</p>
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s2">
                                    <p>
                                        <input ${qualiData.q12 ? "checked":""} disabled class="with-gap" name="q12" value="true" type="radio" id="q23" />
                                        <label for="q23">Sim</label>
                                    </p>
                                </div>
                                <div class="col s2">
                                    <p>
                                        <input ${not empty qualiData.q12 and not qualiData.q12 ? "checked":""} disabled class="with-gap" name="q12" value="false" type="radio" id="q24" />
                                        <label for="q24">Não</label>
                                    </p>
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s12">
                                    <textarea class="response" disabled style="resize:none; border:0; height:60px;" name="" id="" cols="30" rows="10">${qualiData.comment12}</textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="row" style="margin:0px;">
                                <div class="col s12">
                                    <p class="question" style="margin:0;font-size:18px;">Houve agregação dos dados? Qual o nível de agregação utilizado ?</p>
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s2">
                                    <p>
                                        <input ${qualiData.q13 ? "checked":""} disabled class="with-gap" name="q13" value="true" type="radio" id="q25" />
                                        <label for="q25">Sim</label>
                                    </p>
                                </div>
                                <div class="col s2">
                                    <p>
                                        <input ${not empty qualiData.q13 and not qualiData.q13 ? "checked":""} disabled class="with-gap" name="q13" value="false" type="radio" id="q26" />
                                        <label for="q26">Não</label>
                                    </p>
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s12">
                                    <textarea class="response" disabled style="resize:none; border:0; height:60px;" name="" id="" cols="30" rows="10">${qualiData.comment13}</textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="row" style="margin:0px;">
                                <div class="col s12">
                                    <p class="question" style="margin:0;font-size:18px;">O fluxograma do sistema do produto foi apresentado, incluindo as fronteiras do conjunto de dados ?</p>
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s2">
                                    <p>
                                        <input ${qualiData.q14 ? "checked":""} disabled class="with-gap" name="q14" value="true" type="radio" id="q27" />
                                        <label for="q27">Sim</label>
                                    </p>
                                </div>
                                <div class="col s2">
                                    <p>
                                        <input ${not empty qualiData.q14 and not qualiData.q14 ? "checked":""} disabled class="with-gap" name="q14" value="false" type="radio" id="q28" />
                                        <label for="q28">Não</label>
                                    </p>
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s12">
                                    <textarea class="response" disabled style="resize:none; border:0; height:60px;" name="" id="" cols="30" rows="10">${qualiData.comment14}</textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="row" style="margin:0px;">
                                <div class="col s12">
                                    <p class="question" style="margin:0;font-size:18px;">As conexões dos fluxos intermediários com os processos elementares secundários foram apresentadas ?</p>
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s2">
                                    <p>
                                        <input ${qualiData.q15 ? "checked":""} disabled class="with-gap" name="q15" value="true" type="radio" id="q29" />
                                        <label for="q29">Sim</label>
                                    </p>
                                </div>
                                <div class="col s2">
                                    <p>
                                        <input ${not empty qualiData.q15 and not qualiData.q15 ? "checked":""} disabled class="with-gap" name="q15" value="false" type="radio" id="q30" />
                                        <label for="q30">Não</label>
                                    </p>
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s12">
                                    <textarea class="response" disabled style="resize:none; border:0; height:60px;" name="" id="" cols="30" rows="10">${qualiData.comment15}</textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="row" style="margin:0px;">
                                <div class="col s12">
                                    <p class="question" style="margin:0;font-size:18px;">O conjunto de dados representa um sistema multifuncional? Se sim, como lidou com a multifuncionalidade ?</p>
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s2">
                                    <p>
                                        <input ${qualiData.q16 ? "checked":""} disabled class="with-gap" name="q16" value="true" type="radio" id="q31" />
                                        <label for="q31">Sim</label>
                                    </p>
                                </div>
                                <div class="col s2">
                                    <p>
                                        <input ${not empty qualiData.q16 and not qualiData.q16 ? "checked":""} disabled class="with-gap" name="q16" value="false" type="radio" id="q32" />
                                        <label for="q32">Não</label>
                                    </p>
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s12">
                                    <textarea class="response" disabled style="resize:none; border:0; height:60px;" name="" id="" cols="30" rows="10">${qualiData.comment16}</textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="row" style="margin:0px;">
                                <div class="col s12">
                                    <p class="question" style="margin:0;font-size:18px;">Foi considerado o uso da terra (ocupação e transformação)? Se sim, qual foi o método utilizado para transformação do uso da terra ?</p>
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s2">
                                    <p>
                                        <input ${qualiData.q17 ? "checked":""} disabled class="with-gap" name="q17" value="true" type="radio" id="q33" />
                                        <label for="q33">Sim</label>
                                    </p>
                                </div>
                                <div class="col s2">
                                    <p>
                                        <input ${not empty qualiData.q17 and not qualiData.q17 ? "checked":""} disabled class="with-gap" name="q17" value="false" type="radio" id="q34" />
                                        <label for="q34">Não</label>
                                    </p>
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s12">
                                    <textarea class="response" disabled style="resize:none; border:0; height:60px;" name="" id="" cols="30" rows="10">${qualiData.comment17}</textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="row" style="margin:0px;">
                                <div class="col s12">
                                    <p class="question" style="margin:0;font-size:18px;">Os dados foram validados de alguma forma ? Qual foi o método utilizado ?</p>
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s2">
                                    <p>
                                        <input ${qualiData.q18 ? "checked":""} disabled class="with-gap" name="q18" value="true" type="radio" id="q35" />
                                        <label for="q35">Sim</label>
                                    </p>
                                </div>
                                <div class="col s2">
                                    <p>
                                        <input ${not empty qualiData.q18 and not qualiData.q18 ? "checked":""} disabled class="with-gap" name="q18" value="false" type="radio" id="q36" />
                                        <label for="q36">Não</label>
                                    </p>
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s12">
                                    <textarea class="response" disabled style="resize:none; border:0; height:60px;" name="" id="" cols="30" rows="10">${qualiData.comment18}</textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="row" style="margin:0px;">
                                <div class="col s12">
                                    <p class="question" style="margin:0;font-size:18px;">Se o balanço de massa foi realizado, quanto foi fechado nos processos elementares primários ?</p>
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s2">
                                    <p>
                                        <input ${qualiData.q19 ? "checked":""} disabled class="with-gap" name="q19" value="true" type="radio" id="q37" />
                                        <label for="q37">Sim</label>
                                    </p>
                                </div>
                                <div class="col s2">
                                    <p>
                                        <input ${not empty qualiData.q19 and not qualiData.q19 ? "checked":""} disabled class="with-gap" name="q19" value="false" type="radio" id="q38" />
                                        <label for="q38">Não</label>
                                    </p>
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s12">
                                    <textarea class="response" disabled style="resize:none; border:0; height:60px;" name="" id="" cols="30" rows="10">${qualiData.comment19}</textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="row" style="margin:0px;">
                                <div class="col s12">
                                    <p class="question" style="margin:0;font-size:18px;">Se o balanço de água foi realizado, quanto foi fechado nos processos elementares primários ?</p>
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s2">
                                    <p>
                                        <input ${qualiData.q20 ? "checked":""} disabled class="with-gap" name="q20" value="true" type="radio" id="q39" />
                                        <label for="q39">Sim</label>
                                    </p>
                                </div>
                                <div class="col s2">
                                    <p>
                                        <input ${not empty qualiData.q20 and not qualiData.q20 ? "checked":""} disabled class="with-gap" name="q20" value="false" type="radio" id="q40" />
                                        <label for="q40">Não</label>
                                    </p>
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s12">
                                    <textarea class="response" disabled style="resize:none; border:0; height:60px;" name="" id="" cols="30" rows="10">${qualiData.comment20}</textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="row" style="margin:0px;">
                                <div class="col s12">
                                    <p class="question" style="margin:0;font-size:18px;">Se o balanço de energia foi realizado, quanto foi fechado nos processos elementares primários ?</p>
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s2">
                                    <p>
                                        <input ${qualiData.q21 ? "checked":""} disabled class="with-gap" name="q21" value="true" type="radio" id="q41" />
                                        <label for="q41">Sim</label>
                                    </p>
                                </div>
                                <div class="col s2">
                                    <p>
                                        <input ${not empty qualiData.q21 and not qualiData.q21 ? "checked":""} disabled class="with-gap" name="q21" value="false" type="radio" id="q42" />
                                        <label for="q42">Não</label>
                                    </p>
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s12">
                                    <textarea class="response" disabled style="resize:none; border:0; height:60px;" name="" id="" cols="30" rows="10">${qualiData.comment21}</textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="row" style="margin:0px;">
                                <div class="col s12">
                                    <p class="question" style="margin:0;font-size:18px;">Foi adotado algum método para analisar a qualidade dos dados? Se sim, qual ?</p>
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s2">
                                    <p>
                                        <input ${qualiData.q22 ? "checked":""} disabled class="with-gap" name="q22" value="true" type="radio" id="q43" />
                                        <label for="q43">Sim</label>
                                    </p>
                                </div>
                                <div class="col s2">
                                    <p>
                                        <input ${not empty qualiData.q22 and not qualiData.q22 ? "checked":""} disabled class="with-gap" name="q22" value="false" type="radio" id="q44" />
                                        <label for="q44">Não</label>
                                    </p>
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s12">
                                    <textarea class="response" disabled style="resize:none; border:0; height:60px;" name="" id="" cols="30" rows="10">${qualiData.comment22}</textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="row" style="margin:0px;">
                                <div class="col s12">
                                    <p class="question" style="margin:0;font-size:18px;">Os bens de capital foram incluídos ?</p>
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s2">
                                    <p>
                                        <input ${qualiData.q23 ? "checked":""} disabled class="with-gap" name="q23" type="radio" value="true" id="q45" />
                                        <label for="q45">Sim</label>
                                    </p>
                                </div>
                                <div class="col s2">
                                    <p>
                                        <input ${not empty qualiData.q23 and not qualiData.q23 ? "checked":""} disabled class="with-gap" name="q23" type="radio" value="false" id="q46" />
                                        <label for="q46">Não</label>
                                    </p>
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s12">
                                    <textarea class="response" disabled style="resize:none; border:0; height:60px;" name="" id="" cols="30" rows="10">${qualiData.comment23}</textarea>
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
                                <div class="col s12">
                                    <p class="question" style="margin:0;font-size:18px;">A identificação dos fluxos seguiu o padrão definido no Guia? Em caso negativo, adequar.</p>
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s2">
                                    <p>
                                        <input ${qualiData.q24 ? "checked":""} disabled class="with-gap" name="q24" type="radio" value="true" id="q47" />
                                        <label for="q47">Sim</label>
                                    </p>
                                </div>
                                <div class="col s2">
                                    <p>
                                        <input ${not empty qualiData.q24 and not qualiData.q24 ? "checked":""} disabled class="with-gap" name="q24" type="radio" value="false" id="q48" />
                                        <label for="q48">Não</label>
                                    </p>
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s12">
                                    <textarea class="response" disabled style="resize:none; border:0; height:60px;" name="" id="" cols="30" rows="10">${qualiData.comment24}</textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="row" style="margin:0px;">
                                <div class="col s12">
                                    <p class="question" style="margin:0;font-size:18px;">O fluxo de referência foi informado ?</p>
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s2">
                                    <p>
                                        <input ${qualiData.q25 ? "checked":""} disabled class="with-gap" name="q25" type="radio" value="true" id="q49" />
                                        <label for="q49">Sim</label>
                                    </p>
                                </div>
                                <div class="col s2">
                                    <p>
                                        <input ${not empty qualiData.q25 and not qualiData.q25 ? "checked":""} disabled class="with-gap" name="q25" type="radio" value="false" id="q50" />
                                        <label for="q50">Não</label>
                                    </p>
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s12">
                                    <textarea class="response" disabled style="resize:none; border:0; height:60px;" name="" id="" cols="30" rows="10">${qualiData.comment25}</textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="row" style="margin:0px;">
                                <div class="col s12">
                                    <p class="question" style="margin:0;font-size:18px;">As unidades estão no Sistema Internacional (SI)? Se não, descrever as possíveis relações com as unidades do SI.</p>
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s2">
                                    <p>
                                        <input ${qualiData.q26 ? "checked":""} disabled class="with-gap" name="q26" type="radio" value="true" id="q51" />
                                        <label for="q51">Sim</label>
                                    </p>
                                </div>
                                <div class="col s2">
                                    <p>
                                        <input ${not empty qualiData.q26 and not qualiData.q26 ? "checked":""} disabled class="with-gap" name="q26" type="radio" value="false" id="q52" />
                                        <label for="q52">Não</label>
                                    </p>
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s12">
                                    <textarea class="response" disabled style="resize:none; border:0; height:60px;" name="" id="" cols="30" rows="10">${qualiData.comment26}</textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="row" style="margin:0px;">
                                <div class="col s12">
                                    <p class="question" style="margin:0;font-size:18px;">Cada fluxo tecnológico está especificado por região ?</p>
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s2">
                                    <p>
                                        <input ${qualiData.q27 ? "checked":""} disabled class="with-gap" name="q27" type="radio" value="true" id="q53" />
                                        <label for="q53">Sim</label>
                                    </p>
                                </div>
                                <div class="col s2">
                                    <p>
                                        <input ${not empty qualiData.q27 and not qualiData.q27 ? "checked":""} disabled class="with-gap" name="q27" type="radio" value="false" id="q54" />
                                        <label for="q54">Não</label>
                                    </p>
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s12">
                                    <textarea class="response" disabled style="resize:none; border:0; height:60px;" name="" id="" cols="30" rows="10">${qualiData.comment27}</textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="row" style="margin:0px;">
                                <div class="col s12">
                                    <p class="question" style="margin:0;font-size:18px;">São informados os compartimentos e subcompartimentos ?</p>
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s2">
                                    <p>
                                        <input ${qualiData.q28 ? "checked":""} disabled class="with-gap" name="q28" type="radio" value="true" id="q55" />
                                        <label for="q55">Sim</label>
                                    </p>
                                </div>
                                <div class="col s2">
                                    <p>
                                        <input ${not empty qualiData.q28 and not qualiData.q28 ? "checked":""} disabled class="with-gap" name="q28" type="radio" value="false" id="q56" />
                                        <label for="q56">Não</label>
                                    </p>
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s12">
                                    <textarea class="response" disabled style="resize:none; border:0; height:60px;" name="" id="" cols="30" rows="10">${qualiData.comment28}</textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="row" style="margin:0px;">
                                <div class="col s12">
                                    <p class="question" style="margin:0;font-size:18px;">Há informação da origem e destino dos fluxos de água ?</p>
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s2">
                                    <p>
                                        <input ${qualiData.q29 ? "checked":""} disabled class="with-gap" name="q29" type="radio" value="true" id="q57" />
                                        <label for="q57">Sim</label>
                                    </p>
                                </div>
                                <div class="col s2">
                                    <p>
                                        <input ${not empty qualiData.q29 and not qualiData.q29 ? "checked":""} disabled class="with-gap" name="q29" type="radio" value="false" id="q58" />
                                        <label for="q58">Não</label>
                                    </p>
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s12">
                                    <textarea class="response" disabled style="resize:none; border:0; height:60px;" name="" id="" cols="30" rows="10">${qualiData.comment29}</textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="row" style="margin:0px;">
                                <div class="col s12">
                                    <p class="question" style="margin:0;font-size:18px;">Os materiais particulados foram separados em frações ?</p>
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s2">
                                    <p>
                                        <input ${qualiData.q30 ? "checked":""} disabled class="with-gap" name="q30" type="radio" value="true" id="q59" />
                                        <label for="q59">Sim</label>
                                    </p>
                                </div>
                                <div class="col s2">
                                    <p>
                                        <input ${not empty qualiData.q30 and not qualiData.q30 ? "checked":""} disabled class="with-gap" name="q30" type="radio" value="false" id="q60" />
                                        <label for="q60">Não</label>
                                    </p>
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s12">
                                    <textarea class="response" disabled style="resize:none; border:0; height:60px;" name="" id="" cols="30" rows="10">${qualiData.comment30}</textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="row" style="margin:0px;">
                                <div class="col s12">
                                    <p class="question" style="margin:0;font-size:18px;">Os compostos orgânicos voláteis (COV) foram discriminados ?</p>
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s2">
                                    <p>
                                        <input ${qualiData.q31 ? "checked":""} disabled class="with-gap" name="q31" type="radio" value="true" id="q61" />
                                        <label for="q61">Sim</label>
                                    </p>
                                </div>
                                <div class="col s2">
                                    <p>
                                        <input ${not empty qualiData.q31 and not qualiData.q31 ? "checked":""} disabled class="with-gap" name="q31" type="radio" value="false" id="q62" />
                                        <label for="q62">Não</label>
                                    </p>
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s12">
                                    <textarea class="response" disabled style="resize:none; border:0; height:60px;" name="" id="" cols="30" rows="10">${qualiData.comment31}</textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="row" style="margin:0px;">
                                <div class="col s12">
                                    <p class="question" style="margin:0;font-size:18px;">Os hidrocarbonetos aromáticos policíclicos (PAH) foram discriminados ?</p>
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s2">
                                    <p>
                                        <input ${qualiData.q32 ? "checked":""} disabled class="with-gap" name="q32" type="radio" value="true" id="q63" />
                                        <label for="q63">Sim</label>
                                    </p>
                                </div>
                                <div class="col s2">
                                    <p>
                                        <input ${not empty qualiData.q32 and not qualiData.q32 ? "checked":""} disabled class="with-gap" name="q32" type="radio" value="false" id="q64" />
                                        <label for="q64">Não</label>
                                    </p>
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s12">
                                    <textarea class="response" disabled style="resize:none; border:0; height:60px;" name="" id="" cols="30" rows="10">${qualiData.comment32}</textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="row" style="margin:0px;">
                                <div class="col s12">
                                    <p class="question" style="margin:0;font-size:18px;">As dioxinas e furanos foram discriminados ?</p>
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s2">
                                    <p>
                                        <input ${qualiData.q33 ? "checked":""} disabled class="with-gap" name="q33" type="radio" value="true" id="q65" />
                                        <label for="q65">Sim</label>
                                    </p>
                                </div>
                                <div class="col s2">
                                    <p>
                                        <input ${not empty qualiData.q33 and not qualiData.q33 ? "checked":""} disabled class="with-gap" name="q33" type="radio" value="false" id="q66" />
                                        <label for="q66">Não</label>
                                    </p>
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s12">
                                    <textarea class="response" disabled style="resize:none; border:0; height:60px;" name="" id="" cols="30" rows="10">${qualiData.comment33}</textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="row" style="margin:0px;">
                                <div class="col s12">
                                    <p class="question" style="margin:0;font-size:18px;">As fontes de CO2 e CH4 foram discriminadas ?</p>
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s2">
                                    <p>
                                        <input ${qualiData.q34 ? "checked":""} disabled class="with-gap" name="q34" type="radio" value="true" id="q67" />
                                        <label for="q67">Sim</label>
                                    </p>
                                </div>
                                <div class="col s2">
                                    <p>
                                        <input ${not empty qualiData.q34 and not qualiData.q34 ? "checked":""} disabled class="with-gap" name="q34" type="radio" value="false" id="q68" />
                                        <label for="q68">Não</label>
                                    </p>
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s12">
                                    <textarea class="response" disabled style="resize:none; border:0; height:60px;" name="" id="" cols="30" rows="10">${qualiData.comment34}</textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="row" style="margin:0px;">
                                <div class="col s12">
                                    <p class="question" style="margin:0;font-size:18px;">As emissões de longo prazo foram informadas ?</p>
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s2">
                                    <p>
                                        <input ${qualiData.q35 ? "checked":""} disabled class="with-gap" name="q35" type="radio" value="true" id="q69" />
                                        <label for="q69">Sim</label>
                                    </p>
                                </div>
                                <div class="col s2">
                                    <p>
                                        <input ${not empty qualiData.q35 and not qualiData.q35 ? "checked":""} disabled class="with-gap" name="q35" type="radio" value="false" id="q70" />
                                        <label for="q70">Não</label>
                                    </p>
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s12">
                                    <textarea class="response" disabled style="resize:none; border:0; height:60px;" name="" id="" cols="30" rows="10">${qualiData.comment35}</textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="row" style="margin:0px;">
                                <div class="col s12">
                                    <p class="question" style="margin:0;font-size:18px;">As emissões diretas de CO2 de MUT foram incluídas e discriminadas ?</p>
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s2">
                                    <p>
                                        <input ${qualiData.q36 ? "checked":""} disabled class="with-gap" name="q36" type="radio" value="true" id="q71" />
                                        <label for="q71">Sim</label>
                                    </p>
                                </div>
                                <div class="col s2">
                                    <p>
                                        <input ${not empty qualiData.q36 and not qualiData.q36 ? "checked":""} disabled class="with-gap" name="q36" type="radio" value="false" id="q72" />
                                        <label for="q72">Não</label>
                                    </p>
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s12">
                                    <textarea class="response" disabled style="resize:none; border:0; height:60px;" name="" id="" cols="30" rows="10">${qualiData.comment36}</textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="row" style="margin:0px;">
                                <div class="col s12">
                                    <p class="question" style="margin:0;font-size:18px;">Foram incluídos os dados do transporte ?</p>
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s2">
                                    <p>
                                        <input ${qualiData.q37 ? "checked":""} disabled class="with-gap" name="q37" type="radio" value="true" id="q73" />
                                        <label for="q73">Sim</label>
                                    </p>
                                </div>
                                <div class="col s2">
                                    <p>
                                        <input ${not empty qualiData.q37 and not qualiData.q37 ? "checked":""} disabled class="with-gap" name="q37" type="radio" value="false" id="q74" />
                                        <label for="q74">Não</label>
                                    </p>
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s12">
                                    <textarea class="response" disabled style="resize:none; border:0; height:60px;" name="" id="" cols="30" rows="10">${qualiData.comment37}</textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="row" style="margin:0px;">
                                <div class="col s12">
                                    <p class="question" style="margin:0;font-size:18px;">Foram informados os dados faltantes ?</p>
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s2">
                                    <p>
                                        <input ${qualiData.q38 ? "checked":""} disabled class="with-gap" name="q38" type="radio" value="true" id="q75" />
                                        <label for="q75">Sim</label>
                                    </p>
                                </div>
                                <div class="col s2">
                                    <p>
                                        <input ${not empty qualiData.q38 and not qualiData.q38 ? "checked":""} disabled class="with-gap" name="q38" type="radio" value="false" id="q76" />
                                        <label for="q76">Não</label>
                                    </p>
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s12">
                                    <textarea class="response" disabled style="resize:none; border:0; height:60px;" name="" id="" cols="30" rows="10">${qualiData.comment38}</textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="row" style="margin:0px;">
                                <div class="col s12">
                                    <p class="question" style="margin:0;font-size:18px;">Foram informados os tipos de dados para cada fluxo ?</p>
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s2">
                                    <p>
                                        <input ${qualiData.q39 ? "checked":""} disabled class="with-gap" name="q39" type="radio" value="true" id="q77" />
                                        <label for="q77">Sim</label>
                                    </p>
                                </div>
                                <div class="col s2">
                                    <p>
                                        <input ${not empty qualiData.q39 and not qualiData.q39 ? "checked":""} disabled class="with-gap" name="q39" type="radio" value="false" id="q78" />
                                        <label for="q78">Não</label>
                                    </p>
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s12">
                                    <textarea class="response" disabled style="resize:none; border:0; height:60px;" name="" id="" cols="30" rows="10">${qualiData.comment39}</textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="row" style="margin:0px;">
                                <div class="col s12">
                                    <p class="question" style="margin:0;font-size:18px;">Foi informada a incerteza dos dados para cada fluxo ?</p>
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s2">
                                    <p>
                                        <input ${qualiData.q40 ? "checked":""} disabled class="with-gap" name="q40" type="radio" value="true" id="q79" />
                                        <label for="q79">Sim</label>
                                    </p>
                                </div>
                                <div class="col s2">
                                    <p>
                                        <input ${not empty qualiData.q40 and not qualiData.q40 ? "checked":""} disabled class="with-gap" name="q40" type="radio" value="false" id="q80" />
                                        <label for="q80">Não</label>
                                    </p>
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s12">
                                    <textarea class="response" disabled style="resize:none; border:0; height:60px;" name="" id="" cols="30" rows="10">${qualiData.comment40}</textarea>
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
                                <div class="col s12">
                                    <p class="question" style="margin:0;font-size:18px;">Caso tenha havido revisão crítica de terceira parte, as informações necessárias foram fornecidas ?</p>
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s2">
                                    <p>
                                        <input ${qualiData.q41 ? "checked":""} disabled class="with-gap" name="q41" type="radio" value="true" id="q81" />
                                        <label for="q81">Sim</label>
                                    </p>
                                </div>
                                <div class="col s2">
                                    <p>
                                        <input ${not empty qualiData.q41 and not qualiData.q41 ? "checked":""} disabled class="with-gap" name="q41" type="radio" value="false" id="q82" />
                                        <label for="q82">Não</label>
                                    </p>
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s12">
                                    <textarea class="response" disabled style="resize:none; border:0; height:60px;" name="" id="" cols="30" rows="10">${qualiData.comment41}</textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="row" style="margin:0px;">
                                <div class="col s12">
                                    <p class="question" style="margin:0;font-size:18px;">Se houve revisão crítica, o relatório da revisão pode ser disponibilizado para os revisores do SICV, junto com o conjunto de dados ?</p>
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s2">
                                    <p>
                                        <input ${qualiData.q42 ? "checked":""} disabled class="with-gap" name="q42" type="radio" value="true" id="q83" />
                                        <label for="q83">Sim</label>
                                    </p>
                                </div>
                                <div class="col s2">
                                    <p>
                                        <input ${not empty qualiData.q42 and not qualiData.q42 ? "checked":""} disabled class="with-gap" name="q42" type="radio" value="false" id="q84" />
                                        <label for="q84">Não</label>
                                    </p>
                                </div>
                            </div>
                            <div class="row" style="margin:0px;">
                                <div class="col s12">
                                    <textarea class="response" disabled style="resize:none; border:0; height:60px;" name="" id="" cols="30" rows="10">${qualiData.comment42}</textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script type="application/javascript" src="<%=Strings.BASE%>/assets/jquery-3.2.1.min.js"></script>
        <script type="application/javascript" src="<%=Strings.BASE%>/assets/materialize/js/materialize.min.js"></script>
        <script type="application/javascript" src="<%=Strings.BASE%>/assets/jquery-3.2.1.min.js"></script>
        <script type="application/javascript" src="<%=Strings.BASE%>/assets/materialize/js/materialize.min.js"></script>
    </body>

</html>