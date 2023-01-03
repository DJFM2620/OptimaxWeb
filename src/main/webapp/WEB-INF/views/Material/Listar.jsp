<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Listado Material de Articulos</title>

</head>
<body>

	<%@include file="/WEB-INF/views/shared/tab.jsp"%>
	<section>
		<div class="container">
			<table>
				<thead>
					<tr>
						<td><b>ID</b></td>
						<td><b>Nombre</b></td>
						<td><b>Acción</b></td>
					</tr>
				</thead>

				<tbody>
					<c:forEach var="material" items="${bMaterialArticulos}">
						<tr>
							<td><b>${material.cod_TipMaterial}</b></td>
							<td><b>${material.nombre_Materia}</b></td>
							<td><a
								href="<c:url value='/EditarMaterialArticulo/${material.cod_TipMaterial}'/>">Editar</a>
								<a
								href="<c:url value='/EliminarMaterialArticulo/${material.cod_TipMaterial}'/>">Borrar</a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</section>
</body>
</html>