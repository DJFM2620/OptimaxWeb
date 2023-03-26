<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Editar Articulo</title>

<link rel="stylesheet"
	href="<c:url value='/CSS/Plantillas/Editar.css'/>">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>	
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/additional-methods.min.js"></script>

</head>

<body>
	<%@include file="/WEB-INF/views/shared/tab.jsp"%>
	<div class="Form">
		<h1>Editar Articulo</h1>

		<form:form id="formId" name="" method="post" modelAttribute="Articulo" enctype="multipart/form-data">
     
  			Codigo: 
  			<br>
  			<form:input type="text" name="cod" path="codArticulo" id="nombres" placeholder="codigo"/>
			<br>
			<br>
      
  			Seleccionar Imagen:
  			<br>
  			<input type="file" name="picture" accept="image/jpeg,image/png" />
			<br>
			<br>
  
 			Precio:
	 		<br>
	 		<form:input path="precio" name="precio" placeholder="precio" />
			<br>
			<br>
	 
	  		Stock:
	  		<br>
	  		<form:input path="stock" name="stock" placeholder="stock"/>
			<br>
			<br>
  
  			Color:
 			<br>
			<form:select path="color.cod_color">
				<form:options items="${bColores}" itemValue="cod_color" itemLabel="nombre" />
			</form:select>
			<br>
			<br>
  
 			Marcas:  
 			<br>
 			<form:select path="marcaMontura.cod_Marca">
				<form:options items="${bMarca}" itemValue="cod_Marca" itemLabel="nombre_Marca" />
			</form:select>
			<br>
			<br>
 	
 			Modelo:
 			<br>
 			<form:select path="tipoModeloMontura.cod_Modelo">
				<form:options items="${bModelo}" itemValue="cod_Modelo" itemLabel="forma_Modelo" />
			</form:select>
			<br>
			<br>
			
 			Material:
 			<br>
 			<form:select path="tipoMaterialMontura.cod_TipMaterial">
				<form:options items="${bMaterial}" itemValue="cod_TipMaterial" itemLabel="nombre_Materia" />
			</form:select>
			<br>
			<br>

			
			<button class="Button_Submit" type="button" onclick="validate_data()">Guardar</button>
			<button class="Button" type="button" onclick="location.href='<c:url value = "/Articulo/Listar"/>'">Cancelar</button>
		</form:form>
	</div>
	
	<script type="text/javascript" src="/idat/JS/CRUD.js"></script>
	
</body>
</html>