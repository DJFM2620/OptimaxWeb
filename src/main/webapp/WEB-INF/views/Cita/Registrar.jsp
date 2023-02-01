<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html>
<head>
<link rel="stylesheet" href="<c:url value='/CSS/Cita/Registrar.css'/>">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
<meta charset="utf-8">
<title>Registrar Cita</title>
<style type="text/css">
</style>

</head>
<div class="container">
	<header>Registro de Citas</header>
	<div class="progress-bar">
		<div class="step">
			<p>Info</p>
			<div class="bullet">
				<span>1</span>
			</div>
			<div class="check fas fa-check"></div>
		</div>
		<div class="step">
			<p>Fecha</p>
			<div class="bullet">
				<span>2</span>
			</div>
			<div class="check fas fa-check"></div>
		</div>
		<div class="step">
			<p>Datos</p>
			<div class="bullet">
				<span>3</span>
			</div>
			<div class="check fas fa-check"></div>
		</div>
		<div class="step">
			<p>Aceptar</p>
			<div class="bullet">
				<span>4</span>
			</div>
			<div class="check fas fa-check"></div>
		</div>
	</div>
	<div class="form-outer">
		<form action="/idat/Cita" method="post">
			<div class="page slide-page">
				<div class="title" style="top: 44%; left: 48%; margin-left: 130px;">
					Aviso</div>
				<img src="image/logo.jpeg"
					style="width: 343px; height: 157px; position: relative; top: 50px;">
				<div class="field">

					<p style="position: relative; top: 156%;">
						El horario de atencion es de 7:00AM a 20:00PM<br> Si se
						registra en un horario no establecido no se atendera. La optica no
						se hace responsable de los rembolsos.
					</p>
					<br> <br> <br>



				</div>
				<div class="field">
					<button class="firstNext next"
						style="position: absolute; left: 0%; top: 519%;">Siguiente</button>
				</div>
			</div>
			<div class="page">
				<div class="title">Ingresar fecha:</div>
				<div class="field">
					<div class="label">Horario</div>
					<input value="horario" type="date" name="mescliente"
						onchange="myFunction(this.value)">
				</div>
				<div class="field">
					<div class="label">Hora</div>
					<input type="time" name="horacliente"
						onchange="myFunctions(this.value)">
				</div>
				<div class="field btns">
					<button class="prev-1 prev">Atras</button>
					<button class="next-1 next">Siguiente</button>
				</div>
			</div>
			<div class="page">
				<div class="title">Datos del cliente</div>
				<div class="field">
					<div class="label">Nombre</div>
					<input type="text" name="nombrecliente">
				</div>
				<div class="field">
					<div class="label">Apellido Paterno</div>
					<input type="text" name="apellidopcliente">
				</div>
				<div class="field">
					<div class="label">Apellido materno</div>
					<input type="text" name="apellidomcliente">
				</div>

				<div class="field">
					<div class="label">Email</div>
					<input type="email" name="emailcliente">
				</div>
				<div class="field">
					<div class="label">DNI</div>
					<input maxlength="8" name="dnicliente">
				</div>
				<div class="field">
					<div class="label">Celular</div>
					<input maxlength="9" name="celularcliente">
				</div>
				<div class="field">
					<div class="label">Distrito</div>
					<select name="namedistrito">
						<c:forEach items="${bDistritos}" var="dis">
							<option value="${dis.cod_distrito}">${dis.nombredistr}</option>
						</c:forEach>
					</select>
				</div>


				<div class="field btns">
					<button class="prev-2 prev">Atras</button>
					<button class="next-2 next">Siguiente</button>
				</div>
			</div>
			<div class="page">
				<div class="title">Datos de la cita:</div>
				<div class="field">

					<p id="demo"></p>

				</div>
				<div class="field">
					<div class="label">

						<p id="demos"></p>
					</div>

				</div>
				<div class="field">
					<div class="label">

						<p id="demosh"></p>
					</div>

				</div>
				<div class="field btns">
					<button class="prev-3 prev">Atras</button>
					<button class="submit" type="submit">Registrar</button>
				</div>
			</div>
		</form>
	</div>
</div>


<script type="text/javascript">
	const slidePage = document.querySelector(".slide-page");
	const nextBtnFirst = document.querySelector(".firstNext");
	const prevBtnSec = document.querySelector(".prev-1");
	const nextBtnSec = document.querySelector(".next-1");
	const prevBtnThird = document.querySelector(".prev-2");
	const nextBtnThird = document.querySelector(".next-2");
	const prevBtnFourth = document.querySelector(".prev-3");
	const submitBtn = document.querySelector(".submit");
	const progressText = document.querySelectorAll(".step p");
	const progressCheck = document.querySelectorAll(".step .check");
	const bullet = document.querySelectorAll(".step .bullet");
	let current = 1;

	nextBtnFirst.addEventListener("click", function(event) {
		event.preventDefault();
		slidePage.style.marginLeft = "-25%";
		bullet[current - 1].classList.add("active");
		progressCheck[current - 1].classList.add("active");
		progressText[current - 1].classList.add("active");
		current += 1;
	});
	nextBtnSec.addEventListener("click", function(event) {
		event.preventDefault();
		slidePage.style.marginLeft = "-50%";
		bullet[current - 1].classList.add("active");
		progressCheck[current - 1].classList.add("active");
		progressText[current - 1].classList.add("active");
		current += 1;
	});
	nextBtnThird.addEventListener("click", function(event) {
		event.preventDefault();
		slidePage.style.marginLeft = "-75%";
		bullet[current - 1].classList.add("active");
		progressCheck[current - 1].classList.add("active");
		progressText[current - 1].classList.add("active");
		current += 1;
	});
	submitBtn.addEventListener("click", function() {
		bullet[current - 1].classList.add("active");
		progressCheck[current - 1].classList.add("active");
		progressText[current - 1].classList.add("active");
		current += 1;
		setTimeout(function() {
			alert("Your Form Successfully Signed up");
			location.reload();
		}, 800);
	});
	prevBtnSec.addEventListener("click", function(event) {
		event.preventDefault();
		slidePage.style.marginLeft = "0%";
		bullet[current - 2].classList.remove("active");
		progressCheck[current - 2].classList.remove("active");
		progressText[current - 2].classList.remove("active");
		current -= 1;
	});
	prevBtnThird.addEventListener("click", function(event) {
		event.preventDefault();
		slidePage.style.marginLeft = "-25%";
		bullet[current - 2].classList.remove("active");
		progressCheck[current - 2].classList.remove("active");
		progressText[current - 2].classList.remove("active");
		current -= 1;
	});
	prevBtnFourth.addEventListener("click", function(event) {
		event.preventDefault();
		slidePage.style.marginLeft = "-50%";
		bullet[current - 2].classList.remove("active");
		progressCheck[current - 2].classList.remove("active");
		progressText[current - 2].classList.remove("active");
		current -= 1;
	});
</script>
<script type="text/javascript">
	function funcion() {
		var x = document.getElementById("doctor").value;
		document.getElementById("demo").innerHTML = "Doctor: " + x;
	}
</script>


<script type="text/javascript">
	function myFunction(val) {
		document.getElementById("demos").innerHTML = "Fecha: " + val;
	}
</script>
<script type="text/javascript">
	function myFunctions(val) {
		document.getElementById("demosh").innerHTML = "Hora: " + val;
	}
</script>
</body>
</html>