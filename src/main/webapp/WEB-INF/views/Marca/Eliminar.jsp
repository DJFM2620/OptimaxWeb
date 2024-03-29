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

<title>Eliminar Marca Articulo</title>

</head>
<body>

	<%@include file="/WEB-INF/views/shared/tab.jsp"%>
	
	<div class="Form">
		<h1>Eliminar Marca</h1>

		<form:form name="" method="post" modelAttribute="MarcaArticulo">
			Marca ID: 
			<br>
			<form:input type="text" path="cod_Marca" id="codigo" readonly="true" />
			<br>
			<br>
			
			Nombre: 
			<br>
			<form:input type="text" path="nombre_Marca" readonly="true" />
			<br>
			<br>
			
			<p>�Estas seguro de eliminar esta marca?</p>
			<button type="button" class="Delete_Button" onclick="validateRelationship(document.getElementById('codigo'),'/Marca/Eliminar' ,'/Marca/Listar')">Eliminar</button>
			<button type="button" class="Cancel_Button"  onclick="location.href ='<c:url value = "/Marca/Listar"/>'">Cancelar</button>
		</form:form>
	</div>
	
	<div class="Cart" id="Cart">
		<div class="Cart_Content" id="Cart_Content">
		</div>
	</div>
	
	<script type="text/javascript" src="/idat/JS/CRUD.js"></script>
</body>
</html>