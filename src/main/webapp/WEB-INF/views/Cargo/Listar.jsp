<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="<c:url value='/CSS/Plantillas/Listar.css'/>">
<link rel="stylesheet"
	href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">
<title>Lista de Cargos</title>
</head>
<body>

	<%@include file="/WEB-INF/views/shared/tab.jsp"%>
	<div class="main">
		<div>
			<button class="New" onclick="location.href='<c:url value = "/CargoEmpleado/Registrar"/>'">
				<span class="las la-user-plus"></span> <span>NUEVO</span>
			</button>
			<input type="text" placeholder="Buscar..." class="Search">
		</div>

		<table class="Table">
			<thead class="Table_Head">
				<tr>
					<td><b>ID</b></td>
					<td><b>Cargo</b></td>
					<th><b>Opciones</b></th>
				</tr>
			</thead>
			<tbody class="Table_Body">
				<c:forEach var="cargo" items="${bCargosEmpleado}">
					<tr>
						<td>${cargo.cod_cargoemp}</td>
						<td>${cargo.cargo}</td>
						<td>
							<button class="Button_Edit"
								onclick="location.href='<c:url value ="/CargoEmpleado/Editar/${cargo.cod_cargoemp}"/>'">
								<span class="las la-edit"></span><span>Editar</span>
							</button>
							<button class="Button_Delete"
								onclick="location.href='<c:url value = "/CargoEmpleado/Eliminar/${cargo.cod_cargoemp}"/>'">
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