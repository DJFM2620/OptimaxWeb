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

<title>Registrar Distrito</title>
</head>
<%@include file="/WEB-INF/views/shared/tab.jsp"%>
<section>
	<div class="Form">
		<h1>Registro Distrito</h1>

		<form:form name="" method="post" modelAttribute="Distrito">

			Distrito:
			<br>
			<form:input type="text" path="nombredistr" id="nombres"
				placeholder="distrito" required="true" />
			<br>
			<br>
			<button type="submit" class="button">Guardar</button>
			<button type="button" onclick="location.href='<c:url value = "/Distrito/Listar"/>'">Cancelar</button>
		</form:form>
	</div>
</section>
</body>
</html>