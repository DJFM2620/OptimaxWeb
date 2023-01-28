<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">

<link rel="stylesheet"
	href="<c:url value='/CSS/Pedidos/MisPedidos.css'/>">
	
<link rel="stylesheet"
	href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

<title>Mis pedidos</title>

</head>
<body>

	<%@include file="/WEB-INF/views/shared/NavBar.jsp"%>

	<div class="Main">
		<div class="Content">
			<div class="Search">
				Ingresar DNI: <input type="text" id='dni' maxlength="8" />
				<button type="button" onclick="OrdenesDni(document.getElementById('dni'))">Buscar</button>
			</div>
			<table class="Table">
				<thead>
					<tr>
						<td><b>Pedido</b></td>
						<td><b>Fecha</b></td>
						<td><b>Estado</b></td>
						<td><b>Opciones</b></td>
					</tr>
				</thead>

				<tbody id="TBody">
				</tbody>
			</table>
		</div>
		<div class="Detail">
		
			<div class="Detail_ID">
				<span id="Detail_ID">
					Detalle de Pedido
				</span>
			</div>
		
			<div class="Detail_Items">
				<div class="Detail_Header">
			        <span>Articulo</span>
			        <span>Precio</span>
			        <span>Cantidad</span>
			        <span>SubTotal</span>
			        <span>Imagen</span>
			    </div>
			    <div class="Detail_Content" id="Detail_Content">
			    </div>
			</div>
		
			<div class="Detail_Info">
				<span>SubTotal: </span>
				<span id="Info_SubTotal"></span>
				<span>IGV (18%): </span>
				<span id="Info_IGV"></span>
				<span>Delivery:</span>
				<span id="Info_Delivery"></span>
				<span>Total:</span>
				<span id="Info_Total"></span>
			</div>
		</div>
	</div>

	<%@include file="/WEB-INF/views/shared/Footer.jsp"%>
	
	<script type="text/javascript" src="/idat/JS/Pedidos.js"></script>
</body>
</html>