<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">

<link rel="stylesheet" href="<c:url value='/CSS/Pedidos/MisPedidos.css'/>">

<title>Mis pedidos</title>

</head>
<body>
	<div class="imagen">
		<img src="image/logo.jpeg"
			style="position: relative; width: 1000px; height: 261px; top: 62px; left: 412px;">
	</div>

	<div class="header_section_top">
		<div class="row">
			<div class="col-sm-12">
				<div class="custom_menu">
					<ul style="color: white;">
						<li style="color: white;"><a style="color: white;"
							href="<c:url value='/principal'/>">Inicio</a></li>
						<li style="color: white;"><a style="color: white;"
							href="<c:url value='/lentes'/>">Lentes</a></li>

					</ul>
				</div>
			</div>
		</div>
	</div>

	<div class="logo_section">
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<div class="logo">
						<img src="image/logo.jpeg">
					</div>
				</div>
			</div>
		</div>
	</div>





	<div class="dni" style="position: absolute; left: 40%; top: 36%;">
		Colocar dni: <input name="dninuevo" id='dni' maxlength="8" />

		<button type="button" onclick="EnviarDNI()">Buscar</button>
	</div>

	<section>
		<div class="container">




			<table id="table"
				style="position: absolute; /* left: -227px; */ right: 0px; left: -400px; top: 27px;">
				<thead>
					<tr>
						<td><b>Pedido</b></td>
						<td><b>Fecha</b></td>

						<td><b>Accion</b></td>


					</tr>
				</thead>

				<tbody>
					<c:forEach var="pedidos" items="${bPedidos}">
						<tr>
							<td id="codigo${pedidos.cod_pedido}">${pedidos.cod_pedido}</td>
							<td>${pedidos.fecha}</td>



							<td><a
								onclick="verdetalle(document.getElementById('codigo${pedidos.cod_pedido}'))">
									Ver detalle </a></td>

						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</section>


	<script type="text/javascript">
		function EnviarDNI() {

			var ClienteDNI = document.getElementById('dni').value;

			<c:url var="path" value="/Buscarpedidopordni"/>
			location.href = "${path}?code=" + ClienteDNI;
		}
		function verdetalle(codigo) {

			var ClienteDNI = document.getElementById('dni').value;
			var PedidoCODIGO = codigo.innerHTML;

			<c:url var="path" value="/verdetallepedido"/>
			location.href = "${path}?code=" + ClienteDNI + "&codes="
					+ PedidoCODIGO;
		}
	</script>



</body>








</html>