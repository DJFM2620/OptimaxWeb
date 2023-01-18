<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<link rel="stylesheet" href="<c:url value='/CSS/Pedidos/Listar.css'/>">

<title>Editar Pedidos</title>

</head>
<body>

	<%@include file="/WEB-INF/views/shared/tabjefedeventas.jsp"%>

	<div class="Form">
		<form:form name="" method="post" modelAttribute="OrdenPedido">

			<section class="contenedor">
				<div class='bold-line'></div>
				<div class='container'
					style="display: -webkit-box; display: -webkit-flex; display: -ms-flexbox; display: flex; -webkit-box-align: center; -webkit-align-items: center; -ms-flex-align: center; align-items: center; -webkit-box-pack: center; -webkit-justify-content: center; -ms-flex-pack: center; justify-content: center; height: 100%; position: relative; top: 130px;">
					<div class='window'
						style="color: white; display: -webkit-box; display: -webkit-flex; display: -ms-flexbox; display: flex; -webkit-flex-flow: column; -ms-flex-flow: column; flex-flow: column; box-shadow: 0px 15px 50px 10px rgb(0 0 0/ 20%); box-sizing: border-box; height: 507px; width: 360px; background: linear-gradient(#8CA6DB, #B993D6); background: -webkit-linear-gradient(#8CA6DB, #B993D6); /* padding-bottom: 903px;">
						<div class='overlay'></div>
						<div class='content'>
							<div class='welcome'>Editar</div>
							<div class='input-fields'>
								ID:
								<form:input path="cod_pedido" id="nombres" readonly="true"
									class='input-line full-width' />
								<br> Fecha:
								<form:input path="fecha" id="nombres" required="true"
									class='input-line full-width' readonly="true" />
								<br> COD CLIENTE
								<form:input path="cliente.cod_Cliente" id="nombres"
									required="true" class='input-line full-width' readonly="true" />
								<br> ESTADO:
								<form:select path="estadopedido.cod_estado">
									<br>

									<form:options items="${bEstado}" itemValue="cod_estado"
										itemLabel="estado" />
									<br>

								</form:select>
								<br>
								<br>



								<button type="submit" class="button"
									style="position: relative; top: 4%; left: 38%;">Guardar</button>
								<br>

							</div>
						</div>
					</div>
				</div>
			</section>
		</form:form>


	</div>

</body>
</html>