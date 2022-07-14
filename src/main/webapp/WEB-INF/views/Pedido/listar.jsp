<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<title>Listar</title>
<style type="text/css">

body {
   background-image: url('image/admin.jpg');
  background-repeat: no-repeat;
  background-attachment: fixed;
  background-size: 100% 100%;
}
table, th, td {
  border: 2px solid black;
}

 .container {
	 position: absolute;
	 top: 50%;
	 left: 50%;
	 transform: translate(-50%,-50%);
}
 table {
 	opacity: .8;
	 width: 800px;
	 border-collapse: collapse;
	 overflow: hidden;
	 box-shadow: 0 0 20px rgba(0,0,0,0.1);
}
 th, td {
	 padding: 15px;
	 background-color:#E6E6FA;
	 color: black;
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

<%@include file="/WEB-INF/views/shared/tabjefedeventas.jsp" %>  

<section>	
<div  class="container" >
	
	<input id="myInput" type="text" placeholder="Search..">
<br><br>
	
		<table style="padding: 0%;">
		 <thead>
		<tr>
		<td><b>COD PEDIDO</b></td>
		<td><b>FECHA</b></td>
		<td><b>DNI CLIENTE</b></td>
		<td><b>ESTADO PEDIDO</b></td>
		
		<td><b>Accion</b></td>
		</tr>
		</thead>
		 <tbody id="myTable">
    
		<c:forEach var="pedidos" items="${bPedidos}">
		<tr>
					<td id="codigo${pedidos.cod_pedido}">${pedidos.cod_pedido}</td>
					<td>${pedidos.fecha}</td>
					<td id="dni${pedidos.getCliente().getDni()}">${pedidos.getCliente().getDni()}</td>
					<td>${pedidos.getEstadopedido().getEstado()}</td>

					

					<td>
					
					
					
					<button  class="button" onclick="verdetalle(document.getElementById('codigo${pedidos.cod_pedido}'),document.getElementById('dni${pedidos.getCliente().getDni()}'))">Ver detalle </button><br><br>
					<button  class="button" onclick="location.href='<c:url value = "/orden_editar/${pedidos.cod_pedido}"/>'">EDITAR </button><br><br>
														
					</td>
		</tr>
		
		</c:forEach>
		</tbody>
		</table>
</div>
</section>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myTable tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});
</script>
<script type="text/javascript">

function verdetalle(codigo,dni){
	
	var PedidoCODIGO= codigo.innerHTML;
	var ClienteDNI = dni.innerHTML;
	

	<c:url var="path" value="/verdetallepedido"/>
	location.href="${path}?code="+ClienteDNI+"&codes="+PedidoCODIGO;
}

</script>

</body>
</html>