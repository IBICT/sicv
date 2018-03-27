<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@page import="resources.Strings"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

        <link href="<%=Strings.BASE%>/assets/bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="<%=Strings.BASE%>/assets/materialize/css/materialize.min.css">
        <link rel="stylesheet" href="<%=Strings.BASE%>/assets/steps.css">
        <link rel="stylesheet" href="<%=Strings.BASE%>/assets/css/fonts.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" href="<%=Strings.BASE%>/assets/font/font-awesome/css/font-awesome.min.css">

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
                /*margin: 10px 50px;*/
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
            }

            .sicv-table-td {
                border-bottom: 1px solid silver;
            }


        </style>

    </head>

    <body>
        <jsp:include page="/WEB-INF/jsp/partials/header.jsp" />

        <div style="width: 90%;margin-left:5%;">
            <div class="row" style="margin: 0;">
                <h4 class="page-title" style="margin: 0;">Convidar Revisor Qualidata para:</h4>
            </div>
            <div class="row" style="font-size: 18px; color: #595959; margin: 15px 0;">
                ${ilcd.title}
            </div>
            <div class="row" style="color: #6B6B6A; margin-top: 60px;">
                Filtre por usuário ou e-mail ou área de especialização:
            </div>
            <div class="row">
                <div class="col s4">
                    <input type="text" placeholder="Usuário" id="user" class="searchs" onclick="disableMailArea()"/>
                </div>
                <div class="col s4">
                    <input type="text" placeholder="E-mail" id="mail" class="searchs" onclick="disableUserArea()"/>
                </div>
                <div class="col s4">
                    <input type="text" placeholder="Área" id="area" class="searchs" onclick="disableUserMail()"/>
                </div>
            </div>
            <div class="row">
                <div class="col offset-s10 s2">
                    <div class="btn" title="Convidar Revisor" id="searchTerm" onclick="filterApply();" style="color: #4DBCC4; background-color: #fff; border: 1px solid #4DBCC4; border-radius: 5px; padding: 0 10px; text-transform: none; font-weight: bold; text-overflow: ellipsis; white-space: nowrap; overflow: hidden; width: 100%; min-width: 50px;">Aplicar Filtro</div>
                </div>
            </div>
            <form action="<%=Strings.BASE%>/gestor/${ilcd.id}/invite/${status.id}" method="post">
                <input id="type" name="tipo" type="hidden" value="${status.type}" />

                <div class="row">

                    <div style="margin:0px;" class="row">
                        <div class="col s3 sicv-table-th">Usuário</div>
                        <div class="col s3 sicv-table-th">E-mail</div>
                        <div class="col s3 sicv-table-th">Área</div>
                        <div class="col s3 sicv-table-th">-</div>
                    </div>

                    <c:forEach items="${users}" var="user" varStatus="loop">
                        <div style="margin:0px;" class="row" id="tabUsers">
                            <div style="height: 40px; position: relative; top: 10px;" class="col s3 sicv-table-td">
                                ${user.firstName} ${user.lastName}
                            </div>
                            <div style="height: 40px; position: relative; top: 10px;" class="col s3 sicv-table-td">
                                ${user.email}
                            </div>
                            <div style="height: 40px; position: relative; top: 10px;" class="col s3 sicv-table-td">
                                ${user.jobPosition}
                            </div>
                            <div style="height: 40px; position: relative; top: 10px;" class="col s3 sicv-table-td">
                                <input class="with-gap" name="user" type="radio" id="user${user.id}" value="${user.id}"  />
                                <label for="user${user.id}"></label>
                            </div>
                        </div>
                    </c:forEach>


                </div>
                <div class="row">
                    <div class="col offset-s8 s2">
                        <a href="#" class="btn" style="background-color: #C3697C; color: #fff;">CANCELAR</a>
                    </div>
                    <div class="col s2">
                        <input type="submit" class="btn" value="ENVIAR CONVITE" style="background-color: #00697C; color: #fff;" />
                    </div>
                </div>
            </form>
        </div>

        <script type="application/javascript" src="<%=Strings.BASE%>/assets/jquery-3.2.1.min.js"></script>
        <script type="application/javascript" src="<%=Strings.BASE%>/assets/bootstrap-3.3.7/js/bootstrap.min.js"></script>
        <script type="application/javascript" src="<%=Strings.BASE%>/assets/materialize/js/materialize.min.js"></script>
        <script>
            $(document).ready(function () {
                var x = $(location).attr('search');
                if(x === "?type=2"){
                    $("#type").val(2);
                } else {
                    $("#type").val(1);
                }
            });
			function filterApply(){
			    var value = ($('#user').val()+$('#mail').val()+$('#area').val()).toLowerCase();
			    $("#tabUsers ").filter(function() {
			      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
		    	});
			}
			function disableMailArea(){
				$('#user').prop('readonly',false);
				$('#mail').prop('readonly',true);
				$('#area').prop('readonly',true);
				$('#mail').val("");
				$('#area').val("");
			}
			function disableUserMail(){
			 	$('#area').prop('readonly',false);
				$('#user').prop('readonly',true);
				$('#mail').prop('readonly',true);
				$('#user').val("");
				$('#mail').val("");
			}
			function disableUserArea(){
				$('#mail').prop('readonly',false);
				$('#user').prop('readonly',true);
				$('#area').prop('readonly',true);
				$('#user').val("");
				$('#area').val("");
			}
        </script>
    </body>

</html>