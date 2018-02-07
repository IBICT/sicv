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
                    <div class="row" style="margin-bottom: 0;">
                        <div class="col s6">
                            <div style="color: #00697C; font-size: 27px;">
                                Revisão Técnica <span style="color: #6B6B6B;">|</span> <a href="./../.." style="color: #00697C; font-size: 15px;">Voltar para o inventário</a>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col s12">
                            <div style="color: #6B6B6A; font-size: 12px;">
                                <fmt:formatDate value="${status.endDate}" pattern="dd/MM/yyyy"/>
                            </div>
                        </div>
                    </div>
                    <div class="col s12">
                        <div class="row">
                            <div class="row">
                                <div class="row" style="margin:0px;">
                                    <div class="col s12">
                                        <p class="question" style="margin:0;font-size:18px;">Introdução</p>
                                    </div>
                                </div>
                                <div class="row" style="margin:0px;">
                                    <div class="col s12">
                                        <textarea class="response" disabled style="resize:none; border:0; height:60px;" name="" id="" cols="30" rows="10">${technicalReviewer.comment1}</textarea>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="row" style="margin:0px;">
                                    <div class="col s12">
                                        <p class="question" style="margin:0;font-size:18px;">Relatório</p>
                                    </div>
                                </div>
                                <div class="row" style="margin:0px;">
                                    <div class="col s12">
                                        <textarea class="response" disabled style="resize:none; border:0; height:60px;" name="" id="" cols="30" rows="10">${technicalReviewer.comment2}</textarea>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="row" style="margin:0px;">
                                    <div class="col s12">
                                        <p class="question" style="margin:0;font-size:18px;">Conclusão</p>
                                    </div>
                                </div>
                                <div class="row" style="margin:0px;">
                                    <div class="col s12">
                                        <textarea class="response" disabled style="resize:none; border:0; height:60px;" name="" id="" cols="30" rows="10">${technicalReviewer.comment3}</textarea>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col s12">
                                    <a href="<%=Strings.BASE%>/ilcd/${status.archive.pathFile}?name=reviewAttachment.zip" style="color: #4DBCC4;"><i class="fa fa-file-text-o" aria-hidden="true" style="margin-right: 10px;"></i> Arquivo anexo<span style="color: #6B6B6A;"> - <fmt:formatDate value="${status.endDate}" pattern="dd/MM/yyyy"/></span></a>
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