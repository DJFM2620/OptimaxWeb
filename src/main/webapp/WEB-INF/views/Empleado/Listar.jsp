<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="<c:url value='/CSS/Plantillas/Listar.css'/>">
<link rel="stylesheet"
	href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">

<title>Listado Empleados</title>

<body>
	<%@include file="/WEB-INF/views/shared/tab.jsp"%>
	<div class="main">
		<div>
			<button class="New" onclick="location.href='<c:url value = "/Empleado/Registrar"/>'"><span class="las la-user-plus"></span> <span>NUEVO</span></button>
			<input type="text" placeholder="Buscar..." class="Search">
		</div>
		<table class="Table">
			<thead class="Table_Head">
				<tr>
					<td><b>ID</b></td>
					<td><b>Nombre</b></td>
					<td><b>Apellido Paterno</b></td>
					<td><b>Apellido Materno</b></td>
					<td><b>DNI</b></td>
					<td><b>Telefono</b></td>
					<td><b>Email</b></td>
					<td><b>Cargo</b></td>
					<td><b>Opciones</b></td>
				</tr>
			</thead>
			<tbody class="Table_Body">
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
						<td>
							<button class="Button_Edit" onclick="location.href='<c:url value ="/Empleado/Editar/${empleado.cod_empleado}"/>'">
								<span class="las la-edit"></span><span>Editar</span>
							</button>
							<button class="Button_Delete" onclick="location.href='<c:url value = "/Empleado/Eliminar/${empleado.cod_empleado}"/>'">
								<span class="las la-trash-alt"></span><span>Borrar </span>
							</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>