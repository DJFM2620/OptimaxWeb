<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet"
	href="<c:url value='/CSS/Pedidos/MisPedidos.css'/>">

<link rel="stylesheet"
	href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.15.6/xlsx.core.min.js"></script>

<title>Listar Pedidos</title>
</head>
<body>

	<%@include file="/WEB-INF/views/shared/tabjefedeventas.jsp"%>

	<div class="Main main">
		<div class="Content">
		
			<div class="Search">
				Ingresar DNI: <input type="text" id='dni' maxlength="8" />
				<button type="button" onclick="OrdenesDni(document.getElementById('dni'), 'Listar/Dni', 'Listar')">Buscar</button>
			</div>
			
			<button class="Button_To_Excel" onclick="exportToExcel('Pedidos')">
				<span class="las la-download"></span> <span>EXPORTAR A EXCEL</span>
			</button>
			
			<table class="Table"  id="Table">
				<thead>
					<tr>
						<td><b>Pedido</b></td>
						<td><b>Fecha</b></td>
						<td><b>Nombre Cliente</b></td>
						<td><b>Apellido Cliente</b></td>
						<td><b>DNI Cliente</b></td>
						<td><b>Estado</b></td>
						<td><b>Opciones</b></td>
					</tr>
				</thead>

				<tbody id="TBody">
					<c:forEach var="pedidos" items="${bPedidos}">
						<tr>
							<td id="codigo${pedidos.cod_pedido}">${pedidos.cod_pedido}</td>
							<td>${pedidos.fecha}</td>
							<td>${pedidos.cliente.nombres}</td>
							<td>${pedidos.cliente.apellidop}</td>
							<td id="dni${pedidos.cliente.dni}">${pedidos.cliente.dni}</td>
							<td>${pedidos.estadopedido.estado}</td>
							<td>
								<button onclick="Detalle(document.getElementById('codigo${pedidos.cod_pedido}'))">DETALLE</button>
								<button class="Edit_Button" onclick="location.href='<c:url value ="/Pedido/Editar/${pedidos.cod_pedido}"/>'">
									EDITAR
								</button>
							</td>
						</tr>
					</c:forEach>
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
	<script type="text/javascript" src="/idat/JS/Pedidos.js"></script>
</body>
</html>