<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<link rel="stylesheet" href="<c:url value='/CSS/Plantillas/Eliminar.css'/>">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

<title>Eliminar Cliente</title>
</head>
<body>
	<%@include file="/WEB-INF/views/shared/tab.jsp"%>

	<div class="Form">
		<h1>Eliminar cliente</h1>

		<form:form name="" method="post" modelAttribute="Cliente">
		
			ID:
			<br>
			<form:input type="text" path="cod_Cliente" id="codigo" readonly="true"/>
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
			<form:input path="direccion" type='text' placeholder='direccion' readonly="true"/>
			<br>
			<br>
			
			Distrito:
			<br>
				<form:input type="text" path="distrito.nombredistr" readonly="true"/>
			<br>
			<br>
	
			<p>¿Estas seguro de eliminar este cliente?</p>
			<button type="button" class="Delete_Button" onclick="validateRelationship(document.getElementById('codigo'),'/Cliente/Eliminar' ,'/Cliente/Listar')">Eliminar</button>
			<button type="button" class="Cancel_Button" onclick="location.href='<c:url value = "/Cliente/Listar"/>'">Cancelar</button>
		</form:form>
	</div>
	
	<div class="Cart" id="Cart">
		<div class="Cart_Content" id="Cart_Content">
		</div>
	</div>
	
	<script type="text/javascript" src="/idat/JS/CRUD.js"></script>
</body>
</html>