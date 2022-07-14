<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Listado de citas</title>
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
<body>

<%@include file="/WEB-INF/views/shared/tabrecepcionista.jsp" %>  
<section>

<div class="container" >
  
    <table>
      <thead>
		<tr>
		<td><b>CODIGO DE CITA</b></td>
		<td><b>HORA </b></td>
		<td><b>FECHA</b></td>
		<td><b>NOMBRE CLIENTE</b></td>
		<td><b>APELLIDO CLIENTE</b></td>
		<td><b>NOMBRE DOCTOR</b></td>
		<td><b>APELLIDO DOCTOR</b></td>
	</tr>
	</thead>

      <tbody>
			<c:forEach var="citas" items="${bCitas}">
		<tr>
			<td><b>${citas.cod_Cita}</b></td>
			<td><b>${citas.hora}</b></td>
			<td><b>${citas.fecha}</b></td>
			<td><b>${citas.getCliente().getNombres()}</b></td>
			<td><b>${citas.getCliente().getApellidop()}</b></td>
			<td><b>${citas.getEmpleado().getNombres()}</b></td>
			<td><b>${citas.getEmpleado().getApellidp()}</b></td>
			
		
		</tr>
		</c:forEach>
	</tbody>
     </table>
</div> 
</section>

</body>
</html>