<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix = "form" uri="http://www.springframework.org/tags/form" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registro</title>
<link href="<c:url value='/css/sidebar.css'/>" rel="stylesheet"/>
<link href="<c:url value='/css/registronuevo.css'/>" rel="stylesheet"/>
<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600' rel='stylesheet' type='text/css'>
<link href="//netdna.bootstrapcdn.com/font-awesome/3.1.1/css/font-awesome.css" rel="stylesheet">
</head>
<body style="background-image: url('image/admin.jpg') " >
<%@include file="/WEB-INF/views/shared/tab.jsp" %>  
<section>
<div class="testbox">
  <h1>Registrar</h1>

  <form:form name=""  method="post" modelAttribute="Empleado">
      
  <label id="icon" for=""><i class="icon-user "></i></label>
  <form:input type="text" path="nombres" id="nombres" placeholder="nombre"  required="true"/><br>
  <label id="icon" for="name1"><i class="icon-user "></i></label>
  <form:input type="text" path="apellidp" id="apellidp" placeholder="apellido Paterno" required="true" /><br>
  <label id="icon" for="name1"><i class="icon-user"></i></label>
  <form:input type="text" path="apellidom" id="apellidom" placeholder="apellido Materno" required="true"/><br>
  <label id="icon" for="name1"><i class="icon-certificate "></i></label>
  <form:input type="text" path="dni" id="dni" placeholder="dni" required="true"/><br>
  <label id="icon" for="name1"><i class="icon-phone-sign"></i></label>
  <form:input type="text" path="telefono" id="telefono" placeholder="telefono" required="true"/><br>
  <label id="icon" for="name1"><i class='icon-envelope' ></i></label>
  <form:input type="text" path="email" id="name" placeholder="email" required="true"/><br><br>
  
  
 	<form:select path="tipoempleado.cod_cargoemp"><br>
 		
 		 <form:options items="${bCargo}" itemValue="cod_cargoemp" itemLabel="cargo"  /> <br>
 		 
 	</form:select><br>
  
  <button  type="submit" class="button" >Guardar</button>

  </form:form>
</div>
</section>
</body>
</html>