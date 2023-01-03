<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="<c:url value='/CSS/SideBar.css'/>" rel="stylesheet" />

</head>
<body>
	<nav class="sidebar-menu">
		<ul>
			<li class="has-subnav"><a
				onclick="location.href='<c:url value='/Articulo/Listar'/>'"> <i
					class="fa fa-laptop fa-2x"></i> <span class="nav-text">Articulos</span>
			</a></li>

			<li class="has-subnav"><a
				onclick="location.href='<c:url value='/Empleado/Listar'/>'"> <i
					class="fa fa-laptop fa-2x"></i> <span class="nav-text">
						Empleados </span>
			</a></li>
			<li class="has-subnav"><a
				onclick="location.href='<c:url value='/CargoEmpleado/Listar'/>'">
					<i class="fa fa-list fa-2x"></i> <span class="nav-text">
						Cargos </span>
			</a></li>
			<li class="has-subnav"><a
				onclick="location.href='<c:url value='/Distrito/Listar'/>'"> <i
					class="fa fa-list fa-2x"></i> <span class="nav-text">
						Distritos </span>
			</a></li>
			<li class="has-subnav"><a
				onclick="location.href='<c:url value='/Marca/Listar'/>'"> <i
					class="fa fa-list fa-2x"></i> <span class="nav-text"> Marca
				</span>
			</a></li>
			<li class="has-subnav"><a
				onclick="location.href='<c:url value='/Material/Listar'/>'"> <i
					class="fa fa-list fa-2x"></i> <span class="nav-text">
						Material </span>
			</a></li>
			<li class="has-subnav"><a
				onclick="location.href='<c:url value='/Modelo/Listar'/>'"> <i
					class="fa fa-list fa-2x"></i> <span class="nav-text"> Modelo
				</span>
			</a></li>
			<li class="has-subnav"><a
				onclick="location.href='<c:url value='/Cliente/Listar'/>'"> <i
					class="fa fa-list fa-2x"></i> <span class="nav-text">
						Cliente </span>
			</a></li>
			<li class="has-subnav"><a
				onclick="location.href='<c:url value='/Empleado/Registrar'/>'">
					<i class="fa fa-list fa-2x"></i> <span class="nav-text">
						Registro empleados </span>
			</a></li>
			<li class="has-subnav"><a
				onclick="location.href='<c:url value='/CargoEmpleado/Registrar'/>'">
					<i class="fa fa-list fa-2x"></i> <span class="nav-text">
						Registro Cargos </span>
			</a></li>

			<li class="has-subnav"><a
				onclick="location.href='<c:url value='/Distrito/Registrar'/>'">
					<i class="fa fa-list fa-2x"></i> <span class="nav-text">
						Registro Distritos </span>
			</a></li>
			<li class="has-subnav"><a
				onclick="location.href='<c:url value='/Marca/Registrar'/>'"> <i
					class="fa fa-list fa-2x"></i> <span class="nav-text">
						Registro marca </span>
			</a></li>
			<li class="has-subnav"><a
				onclick="location.href='<c:url value='/Material/Registrar'/>'">
					<i class="fa fa-list fa-2x"></i> <span class="nav-text">
						Registro Material </span>
			</a></li>
			<li class="has-subnav"><a
				onclick="location.href='<c:url value='/Modelo/Registrar'/>'"> <i
					class="fa fa-list fa-2x"></i> <span class="nav-text">
						Registro Modelo </span>
			</a></li>
			<li class="has-subnav"><a
				onclick="location.href='<c:url value='/Articulo/Registrar'/>'">
					<i class="fa fa-list fa-2x"></i> <span class="nav-text">
						Registro Articulo </span>
			</a></li>
			<li class="has-subnav">
		</ul>

		<ul class="logout">
			<li><a onclick="location.href='<c:url value='/Principal'/>'">
					<i class="fa fa-power-off fa-2x"></i> <span class="nav-text">
						Logout </span>
			</a></li>
		</ul>
	</nav>
</body>
</html>