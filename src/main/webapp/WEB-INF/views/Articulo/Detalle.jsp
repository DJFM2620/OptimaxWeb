<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>

<html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="<c:url value='/CSS/Articulo/Detalle.css'/>">

<title>Detalle Producto</title>
</head>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js"
	integrity="sha256-qM7QTJSlvtPSxVRjVWNM2OfTAz/3k5ovHOKmKXuYMO4="
	crossorigin="anonymous">
</script>
<body>
	<div class="card-wrapper">
		<div class="card">
			<!-- card left -->
			<div class="product-imgs">
				<div class="img-display">
					<div class="img-showcase">
						<c:set var="typeImage"
							value="${fn:substringAfter(articulo.imagen,'.')}" />
						<img
							src="data:image/${typeImage};base64,${articulo.getBase64Imagen()}"
							width="310" height="310" />
					</div>
				</div>
			</div>
			<!-- card right -->
			<div class="product-content">
				<div class="product-rating">
					<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
						class="fas fa-star"></i> <i class="fas fa-star"></i> <i
						class="fas fa-star-half-alt"></i> <span>4.7(21)</span>
				</div>

				<div class="product-price">
					<p class="new-price">
						Precio: S/ <span>${articulo.precio}</span>
					</p>
				</div>

				<div class="product-detail">
					<!--  -->
					<ul>
						<li>Color: <span>${articulo.color}</span></li>
						<li>Disponibilidad: <span>En stock</span></li>
						<li>Material: <span>${articulo.tipoMaterialMontura.nombre_Materia}</span></li>
						<li>Modelo: <span>${articulo.tipoModeloMontura.forma_Modelo}</span></li>
						<li>Marca: <span>${articulo.marcaMontura.nombre_Marca}</span></li>

					</ul>
				</div>

				<button class="name noselect"
					onclick="location.href='<c:url value ="/lentes"/>'">Retornar
					al listado de Lentes</button>

				<div class="social-links">
					<p>Comparte en:</p>
					<a href="#"> <i class="fab fa-facebook-f"></i>
					</a> <a href="#"> <i class="fab fa-twitter"></i>
					</a> <a href="#"> <i class="fab fa-instagram"></i>
					</a> <a href="#"> <i class="fab fa-whatsapp"></i>
					</a> <a href="#"> <i class="fab fa-pinterest"></i>
					</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>