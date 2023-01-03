<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Listado Empleados</title>
<link rel="stylesheet" href="<c:url value='/CSS/Empleado/Listar.css'/>">

<body>
<%@include file="/WEB-INF/views/shared/tab.jsp"%>

<section>
	<div class="container">
		<table>
			<thead>
				<tr>
					<td><b>ID</b></td>
					<td><b>Nombre</b></td>
					<td><b>Apellido_Paterno</b></td>
					<td><b>Apellido_Materno</b></td>
					<td><b>DNI</b></td>
					<td><b>Telefono</b></td>
					<td><b>Email</b></td>
					<td><b>Cargo</b></td>
					<td><b>Accion</b></td>

				</tr>
			</thead>

			<tbody>
				<c:forEach var="empleado" items="${bEmpleado}">
					<tr>
						<td>${empleado.cod_empleado}</td>
						<td>${empleado.nombres}</td>
						<td>${empleado.apellidp}</td>
						<td>${empleado.apellidom}</td>
						<td>${empleado.dni}</td>
						<td>${empleado.telefono}</td>
						<td>${empleado.email}</td>
						<td>${empleado.tipoempleado.cargo}</td>
						<td><a
							href="<c:url value = '/empleado_editar/${empleado.cod_empleado}'/>">
								Editar </a> | <a
							href="<c:url value = '/empleado_borrar/${empleado.cod_empleado}'/>">
								Eliminar </a></td>
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