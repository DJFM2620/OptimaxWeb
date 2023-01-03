<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<link rel="stylesheet" href="<c:url value='/CSS/Pedidos/Detalle.css'/>">

<title>Detalle de Pedido</title>

</head>
<body>
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

	<section>
		<div class="total"
			style="position: absolute; top: 23%; left: 30%; font-size: 28px;">
			Su total es: S/ ${bsubtotal}</div>
		<div class="container">

			<table id="table"
				style="padding: 0%; position: absolute; margin: -109px; margin-left: -500px;">
				<thead>
					<tr>

						<td><b>CODPEDIDO</b></td>
						<td><b>CANTIDAD</b></td>
						<td><b>SUBTOTAL</b></td>
						<td><b>COD_ARTICULO</b></td>
						<td><b>IMAGEN</b></td>



					</tr>
				</thead>

				<tbody>
					<c:forEach var="detalle" items="${bDetalles}">
						<tr>

							<td>${detalle.ordenpedido.cod_pedido}</td>
							<td>${detalle.cantidad}</td>
							<td>S/ ${detalle.subtotal}</td>
							<td>${detalle.articulo.codArticulo}</td>
							<td><c:set var="typeImage"
									value="${fn:substringAfter(detalle.articulo.imagen,'.')}" /> <img
								src="data:image/${typeImage};base64,${detalle.articulo.getBase64Imagen()}"
								width="120" height="120" /></td>



						</tr>
					</c:forEach>
				</tbody>
			</table>


		</div>
	</section>
</body>
</html>