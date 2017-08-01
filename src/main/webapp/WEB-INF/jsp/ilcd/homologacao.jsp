<%--
    Document   : homologacao
    Created on : 11/05/2017, 09:48:46
    Author     : Deivdy.Silva
--%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page import="br.com.ibict.acv.sicv.helper.URLHelper"%>
<%@page import="br.com.ibict.acv.sicv.model.User"%>
<%@page import="resources.Strings"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="/WEB-INF/jsp/partials/styles.jsp" />
        <style>
            html, body {
                height: 100%;
            }
            body {
            }
            .page-content {
                padding-top: 3.125rem;
                min-height: 100%;
                height: 100%;
            }
            .table .input-control.checkbox {
                line-height: 1;
                min-height: 0;
                height: auto;
            }

            @media screen and (max-width: 800px){
                #cell-sidebar {
                    flex-basis: 52px;
                }
                #cell-content {
                    flex-basis: calc(100% - 52px);
                }
            }
        </style>
    </head>
    <body class="bg-steel">
        <jsp:include page="/WEB-INF/jsp/partials/header.jsp" />
        <div class="page-content">
            <div class="flex-grid no-responsive-future" style="height: 100%;">
                <div class="row" style="height: 100%">
                    <div class="cell size-x200" id="cell-sidebar" style="background-color: #71b1d1; height: 100%">
                        <ul class="sidebar">
                            <li><a href="#">
                                    <span class="mif-apps icon"></span>
                                    <span class="title">TODOS OS ITENS</span>
                                    <span class="counter">0</span>
                                </a></li>
                            <li><a href="#">
                                    <span class="mif-database icon"></span>
                                    <span class="title">ILCD Bases</span>
                                    <span class="counter">0</span>
                                </a></li>
                            <li><a href="#">
                                    <span class="mif-file-binary icon"></span>
                                    <span class="title">ILCD</span>
                                    <span class="counter">0</span>
                                </a></li>
                            <li><a href="#">
                                    <span class="mif-user icon"></span>
                                    <span class="title">USUÁRIO</span>
                                    <span class="counter">0</span>
                                </a></li>
                            <li><a href="#">
                                    <span class="mif-apps icon"></span>
                                    <span class="title">TODOS OS ITENS</span>
                                    <span class="counter">0</span>
                                </a></li>
                        </ul>
                    </div>
                    <div class="cell auto-size padding20 bg-white" id="cell-content">
                        <h1 class="text-light">Selecione um revisor de qualidade</h1>
                        <hr class="thin bg-grayLighter"  />
                        <hr class="thin bg-grayLighter" />
                        <table id="list" class="dataTable border bordered hovered" data-auto-width="false">
                            <thead>
                                <tr>
                                    <td class="sortable-column">Nome</td>
                                    <td class="sortable-column">Sobre Nome</td>
                                    <td class="sortable-column">Profissão</td>
                                    <td class="sortable-column">Sexo</td>
                                    <td class="sortable-column">País</td>
                                    <td class="sortable-column">E-mail</td>
                                    <td class="sortable-column">Telefone</td>
                                </tr>
                            </thead>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="/WEB-INF/jsp/partials/scriptsLibs.jsp" />
        <script src="<%=Strings.BASE%>/assets/metro-ui3.0.17/js/jquery.dataTables.min.js"></script>
        <script>

            var ilcd = "${ilcd}";

            $(document).ready(function () {

                var table = $('#list').DataTable({
                    "ajax": "<%=Strings.BASE%>/admin/ilcd/revisor-qualidade.json",
                    "columns": [
                        {"data": "firstName"},
                        {"data": "lastName"},
                        {"data": "jobPositon"},
                        {"data": "gender"},
                        {"data": "country"},
                        {"data": "email"},
                        {"data": "telefone"}
                    ]
                });

                $('#list tbody').on('click', 'tr', function () {
                    var data = table.row(this).data();
                    solicitacao(data);

                });

            });

            function solicitacao(data) {
                var ask = window.confirm("Deseja enviar uma solicitação de homologação para " + data.firstName + " " + data.lastName + " ?");
                if (ask) {
                    $.ajax({
                        url: '<%=Strings.BASE%>/admin/ilcd/teste',
                        type: 'POST',
                        data: {user: data.id, ilcd: ilcd},
                        success: function (response) {
                            if (response == "true") {
                                window.alert("Solicitação enviada com sucesso.");
                                document.location.href = "<%=Strings.BASE%>/admin/ilcd";
                            } else {
                                alert("Falha ao solicitar usuario !!!");
                            }
                        }
                    });
                }
            }

            $(function () {
                $('.sidebar').on('click', 'li', function () {
                    if (!$(this).hasClass('active')) {
                        $('.sidebar li').removeClass('active');
                        $(this).addClass('active');
                    }
                })
            })
        </script>
    </body>
</html>
</html>