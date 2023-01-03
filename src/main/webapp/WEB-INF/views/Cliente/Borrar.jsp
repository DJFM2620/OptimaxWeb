<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Eliminar Cliente</title>
<link rel="stylesheet" href="<c:url value='/CSS/Cliente/Eliminar.css'/>">

</head>
<body style="background-color: beige;">

	<%@include file="/WEB-INF/views/shared/tab.jsp"%>

	<div class="testbox">
		<h4 style="position: relative; left: 148px; font-size: 23px;">Eliminar cliente</h4>

		<form:form name="" method="post" modelAttribute="Cliente">
		
		ID: <form:input type="number" path="cod_Cliente" readonly="true"></form:input>
			<br> 
		Nombre: <form:input type="text" path="nombres" readonly="true"></form:input>
			<br>

			<button type="submit">Guardar</button>

		</form:form>
	</div>
</body>
</html>