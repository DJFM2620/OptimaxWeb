<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix = "form" uri="http://www.springframework.org/tags/form" %>      
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
	body {
	background: url('image/admin2.jpg');
}
	
</style>
</head>
<body >
 <h1>Registro</h1>

  <form:form name=""  method="post" modelAttribute="Cliente">
   <label id="icon" for=""><i class="icon-user "></i></label>
  <form:input type="text" path="cod_Cliente" id="nombres" placeholder="nombre" readonly="true"/><br>   
  <label id="icon" for=""><i class="icon-user "></i></label>
  <form:input type="text" path="nombres" id="nombres" placeholder="nombre" required="true"/><br>
   <label id="icon" for=""><i class="icon-user "></i></label>
  <form:input type="text" path="apellidop" id="nombres" placeholder="Apellido Paterno" required="true"/><br>
 
  <label id="icon" for=""><i class="icon-user "></i></label>
  <form:input type="text" path="apellidom" id="nombres" placeholder="Apellido Materno" required="true"/><br>
 
  <label id="icon" for=""><i class="icon-user "></i></label>
  <form:input type="text" path="celular" id="nombres" placeholder="celular" required="true"/><br>
  <label id="icon" for=""><i class="icon-user "></i></label>
  <form:input type="text" path="dni" id="nombres" placeholder="dni" required="true"/><br>
 <label id="icon" for=""><i class="icon-user "></i></label>
  <form:input type="text" path="email" id="nombres" placeholder="email" required="true"/><br>
  <label id="icon" for=""><i class="icon-user "></i></label>
  <form:input type="text" path="ruc" id="nombres" placeholder="ruc" /><br>
 
 <form:select path="distrito.cod_distrito"><br>
 		
 		 <form:options items="${bDistrito}" itemValue="cod_distrito" itemLabel="nombredistr"  /> <br>
 		 
 	</form:select><br>
 	
  
  <button  type="submit" class="button" >Guardar</button><br>


</form:form>
			
	
	
</body>
</html>