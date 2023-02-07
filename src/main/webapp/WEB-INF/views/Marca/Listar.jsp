<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<link rel="stylesheet" href="<c:url value='/CSS/Plantillas/Listar.css'/>">
<link rel="stylesheet"
	href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">

<title>Listado Marcas</title>

</head>
<body>
	<%@include file="/WEB-INF/views/shared/tab.jsp"%>
	<div class="main">
		<div>
			<button class="New" onclick="location.href='<c:url value = "/Marca/Registrar"/>'"><span class="las la-user-plus"></span> <span>NUEVO</span></button>
		</div>
		
		<table class="Table">
			<thead class="Table_Head">
				<tr>
					<td><b>ID</b></td>
					<td><b>Nombre</b></td>
					<td><b>Opciones</b></td>
				</tr>
			</thead>
			<tbody class="Table_Body">
				<c:forEach var="marca" items="${bMarcas}">
					<tr>
						<td><b>${marca.cod_Marca}</b></td>
						<td><b>${marca.nombre_Marca}</b></td>
						<td>
							<button class="Button_Edit" onclick="location.href='<c:url value="/Marca/Editar/${marca.cod_Marca}"/>'">
								<span class="las la-edit"></span><span>Editar</span>
							</button>
							<button class="Button_Delete" onclick="location.href='<c:url value="/Marca/Eliminar/${marca.cod_Marca}"/>'">
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