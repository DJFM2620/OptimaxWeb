<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>



<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Editar</title>
</head>
<body>


<form:form name="" method="post" modelAttribute="MaterialArticulo">



ID: <form:input type="text" path="cod_TipMaterial" readonly="true"/><br>

Nombre: <form:input type="text" path="Nombre_Materia"/> <br>



<button type="submit">Guardar</button>
<button type="button"
onclick="location.href='<c:url value="/MaterialArticulos"/>'">Cancelar</button>
</form:form>
</body>
</html>