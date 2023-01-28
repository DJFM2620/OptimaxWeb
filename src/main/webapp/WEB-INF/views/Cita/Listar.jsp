<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<link rel="stylesheet"
	href="<c:url value='/CSS/Plantillas/Listar.css'/>">

<link rel="stylesheet"
	href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">

<title>Listado de citas</title>

</head>
<body>

	<%@include file="/WEB-INF/views/shared/tabrecepcionista.jsp"%>

	<div class="main">
		<table class="Table">
			<thead class="Table_Head">
				<tr>
					<td><b>Codigo</b></td>
					<td><b>Hora </b></td>
					<td><b>Fecha</b></td>
					<td><b>Nombre Cliente</b></td>
					<td><b>Apellido Cliente</b></td>
				</tr>
			</thead>
			<tbody class="Table_Body">
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
</body>
</html>