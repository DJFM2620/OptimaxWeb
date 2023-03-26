<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<link rel="stylesheet"
	href="<c:url value='/CSS/Plantillas/Registrar.css'/>">

<link
	href="//netdna.bootstrapcdn.com/font-awesome/3.1.1/css/font-awesome.css"
	rel="stylesheet">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/additional-methods.min.js"></script>

<title>Registrar Empleado</title>
</head>
<body>
	<%@include file="/WEB-INF/views/shared/tab.jsp"%>

	<div class="Form">
		<h1>Registrar Empleado</h1>

		<form:form id="formId" name="" method="post" modelAttribute="Empleado">

			Nombre:
			<br>
			<form:input type="text" path="nombres" name="nombre" id="nombres" placeholder="nombre"/>
			<br>
			<br>
			
			Apellido Paterno:
			<br>
			<form:input type="text" path="apellidp" name="apellidp" id="apellidp" placeholder="apellido Paterno"/>
			<br>
			<br>
			
			Apellido Materno:
			<br>
			<form:input type="text" path="apellidom" name="apellidom" id="apellidom" placeholder="apellido Materno"/>
			<br>
			<br>
			
			DNI:
			<br>
			<form:input type="text" path="dni" name="dni" id="dni" placeholder="dni"/>
			<br>
			<br>
			
			Celular:
			<br>
			<form:input type="text" path="telefono" name="telefono" id="telefono" placeholder="telefono"/>
			<br>
			<br>
			
			Email:
			<br>
			<form:input type="text" path="email" name="email" id="name" placeholder="email"/>
			<br>
			<br>

			Cargo:
			<br>
			<form:select path="tipoempleado.cod_cargoemp">
				<form:options items="${bCargo}" itemValue="cod_cargoemp" itemLabel="cargo" />
			</form:select>
			<br>
			<br>

			<button class="Button_Submit" type="button" onclick="validate_data()">Guardar</button>
			<button class="Button" type="button" onclick="location.href='<c:url value = "/Empleado/Listar"/>'">Cancelar</button>
		</form:form>
	</div>
	
	<script type="text/javascript" src="/idat/JS/CRUD.js"></script>
	
</body>
</html>