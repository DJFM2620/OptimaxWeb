<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registrar Datos</title>

<link rel="stylesheet"
	href="<c:url value='/CSS/Plantillas/Registrar.css'/>">
</head>
<body>
	<div class="Form">
		<h1>Eliminar Color</h1>

		<form:form name="" method="post" modelAttribute="Color">
		
			Nombre:
			<br>
			<form:input type="text" path="nombre"/>
			<br>
			<br>
	
			<button type="submit">Guardar</button>
			<button type="button" onclick="location.href='<c:url value = "/ColorArticulo/Listar"/>'">Cancelar</button>
		</form:form>
	</div>
</body>
</html>