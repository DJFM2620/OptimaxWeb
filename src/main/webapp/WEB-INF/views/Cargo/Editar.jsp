<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Editar Cargo</title>

<link rel="stylesheet"
	href="<c:url value='/CSS/Plantillas/Eliminar.css'/>">

</head>

<body>
	<%@include file="/WEB-INF/views/shared/tab.jsp"%>
	<div class="Form">
		<h1>Editar Cargo</h1>

		<form:form name="" method="post" modelAttribute="Cargo">
     
  			ID:
	   		<br>
	   		<form:input type="text" path="cod_cargoemp" readonly="true"/>
			<br>
			<br>
			    
	 		Cargo:
	 		<br>
	 		<form:input type="text" path="cargo"/>
			<br>
			<br>

			<button type="submit">Guardar</button>
			<button type="button" onclick="location.href='<c:url value = "/CargoEmpleado/Listar"/>'">Cancelar</button>
		</form:form>
	</div>
</body>
</html>