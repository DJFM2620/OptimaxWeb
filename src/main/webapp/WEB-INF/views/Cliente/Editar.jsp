<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<link rel="stylesheet" href="<c:url value='/CSS/Plantillas/Editar.css'/>">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/additional-methods.min.js"></script>

<title>Editar Cliente</title>
</head>
<body>

	<%@include file="/WEB-INF/views/shared/tab.jsp"%>

	<div class="Form">
		<form:form id="formId" name="" method="post" modelAttribute="Cliente">
			<h1>Editar Datos de Cliente</h1>
			
				ID:
				<br>
				<form:input path="cod_Cliente" name="cod" placeholder="codigo"/>
				<br> 
				<br>
				
				Nombre:
				<br>
				<form:input path="nombres" name="nombre" placeholder="nombre"/>
				<br>
				<br>
				
				Apellido Paterno:
				<br>
				<form:input path="apellidop" name="apellidop" placeholder="Apellido Paterno"/>
				<br>
				<br>
				
				Apellido Materno:
				<br>
				<form:input path="apellidom" name="apellidom" placeholder="Apellido Materno"/>
				<br>
				<br>
				
				Celular:
				<br>
				<form:input path="celular" name="celular" placeholder="celular"/>
				<br>
				<br>
				
				DNI:
				<br>
				<form:input path="dni" name="dni" placeholder="dni"/>
				<br>
				<br>
				
				Email:
				<br>
				<form:input path="email" name="email" id="nombres" placeholder="email"/>
				<br>
				<br>
				 
				RUC(Opcional):
				<br>
				<form:input path="ruc" name="ruc" id="nombres" placeholder="ruc"/>
				<br>
				<br>
				
				Direccion:
				<br>
				<form:input path="direccion" name="direccion" type='text' placeholder='direccion' />
				<br>
				<br>
				
				Distrito:
				<br>
				<form:select path="distrito.cod_distrito">
					<form:options items="${bDistrito}" itemValue="cod_distrito"
						itemLabel="nombredistr" />
				</form:select>
				<br>
				<br>
	
				<button class="Button_Submit" type="button" onclick="validate_data()">Guardar</button>
				<button class="Button" type="button" onclick="location.href='<c:url value = "/Cliente/Listar"/>'">Cancelar</button>
				<br>
		</form:form>
		
		<script type="text/javascript" src="/idat/JS/CRUD.js"></script>
	</div>
</body>
</html>