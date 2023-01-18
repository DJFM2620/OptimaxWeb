<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<link rel="stylesheet" href="<c:url value='/CSS/Plantillas/Editar.css'/>">

<title>Editar Cliente</title>
</head>
<body>

	<%@include file="/WEB-INF/views/shared/tab.jsp"%>

	<div class="Form">
		<form:form name="" method="post" modelAttribute="Cliente">
			<h1>Editar Datos de Cliente</h1>
			
				ID:
				<br>
				<form:input path="cod_Cliente" id="nombres"
					placeholder="nombre" readonly="true"/>
				<br> 
				<br>
				
				Nombre:
				<br>
				<form:input path="nombres" id="nombres" placeholder="nombre"
					required="true"/>
				<br>
				<br>
				
				Apellido Paterno:
				<br>
				<form:input path="apellidop" id="nombres"
					placeholder="Apellido Paterno" required="true"/>
				<br>
				<br>
				
				Apellido Materno:
				<br>
				<form:input path="apellidom" id="nombres"
					placeholder="Apellido Materno" required="true"/>
				<br>
				<br>
				
				Celular:
				<br>
				<form:input path="celular" id="nombres" placeholder="celular"
					required="true" maxlength="9" />
				<br>
				<br>
				
				DNI:
				<br>
				<form:input path="dni" id="nombres" placeholder="dni"
					required="true" maxlength="8" />
				<br>
				<br>
				
				Email:
				<br>
				<form:input path="email" id="nombres" placeholder="email"
					required="true"/>
				<br>
				<br>
				 
				RUC(Opcional):
				<br>
				<form:input path="ruc" id="nombres" placeholder="ruc"/>
				<br>
				<br>
				
				Distrito:
				<br>
				<form:select path="distrito.cod_distrito">
					<form:options items="${bDistrito}" itemValue="cod_distrito"
						itemLabel="nombredistr" />
				</form:select>
				<br>
				<br>
	
				<button type="submit">Guardar</button>
				<button type="button" onclick="location.href='<c:url value = "/Cliente/Listar"/>'">Cancelar</button>
				<br>
		</form:form>
	</div>
</body>
</html>