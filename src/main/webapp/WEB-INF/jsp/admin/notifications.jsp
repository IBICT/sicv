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

<link
	href="<%=Strings.BASE%>/assets/bootstrap-3.3.7/css/bootstrap.min.css"
	rel="stylesheet">
<!DOCTYPE html>
<html>
<head>

<jsp:include page="/WEB-INF/jsp/partials/styles.jsp" />
<style>
@font-face {
	font-family: 'TitilliumWeb-ExtraLight';
	src: url('../fonts/TitilliumWeb-ExtraLight.ttf') format('truetype');
}

@font-face {
	font-family: 'TitilliumWeb-Regular';
	src: url('../fonts/TitilliumWeb-Regular.ttf') format('truetype');
}


html, body {
	height: 100%;
}

body {
	font-family: 'TitilliumWeb-Regular', sans-serif ;	
	color: #00697c !important;

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

@media screen and (max-width: 800px) {
	#cell-sidebar {
		flex-basis: 52px;
	}
	#cell-content {
		flex-basis: calc(100% - 52px);
	}
}
.divs{
	font-family: 'TitilliumWeb-ExtraLight', sans-serif !important;
	font-weight: normal;
}
.titleNotify{
	font-family: 'TitilliumWeb-ExtraLight', sans-serif !important;
	font-size:30px;
	margin: 2% 0% 2% 5%;
}
.tdCenter{
	text-align: center;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/partials/header.jsp" />
	<div class="page-content">
		<div class="titleNotify">Notificações</div>
	

		<table id="list" class="table table-hover" style="width: 85%; margin-left:5%;" >
			<thead>
				<tr >
					<td class="sortable-column" style="text-align: center;">Data</td>
					<td class="sortable-column">Assunto</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td class="tdCenter">13/09/2017</td>
					<th>
						<p>Aprovado pelo revisor de Qualidade: 266c5da8-55bc-4d58-a4af-cbf7724f7939: </p>
				        <div class="divs" style="padding-top: 1%"> Brick technology mix production mix, at plant 1800 kg/m3 foi aprovado pelo revisor de Qualidade.</div><p>
				        <div class="divs"> Acesse à revisão em: Meus inventários Download Disponíveis</div>
					</th>
					
				</tr>
				<tr>
					<td class="tdCenter">23/10/2017</td>
					<th>
						<p>Aprovado pelo revisor de Qualidade: 266c5da8-55bc-4d58-a4af-cbf7724f7939: </p>
				        <div class="divs" style="padding-top: 1%"> Brick technology mix production mix, at plant 1800 kg/m3 foi aprovado pelo revisor de Qualidade.</div><p>
				        <div class="divs"> Acesse à revisão em: Meus inventários Download Disponíveis</div>
					</th>
					
				</tr>
			</tbody>
			<tfoot>
				<tr></tr>
			</tfoot>
		</table>

		<jsp:include page="/WEB-INF/jsp/partials/scriptsLibs.jsp" />	
	</div>
	<script>
		
		$(function () {
		    var shown = false;
		    $('#list tr').click(function (ev) {
		        if (!shown) {
		        	alert("teste1");
		        	$(this).children("th").children("div").slideDown(1000);
		    	        
		        }else{
		        	alert("teste");
		        	$(this).children("th").children("div").slideUp(1000);
		        	
		        }
		        shown = !shown;
		    });
		})
	</script>
	<!--         <script type="text/javascript">

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


        </script> -->
</body>
</html>
