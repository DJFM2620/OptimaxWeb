<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<link rel="stylesheet" href="<c:url value='/CSS/Plantillas/NavBar.css'/>">

<title>Insert title here</title>
</head>
<body>
	<div class="NavBar">
		<div class="NavBar_Content">
			<div>
				<p>OPTIMAX</p>
			</div>
			<div class="NavBar_Menu">
				<ul>
					<li><a href="<c:url value='/Principal'/>">Inicio</a></li>
					<li><a href="<c:url value='/Lentes'/>">Lentes</a></li>
					<li><a href="<c:url value='/MisPedidos'/>">Mis pedidos</a></li>
					<li><a href="<c:url value='/Cita'/>">Registrar una cita</a></li>
					<li><a href="<c:url value='/MisCitas'/>">Mis citas</a></li>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>