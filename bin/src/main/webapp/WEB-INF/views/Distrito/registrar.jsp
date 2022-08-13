<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix = "form" uri="http://www.springframework.org/tags/form" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
  <h1>Registro Distrito</h1>

  <form:form name=""  method="post" modelAttribute="Distrito">
      
  <label id="icon" for=""><i class="icon-user "></i></label>
  <form:input type="text" path="nombredistr" id="nombres" placeholder="nombre" required="true"/><br>
 

  
  <button  type="submit" class="button" >Guardar</button>

  </form:form>
</div>
</section>
</body>
</html>