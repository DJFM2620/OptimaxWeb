<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<link rel="stylesheet" href="<c:url value='/CSS/MarcaArticulo/Eliminar.css'/>">

<title>Eliminar Marca Articulo</title>

</head>
<body>

	<%@include file="/WEB-INF/views/shared/tab.jsp"%>
	
	<div class="testbox">
		<h4 style="position: relative; left: 148px; font-size: 23px;">Marca-Borrar</h4>

		<form:form name="" method="post" modelAttribute="MarcaArticulo">
Marca ID: <form:input type="text" path="cod_Marca" readonly="true" />
			<br>
Nombre: <form:input type="text" path="nombre_Marca" readonly="true" />
			<br>
			<p>¿Esta seguro de Borrar la Marca?</p>
			<button type="submit">Si, borrar</button>

		</form:form>
	</div>
</body>
</html>