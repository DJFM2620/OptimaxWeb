<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
    <%@taglib prefix = "form" uri="http://www.springframework.org/tags/form" %>  
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<!DOCTYPE html>
<html>
<head>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<style type="text/css">
	

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
	
	<meta charset="ISO-8859-1">
	<title>LENTES</title>

</head>
<body >
<div class="imagen"  ><img src="image/logo.jpeg" style="
    position: relative;
    width: 1000px;
    height: 261px;
    top: 62px;
    left: 412px;
"></div>
 
           <div class="header_section_top" style="
           width: 60%;
    background-color: #2b2a29;
    clip-path: polygon(0 0, 100% 0, 96% 100%, 3% 100%);
    height: auto;
    padding: 15px 0px;
    /* top: -4%; */
    position: relative;
    /* margin-top: -272px; */
    margin-left: 387px;
    top: -271px;">
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
         
         
	<button class="button" id="myBtn">
	
	  <span class="button__text">
	   <span>C</span><span>a</span><span>r</span><span>r</span><span>i</span><span>t</span><span>o</span>
	  </span>
	  
	  <svg class="button__svg" role="presentational" viewBox="0 0 600 600">
	  
	    <defs>  
	      <clipPath id="myClip">
	      
	        <rect x="0" y="0" width="100%" height="50%" />
	        
	      </clipPath>
	    </defs>
	    
	    <g clip-path="url(#myClip)">
	      <g id="money">
	      
	        <path d="M441.9,116.54h-162c-4.66,0-8.49,4.34-8.62,9.83l.85,278.17,178.37,2V126.37C450.38,120.89,446.56,116.52,441.9,116.54Z" fill="#699e64" stroke="#323c44" stroke-miterlimit="10" stroke-width="14" />
	        <path d="M424.73,165.49c-10-2.53-17.38-12-17.68-24H316.44c-.09,11.58-7,21.53-16.62,23.94-3.24.92-5.54,4.29-5.62,8.21V376.54H430.1V173.71C430.15,169.83,427.93,166.43,424.73,165.49Z" fill="#699e64" stroke="#323c44" stroke-miterlimit="10" stroke-width="14" />
	        
	      </g>
	      
	      <g id="creditcard">
	      
	        <path d="M372.12,181.59H210.9c-4.64,0-8.45,4.34-8.58,9.83l.85,278.17,177.49,2V191.42C380.55,185.94,376.75,181.57,372.12,181.59Z" fill="#a76fe2" stroke="#323c44" stroke-miterlimit="10" stroke-width="14" />
	        <path d="M347.55,261.85H332.22c-3.73,0-6.76-3.58-6.76-8v-35.2c0-4.42,3-8,6.76-8h15.33c3.73,0,6.76,3.58,6.76,8v35.2C354.31,258.27,351.28,261.85,347.55,261.85Z" fill="#ffdc67" />
	        <path d="M249.73,183.76h28.85v274.8H249.73Z" fill="#323c44" />
	        
	      </g>
	    </g>
	    
	    <g id="wallet">
	      <path d="M478,288.23h-337A28.93,28.93,0,0,0,112,317.14V546.2a29,29,0,0,0,28.94,28.95H478a29,29,0,0,0,28.95-28.94h0v-229A29,29,0,0,0,478,288.23Z" fill="#a4bdc1" stroke="#323c44" stroke-miterlimit="10" stroke-width="14" />
	      <path d="M512.83,382.71H416.71a28.93,28.93,0,0,0-28.95,28.94h0V467.8a29,29,0,0,0,28.95,28.95h96.12a19.31,19.31,0,0,0,19.3-19.3V402a19.3,19.3,0,0,0-19.3-19.3Z" fill="#a4bdc1" stroke="#323c44" stroke-miterlimit="10" stroke-width="14" />
	      <path d="M451.46,435.79v7.88a14.48,14.48,0,1,1-29,0v-7.9a14.48,14.48,0,0,1,29,0Z" fill="#a4bdc1" stroke="#323c44" stroke-miterlimit="10" stroke-width="14" />
	      <path d="M147.87,541.93V320.84c-.05-13.2,8.25-21.51,21.62-24.27a42.71,42.71,0,0,1,7.14-1.32l-29.36-.63a67.77,67.77,0,0,0-9.13.45c-13.37,2.75-20.32,12.57-20.27,25.77l.38,221.24c-1.57,15.44,8.15,27.08,25.34,26.1l33-.19c-15.9,0-28.78-10.58-28.76-25.93Z" fill="#7b8f91" />
	      <path d="M148.16,343.22a6,6,0,0,0-6,6v92a6,6,0,0,0,12,0v-92A6,6,0,0,0,148.16,343.22Z" fill="#323c44" />
	    </g>
	
	  </svg>
	</button>

