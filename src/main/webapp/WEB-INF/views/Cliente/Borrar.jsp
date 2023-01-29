<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Eliminar Cliente</title>
<link rel="stylesheet" href="<c:url value='/CSS/Plantillas/Eliminar.css'/>">

</head>
<body>
	<%@include file="/WEB-INF/views/shared/tab.jsp"%>

	<div class="Form">
		<h1>Eliminar cliente</h1>

		<form:form name="" method="post" modelAttribute="Cliente">
		
			ID:
			<br>
			<form:input type="text" path="cod_Cliente" readonly="true"/>
			<br> 
			<br>
			
			Nombre:
			<br>
			<form:input type="text" path="nombres" readonly="true"/>
			<br>
			<br>
			
			Apellido Paterno:
			<br>
			<form:input type="text" path="apellidop" readonly="true"/>
			<br>
			<br>
			
			Apellido Materno:
			<br>
			<form:input type="text" path="apellidom" readonly="true"/>
			<br>
			<br>
			
			Celular:
			<br>
			<form:input type="text" path="celular" readonly="true"/>
			<br>
			<br>
			
			DNI:
			<br>
			<form:input type="text" path="dni" readonly="true"/>
			<br>
			<br>
			
			Email:
			<br>
			<form:input type="text" path="email" readonly="true" />
			<br>
			<br>
			 
			RUC:
			<br>
			<form:input type="text" path="ruc" readonly="true"/>
			<br>
			<br>
			
			Direccion:
			<br>
			<form:input path="direccion" type='text' placeholder='direccion' />
			<br>
			<br>
			
			Distrito:
			<br>
				<form:input type="text" path="distrito.nombredistr" readonly="true"/>
			<br>
			<br>
	
			<p>¿Estas seguro de eliminar este cliente?</p>
			<button type="submit" class="button">Eliminar</button>
			<button type="button" onclick="location.href='<c:url value = "/Cliente/Listar"/>'">Cancelar</button>
		</form:form>
	</div>
</body>
</html>