<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">

<link rel="stylesheet"
	href="<c:url value='/CSS/Pedidos/MisPedidos.css'/>">
	
<link rel="stylesheet"
	href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

<title>Mis Citas</title>
</head>
<body>

	<%@include file="/WEB-INF/views/shared/NavBar.jsp"%>

	<div class="Main">
		<div class="Content">
			<div class="Search">
				Ingresar DNI: <input type="text" id='dni' maxlength="8"/>
				<button type="button" onclick="CitasDni(document.getElementById('dni'), 'Cita/Dni', 'MisCitas')">Buscar</button>
			</div>
			<table class="Table">
				<thead>
					<tr>
						<td><b>Cita</b></td>
						<td><b>Hora</b></td>
						<td><b>Fecha</b></td>
					</tr>
				</thead>

				<tbody id="TBody">
				</tbody>
			</table>
		</div>
		<div class="Detail">
		
			<div class="Detail_ID">
				<span id="Detail_ID">Informacion</span>
			</div>
		
			<div class="Detail_Items">
			    <div class="Detail_Content" id="Detail_Content">
			    	<p>Ingresa tu DNI para que puedas ver tus citas.</p>
			    	<p>Estas estaran ordenadas por fecha en orden descendente.</p>
			    	<p>Recuerda que si llegas tarde o dias despues de la fecha citada, no habra lugar a reclamo.</p>
			    </div>
			</div>
		</div>
	</div>
	
	<%@include file="/WEB-INF/views/shared/Footer.jsp"%>
	
	<script type="text/javascript" src="/idat/JS/MisCitas.js"></script>
</body>
</html>