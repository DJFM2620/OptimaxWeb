<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<link rel="stylesheet"
	href="<c:url value='/CSS/Plantillas/Registrar.css'/>">
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/additional-methods.min.js"></script>

<title>Registrar Marca</title>

</head>
<body>

	<%@include file="/WEB-INF/views/shared/tab.jsp"%>
	
	<div class="Form">
		<h1>Registrar Marca</h1>
		
		<form:form id="formId" name="" method="post" modelAttribute="MarcaArticulo">
			
			Marca:
			<br>
			<form:input type="text" name="nombre_obj" path="nombre_Marca" placeholder="marca"/>
			<br>
			<br>
			
			<button class="Button_Submit" type="button" onclick="validate_data()">Guardar</button>
			<button class="Button" type="button" onclick="location.href='<c:url value = "/Marca/Listar"/>'">Cancelar</button>
		</form:form>
	</div>
	
	<script type="text/javascript" src="/idat/JS/CRUD.js"></script>
	
</body>
</html>