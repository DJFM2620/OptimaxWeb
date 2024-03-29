<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   

<!DOCTYPE html>
<!-- Created By CodingNepal -->
<html lang="en" dir="ltr">
   <head>
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
      <meta charset="utf-8">
      <title>Citas</title>
      <style type="text/css">
 @import url('https://fonts.googleapis.com/css?family=Poppins:400,500,600,700&display=swap');
*{
  margin: 0;
  padding: 0;
  outline: none;
  font-family: 'Poppins', sans-serif;
}
body{
  display: flex;
  align-items: center;
  justify-content: center;
  min-height: 100vh;
  overflow: hidden;
  background: url("bg.png"), -webkit-linear-gradient(bottom, #0250c5, #d43f8d);
     margin: 2px;
}
::selection{
  color: #fff;
  background: #d43f8d;
}
.container{
  width: 330px;
  background: #fff;
  text-align: center;
  border-radius: 5px;
  padding: 50px 35px 10px 35px;
  height: 873px;
}
.container header{
  font-size: 35px;
  font-weight: 600;
  margin: 0 0 30px 0;
  position: relative;
    bottom: 31px;
}
.container .form-outer{
  width: 100%;
  overflow: hidden;
}
.container .form-outer form{
  display: flex;
  width: 400%;
}
.form-outer form .page{
  width: 25%;
  transition: margin-left 0.3s ease-in-out;
}
.form-outer form .page .title{
  text-align: left;
  font-size: 25px;
  font-weight: 500;
      margin-top: -5px;
}
.form-outer form .page .field{
  width: 330px;
  height: 45px;
  margin: 45px 0;
  display: flex;
  position: relative;
  bottom: 2%;
}
form .page .field .label{
  position: absolute;
  top: -30px;
  font-weight: 500;
}
form .page .field input{
  height: 100%;
  width: 100%;
  border: 1px solid lightgrey;
  border-radius: 5px;
  padding-left: 15px;
  font-size: 18px;
}
form .page .field select{
  width: 100%;
  padding-left: 10px;
  font-size: 17px;
  font-weight: 500;
}
form .page .field button{
  width: 100%;
  height: calc(100% + 5px);
  border: none;
  background: #d33f8d;
  margin-top: -20px;
  border-radius: 5px;
  color: #fff;
  cursor: pointer;
  font-size: 18px;
  font-weight: 500;
  letter-spacing: 1px;
  text-transform: uppercase;
  transition: 0.5s ease;
}
form .page .field button:hover{
  background: #000;
}
form .page .btns button{
  margin-top: -20px!important;
}
form .page .btns button.prev{
  margin-right: 3px;
  font-size: 17px;
}
form .page .btns button.next{
  margin-left: 3px;
}
.container .progress-bar{
  display: flex;
    margin: 16px 0;
    user-select: none;
    margin-top: -12%;
}
.container .progress-bar .step{
  text-align: center;
  width: 100%;
  position: relative;
}
.container .progress-bar .step p{
  font-weight: 500;
  font-size: 18px;
  color: #000;
  margin-bottom: 8px;
}
.progress-bar .step .bullet{
  height: 25px;
  width: 25px;
  border: 2px solid #000;
  display: inline-block;
  border-radius: 50%;
  position: relative;
  transition: 0.2s;
  font-weight: 500;
  font-size: 17px;
  line-height: 25px;
}
.progress-bar .step .bullet.active{
  border-color: #d43f8d;
  background: #d43f8d;
}
.progress-bar .step .bullet span{
  position: absolute;
  left: 50%;
  transform: translateX(-50%);
}
.progress-bar .step .bullet.active span{
  display: none;
}
.progress-bar .step .bullet:before,
.progress-bar .step .bullet:after{
  position: absolute;
  content: '';
  bottom: 11px;
  right: -51px;
  height: 3px;
  width: 44px;
  background: #262626;
}
.progress-bar .step .bullet.active:after{
  background: #d43f8d;
  transform: scaleX(0);
  transform-origin: left;
  animation: animate 0.3s linear forwards;
}
@keyframes animate {
  100%{
    transform: scaleX(1);
  }
}
.progress-bar .step:last-child .bullet:before,
.progress-bar .step:last-child .bullet:after{
  display: none;
}
.progress-bar .step p.active{
  color: #d43f8d;
  transition: 0.2s linear;
}
.progress-bar .step .check{
  position: absolute;
  left: 50%;
  top: 70%;
  font-size: 15px;
  transform: translate(-50%, -50%);
  display: none;
}
.progress-bar .step .check.active{
  display: block;
  color: #fff;
}
      
      </style>
      
   </head>
  <div class="container">
         <header>Registro de Citas</header>
         <div class="progress-bar">
            <div class="step">
               <p>
                  Info
               </p>
               <div class="bullet">
                  <span>1</span>
               </div>
               <div class="check fas fa-check"></div>
            </div>
            <div class="step">
               <p>
                 Fecha
               </p>
               <div class="bullet">
                  <span>2</span>
               </div>
               <div class="check fas fa-check"></div>
            </div>
            <div class="step">
               <p>
                  Datos
               </p>
               <div class="bullet">
                  <span>3</span>
               </div>
               <div class="check fas fa-check"></div>
            </div>
            <div class="step">
               <p>
                  Aceptar
               </p>
               <div class="bullet">
                  <span>4</span>
               </div>
               <div class="check fas fa-check"></div>
            </div>
         </div>
         <div class="form-outer">
            <form action="/idat/cita" method="post">
               <div class="page slide-page">
                  <div class="title" style="
   							 top: 44%;
   								 /* position: absolute; */
    								left: 48%;
    							margin-left: 130px;">
                     Aviso
                  </div>
                  <img src="image/logo.jpeg" style="
   width: 343px;
    height: 157px;
    position: relative;
    top: 50px;
">
                  <div class="field">
                     
                       <p style="
    position: relative;
    top: 156%;
">El horario de atencion es de 7:00AM a 20:00PM<br>
                     
                    
                        
                        Si se registra en un horario no establecido no se atendera.
                        La optica no se hace responsable de los rembolsos.</p><br><br><br>
                        
                  
                     
                  </div>
                  <div class="field">
                     <button class="firstNext next" style="
   							 position: absolute;
   							 /* bottom: 0%; */
  									  left: 0%;
  										  top: 519%;
										">Siguiente</button>
                  </div>
               </div>
               <div class="page">
                  <div class="title">
                     Ingresar fecha:
                  </div>
                  <div class="field">
                     <div class="label" >
                       Horario
                     </div>
                     <input value="horario" type="date" name="mescliente"  onchange="myFunction(this.value)">
                  </div>
                  <div class="field">
                     <div class="label">
                        Hora
                     </div>
                     <input type="time" name="horacliente" onchange="myFunctions(this.value)">
                  </div>
                  <!-- <div class="field">
                     <div class="label">
                        Doctor
                     </div>
                       <select id="doctor"  onchange="funcion()"  name="namedoctor">
                     <c:forEach items="${bDoctor}" var="doc">                    
                     <option value="${doc.cod_empleado}">${doc.nombres}</option>
                     </c:forEach>                    
                     </select>   
                  </div> -->
                  
                  <div class="field btns">
                     <button class="prev-1 prev">Atras</button>
                     <button class="next-1 next">Siguiente</button>
                  </div>
               </div>
               <div class="page">
                  <div class="title">
                     Datos del cliente
                  </div>
                  <div class="field">
                     <div class="label">
                        Nombre
                     </div>
                     <input type="text" name="nombrecliente">
                  </div>
                  <div class="field">
                     <div class="label">
                        Apellido Paterno
                     </div>
                     <input type="text" name="apellidopcliente">
                  </div>
                  <div class="field">
                     <div class="label">
                        Apellido materno
                     </div>
                     <input type="text" name="apellidomcliente">
                  </div>
                  
                  <div class="field">
                     <div class="label">
                        Email
                     </div>
                     <input type="email" name="emailcliente">
                  </div>
                  <div class="field">
                     <div class="label">
                        DNI
                     </div>
                     <input  maxlength="8" name="dnicliente">   
                  </div>
                    <div class="field">
                     <div class="label">
                        Celular
                     </div>   
                     <input  maxlength="9" name="celularcliente">   
                  </div>
                    <div class="field">
                     <div class="label">
                        Distrito
                     </div>
                     <select  name="namedistrito">
                     <c:forEach items="${bDistritos}" var="dis">                    
                     <option value="${dis.cod_distrito}">${dis.nombredistr}</option>
                     </c:forEach>                    
                     </select>   
                  </div>
                  
                  
                  <div class="field btns">
                     <button class="prev-2 prev">Atras</button>
                     <button class="next-2 next">Siguiente</button>
                  </div>
               </div>
               <div class="page">
                  <div class="title">
                     Datos de la cita:
                  </div>
                  <div class="field">
                     
                       <p id="demo"></p>
                
                  </div>
                  <div class="field">
                     <div class="label">
                    
                       <p id="demos"></p>
                     </div>
                     
                  </div>
                  <div class="field">
                     <div class="label">
                    
                       <p id="demosh"></p>
                     </div>
                     
                  </div>
                  <div class="field btns">
                     <button class="prev-3 prev">Atras</button>
                     <button class="submit" type="submit">Registrar</button>
                  </div>
               </div>
            </form>
         </div>
      </div>
      
  
 <script type="text/javascript">
 
 const slidePage = document.querySelector(".slide-page");
 const nextBtnFirst = document.querySelector(".firstNext");
 const prevBtnSec = document.querySelector(".prev-1");
 const nextBtnSec = document.querySelector(".next-1");
 const prevBtnThird = document.querySelector(".prev-2");
 const nextBtnThird = document.querySelector(".next-2");
 const prevBtnFourth = document.querySelector(".prev-3");
 const submitBtn = document.querySelector(".submit");
 const progressText = document.querySelectorAll(".step p");
 const progressCheck = document.querySelectorAll(".step .check");
 const bullet = document.querySelectorAll(".step .bullet");
 let current = 1;
 
 nextBtnFirst.addEventListener("click", function(event){
   event.preventDefault();
   slidePage.style.marginLeft = "-25%";
   bullet[current - 1].classList.add("active");
   progressCheck[current - 1].classList.add("active");
   progressText[current - 1].classList.add("active");
   current += 1;
 });
 nextBtnSec.addEventListener("click", function(event){
   event.preventDefault();
   slidePage.style.marginLeft = "-50%";
   bullet[current - 1].classList.add("active");
   progressCheck[current - 1].classList.add("active");
   progressText[current - 1].classList.add("active");
   current += 1;
 });
 nextBtnThird.addEventListener("click", function(event){
   event.preventDefault();
   slidePage.style.marginLeft = "-75%";
   bullet[current - 1].classList.add("active");
   progressCheck[current - 1].classList.add("active");
   progressText[current - 1].classList.add("active");
   current += 1;
 });
 submitBtn.addEventListener("click", function(){
   bullet[current - 1].classList.add("active");
   progressCheck[current - 1].classList.add("active");
   progressText[current - 1].classList.add("active");
   current += 1;
   setTimeout(function(){
     alert("Your Form Successfully Signed up");
     location.reload();
   },800);
 });
 prevBtnSec.addEventListener("click", function(event){
   event.preventDefault();
   slidePage.style.marginLeft = "0%";
   bullet[current - 2].classList.remove("active");
   progressCheck[current - 2].classList.remove("active");
   progressText[current - 2].classList.remove("active");
   current -= 1;
 });
 prevBtnThird.addEventListener("click", function(event){
   event.preventDefault();
   slidePage.style.marginLeft = "-25%";
   bullet[current - 2].classList.remove("active");
   progressCheck[current - 2].classList.remove("active");
   progressText[current - 2].classList.remove("active");
   current -= 1;
 });
 prevBtnFourth.addEventListener("click", function(event){
   event.preventDefault();
   slidePage.style.marginLeft = "-50%";
   bullet[current - 2].classList.remove("active");
   progressCheck[current - 2].classList.remove("active");
   progressText[current - 2].classList.remove("active");
   current -= 1;
 });
 
 
 
 
 </script>
 <script type="text/javascript">

 function funcion() {
	  var x = document.getElementById("doctor").value;
	  document.getElementById("demo").innerHTML = "Doctor: " + x;
	}

 </script>
 
 
 <script type="text/javascript">
 function myFunction(val) {
	   document.getElementById("demos").innerHTML="Fecha: " + val;
	 }
 
 </script>
 <script type="text/javascript">
 function myFunctions(val) {
	   document.getElementById("demosh").innerHTML="Hora: " + val;
	 }
 
 </script>
  </body>
</html>