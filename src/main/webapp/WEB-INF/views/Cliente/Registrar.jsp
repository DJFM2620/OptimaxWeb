<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet"
	href="<c:url value='/CSS/Plantillas/Registrar.css'/>">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>	
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/additional-methods.min.js"></script>

<title>Registrar Cliente</title>

</head>
<body>

	<%@include file="/WEB-INF/views/shared/tab.jsp"%>

	<div class="Form">
		<h1>Registrar Cliente</h1>
		
		<form:form id="formId" name="" method="post" modelAttribute="Cliente">
			
			Nombres:
			<br>
			<form:input path="nombres" name="nombre" placeholder='nombres' />
			<br>
			<br>
			
			Apellido Paterno:
			<br>
			<form:input path="apellidop" name="apellidop" placeholder='apellido paterno' />
			<br>
			<br>
			
			Apellido Materno:
			<br>
			<form:input path="apellidom" name="apellidom" placeholder='apellido Materno' />
			<br>
			<br>
			
			Celular:
			<br>
			<form:input path="celular" name="celular" placeholder='celular'/>
			<br>
			<br>
			
			Email:
			<br>
			<form:input path="email" name="email" placeholder='email'/>
			<br>
			<br>
			
			DNI:
			<br>
			<form:input path="dni" name="dni" placeholder='dni'/>
			<br>
			<br>
			
			RUC (Opcional):
			<br>
			<form:input path="ruc" name="ruc" placeholder='ruc'/>
			<br>
			<br>
			
			Direccion:
			<br>
			<form:input path="direccion" name="direccion" placeholder='direccion' />
			<br>
			<br>
			
			Distrito:
			<form:select path="distrito.cod_distrito">
				<form:options items="${bDistrito}" itemValue="cod_distrito" itemLabel="nombredistr" />
			</form:select>
			<br>
			
			<button class="Button_Submit" type="button" onclick="validate_data()">Guardar</button>
			<button class="Button" type="button" onclick="location.href='<c:url value = "/Cliente/Listar"/>'">Cancelar</button>
		</form:form>
	</div>
	
	<script type="text/javascript" src="/idat/JS/CRUD.js"></script>
		
</body>
</html>