<div class="conteiner" style="
       top: 42%;
    left: 18%;
    position: absolute;
    width: 66%;
    padding: 20px;
    ">

  <c:forEach var="img" items="${Bimagen}">
								
		<td>
					
			<figure  class="grid__figure">
										
				<input type="text" name="codigoarticulo" id="articuloID${img.codArticulo}" value="${img.codArticulo}" disabled="disabled" hidden="true">
				
				<c:set var="typeImage" value="${fn:substringAfter(img.imagen,'.')}" />
																						
				<img src="data:image/${typeImage};base64,${img.getBase64Imagen()}" width="310" height="310" onclick="ejecutar(document.getElementById('articuloID${img.codArticulo}').value)" />
															
				<div class="centered" style="position: absolute;"><a>Precio :S/${img.precio}</a> <button type="button" onclick="execute(document.getElementById('articuloID${img.codArticulo}').value)">Agregar Al carrito <i class="fa fa-shopping-cart"></i></button></div>
				
			</figure>
								 
		</td>   
  
  </c:forEach>

<!-- The Modal -->
	<div id="myModal" class="modal">

  <!-- Modal content -->
		<div class="modal-content" style="
       width: 1074px;
">
			<div class="modal-header" style="
    padding: 25px;
">
		
				<span class="close">&times;</span>
				<span style="
    position: absolute;
    top: 7%;
    left: 9%;
    font-size: 20px;
">ID</span>
				<span style="
    position: absolute;
    top: 7%;
    left: 30%;
    font-size: 20px;
">Articulo</span>
				<span style="
    position: absolute;
    top: 7%;
    left: 47%;
    font-size: 20px;
">Cantidad</span>
				<span style="
    position: absolute;
    top: 7%;
    left: 65%;
    font-size: 20px;
">Precio</span>
<span style="
    position: absolute;
    top: 7%;
    left: 81%;
    font-size: 20px;
">subtotal</span>
			
				<h2 style="
    margin-top: -3px;
