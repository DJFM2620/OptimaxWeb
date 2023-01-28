<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">

<link rel="stylesheet" href="<c:url value='/CSS/Sidebar.css'/>">

<title>Insert title here</title>

</head>
<body>
	<nav class="sidebar-menu">
		<ul>
			<li class="has-subnav"><a
				onclick="location.href='<c:url value='/Cita/Listar'/>'"> <i
					class="fa fa-laptop fa-2x"></i> <span class="nav-text">Citas</span>
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