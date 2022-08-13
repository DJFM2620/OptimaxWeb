<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>

 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style type="text/css">

body {
	background-image: url('image/admin.jpg');
}
</style>
<title>Principal - Administrador</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">


<link href="<c:url value='/css/sidebar.css'/>" rel="stylesheet"/>



</head>
<body >


<%@include file="/WEB-INF/views/shared/tab.jsp" %>  
<%@include file="/WEB-INF/views/shared/admin.jsp" %>  

      
</body>
<script type="text/javascript">
alert("Ingresaste como Administrador");
</script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="js/AlertaAdministrador.js"></script>

</html>