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

<title>Eliminar Articulo</title>

</head>
	<%@include file="/WEB-INF/views/shared/tab.jsp"%>	
	<div class="Form">
		<h1>Eliminar Articulo</h1>
	
		<form:form name="" method="post" modelAttribute="Articulo">
		
	   		ID:
	   		<br>
	   		<form:input type="text" path="codArticulo" id="codigo" readonly="true" />
			<br>
			<br>
			    
	 		Color:
	 		<br>
	 		<form:input type="text" path="color.nombre" readonly="true"/>
			<br>
			<br>
			
		 	Precio: 
		 	<br>
		 	<form:input type="text" path="precio" readonly="true"/>
			<br>
			<br>
	 
	 		Stock:
	 		<br>
	  		<form:input type="text" path="stock" readonly="true"/>
			<br>
			<br>
			
			Marca:
	 		<br>
	  		<form:input type="text" path="marcaMontura.nombre_Marca" readonly="true"/>
			<br>
			<br>
			
			Material:
	 		<br>
	  		<form:input type="text" path="tipoMaterialMontura.nombre_Materia" readonly="true"/>
			<br>
			<br>
			
			Modelo:
	 		<br>
	  		<form:input type="text" path="tipoModeloMontura.forma_Modelo" readonly="true"/>
			<br>
			<br>
			
			<p>¿Estas seguro de eliminar este articulo?</p>
			<button type="button" class="Delete_Button" onclick="validateRelationship(document.getElementById('codigo'),'/Articulo/Eliminar' ,'/Articulo/Listar')">Eliminar</button>
			<button type="button" class="Cancel_Button" onclick="location.href='<c:url value = "/Articulo/Listar"/>'">Cancelar</button>
		</form:form>
	</div>
	
	<div class="Cart" id="Cart">
		<div class="Cart_Content" id="Cart_Content">
		</div>
	</div>
	
	<script type="text/javascript" src="/idat/JS/CRUD.js"></script>
</body>
</html>