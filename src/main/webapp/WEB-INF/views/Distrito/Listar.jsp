<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Listado Distrito</title>

<link rel="stylesheet" href="<c:url value='/CSS/Distrito/Listar.css'/>">

</head>

<%@include file="/WEB-INF/views/shared/tab.jsp"%>

<section>
	<div class="container">
		<table>
			<thead>
				<tr>
					<td><b>ID</b></td>
					<td><b>Nombre</b></td>
				</tr>
			</thead>

			<tbody>
				<c:forEach var="distrito" items="${bDistrito}">
					<tr>
						<td>${distrito.cod_distrito}</td>
						<td>${distrito.nombredistr}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</section>

<script type="text/javascript">
	$(window).on(
			"load resize ",
			function() {
				var scrollWidth = $('.tbl-content').width()
						- $('.tbl-content table').width();
				$('.tbl-header').css({
					'padding-right' : scrollWidth
				});
			}).resize();
</script>

</body>
</html>