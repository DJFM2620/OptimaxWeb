<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<link rel="stylesheet" href="<c:url value='/CSS/MarcaArticulo/Editar.css'/>">

<title>Editar Marca Articulo</title>
</head>
<body>

	<h3>Editar Marca de Articulo</h3>
	<form:form name="" method="post" modelAttribute="MarcaArticulo">
Marca ID: <form:input type="text" path="cod_Marca" readonly="true" />
		<br>
Nombre: <form:input type="text" path="nombre_Marca" />
		<br>

		<button type="submit">Guardar</button>
		<button type="button"
			onclick="location.href='<c:url value="/MarcasArticulos"/>'">Cancelar</button>
	</form:form>
</body>
</html>