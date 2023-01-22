<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" type="text/css" href="CSS/Principal.css">

<title>Principal</title>

</head>
<body>
	<!-- banner bg main start -->
	<div class="banner_bg_main">
		<!-- header top section start -->
		<div class="container">
			<div class="header_section_top">
				<div class="row">
					<div class="col-sm-12">
						<div class="custom_menu">
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
			</div>
		</div>
		<!-- header top section start -->
		<!-- logo section start -->
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
		<!-- logo section end -->
		
	</div>
	<!-- header section end -->
	<!-- banner section start -->
	<!-- banner section end -->

	<!-- banner bg main end -->
	<!-- fashion section start -->
	<div class="fashion_section">
		<div id="main_slider" class="carousel slide" data-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<div class="container">
						<h1 class="fashion_taital">Hombres</h1>
						<div class="fashion_section_2">
							<div class="row">
								<div class="col-lg-4 col-sm-4">
									<div class="box_main">
										<h4 class="shirt_text">Nike</h4>
										<p class="price_text">
											Precio <span style="color: #262626;">$ 30</span>
										</p>
										<div class="tshirt_img">
											<img src="image/lente1.jpg">
										</div>
										<div class="btn_main">

											<div class="seemore_bt">
												<a href="<c:url value='/lentes'/>">Ver mas</a>
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-4 col-sm-4">
									<div class="box_main">
										<h4 class="shirt_text">Nike</h4>
										<p class="price_text">
											Precio <span style="color: #262626;">$ 30</span>
										</p>
										<div class="tshirt_img">
											<img src="image/lente4.png">
										</div>
										<div class="btn_main">

											<div align="center" class="seemore_bt">
												<a href="<c:url value='/lentes'/>">Ver mas</a>
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-4 col-sm-4">
									<div class="box_main">
										<h4 class="shirt_text">Nike</h4>
										<p class="price_text">
											Precio <span style="color: #262626;">$ 100</span>
										</p>
										<div class="tshirt_img">
											<img src="image/lente6.jpg">
										</div>
										<div class="btn_main">

											<div align="center" class="seemore_bt">
												<a href="<c:url value='/lentes'/>">Ver mas</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="carousel-item">
					<div class="container">
						<h1 class="fashion_taital">Hombres</h1>
						<div class="fashion_section_2">
							<div class="row">
								<div class="col-lg-4 col-sm-4">
									<div class="box_main">
										<h4 class="shirt_text">Nike</h4>
										<p class="price_text">
											Precio <span style="color: #262626;">$ 200</span>
										</p>
										<div class="tshirt_img">
											<img src="image/lente8.jpg">
										</div>
										<div class="btn_main">

											<div align="center" class="seemore_bt">
												<a href="<c:url value='/lentes'/>">Ver mas </a>
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-4 col-sm-4">
									<div class="box_main">
										<h4 class="shirt_text">Nike</h4>
										<p class="price_text">
											Precio <span style="color: #262626;">$200</span>
										</p>
										<div class="tshirt_img">
											<img src="image/lente9.jpg">
										</div>
										<div class="btn_main">

											<div class="seemore_bt">
												<a href="<c:url value='/lentes'/>">Ver mas</a>
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-4 col-sm-4">
									<div class="box_main">
										<h4 class="shirt_text">Adidas</h4>
										<p class="price_text">
											Precio <span style="color: #262626;">$ 400</span>
										</p>
										<div class="tshirt_img">
											<img src="image/lente10.jpg">
										</div>
										<div class="btn_main">

											<div class="seemore_bt">
												<a href="<c:url value='/lentes'/>">Ver mas </a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="carousel-item">
					<div class="container">
						<h1 class="fashion_taital">Hombres</h1>
						<div class="fashion_section_2">
							<div class="row">
								<div class="col-lg-4 col-sm-4">
									<div class="box_main">
										<h4 class="shirt_text">Adidas</h4>
										<p class="price_text">
											Precio <span style="color: #262626;">$ 300</span>
										</p>
										<div class="tshirt_img">
											<img src="image/lente11.jpg">
										</div>
										<div class="btn_main">

											<div class="seemore_bt">
												<a href="<c:url value='/lentes'/>">Ver mas</a>
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-4 col-sm-4">
									<div class="box_main">
										<h4 class="shirt_text">Adidas</h4>
										<p class="price_text">
											Precio <span style="color: #262626;">$ 150</span>
										</p>
										<div class="tshirt_img">
											<img src="image/lente12.jpg">
										</div>
										<div class="btn_main">

											<div class="seemore_bt">
												<a href="<c:url value='/lentes'/>">Ver mas</a>
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-4 col-sm-4">
									<div class="box_main">
										<h4 class="shirt_text">Adidas</h4>
										<p class="price_text">
											Precio <span style="color: #262626;">$ 680</span>
										</p>
										<div class="tshirt_img">
											<img src="image/lente13.jpg">
										</div>
										<div class="btn_main">
											<div class="seemore_bt">
												<a href="<c:url value='/lentes'/>">Ver mas </a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<a class="carousel-control-prev" href="#main_slider" role="button"
				data-slide="prev"> <i class="fa fa-angle-left"></i>
			</a> <a class="carousel-control-next" href="#main_slider" role="button"
				data-slide="next"> <i class="fa fa-angle-right"></i>
			</a>
		</div>
	</div>
	<!-- fashion section end -->
	<!-- electronic section start -->
	<div class="fashion_section">
		<div id="electronic_main_slider" class="carousel slide"
			data-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<div class="container">
						<h1 class="fashion_taital">Mujeres</h1>
						<div class="fashion_section_2">
							<div class="row">
								<div class="col-lg-4 col-sm-4">
									<div class="box_main">
										<h4 class="shirt_text">Jordan</h4>
										<p class="price_text">
											Precio <span style="color: #262626;">$ 100</span>
										</p>
										<div class="electronic_img">
											<img src="image/lente14.jpg">
										</div>
										<div class="btn_main">
											<div class="seemore_bt">
												<a href="<c:url value='/lentes'/>">Ver mas</a>
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-4 col-sm-4">
									<div class="box_main">
										<h4 class="shirt_text">Jordan</h4>
										<p class="price_text">
											Precio <span style="color: #262626;">$ 100</span>
										</p>
										<div class="electronic_img">
											<img src="image/lente15.jpg">
										</div>
										<div class="btn_main">
											<div class="seemore_bt">
												<a href="#">Ver mas</a>
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-4 col-sm-4">
									<div class="box_main">
										<h4 class="shirt_text">Jordan</h4>
										<p class="price_text">
											Precio <span style="color: #262626;">$ 100</span>
										</p>
										<div class="electronic_img">
											<img src="image/lente16.jpg">
										</div>
										<div class="btn_main">
											<div class="seemore_bt">
												<a href="#">Ver mas</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="carousel-item">
					<div class="container">
						<h1 class="fashion_taital">Mujeres</h1>
						<div class="fashion_section_2">
							<div class="row">
								<div class="col-lg-4 col-sm-4">
									<div class="box_main">
										<h4 class="shirt_text">Jordan</h4>
										<p class="price_text">
											Precio <span style="color: #262626;">$ 100</span>
										</p>
										<div class="electronic_img">
											<img src="image/lente17.jpg">
										</div>
										<div class="btn_main">
											<div class="seemore_bt">
												<a href="#">Ver mas</a>
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-4 col-sm-4">
									<div class="box_main">
										<h4 class="shirt_text">Jordan</h4>
										<p class="price_text">
											Precio <span style="color: #262626;">$ 100</span>
										</p>
										<div class="electronic_img">
											<img src="image/lente18.jpg">
										</div>
										<div class="btn_main">
											<div class="seemore_bt">
												<a href="#">Ver mas</a>
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-4 col-sm-4">
									<div class="box_main">
										<h4 class="shirt_text">Jordan</h4>
										<p class="price_text">
											Precio <span style="color: #262626;">$ 100</span>
										</p>
										<div class="electronic_img">
											<img src="image/lente19.jpg">
										</div>
										<div class="btn_main">
											<div class="seemore_bt">
												<a href="<c:url value='/lentes'/>">Ver mas</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="carousel-item">
					<div class="container">
						<h1 class="fashion_taital">Mujeres</h1>
						<div class="fashion_section_2">
							<div class="row">
								<div class="col-lg-4 col-sm-4">
									<div class="box_main">
										<h4 class="shirt_text">Jordan</h4>
										<p class="price_text">
											Precio <span style="color: #262626;">$ 100</span>
										</p>
										<div class="electronic_img">
											<img src="image/lente20.jpg">
										</div>
										<div class="btn_main">
											<div class="seemore_bt">
												<a href="<c:url value='/lentes'/>">Ver mas</a>
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-4 col-sm-4">
									<div class="box_main">
										<h4 class="shirt_text">Jordan</h4>
										<p class="price_text">
											Precio <span style="color: #262626;">$ 100</span>
										</p>
										<div class="electronic_img">
											<img src="image/lente21.png">
										</div>
										<div class="btn_main">
											<div class="seemore_bt">
												<a href="<c:url value='/lentes'/>">Ver mas</a>
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-4 col-sm-4">
									<div class="box_main">
										<h4 class="shirt_text">Jordan</h4>
										<p class="price_text">
											Precio <span style="color: #262626;">$ 100</span>
										</p>
										<div class="electronic_img">
											<img src="image/lente22.jpg">
										</div>
										<div class="btn_main">
											<div class="seemore_bt">
												<a href="<c:url value='/lentes'/>">Ver mas</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<a class="carousel-control-prev" href="#electronic_main_slider"
				role="button" data-slide="prev"> <i class="fa fa-angle-left"></i>
			</a> <a class="carousel-control-next" href="#electronic_main_slider"
				role="button" data-slide="next"> <i class="fa fa-angle-right"></i>
			</a>
		</div>
	</div>
	<!-- electronic section end -->
	<!-- jewellery  section start -->

	<!-- jewellery  section end -->
	<!-- footer section start -->





	<!-- footer section end -->
	<!-- copyright section start -->
	<div class="copyright_section">
		<div class="container">
			<p class="copyright_text">© 2020 All Rights Reserved.</p>
		</div>
	</div>
	<!-- copyright section end -->
	<!-- Javascript files-->
	<script src="js/jquery.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.bundle.min.js"></script>
	<script src="js/jquery-3.0.0.min.js"></script>
	<script src="js/plugin.js"></script>
	<!-- sidebar -->
	<script src="js/jquery.mCustomScrollbar.concat.min.js"></script>
	<script src="js/custom.js"></script>

	<button class="open-button" onclick="openForm()">Inicio Sesion</button>

	<div class="form-popup" id="myForm">
		<form action="/idat/principal" class="form-container">
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