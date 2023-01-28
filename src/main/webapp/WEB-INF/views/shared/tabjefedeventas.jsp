<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="<c:url value='/CSS/Sidebar.css'/>" rel="stylesheet" />


</head>
<body>
	<nav class="sidebar-menu">
		<ul>
			<li class="has-subnav"><a
				onclick="location.href='<c:url value='/Pedido/Listar'/>'"> <i
					class="fa fa-laptop fa-2x"></i> <span class="nav-text">Pedidos</span>
			</a></li>
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