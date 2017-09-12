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

@media screen and (max-width: 800px) {
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

		<table id="list" class="table table-hover" >
			<thead>
				<tr>
					<td class="sortable-column">Data</td>
					<td class="sortable-column">Assunto</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td scope="row" >1</td>
					<th>
						<p>John Doe</p>
				        <div>12 Sales Total; 4 March, 3 April, 12 July, 14 August</div>
				        <div>12 Sales Total; 4 March, 3 April, 12 July, 14 August</div>
					</th>
					
				</tr>
				<tr>
					<td scope="row" rowspan="2">2</td>
					<th>
						<p style="padding-bottom: 1%;">Aprovado pelo revisor de Qualidade: 266c5da8-55bc-4d58-a4af-cbf7724f7939: </p>
				        <div> Brick technology mix production mix, at plant 1800 kg/m3 foi aprovado pelo revisor de Qualidade.</div><p>
				        <div> Acesse à revisão em: Meus inventários Download Disponíveis</div>
					</th>
					
				</tr>
			</tbody>
		</table>

	</div>

	<jsp:include page="/WEB-INF/jsp/partials/scriptsLibs.jsp" />
	
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