">Articulos</h2>
			
     	</div>
     
    		<div class="modal-body">
		  <form id="cart" method="post" action="/idat/lentes">
	    	
		    	<c:forEach var="art" items="${bCarrito}" >
		    		<c:set var="Articulo" value="document.getElementById('${art.codArticulo}')" />
	    			<c:set var="Cantidad" value="document.getElementById('CantidadArt${art.codArticulo}')" />
	    			<c:set var="Precio" value="document.getElementById('PrecioArt${art.codArticulo}')" />	
	    			<c:set var="SubTotal" value="document.getElementById('SubTotal${art.codArticulo}')" />	
    				
    				
    				<input class = "Articulo" type = "text" id = "CodigoArt${art.codArticulo}" value = "${art.codArticulo}" readonly="readonly"/>
    				<c:set var="typeImage" value="${fn:substringAfter(art.imagen,'.')}" />												
						<img src="data:image/${typeImage};base64,${art.getBase64Imagen()}" width="240" height="240"/>
   						
   					<input onchange="Calcular(${Precio},${Cantidad},${SubTotal})" name = "Quantity" class = "numero" type = "text" id = "CantidadArt${art.codArticulo}" value = "1"/>
   					<input onchange="Calcular(${Precio},${Cantidad},${SubTotal})" class = "Articulo" type = "text" id = "PrecioArt${art.codArticulo}" value = "${art.precio}" readonly="readonly"/>
   					<input type = "text" id = "SubTotal${art.codArticulo}" value = "0"/>
  				
   					
			    	<c:set var="Articulo" value="document.getElementById('${art.codArticulo}').innerHTML" />
	    			<c:set var="Cantidad" value="document.getElementById('cantidad${art.codArticulo}').value" />
	    			<c:set var="Precio" value="document.getElementById('precio${art.codArticulo}').innerHTML" />			
	    			
      <button type="button" class="remove-product" onclick="location.href='<c:url value='/EliminarArticuloCarro?code=${art.codArticulo}'/>'">
        Remove
      </button><br>
   
		    	</c:forEach>		    
   <!--  onclick="location.href='<c:url value='/Cantidad'/>'"-->
	      	  <div class="modal-footer" style="height: 40px;">
		      
		       <button id="registrar" type = "submit" style="float: right;" class="RegistrarPedido" >
		      		Realizar Pedido
		      </button>     
      
	      </div>
	    
	  </form>	    
	   		
	      
	    </div>
	  </div>
	</div>  
	</div>
	
	<script  type="text/javascript">
	
	function Calcular(N1, N2, SubTotal) {
		
		var Numero1 = N1.value;
		var Numero2 = N2.value;

		var Suma = Numero1 * Numero2;

		SubTotal.value = Suma;
	}
	
	
	
	/*------------------------------------------------*/
	
	/*function CalcularSumaDeSubTotalesXD() {
		
		const Cant = document.getElementsByClassName(".numero").innerHTML;
		 
		 alert(Cant);
		
	}*/
	
	function Papu(Tag) {

		<c:url var="path" value="/CantidadCarrito"/>
		location.href="${path}/"+Tag;

	}
		
	function execute(articuloID, Tag){
		
		<c:url var="path" value="/lentescarrito"/>
		location.href="${path}/"+articuloID;
	}
		
	function ejecutar(articuloID){
		<c:url var="path" value="/detallearticulo"/>
		location.href="${path}/"+articuloID;
	}
	
	/* Otra Funcion*/
	
		function RecorrerCeldasTabla(){/*Codigo, Cantidad, Precio*/
		
			const resume_table = document.getElementById("#TableID");
			const tableRows = document.querySelectorAll('#TableID tr.row');
			
			// Recorremos las filas que tengan el class="row"
			// asÃ­ obviamos la cabecera
			for(let i=0; i<tableRows.length; i++) {
				
			  const row = tableRows[i];
			  const Art = row.querySelector('.CodArticuloClass');
			  const Cant = row.querySelector('.numero');
			  const Prec = row.querySelector('.tdArticulo');
			  
			  alert( Art.innerText);
			  alert( Cant.value);
			  alert( Prec.innerText);
			  
			  // Para modificar un estado:
			  // status.innerText = 'offline';
			}		
	}	
	
	/*-----------------------------------------------------------------------------------------*/
	
	
		/*function RecorrerTabla(){
			
			var table = document.getElementById("TableID");
			
			for (var i = 0, row; row = table.rows[i]; i++) {
				
			   //iterate through rows
			   //rows would be accessed using the "row" variable assigned in the for loop
			   for (var j = 0, col; col = row.cells[j]; j++) {
				   
			     //iterate through columns
			     //columns would be accessed using the "col" variable assigned in the for loop
			     
				  alert(table.rows[i].cells[j].innerHTML);		     
			   }  		 	
			}		
		}*/
		
		/*----------Valor de las Celdas Inicio-----------------*/

		/*$(document).ready(function(){
			
		    $(".tdArticulo").click(function(){
		    	
				var idi = $(this).val();
			    alert('Evento click '+idi);
			});
			    
		});
		
		$(document).ready(function(){
		    $(".numero").click(function(){
		    	
				var idi = $(this).val();
		        alert('Evento click '+idi);
		    });
		});*/
		
		
		/*----------Valor de las Celdas Fin-----------------*/
		
		/*function SumaTotal(Quantity, Price, Total){
			
			var Cantidad = Quantity;
			var Precio = Price;
			
			var resultado = Cantidad * Precio;
			
			Total.innerText = resultado;
			
			alert(resultado);
		}*/
		
		/*-------- SubTotal Comienzo ----------------------
		$(document).ready( function() {   	
	
			var Cart = {
					
					$cart: $( "#cart" ),
					$qtyFields: $( "input.numero" ),
					$triggerBtn: $( "#calc" ),
					$subTotalEl : $( "#total" ),
			   /*---------------------------------------
			  
				calculate: function() {	
				
				  var total = 0;
				  
				  this.$qtyFields.each(function() {
				  
				   	 var $field = $( this );
				   	 var amount = $field.parent().next().text();
				   	 var amountR = amount.replace( /\s+/g, "" ).replace( /USD/, "" );
				   	 var n1 = Number( $field.val() );
				  	 var n2 = Number( amountR );
				    
				  	  var sum = n1 * n2;
				    
				  
				 	   total += sum;
				  
				 	});
				  
				  
				 	var totalStr = total.toFixed( 2 );
				 	var tot = "S/"+totalStr ;
				 	
					return tot;
				},
			
				/*----------------- Calculate Function End -------------------
				  
				trigger: function() {
					
					var self = this;
				
					this.$triggerBtn.on( "click", function( e ) {
					
						e.preventDefault();
					  
						var subtotal = self.calculate();
					  
					  self.$subTotalEl.text( subtotal );
					 
					});
				},
				
				/*---------------------------------------
				init: function() {
				
					this.trigger();
					
					this.$triggerBtn.trigger( "click" );
					
					this.$cart.submit(function( e ) {
						
						e.preventDefault();
					
					});
				}	
			};
			
			//------------------Fin del Cart---------------------
			
			$(function() {
			
			   Cart.init();
			});	
		
	 	});
	
	/*---------------------------------------------------*/
	
	
	
	// Get the modal
	var modal = document.getElementById("myModal");
	
	// Get the button that opens the modal
	var btn = document.getElementById("myBtn");
	
	// Get the <span> element that closes the modal
	var span = document.getElementsByClassName("close")[0];
	
	// When the user clicks the button, open the modal 
	btn.onclick = function() {
		
	  modal.style.display = "block";
	}
	
	// When the user clicks on <span> (x), close the modal
	span.onclick = function() {
		
	  modal.style.display = "none";
	}
	
	// When the user clicks anywhere outside of the modal, close it
	window.onclick = function(event) {
		
	  if (event.target == modal) {
	    modal.style.display = "none";
	  }
	}	
		
	document.querySelectorAll(".btn-mas>span:first-child, .btn-mas>span:last-child").forEach(span => {
		
		span.addEventListener("click", function(el) {
	    const element=this.parentElement.querySelector(".numero");
	    let num=element.innerText;
	    if (this.innerText=="+") {
	    	
	        // incrementamos
	        num++;
	    }
	    else {
	    	
				// decrementanos
				if (num>1){
					
					 num--;
				}
			}
			element.innerText=num;
			
   });
	});
	
	
	function removeItem(removeButton)
	{
	  /* Remove row from DOM and recalc cart total */
	  var productRow = $(removeButton).parent().parent();
	  productRow.slideUp(fadeTime, function() {
	    productRow.remove();
	    recalculateCart();
	  });
	}
	
	
	
	</script>	




</body>



</html>