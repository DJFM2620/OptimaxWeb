<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Lista de Cargos</title>

</head>
<%@include file="/WEB-INF/views/shared/tab.jsp"%>

<section>

	<div class="container">
		<table>
			<thead>
				<tr>
					<td><b>ID</b></td>
					<td><b>Cargo</b></td>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="cargoempleado" items="${bCargosEmpleado}">
					<tr>
						<td>${cargoempleado.cod_cargoemp}</td>
						<td>${cargoempleado.cargo}</td>
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