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
        <link rel="stylesheet" href="<%=Strings.BASE%>/assets/materialize/css/materialize.min.css">
        <link rel="stylesheet" href="<%=Strings.BASE%>/assets/css/quality/item.css">

		<style>
			html {
			    font-family: 'TitilliumWeb-Regular', sans-serif !important;
			}
		</style>
    </head>
    
    <body>

        <jsp:include page="/WEB-INF/jsp/partials/header.jsp" />

        <div class="principalDiv">

            <div class="row">

                <div class="row">
                    <div class="col s8">
                        <div style="font-size: 18px; color: #00697C;">${ilcd.title}</div>
                    </div>
                    <c:if test="${empty status1.accept}">
                        <div class="col s2">
                            <a href="<%=Strings.BASE%>/qualityreview/refuse/${status1.id}/" style="color: #C3697C; font-size: 14px; position: relative; top: 4px;"><i class="fa fa-ban" aria-hidden="true"></i> Não, obrigado</a>
                        </div>
                        <div class="col s2">
                            <a href="<%=Strings.BASE%>/qualityreview/accept/${status1.id}/" style="color: #ACCC5F; font-size: 14px; position: relative; top: 4px;"><i class="fa fa-check" aria-hidden="true"></i> Aceito</a>
                        </div>
                    </c:if>
                </div>
                <hr />
            </div>
            <div class="row">
                <div class="col s8">
                    <div style="padding-bottom: 2%;">
                    	<span style="font-size: 20px;font-family: TitilliumWeb-Light;">Usuário</span><br>
                        <i style="font-size: 16px;color: #00697C">${ilcd.authors[0]}</i>
                    </div>
                    <h6 class="bold"><b>Autor/es</b></h6>
                    <div style="color: #146678;">
	                    <c:forEach items="${ilcd.authors}" var="author" varStatus="loop">
	                        ${author};
	                    </c:forEach>
	                    <br>
	                    <c:forEach items="${ilcd.emails}" var="email" varStatus="loop">
	                        <i style="font-family: TitilliumWeb-Light;">${email};</i>
	                    </c:forEach>
                    </div>

                    <h6 class="bold" style="margin-top: 35px;"><b>Categoria</b></h6>
                    <div style="color: #146678;">
                    	${ilcd.category}
                    </div>
                    
                    <h6 class="bold" style="margin-top: 35px;"><b>Descrição</b></h6>
                    <div style="font-size: 14px;color: #6B6B6A;">
                    	${ilcd.description}
                    </div>
                </div>
                <div class="col s4">
                    <div class="row">
                        <div class="col s12">
                            <div class="headerStatus">
                                Acompanhamento de revisões 
                            </div>
                        </div>
                    </div>
                    <c:forEach var="status4" items="${status2}">
                        <c:if test="${not empty status4.revisor}">
                            <c:choose>
                                <c:when test="${empty status4.closed or not status4.closed}">
                                    <div class="row" >
                                        <div class="col s6" style="color: #00697C;">
                                            Autor
                                        </div>
                                        <div class="col s6" style="color: #4DBCC4;">
                                            Revisão Qualidata
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col s6">
                                            <a style="font-size: 14px; color: #6B6B6A;" href="<%=Strings.BASE%>/ilcd/${status4.archive.pathFile}/ilcd"><i style="color: #00697C; margin-right: 5px;" class="fa fa-file-archive-o" aria-hidden="true"></i> ILCD.ZIP</a>
                                            <br />
                                            <c:if test="${status4.archive.containsComplement()}">
                                                <a style="font-size: 14px; color: #6B6B6A;" href="<%=Strings.BASE%>/ilcd/${status4.archive.pathFile}?name=complement.zip"><i style="color: #00697C; margin-right: 5px;" class="fa fa-file-archive-o" aria-hidden="true"></i> complement.zip</a>                                
                                            </c:if>

                                        </div>
                                        <div class="col s6">
                                            <c:choose>
                                                <c:when test="${status4.accept}">
                                                    <a href="<%=Strings.BASE%>/qualityreview/${status4.id}/review" class="btn bgBtnEntrar button-collapse">Aplicar Qualidata</a>
                                                </c:when>
                                                <c:when test="${not status4.accept}">
                                                    <a href="" class="btn btn-lg btn-block disabled bgBtnEntrar">Aplicar Qualidata</a>
                                                </c:when>
                                            </c:choose>
                                        </div>
                                    </div>
                                    <hr style="border-top: 1px solid #6B6B6B;" />
                                </c:when>
                                <c:when test="${not empty status4.closed and status4.closed}">
                                    <div class="row">
                                        <div class="row">
                                            <div class="col s6">
                                                <a style="font-size: 14px; color: #6B6B6A;" href="<%=Strings.BASE%>/ilcd/${status4.archive.pathFile}/ilcd"><i style="color: #00697C; margin-right: 5px;" class="fa fa-file-archive-o" aria-hidden="true"></i> ILCD.ZIP</a>
                                                <br />
                                                <c:if test="${status4.archive.containsComplement()}">
                                                    <a style="font-size: 14px; color: #6B6B6A;" href="<%=Strings.BASE%>/ilcd/${status4.archive.pathFile}?name=complement.zip"><i style="color: #00697C; margin-right: 5px;" class="fa fa-file-archive-o" aria-hidden="true"></i> complement.zip</a>                                
                                                </c:if>
                                            </div>
                                            <div class="col s6">
                                                <a href="<%=Strings.BASE%>/qualityreview/${status4.id}/view" class="">Ver revisão - <fmt:formatDate value="${status4.endDate}" pattern="dd/MM/yyyy"/></a>
                                            </div>
                                        </div>
                                    </div>
                                    <hr style="border-top: 1px solid #6B6B6B;" />
                                </c:when>
                            </c:choose>
                        </c:if>
                    </c:forEach>
                </div>
            </div>
        </div>

        <script type="application/javascript" src="<%=Strings.BASE%>/assets/jquery-3.2.1.min.js"></script>
        <script type="application/javascript" src="<%=Strings.BASE%>/assets/materialize/js/materialize.min.js"></script>
    </body>

</html>