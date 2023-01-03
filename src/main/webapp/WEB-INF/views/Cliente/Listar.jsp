<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Listado de Clientes</title>

<link rel="stylesheet" href="<c:url value='/CSS/Cliente/Listar.css'/>">

</head>

<%@include file="/WEB-INF/views/shared/tab.jsp"%>

<section>

	<div class="container">

		<table>
			<thead>
				<tr>
					<td><b>ID</b></td>
					<td><b>Nombre</b></td>
					<td><b>Apellido Paterno</b></td>
					<td><b>Apellido Materno</b></td>
					<td><b>celular</b></td>
					<td><b>Dni</b></td>
					<td><b>Email</b></td>
					<td><b>ruc</b></td>
					<td><b>Distrito</b></td>
					<td><b>Accion</b></td>


				</tr>
			</thead>

			<tbody>
				<c:forEach var="cliente" items="${bCliente}">
					<tr>
						<td>${cliente.cod_Cliente}</td>
						<td>${cliente.nombres}</td>
						<td>${cliente.apellidop}</td>
						<td>${cliente.apellidom}</td>
						<td>${cliente.celular}</td>
						<td>${cliente.dni}</td>
						<td>${cliente.email}</td>
						<td>${cliente.ruc}</td>
						<td>${cliente.distrito.nombredistr}</td>

						<td><a
							href="<c:url value = '/EditarCliente/${cliente.cod_Cliente}'/>">
								Editar </a> | <a
							href="<c:url value = '/Eliminarcliente/${cliente.cod_Cliente}'/>">
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