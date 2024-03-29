<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Listado Articulos</title>


<link href="<c:url value='/css/sidebar.css'/>" rel="stylesheet"/>

<style type="text/css">

body {
  background-image: url('image/admin.jpg');
  background-repeat: no-repeat;
  background-attachment: fixed;
  background-size: 100% 100%;
}


 .container {
	 position: absolute;
	 top: 50%;
	 left: 50%;
	 transform: translate(-50%,-50%);
}
 table {
	 width: 800px;
	 border-collapse: collapse;
	 overflow: hidden;
	 box-shadow: 0 0 20px rgba(0,0,0,0.1);
}
 th, td {
	 padding: 15px;
	 background-color:navy;
	 color: white;
}
 th {
	 text-align: left;
}
 thead th {
	 background-color: #55608f;
}
 tbody tr:hover {
	 background-color: rgba(255,255,255,0.3);
}
 tbody td {
	 position: relative;
}
 tbody td:hover:before {
	 content: "";
	 position: absolute;
	 left: 0;
	 right: 0;
	 top: -9999px;
	 bottom: -9999px;
	 z-index: -1;
}
</style>
</head>
<body style="background: url('image/admin.jpg');">

<%@include file="/WEB-INF/views/shared/tab.jsp" %>  
<section>

<div class="container" >
  
    <table>
      <thead>
		<tr>
		<td><b>ID</b></td>
		<td><b>Nombre</b></td>
		<td><b>Acci�n</b></td>
	</tr>
	</thead>

      <tbody>
			<c:forEach var="material" items="${bMaterialArticulos}">
		<tr>
			<td><b>${material.cod_TipMaterial}</b></td>
			<td><b>${material.nombre_Materia}</b></td>
		<td>
		<a href ="<c:url value='/EditarMaterialArticulo/${material.cod_TipMaterial}'/>">Editar</a>
		<a href ="<c:url value='/EliminarMaterialArticulo/${material.cod_TipMaterial}'/>">Borrar</a>
		</td>
		</tr>
		</c:forEach>
	</tbody>
     </table>
</div> 
</section>
</body>
</html>