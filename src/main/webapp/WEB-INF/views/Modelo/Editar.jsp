<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<link rel="stylesheet"
	href="<c:url value='/CSS/ModeloArticulo/Editar.css'/>">

<title>Editar Modelo Articulo</title>

</head>
<body>
	<%@include file="/WEB-INF/views/shared/tab.jsp"%>
	<section>
		<div class="testbox">
			<h1>Editar - Modelo Articulo</h1>

			<form:form name="" method="post" modelAttribute="ModeloArticulo">

				<label id="icon" for=""><i class="icon-user "></i></label>
		ID: <form:input type="number" path="cod_Modelo" readonly="true" />
				<br>

				<label id="icon" for="name1"><i class="icon-user "></i></label>
		Forma: <form:input type="text" path="forma_Modelo" />
				<br>

				<button type="submit">Guardar</button>
				<button type="button"
					onclick="location.href ='<c:url value = "/ModelosArticulos"/>'">Cancelar</button>

			</form:form>
		</div>
	</section>
</body>
</html>