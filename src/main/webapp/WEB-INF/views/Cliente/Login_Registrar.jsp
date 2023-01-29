<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registrar Datos</title>

<link rel="stylesheet"
	href="<c:url value='/CSS/Plantillas/Registrar.css'/>">
</head>
<body>
	<div class="Form">
		<h1>¡Hola! Ingresa tus datos para registrarte</h1>
		
		<form:form name="" method="post" modelAttribute="Cliente">
			
			Nombres:
			<br>
			<form:input path="nombres" placeholder='nombres' />
			<br>
			<br>
			
			Apellido Paterno:
			<br>
			<form:input path="apellidop" placeholder='apellido paterno' />
			<br>
			<br>
			
			Apellido Materno:
			<br>
			<form:input path="apellidom" placeholder='apellido Materno' />
			<br>
			<br>
			
			Celular:
			<br>
			<form:input path="celular" placeholder='celular' maxlength="9" />
			<br>
			<br>
			
			Email:
			<br>
			<form:input path="email" placeholder='email'/>
			<br>
			<br>
			
			DNI:
			<br>
			<form:input path="dni" placeholder='dni' maxlength="8" />
			<br>
			<br>
			
			RUC (Opcional):
			<br>
			<form:input path="ruc" placeholder='ruc' />
			<br>
			<br>
			
			Direccion:
			<br>
			<form:input path="direccion" placeholder='direccion' />
			<br>
			<br>
			
			Distrito:
			<form:select path="distrito.cod_distrito">
				<form:options items="${bDistrito}" itemValue="cod_distrito" itemLabel="nombredistr" />
			</form:select>
			<br>
			<br>
			
			<div class="Login">Ya estas registrado? 
				<span onclick="location.href='<c:url value='/Principal'/>'">
					inicia sesion 
				</span>
			</div>
			<button type="submit">Registrarse</button>
		</form:form>
	</div>
</body>
</html>