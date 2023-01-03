<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<link rel="stylesheet" href="<c:url value='/CSS/MaterialArticulo/Eliminar.css'/>">

<title>Eliminar Material Articulo</title>

</head>
<body>
	<%@include file="/WEB-INF/views/shared/tab.jsp"%>
	<div class="testbox">
		<h4 style="position: relative; left: 148px; font-size: 23px;">Material-Borrar</h4>
		
		<form:form name="" method="post" modelAttribute="MaterialArticulo">
	ID: <form:input type="text" path="cod_TipMaterial" readonly="true" />
			<br>

	Nombre: <form:input type="text" path="Nombre_Materia" />
			<br>

			<p>¿Estas seguro de borrar?</p>

			<button type="submit">Si</button>
		</form:form>
	</div>
</body>
</html>