<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Eliminar Articulo</title>

<link rel="stylesheet" href="<c:url value='/CSS/Articulo/Eliminar.css'/>">

</head>
	<%@include file="/WEB-INF/views/shared/tab.jsp"%>	
	<div class="testbox">
		<h1>Eliminar Articulo</h1>
	
		<form:form name="" method="post" modelAttribute="Articulo">
	   		ID:
	   		<form:input type="text" path="codArticulo" readonly="true" />
			<br>
			    
	 		Color:
	 		<form:input type="text" path="color" id="nombres"
				placeholder="color" />
			<br>
			
		 	Precio: 
		 	<form:input path="precio" id="nombres" placeholder="precio" />
			<br>
	 
	 		Stock 
	  		<form:input path="stock" id="nombres" placeholder="stock" />
			<br>
			<br>
			
			<p>¿Estas seguro de borrar?</p>
			<button type="submit">Si</button>
		</form:form>
	</div>
</body>
</html>