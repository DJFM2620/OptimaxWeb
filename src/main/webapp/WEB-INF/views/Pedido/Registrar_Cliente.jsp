<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix = "form" uri="http://www.springframework.org/tags/form" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link href="<c:url value='/CSS/Cliente/Registrar.css'/>" rel="stylesheet"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

<title>Registro</title>
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
					<li> <a href="<c:url value='/Lentes'/>">Lentes</a></li>
				</ul>
				<button type="button" id="openButton" onclick="AbrirModal()">CARRITO</button>
			</div>
		</div>
	</div>
	
	<div class="Main">
		<div class="Register">
		
			<div class="Data">
				<div class="Data_Client">
				
					<div class='Subtitle_Register'>
						<p>Proporciona tus datos para registrarte</p>
					</div>
					
					<input id="nombres" type='text' placeholder='nombres'/>
				    <input id="apellidop" type='text' placeholder='apellido paterno'/>
				    <input id="apellidom" type='text' placeholder='apellido Materno'/>
				    <input id="celular" type='text' placeholder='celular' maxlength="9"/>
				    <input id="email" type='email' placeholder='Email'/>
				    <input id="dni" type='text' placeholder='dni' maxlength="8"/>
				    <input id="ruc" type='text' placeholder='ruc (opcional)' maxlength="11"/>
				    <input id="direccion" type='text' placeholder='direccion'/>
					
					<select id="distritos">
						<c:forEach var="distrito" items="${bDistrito}">
							<option value="${distrito.cod_distrito}">${distrito.nombredistr}</option>
						</c:forEach>
					</select>
							
					<div class="Register_Center">
						<button type="button" id="btn_continuar">Continuar</button>
				    </div>
				</div>
				
				<div class="Data_Payment_Gateway" id="Data_Payment_Gateway">

					<div class='Data_Item1 Subtitle_Register'>
						<p>Ingresa los datos de tu tarjeta</p>
					</div>

					<div class="Data_Grid_item Data_Item2">
						<div class="Data_Grid_Span_Info">
							<span>Número de tarjeta</span>
							<span>Ingresa los digitos de tu tarjeta</span>
						</div>
						<input id="card[number]" type="text" maxlength="20" size="20" placeholder="5651-3215-9987-3015" data-culqi="card[number]">
					</div>
					
					<div class="Data_Grid_item Data_Item3">
						<div class="Data_Grid_Span_Info">
							<span>CVV</span>
							<span>Ingresa el codigo de seguridad de tu tarjeta</span>
						</div>
						<input id="card[cvv]" type="text" maxlength="4" size="4" placeholder="1234" data-culqi="card[cvv]">
					</div>
					
					<div class="Data_Grid_item Data_Item4">
				    	<div class="Data_Grid_Span_Info">
					    	<span>Fecha expiración (MM/YYYY)</span>
					    	<span>Ingresa la fecha de expiracion de tu tarjeta</span>
				    	</div>
				    	<input id="card[exp_month]" maxlength="2" size="2" placeholder="Mes" data-culqi="card[exp_month]">
				    	<input id="card[exp_year]" maxlength="4" size="4" placeholder="Año" data-culqi="card[exp_year]" >
				    </div>
				    
					<div class="Data_Grid_item Data_Item5">
						<div class="Data_Grid_Span_Info">
							<span>Correo Electrónico</span>
							<span>Ingresa tu correo electronico</span>
						</div>
						<input id="card[email]" type="text" placeholder="Correo Electronico" size="50" data-culqi="card[email]" >
					</div>
				    
				    <div class="Data_Grid_item Data_Item6">
						<div class="Data_Grid_Span_Info">
							<span>Total a Pagar (S/.)</span>
							<span>Monto que se descontara de su cuenta bancaria</span>
						</div>
						<input id="amount" type="text" value="${amount}" readonly="readonly">
					</div>
				    
				    <div class="Data_Grid_item Data_Item7">
				    	<button type="button" id="btn_pagar">PAGAR</button>
				    </div>
				</div>
			</div>
			
		</div>
	</div>
	<script src="https://checkout.culqi.com/js/v4"></script>
	<script type="text/javascript" src="/idat/JS/Pasarela_Pago.js"></script>
</body>
</html>