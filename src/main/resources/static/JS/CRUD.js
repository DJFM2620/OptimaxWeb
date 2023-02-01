function validateRelationship(codigo,URL_DELETE ,URL_LIST) {

	$.ajax({
		type: "GET",
  		contentType: "application/json",
		url: 'http://localhost:8040/idat' + URL_DELETE,
		data: {codigo: codigo.value},
		success: function(response) {
			
			var modal = document.getElementById("Cart");
			var cart_content = document.getElementById("Cart_Content");
			var html = "";
			
    		if(response[0] == "Exito"){
	
				modal.classList.add("Modal_Show");
				cart_content.classList.add("Exito");
				
    			html +=	"<p>EXITO</p>" + 
    					"<p>" + response[1] + "</p>"+
    					"<div class='Center'>" +
				        	"<button onclick='toList(`" + URL_LIST + "`)'>ACEPTAR</button>"+
				    	"</div>";
	
			} else {
				
				modal.classList.add("Modal_Show");
				cart_content.classList.add("Error");
				
    			html +=	"<p>ERROR</p>" + 
    					"<p>" + response[1] + "</p>"+
    					"<div class='Center'>" +
				        	"<button onclick='toList(`" + URL_LIST + "`)'>ACEPTAR</button>"+
				    	"</div>";
			}
    		
    		$("#Cart_Content").html(html);
		}
	});
}

function toList(URL) {
	
	location.href = "http://localhost:8040/idat" + URL;
}