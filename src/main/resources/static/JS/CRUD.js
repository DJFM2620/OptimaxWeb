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

$('[name="cod_Marca"]').prop('readonly', true); //Asignar readonly a los elementos que contenga el codigo
$('[name="cod_Modelo"]').prop('readonly', true)
$('[name="cod_empleado"]').prop('readonly', true)
$('[name="cod_TipMaterial"]').prop('readonly', true)
$('[name="cod_distrito"]').prop('readonly', true)
$('[name="cod_Cliente"]').prop('readonly', true)
$('[name="cod_color"]').prop('readonly', true)
$('[name="codArticulo"]').prop('readonly', true)
$('[name="cod_cargoemp"]').prop('readonly', true)


$("#formId").validate({
	
	rules: {
		stock: {
			required: true,
			digits: true
		},
		precio: {
			required: true,
			number: true
		},
		nombre: {
			required: true,
			lettersonly: true
		},
		nombres: {
			required: true,
			lettersonly: true
		},
		apellidop: {
			required: true,
			lettersonly: true
		},
		apellidp: {
			required: true,
			lettersonly: true
		},
		apellidom: {
			required: true,
			lettersonly: true
		},
		celular: {
			required: true,
			digits: true,
			minlength: 9,
			maxlength: 9
		},
		telefono: {
			required: true,
			digits: true,
			minlength: 9,
			maxlength: 9
		},
		email: {
			required: true,
			email: true
		},
		dni: {
			required: true,
			digits: true,
			minlength: 8,
			maxlength: 8
		},
		ruc: {
			required: false,
			digits: true,
			minlength: 12,
			maxlength: 12
		},
		direccion: {
			required: true,
		},
		nombredistr: {
			required: true,
			lettersonly: true
		},
		cargo: {
			required: true,
			lettersonly: true
		},
		forma_Modelo: {
			required: true,
			alphanumeric: true
		},
		nombre_Materia: {
			required: true,
			alphanumeric: true
		},
		nombre_Marca: {
			required: true,
			alphanumeric: true
		}
	},
	messages: {
		stock: {
			required: "Por favor ingrese el stock.",
			digits: "Por favor ingrese solo numeros."
		},
		precio: {
			required: "Por favor ingrese el precio.",
			number: "Por favor ingrese solo numeros."
		},
		nombre: {
			required: "Por favor ingrese el nombre.",
			lettersonly: "Por favor ingrese solo letras."
		},
		nombres:{
			required: "Por favor ingrese el nombre.",
			lettersonly: "Por favor ingrese solo letras."
		},
		apellidp: {
			required: "Por favor ingrese su apellido paterno.",
			lettersonly: "Por favor ingrese solo letras."
		},
		apellidop: {
			required: "Por favor ingrese su apellido paterno.",
			lettersonly: "Por favor ingrese solo letras."
		},
		apellidom: {
			required: "Por favor ingrese su apellido materno.",
			lettersonly: "Por favor ingrese solo letras."
		},
		celular: {
			required: "Por favor ingrese su numero de telefono.",
			digits: "Por favor ingrese solo numeros.",
			minlength: "El numero de celular debe tener 9 digitos",
			maxlength: "El numero de celular debe tener 9 digitos"
		},
		telefono: {
			required: "Por favor ingrese su numero de telefono.",
			digits: "Por favor ingrese solo numeros.",
			minlength: "El numero de celular debe tener 9 digitos",
			maxlength: "El numero de celular debe tener 9 digitos"
		},
		email: {
			required: "Por favor ingrese su direccion de correo electronico.",
			email: "Por favor ingrese una direccion de correo electronico valida."
		},
		dni: {
			required: "Por favor ingrese su numero de DNI.",
			digits: "Por favor ingrese solo numeros.",
			minlength: "El número de DNI debe tener 8 digitos",
			maxlength: "El número de DNI debe tener 8 digitos"
		},
		ruc: {
			digits: "Por favor ingrese solo numeros.",
			minlength: "El número de RUC debe tener 12 digitos",
			maxlength: "El número de RUC debe tener 12 digitos"
		},
		direccion: {
			required: "Por favor ingrese su direccion.",
			alphanumeric: "Por favor ingresa solo caracteres alfanumericos."
		},
		nombredistr: {
			required: "Por favor ingrese el distrito.",
			lettersonly: "Por favor ingrese solo letras."
		},
		cargo: {
			required: "Por favor ingresa el nombre del cargo.",
			alphanumeric: "Por favor ingresa solo caracteres alfanumericos."
		},
		forma_Modelo: {
			required: "Por favor ingresa el nombre del modelo.",
			alphanumeric: "Por favor ingresa solo caracteres alfanumericos."
		},
		nombre_Materia: {
			required: "Por favor ingresa el nombre del material.",
			alphanumeric: "Por favor ingresa solo caracteres alfanumericos."
		},
		nombre_Marca: {
			required: "Por favor ingresa el nombre de la marca.",
			alphanumeric: "Por favor ingresa solo caracteres alfanumericos."
		}
	}
});

function validate_data(){

	console.log("Se actia la validacion de lsubmit");

	if ($('#formId').valid()) { // Si el formulario esta validado retorna true
	
		console.log("Aqui Pasa el IF");
		$('#formId').submit(); // envía el formulario una vez que se han validado los datos
	}
}