<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Editar Articulo</title>

<link rel="stylesheet" href="<c:url value='/CSS/Articulo/Editar.css'/>">

</head>

<body>
	<%@include file="/WEB-INF/views/shared/tab.jsp"%>
	<div class="testbox">
		<h1>Editar Articulo</h1>

		<form:form name="" method="post" modelAttribute="Articulo"
			enctype="multipart/form-data">
     
  			ID: 
  			<form:input type="text" path="codArticulo" id="nombres"
				placeholder="codigo" readonly="true" />
			<br>    
      
  			Seleccione imagen:
  			<input type="file" name="picture"
				accept="image/jpeg,image/png" />
			<br>
  
 			Precio:
 			<form:input path="precio" id="nombres" placeholder="precio" />
			<br>
 
  			Stock:
  			<form:input path="stock" id="nombres" placeholder="stock" />
			<br>
			<br>
  
  			Color:
 			<br>
			<form:select path="color.cod_Color">
				<form:options items="${bColores}" itemValue="cod_Color" itemLabel="nombre" />
			</form:select>
			<br>
			<br>
  
 			Marcas:  
 			<form:select path="marcaMontura.cod_Marca">
				<br>
				<br>
				<form:options items="${bMarca}" itemValue="cod_Marca"
					itemLabel="nombre_Marca" />
				<br>
				<br>
			</form:select>
			<br>
			<br>
 	
 			Modelo:
 			<form:select path="tipoModeloMontura.cod_Modelo">
				<br>
				<form:options items="${bModelo}" itemValue="cod_Modelo"
					itemLabel="forma_Modelo" />
				<br>
			</form:select>
			<br>
			<br>
			
 			Material :
 			<form:select path="tipoMaterialMontura.cod_TipMaterial">
				<br>
				<form:options items="${bMaterial}" itemValue="cod_TipMaterial"
					itemLabel="nombre_Materia" />
				<br>
			</form:select>
			<br>
			
			<button type="submit">Guardar</button>
		</form:form>
	</div>
</body>
</html>