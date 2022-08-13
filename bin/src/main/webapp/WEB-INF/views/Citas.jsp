<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
    <%@taglib prefix = "form" uri="http://www.springframework.org/tags/form" %>  
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<title>Mis pedidos</title>
<style type="text/css">


body {
  
  background-repeat: no-repeat;
  background-attachment: fixed;
  background-size: 100% 100%;
}
table, th, td {
  border: 2px solid black;
}

 .container {
	 position: absolute;
	 top: 40%;
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


@import url('https://fonts.googleapis.com/css?family=Exo:400,700');







@keyframes animate {

    0%{
        transform: translateY(0) rotate(0deg);
        opacity: 1;
        border-radius: 0;
    }

    100%{
        transform: translateY(-1000px) rotate(720deg);
        opacity: 0;
        border-radius: 50%;
    }

}

 .btn-mas{
        width: 130px;
        display: flex;
        border:1px solid #d4d4d4;
        font-weight:bold;
        font-family:Arial;
    }
    .btn-mas>span {
        width:25px;
        text-align:center;
        padding:8px 12px;
    }
    .btn-mas>span:first-child, .btn-mas>span:last-child {
        cursor:pointer;
    }
    .btn-mas .numero {
        width:100%;
        border-left:1px solid #d4d4d4;
        border-right:1px solid #d4d4d4;
    }



	

figure {
    display: block;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 40px;
    margin-inline-end: 20px;
    width:250px; /* or whatever width you want. */
   max-width:250px; /* or whatever width you want. */
   display: inline-block;
    
    
}

img {
  border-radius: 8px;
}



.grid__figure {
    position: relative;
    min-height: 1px;
    padding-right: 15px;
    padding-left: 15px;
}

.container:before, .container:after {
    display: table;
    content: " ";
}

.centered {
  
	bottom: 8px;
 	right: -12px;
  
}

/* The Modal (background) */
.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  padding-top: 100px; /* Location of the box */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
  position: relative;
  background-color: #fefefe;
  margin: auto;
  padding: 0;
  border: 1px solid #888;
  width: 80%;
  box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
  -webkit-animation-name: animatetop;
  -webkit-animation-duration: 0.4s;
  animation-name: animatetop;
  animation-duration: 0.4s
  
}
.modal-dialog{
    overflow-y: initial !important
}
.modal-body{
    height: 80vh;
    overflow-y: auto;
}

h2, .h2 {
    font-size: 2rem;
    width: 100%;
}
/* Add Animation */
@-webkit-keyframes animatetop {
  from {top:-300px; opacity:0} 
  to {top:0; opacity:1}
}

@keyframes animatetop {
  from {top:-300px; opacity:0}
  to {top:0; opacity:1}
}

/* The Close Button */
.close {
  color: white;
  float: right;
  font-size: 28px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: #000;
  text-decoration: none;
  cursor: pointer;
}

.modal-header {
  padding: 2px 16px;
  background-color: hsl(0, 49%, 50%);
  color: white;
  text-align: center;
}

.modal-body {padding: 2px 16px;}

.modal-footer {
  padding: 11px 16px;
   background-color: hsl(0, 49%, 50%);
  color: white;
  height: 29px;
}

.centered button {
	margin:5px;

}

.conteiner figure {

 box-shadow : 0px 5px 10px 0 #000;


}

/* only animate if the device supports hover */
@media (hover: hover) {
  #creditcard {
    /*  set start position */
    transform: translateY(110px);
    transition: transform 0.1s ease-in-out;
    /*  set transition for mouse enter & exit */
  }

  #money {
    /*  set start position */
    transform: translateY(180px);
    transition: transform 0.1s ease-in-out;
    /*  set transition for mouse enter & exit */
  }

  button:hover #creditcard {
    transform: translateY(0px);
    transition: transform 0.2s ease-in-out;
    /*  overide transition for mouse enter */
  }

  button:hover #money {
    transform: translateY(0px);
    transition: transform 0.3s ease-in-out;
    /*  overide transition for mouse enter */
  }
  
}

@keyframes bounce {
  0% {
    transform: translateY(0);
  }
  50% {
    transform: translateY(-0.25rem);
  }
  100% {
    transform: translateY(0);
  }
}

.button:hover .button__text span {
  transform: translateY(-0.25rem);
  transition: transform .2s ease-in-out;
}

/* styling */

@import url("https://fonts.googleapis.com/css2?family=Lato:wght@300;400&display=swap");



.button {
	left: 83%;
	top: 1%;
  border: none;
  outline: none;
  background-color: purple;
  padding: 1rem 90px 1rem 2rem;
  position: absolute;
  border-radius: 8px;
  letter-spacing: 0.7px;
  background-color: #5086bd;
  color: #fff;
  font-size: 21px;
  font-family: "Lato", sans-serif;
  cursor: pointer;
  box-shadow: rgba(0, 9, 61, 0.2) 0px 4px 8px 0px;
  margin: 35px
}

