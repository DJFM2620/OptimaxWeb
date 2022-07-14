<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix = "form" uri="http://www.springframework.org/tags/form" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registro</title>

<link href="<c:url value='/css/registrocliente.css'/>" rel="stylesheet"/>
</head>
<body style="background-image: url('image/admin.jpg') " >
<section>
<div class="testbox">
  <form:form name=""  method="post" modelAttribute="Cliente">
      
<div class='bold-line'></div>
<div class='container'>
  <div class='window'>
    <div class='overlay'></div>
    <div class='content'>
      <div class='welcome'>Hola!</div>
      <div class='subtitle'>Proporciona tus datos para registrarte.</div>
      <div class='input-fields'>
      
        <form:input path="nombres" type='text' placeholder='nombres' class='input-line full-width'></form:input>
        <form:input path="apellidop" type='text' placeholder='apellido paterno' class='input-line full-width'></form:input>
        <form:input path="apellidom" type='text' placeholder='apellido Materno' class='input-line full-width'></form:input>
        <form:input path="celular" type='number' placeholder='celular' class='input-line full-width'></form:input>
        <form:input path="email" type='email' placeholder='email' class='input-line full-width'></form:input>
        <form:input path="dni" type='number' placeholder='dni' class='input-line full-width'></form:input>
        <form:input path="ruc" type='text' placeholder='ruc' class='input-line full-width'></form:input>
		
		Distrito:
		<form:select path="distrito.cod_distrito"><br>
 		
 		 <form:options items="${bDistrito}" itemValue="cod_distrito" itemLabel="nombredistr"  /> <br>
 		 
 		</form:select><br>
			
		
      </div>
      <div class='spacing'><span class='highlight' onclick="location.href='<c:url value='/lentes'/>'">Cancelar</span></div>
      <div><button type = "submit" class='ghost-round full-width'>Registrarse</button></div>
    </div>
  </div>
</div>
</form:form>
</div>
</section>
</body>
</html>