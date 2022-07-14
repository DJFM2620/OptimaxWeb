<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Listado de Clientes</title>

<link href="<c:url value='/css/sidebar.css'/>" rel="stylesheet"/>


<style type="text/css">

body {
  
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
		<td><b>Apellido Paterno</b></td>
		<td><b>Apellido Materno</b></td>
		<td><b>celular</b></td>
		<td><b>Dni</b></td>
		<td><b>Email</b></td>
		<td><b>ruc</b></td>
		<td><b>Distrito</b></td>
		<td><b>Accion</b></td>
		
		
		</tr>
      </thead>

      <tbody>
        <c:forEach var="cliente" items="${bCliente}">
		<tr>
					<td>${cliente.cod_Cliente}</td>
					<td>${cliente.nombres}</td>
					<td>${cliente.apellidop}</td>
					<td>${cliente.apellidom}</td>
					<td>${cliente.celular}</td>
					<td>${cliente.dni}</td>
					<td>${cliente.email}</td>
					<td>${cliente.ruc}</td>
					<td>${cliente.distrito.nombredistr}</td>
					
					<td>
				
					<a href="<c:url value = '/EditarCliente/${cliente.cod_Cliente}'/>"> Editar </a>	|	
				
					<a href="<c:url value = '/Eliminarcliente/${cliente.cod_Cliente}'/>"> Eliminar </a>		
				
					</td>
				
		</tr>
		</c:forEach>
      </tbody>
     </table>
</div> 
</section>
<script type="text/javascript">
$(window).on("load resize ", function() {
	  var scrollWidth = $('.tbl-content').width() - $('.tbl-content table').width();
	  $('.tbl-header').css({'padding-right':scrollWidth});
	}).resize();
</script>

</body>
</html>