.button:active {
  transform: translateY(1px);
}

.button__svg {
  position: absolute;
  overflow: visible;
  bottom: 6px;
  right: 0.2rem;
  height: 140%;
}

.conteiner figure{

display: inline-block;
margin-right: 35px;
margin-left: 35px;
}


.header_section_top {
       width: 60%;
    
    background-color: #2b2a29;
    clip-path: polygon(0 0, 100% 0, 96% 100%, 3% 100%);
    height: auto;
    padding: 11px 0px;
    top: 2%;
    position: absolute;
    left: 20%;
}
.custom_menu ul {
    margin: 0px;
    padding: 0px;
    display: inline-block;
}
ul, li, ol {
    /* margin: 0px; */
    /* padding: 0px; */
    list-style: none;
}
.custom_menu li {
    float: left;
    font-size: 16px;
    color: white;
    padding: 6px 10px 0px 10px;
}
.custom_menu {
    width: 100%;
    margin: 0 auto;
    text-align: center;
}
.logo_section {
    width: 100%;
    float: left;
}
.container {
    max-width: 1140px;
}
.row {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-wrap: wrap;
    flex-wrap: wrap;
    margin-right: -15px;
    margin-left: -15px;
        position: relative;
        left: 42%;
}

@media (min-width: 576px)
.col-sm-12 {
    -ms-flex: 0 0 100%;
    flex: 0 0 100%;
    max-width: 100%;
}

.logo {
    width: 100%;
    float: left;
    text-align: center;
    padding: 30px 0px;
   
}
.logo img {
	    max-width: 100%;
    height: 291px;
    top: -892px;
    position: absolute;
    width: 93%;
    left: 5%;
    box-shadow: black;
    box-shadow: 0px -1px 10px 0 #000;
    right: 10px;
}

.remove-product {
    border: 0;
    padding: 4px 8px;
    background-color: #c66;
    color: #fff;
    font-family: $font-bold;
    font-size: 12px;
    border-radius: 3px;
  }
  
  .remove-product:hover {
    background-color: #a44;
  }
}


</style>
</head>
<body >
<div class="imagen"  ><img src="image/logo.jpeg" style="
    position: relative;
    width: 1000px;
    height: 261px;
    top: 62px;
    left: 412px;
"></div>

            <div class="header_section_top">
               <div class="row">
                  <div class="col-sm-12">
                     <div class="custom_menu">
                        <ul style="color: white;">
                           <li style="color: white;"><a style="color: white;" href="<c:url value='/principal'/>">Inicio</a></li>
                           <li style="color: white;"><a style="color: white;" href="<c:url value='/lentes'/>">Lentes</a></li>
                                    
                        </ul>
                     </div>
                  </div>
               </div>
            </div>
   
        <div class="logo_section">
            <div class="container">
               <div class="row">
                  <div class="col-sm-12">
                     <div class="logo"><img src="image/logo.jpeg"></div>
                  </div>
               </div>
            </div>
         </div>
         
        



<div class="dni" style="
    /* position: relative; */
    /* left: 13%; */
    /* top: 180px; */
    position: absolute;
    left: 40%;
    top: 36%;
">
 Colocar dni:
	
	<input name="dninuevo" id='dni' maxlength="8"/>
	
	<button type = "button" onclick="EnviarDNI()" >Buscar</button>
	</div>
	
<section>		
<div  class="container" >

  <table id="table" style="/* padding: 0%; */position: absolute;left: -369px;">
      <thead>
        <tr>
		<td><b>CODIGO DE CITA</b></td>
		<td><b>HORA</b></td>
		<td><b>FECHA</b></td>
			<td><b>CODIGO DOCTOR</b></td>
			<td><b>NOMBRE DOCTOR</b></td>
			<td><b>APELLIDO DOCTOR</b></td>
		
		
		
		</tr>
      </thead>

      <tbody>
        <c:forEach var="citas" items="${bCitadni}">
		<tr >
					<td>${citas.cod_Cita}</td>
					<td>${citas.hora}</td>
					<td>${citas.fecha}</td>
					<td>${citas.getEmpleado().getCod_empleado()}</td>
					<td>${citas.getEmpleado().getNombres()}</td>
					<td>${citas.getEmpleado().getApellidp()}</td>
				
					

					
				
		</tr>
		</c:forEach>
      </tbody>
     </table>  
	</div>
</section>
	
	
	<script type="text/javascript">

function EnviarDNI() {

	var ClienteDNI = document.getElementById('dni').value;
	
	<c:url var="path" value="/Buscarcitapordni"/>
	location.href="${path}?code="+ClienteDNI;
}
	
</script>


  
</body>








</html>