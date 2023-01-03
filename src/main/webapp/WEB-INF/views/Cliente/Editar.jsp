<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<link rel="stylesheet" href="<c:url value='/CSS/Cliente/Editar.css'/>">

<title>Editar Cliente</title>
</head>
<body>

	<%@include file="/WEB-INF/views/shared/tab.jsp"%>

	<section>
		<div class="testbox">
			<form:form name="" method="post" modelAttribute="Cliente">
				<section class="contenedor">
					<div class='bold-line'></div>
					<div class='container'>
						<div class='window'>
							<div class='overlay'></div>
							<div class='content'>
								<div class='welcome'>Editar</div>
								<div class='input-fields'>
									ID:
									<form:input path="cod_Cliente" id="nombres"
										placeholder="nombre" readonly="true"
										class='input-line full-width' />
									<br> Nombre:
									<form:input path="nombres" id="nombres" placeholder="nombre"
										required="true" class='input-line full-width' />
									<br> Apellido Paterno:
									<form:input path="apellidop" id="nombres"
										placeholder="Apellido Paterno" required="true"
										class='input-line full-width' />
									<br> Apellido Materno:
									<form:input path="apellidom" id="nombres"
										placeholder="Apellido Materno" required="true"
										class='input-line full-width' />
									<br> CELULAR:
									<form:input path="celular" id="nombres" placeholder="celular"
										required="true" class='input-line full-width' maxlength="9" />
									<br> DNI:
									<form:input path="dni" id="nombres" placeholder="dni"
										required="true" class='input-line full-width' maxlength="8" />
									<br> EMAIL:
									<form:input path="email" id="nombres" placeholder="email"
										required="true" class='input-line full-width' />
									<br> RUC(OPCIONAL):
									<form:input path="ruc" id="nombres" placeholder="ruc"
										class='input-line full-width' />
									<br> DISTRITOS
									<form:select path="distrito.cod_distrito">
										<br>

										<form:options items="${bDistrito}" itemValue="cod_distrito"
											itemLabel="nombredistr" />
										<br>
									</form:select>
									<br> <br>

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
	</section>
</body>
</html>