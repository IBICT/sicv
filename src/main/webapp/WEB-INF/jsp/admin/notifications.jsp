<%-- 
    Document   : notifications
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
    <body>
        <jsp:include page="/WEB-INF/jsp/partials/header.jsp" />

        <div class="page-content">
            <div class="flex-grid no-responsive-future">
                <div class="row">
                    <table id="list" class="dataTable border bordered" data-auto-width="false">
                        <thead>
                            <tr>
                                <td class="sortable-column">Nome</td>
                            </tr>
                        </thead>
                    </table>
                </div>
            </div>
        </div>
        <jsp:include page="/WEB-INF/jsp/partials/scriptsLibs.jsp" />
        <script src="<%=Strings.BASE%>/assets/metro-ui3.0.17/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript">

            $(document).ready(function () {
                $('#list').DataTable({
                    "ajax": "<%=Strings.BASE%>/admin/ilcd/ilcd.json",
                    "columns": [
                        {"data": "id"},
                        {"data": "name"},
                        {"data": function (data, type, row, meta) {
                                return '<a href="#">' + data.user.email + '</a>';
                            }
                        },
                        {"data": function (data, type, row, meta) {

                                if (data.homologacao) {
                                    //console.log(data.homologacao);
                                    switch (data.homologacao.status) {
                                        case 1:
                                            return '<button class="cycle-button" onclick="metroDialog.toggle(\'#dialog\')" onmouseout="$(this).popover(\'show\')" data-role="popover" data-popover-position="bottom" data-popover-text="Enviado para o usuário ' + data.homologacao.user.userName + ' des de ' + data.homologacao.lastModifier + '" data-popover-background="bg-white" data-popover-color="fg-black"><span class="mif-paper-plane fg-gray mif-ani-hover-float"></span></button>';
                                            break;
                                        case 2:
                                            return '<button class="cycle-button" data-role="popover" data-popover-position="bottom" data-popover-text="Em analise de qualidade por usuário ' + data.homologacao.user.userName + ' des de ' + data.homologacao.lastModifier + '" data-popover-background="bg-white" data-popover-color="fg-black"><span class="mif-user"></span></button>';
                                            break;
                                        case 3:
                                            return '<button class="cycle-button" onclick="openCustom(\'' + encodeURIComponent(JSON.stringify(data)) + '\')" ><span class="mif-envelop"></span></button>';
                                            break;
                                        case 4:
                                            return '<button class="cycle-button"><span class="mif-pause"></span></button>';
                                            break;
                                        case 5:
                                            return '<button class="cycle-button" onclick="inviteStatus(\'' + encodeURIComponent(JSON.stringify(data)) + '\')" onmouseout="$(this).popover(\'show\')" data-role="popover" data-popover-position="bottom" data-popover-text="Enviado para o usuário ' + data.homologacao.user.userName + ' des de ' + data.homologacao.lastModifier + '" data-popover-background="bg-white" data-popover-color="fg-black"><span class="mif-paper-plane fg-gray mif-ani-hover-float"></span></button>';
                                            break;
                                        case 6:
                                            return '<button class="cycle-button"><span class="mif-envelop"></span></button>';
                                            break;
                                        case 7:
                                            return '<button class="cycle-button"><span class="mif-checkmark"></span></button>';
                                            break;
                                        default:
                                            return '<button class="cycle-button"><span class="mif-bug"></span></button>';
                                            break;
                                    }
                                } else
                                    return '<a href="<%=Strings.BASE%>/admin/ilcd/homologacao/' + data.id + '" class="button primary cycle-button"><span class="mif-play"></span></a>';
                            }
                        },
                        {"data": function (data, type, row, meta) {
                                return '<td><a href="<%=Strings.BASE%>/admin/ilcd/files/' + data.pathFile + '" class="button success cycle-button"><span class="mif-file-download"></span></a></td>';
                            }
                        }
                    ]
                });
            });


        </script>
    </body>
</html>
