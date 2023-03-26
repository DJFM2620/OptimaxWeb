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
	
<title>Registrar Color</title>
	
</head>
<body>

	<%@include file="/WEB-INF/views/shared/tab.jsp"%>

	<div class="Form">
		<h1>Registrar Color</h1>

		<form:form id="formId" name="" method="post" modelAttribute="Color">
		
			Nombre:
			<br>
			<form:input type="text" name="nombre" path="nombre"/>
			<br>
			<br>
	
			<button class="Button_Submit" type="button" onclick="validate_data()">Guardar</button>
			<button class="Button" type="button" onclick="location.href='<c:url value = "/ColorArticulo/Listar"/>'">Cancelar</button>
		</form:form>
	</div>
	
	<script type="text/javascript" src="/idat/JS/CRUD.js"></script>
	
</body>
</html>