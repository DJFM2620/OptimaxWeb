<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<link rel="stylesheet"
	href="<c:url value='/CSS/Plantillas/Editar.css'/>">

<title>Editar Pedidos</title>
</head>
<body>

	<%@include file="/WEB-INF/views/shared/tabjefedeventas.jsp"%>

	<div class="Form">
		<form:form name="" method="post" modelAttribute="OrdenPedido">
	
			<h1>Editar Pedido</h1>
		
			ID:
			<br>
			<form:input path="cod_pedido" id="nombres" readonly="true" />
			<br>
			<br>
			
			Fecha:
			<br>
			<form:input path="fecha" id="nombres" readonly="true" />
			<br>
			<br>
			 
			Codigo Cliente:
			<br>
			<form:input path="cliente.cod_Cliente" id="nombres" readonly="true" />
			<br>
			<br>
			
			ESTADO:
			<br>
			<form:select path="estadopedido.cod_estado">
				<form:options items="${bEstado}" itemValue="cod_estado" itemLabel="estado" />
			</form:select>
			<br>
			<br>
			
			<button type="submit">Guardar</button>
			<button type="button" onclick="location.href='<c:url value = "/Pedido/Listar"/>'">Cancelar</button>
			<br>
		</form:form>
	</div>

</body>
</html>