<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Eliminar Distrito</title>
<link rel="stylesheet" href="<c:url value='/CSS/Plantillas/Eliminar.css'/>">

</head>
<body>
	<%@include file="/WEB-INF/views/shared/tab.jsp"%>

	<div class="Form">
		<h1>Eliminar Distrito</h1>

		<form:form name="" method="post" modelAttribute="Distrito">
		
			ID:
			<br>
			<form:input type="text" path="cod_distrito" readonly="true"/>
			<br> 
			<br>
			
			Distrito:
			<br>
			<form:input type="text" path="nombredistr" readonly="true"/>
			<br>
			<br>
	
			<p>¿Estas seguro de eliminar este distrito?</p>
			<button type="submit" class="button">Eliminar</button>
			<button type="button" onclick="location.href='<c:url value = "/Distrito/Listar"/>'">Cancelar</button>
		</form:form>
	</div>
</body>
</html>