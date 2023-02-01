<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix = "form" uri="http://www.springframework.org/tags/form" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<link rel="stylesheet" href="<c:url value='/CSS/Plantillas/Eliminar.css'/>">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

<title>Eliminar Empleado</title>
</head>
<body>
	<%@include file="/WEB-INF/views/shared/tab.jsp"%>

	<div class="Form">
		<h1>Eliminar Empleado</h1>
		<form:form name="" method="post" modelAttribute="Empleado">

			ID:
			<br>
			<form:input path="cod_empleado" id="codigo" readonly="true"/>
			<br>
			<br>

			Nombre:
			<br>
			<form:input type="text" path="nombres" readonly="true"/>
			<br>
			<br>
			
			Apellido Paterno:
			<br>
			<form:input type="text" path="apellidp" readonly="true"/>
			<br>
			<br>

			Apellido Materno:
			<br>
			<form:input type="text" path="apellidom" readonly="true"/>
			<br>
			<br>
			
			Celular:
			<br>
			<form:input type="text" path="telefono" readonly="true" />
			<br>
			<br>
			
			DNI:
			<br>
			<form:input type="text" path="dni" placeholder="dni" readonly="true"/>
			<br>
			<br>
			
			Email:
			<br>
			<form:input type="email" path="email" readonly="true"/>
			<br>
			<br>

			Cargo:
			<br>
			<form:input type="email" path="tipoempleado.cargo" readonly="true"/>
			<br>
			<br>

			<p>¿Estas seguro de eliminar este empleado?</p>

			<button type="button" class="Delete_Button" onclick="validateRelationship(document.getElementById('codigo'),'/Empleado/Eliminar' ,'/Empleado/Listar')">Eliminar</button>
			<button type="button" class="Cancel_Button"  onclick="location.href='<c:url value = "/Empleado/Listar"/>'">Cancelar</button>
		</form:form>
	</div>
	
	<div class="Cart" id="Cart">
		<div class="Cart_Content" id="Cart_Content">
		</div>
	</div>
	
	<script type="text/javascript" src="/idat/JS/CRUD.js"></script>
</body>
</html>