<%-- 
    Document   : home
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
                <form method="post">
                    <div class="input-control textarea">
                        <label>Comentário</label>
                        <textarea name="comment"></textarea>
                    </div>
                    <br />
                    <a class="button" href="<%=Strings.BASE%>/admin/">Cancelar</a>
                    <input class="warning" type="reset" value="Reset">
                    <input class="primary" type="submit" value="Submit">
                </form>
            </div>
        </div>
        <jsp:include page="/WEB-INF/jsp/partials/scriptsLibs.jsp" />
        <script type="text/javascript">

            $(document).ready(function () {

            });
        </script>
    </body>
</html>
