<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Editar Modelo Articulo</title>

<link rel="stylesheet" href="<c:url value='/CSS/ModeloArticulo/Editar.css'/>">

</head>
<body>
	<%@include file="/WEB-INF/views/shared/tab.jsp"%>
	<div class="testbox">
		<h4 style="position: relative; left: 148px; font-size: 23px;">Modelo-Borrar</h4>

		<form:form name="" method="post" modelAttribute="ModeloArticulo">
		
		ID: <form:input type="number" path="cod_Modelo" readonly="true" />
			<br> 
		Forma: <form:input type="text" path="forma_Modelo" readonly="true" />
			<br>

			<p>¿Estas seguro de borrar?</p>

			<button type="submit">Guardar</button>
		</form:form>
	</div>
</body>
</html>