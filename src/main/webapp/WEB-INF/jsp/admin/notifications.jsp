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
                    data: ${notifications},
                    "columns": [
                        {"data": function (data, type, row, meta) {
                                return data.message;
                            }
                        }
                    ]
                });
            });


        </script>
    </body>
</html>
