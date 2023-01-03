<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<link rel="stylesheet"
	href="<c:url value='/CSS/Plantillas/Registrar.css'/>">

<title>Registrar Material</title>
</head>
<body>

	<%@include file="/WEB-INF/views/shared/tab.jsp"%>
	
	<div class="Form">
	
		<h1>Registro Material</h1>
		
		<form:form name="" method="post" modelAttribute="material">
		
			Material:
			<br>
			<form:input type="text" path="nombre_Materia" placeholder="Material" required="true" />
			<br>
			<br>
			
			<button type="submit">Guardar</button>
			<button type="button" onclick="location.href='<c:url value="/Material/Listar"/>'">Cancelar</button>
		</form:form>
	</div>
</body>
</html>