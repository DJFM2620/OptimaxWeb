<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" type="text/css" href="CSS/Principal.css">
<link rel="stylesheet"
	href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">

<title>Principal</title>
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

	<div class="Logo">
		<img src="image/logo.jpeg">
	</div>
	
	<div class="Main">
		<div class="Better_Selling">
			<div class="Better_Selling_Title">
				<h3>Los mas vendidos</h3>
			</div>
			
			<div class="Better_Selling_Items">
				<c:forEach var="art" items="${bArticles}">
					<div class="Better_Selling_Item">
					
						<c:set var="typeImage" value="${fn:substringAfter(art.imagen,'.')}" />
						<img src="data:image/${typeImage};base64,${art.getBase64Imagen()}" />
						
						<div class="Item_Flex">
							<input type="text" value="${art.marcaMontura.nombre_Marca}" disabled="disabled" readonly />
						
							<label>S/${art.precio}</label>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>

		<div class="Info">
			<div class="Info_Title">
				<h3>Nuestros Productos</h3>
			</div>
			<div class="Info_Content">
				<p>
					Contamos con los mejores productos de las marcas mas conocidas en la industria de la moda y de marcas peruanas.
				</p>
			</div>
		</div>
	</div>

	<button class="open-button" onclick="openForm()">Inicio Sesion</button>

	<div class="form-popup" id="myForm">
		<form action="/idat/Principal" class="form-container">
			<h1>Login</h1>

			<label for="email"><b>Email</b></label> <input type="text"
				placeholder="Enter Email" name="email" id="emailId" required>

			<label for="psw"><b>Password</b></label> <input type="password"
				placeholder="Enter Password" name="dni" id="dniId" required>

			<a href="<c:url value ='/cliente_registrar'/>">Registrate aqui </a>

			<button type="button" id="button-a" class="btn"
				onclick="execute(document.getElementById('emailId').value,document.getElementById('dniId').value)">Login</button>
			<br>
			<button type="button" class="btn cancel" onclick="closeForm()">Close</button>
		</form>
	</div>

	<div class="Footer">
		<%@include file="/WEB-INF/views/shared/Footer.jsp"%>
	</div>

	<script>
		function openForm() {
			document.getElementById("myForm").style.display = "block";
		}

		function execute(emailId, dniId) {
			if (emailId == "" || dniId == null) {
				alert("Todos los campos son requeridos");
			} else {
				<c:url var="path" value="/validarempleado"/>
				location.href = "${path}" + "/" + emailId + "/" + dniId;

			}
		}

		function closeForm() {
			document.getElementById("myForm").style.display = "none";

		}
	</script>

	<script
		src="https://unpkg.com/sweetalert2@7.8.2/dist/sweetalert2.all.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script src="js/sweetAlert.js"></script>
</body>
</html>