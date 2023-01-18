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

<title>Editar Cliente</title>
</head>
<body>

	<%@include file="/WEB-INF/views/shared/tab.jsp"%>

	<div class="Form">
		<form:form name="" method="post" modelAttribute="Distrito">
			<h1>Editar Distrito</h1>
			
			ID:	
			<br>
			<form:input type="text" path="cod_distrito" required="true" placeholder="Codigo"/>
			<br>
			<br>
			
			Distrito:
			<br>
			<form:input type="text" path="nombredistr" required="true" placeholder="Distrito"/>
			<br>
			<br>

			<button type="submit">Guardar</button>
			<button type="button"
				onclick="location.href='<c:url value = "/Distrito/Listar"/>'">Cancelar</button>
			<br>
		</form:form>
	</div>
</body>
</html>