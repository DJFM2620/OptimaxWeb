<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Listado de Clientes</title>

<link rel="stylesheet" href="<c:url value='/CSS/Plantillas/Listar.css'/>">
<link rel="stylesheet"
	href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">
	
<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.15.6/xlsx.core.min.js"></script>

</head>
<body>
	<%@include file="/WEB-INF/views/shared/tab.jsp"%>
	<div class="main">
		<div>
			<button class="New" onclick="location.href='<c:url value = "/Cliente/Registrar"/>'">
				<span class="las la-user-plus"></span> <span>NUEVO</span>
			</button>
			
			<button class="Button_To_Excel" onclick="exportToExcel('Clientes')">
				<span class="las la-download"></span> <span>EXPORTAR A EXCEL</span>
			</button>
		</div>
		
		<table class="Table" id="Table">
			<thead class="Table_Head">
				<tr>
					<td><b>ID</b></td>
					<td><b>Nombre</b></td>
					<td><b>Apellido Paterno</b></td>
					<td><b>Apellido Materno</b></td>
					<td><b>Celular</b></td>
					<td><b>Dni</b></td>
					<td><b>Email</b></td>
					<td><b>RUC</b></td>
					<td><b>Direccion</b></td>
					<td><b>Distrito</b></td>
					<td><b>Accion</b></td>
				</tr>
			</thead>
			<tbody class="Table_Body">
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
						<td>${cliente.direccion}</td>
						<td>${cliente.distrito.nombredistr}</td>
						<td>
							<button class="Button_Edit" onclick="location.href='<c:url value ="/Cliente/Editar/${cliente.cod_Cliente}"/>'">
								<span class="las la-edit"></span><span>Editar</span>
							</button>
							<button class="Button_Delete" onclick="location.href='<c:url value = "/Cliente/Eliminar/${cliente.cod_Cliente}"/>'">
								<span class="las la-trash-alt"></span><span>Borrar </span>
							</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<script type="text/javascript" src="/idat/JS/Listar.js"></script>
</body>
</html>