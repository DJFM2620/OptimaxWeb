<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<link rel="stylesheet"
	href="<c:url value='/CSS/Plantillas/Registrar.css'/>">

<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600'
	rel='stylesheet' type='text/css'>
<link
	href="//netdna.bootstrapcdn.com/font-awesome/3.1.1/css/font-awesome.css"
	rel="stylesheet">

<title>Registrar Cargo</title>
</head>

<body>

	<%@include file="/WEB-INF/views/shared/tab.jsp"%>

	<div class="Form">
		<h1>Registrar Cargo de Empleado</h1>

		<form:form name="" method="post" modelAttribute="Cargo">	
		
			Cargo:
			<br>	
			<form:input type="text" path="cargo" id="nombres" placeholder="cargo" required="true" />
			<br>
			<br>
			
			<button type="submit">Guardar</button>
			<button type="button" onclick="location.href='<c:url value = "/CargoEmpleado/Listar"/>'">Cancelar</button>
		</form:form>
	</div>

</body>
</html>