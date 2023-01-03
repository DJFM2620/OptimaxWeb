<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<link rel="stylesheet" href="<c:url value='/CSS/MarcaArticulo/Listar.css'/>">

<title>Listado Marcas</title>

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
						<td><b>Accion</b></td>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="marca" items="${bMarcas}">
						<tr>
							<td><b>${marca.cod_Marca}</b></td>
							<td><b>${marca.nombre_Marca}</b></td>
							<td><a
								href="<c:url value='/EditarMarcaArticulo/${marca.cod_Marca}'/>">|Editar</a>
								<a
								href="<c:url value='/EliminarMarcaArticulo/${marca.cod_Marca}'/>">|Borrar|</a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</section>
</body>
</html>