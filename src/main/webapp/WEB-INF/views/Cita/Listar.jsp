<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<link rel="stylesheet" href="<c:url value='/CSS/Cita/Listar.css'/>">
<title>Listado de citas</title>
<style type="text/css">
</style>
</head>
<body>

	<%@include file="/WEB-INF/views/shared/tabrecepcionista.jsp"%>
	<section>
		<div class="container">
			<table>
				<thead>
					<tr>
						<td><b>CODIGO DE CITA</b></td>
						<td><b>HORA </b></td>
						<td><b>FECHA</b></td>
						<td><b>NOMBRE CLIENTE</b></td>
						<td><b>APELLIDO CLIENTE</b></td>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="citas" items="${bCitas}">
						<tr>
							<td><b>${citas.cod_Cita}</b></td>
							<td><b>${citas.hora}</b></td>
							<td><b>${citas.fecha}</b></td>
							<td><b>${citas.getCliente().getNombres()}</b></td>
							<td><b>${citas.getCliente().getApellidop()}</b></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</section>
</body>
</html>