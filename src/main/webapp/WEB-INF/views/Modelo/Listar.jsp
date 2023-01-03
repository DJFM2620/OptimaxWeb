<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<link rel="stylesheet"
	href="<c:url value='/CSS/ModeloArticulo/Listar.css'/>">

<title>Listado Modelos Articulos</title>

</head>
<body>
	<%@include file="/WEB-INF/views/shared/tab.jsp"%>


	<section>

		<div class="container">

			<table>
				<thead>
					<!--  Ecanbezado -->
					<tr>

						<td><b>ID</b></td>
						<td><b>Forma</b></td>
						<td><b>Accion</b></td>



					</tr>
				</thead>

				<tbody>

					<!-- Filas -->
					<c:forEach var="modelo" items="${bModelosArticulos}">

						<tr>

							<td><b>${modelo.cod_Modelo}</b></td>
							<td><b>${modelo.forma_Modelo}</b></td>

							<td><a
								href="<c:url value = '/EditarModeloArticulo/${modelo.cod_Modelo}'/>">
									Editar </a> | <a
								href="<c:url value = '/EliminarModeloArticulo/${modelo.cod_Modelo}'/>">
									Eliminar </a></td>

						</tr>

					</c:forEach>
				</tbody>
			</table>
		</div>
	</section>
</body>
</html>