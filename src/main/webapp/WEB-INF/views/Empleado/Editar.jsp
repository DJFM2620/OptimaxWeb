<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<link rel="stylesheet" href="<c:url value='/CSS/Plantillas/Editar.css'/>">

<title>Editar Empleado</title>

</head>
<body>
	<%@include file="/WEB-INF/views/shared/tab.jsp"%>
	<div class="Form">
		<h1>Editar Datos de Empleado</h1>
		<form:form name="" method="post" modelAttribute="Empleado">

			ID:
			<br>
			<form:input path="cod_empleado" id="nombres" placeholder="nombre" readonly="true"/>
			<br>
			<br>

			Nombre:
			<br>
			<form:input type="text" path="nombres" id="nombres" placeholder="nombre" required="true"/>
			<br>
			<br>
			
			Apellido Paterno:
			<br>
			<form:input type="text" path="apellidp" id="apellidp" placeholder="apellido Paterno" required="true"/>
			<br>
			<br>

			Apellido Materno:
			<br>
			<form:input type="text" path="apellidom" id="apellidom" placeholder="apellido Materno" required="true"/>
			<br>
			<br>
			
			Celular:
			<br>
			<form:input type="text" path="telefono" id="telefono" placeholder="telefono" maxlength="9" required="true"/>
			<br>
			<br>
			
			DNI:
			<br>
			<form:input type="text" path="dni" id="dni" placeholder="dni" maxlength="8" required="true"/>
			<br>
			<br>
			
			Email
			<br>
			<form:input type="email" path="email" id="email" placeholder="email" required="true"/>
			<br>
			<br>

			Cargo:
			<br>
			<form:select path="tipoempleado.cod_cargoemp">
				<form:options items="${bCargo}" itemValue="cod_cargoemp" itemLabel="cargo" />
			</form:select>
			<br>
			<br>

			<button type="submit" class="button">Guardar</button>
			<button type="button" onclick="location.href='<c:url value = "/Empleado/Listar"/>'">Cancelar</button>
		</form:form>
	</div>
</body>
</html>