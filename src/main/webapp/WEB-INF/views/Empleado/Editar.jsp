<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<link rel="stylesheet" href="<c:url value='/CSS/Empleado/Editar.css'/>">

<title>Editar Empleado</title>

</head>
<body>
	<%@include file="/WEB-INF/views/shared/tab.jsp"%>
	<section>
		<div class="testbox">
			<form:form name="" method="post" modelAttribute="Empleado">

				<section class="contenedor">
					<div class='bold-line'></div>
					<div class='container'>
						<div class='window'>
							<div class='overlay'></div>
							<div class='content'>
								<div class='welcome'>Editar</div>
								<div class='input-fields'>

									ID:
									<form:input path="cod_empleado" id="nombres"
										placeholder="nombre" readonly="true"
										class='input-line full-width' />
									<br>

									<form:input type="text" path="nombres" id="nombres"
										placeholder="nombre" required="true"
										class='input-line full-width' />
									<br>

									<form:input type="text" path="apellidp" id="apellidp"
										placeholder="apellido Paterno" required="true"
										class='input-line full-width' />
									<br>

									<form:input type="text" path="apellidom" id="apellidom"
										placeholder="apellido Materno" required="true"
										class='input-line full-width' />
									<br>

									<form:input type="text" path="dni" id="dni" placeholder="dni"
										required="true" class='input-line full-width' />
									<br>

									<form:input type="text" path="telefono" id="telefono"
										placeholder="telefono" required="true"
										class='input-line full-width' />
									<br>

									<form:input type="text" path="email" id="name"
										placeholder="email" required="true"
										class='input-line full-width' />
									<br> <br>


									<form:select path="tipoempleado.cod_cargoemp">
										<br>

										<form:options items="${bCargo}" itemValue="cod_cargoemp"
											itemLabel="cargo" />
										<br>

									</form:select>
									<br>

									<button type="submit" class="button">Guardar</button>
								</div>
							</div>
						</div>
					</div>
				</section>
			</form:form>
		</div>
	</section>
</body>
</html>