var dniInput = document.getElementById("dniId");

dniInput.addEventListener("input", function() {
	// Verificar si el valor del input contiene solo números
	if (!/^\d*$/.test(dniInput.value)) {
		// Si no es así, reemplazar el valor por una cadena vacía
		alert("Solo se permiten digitos");
		dniInput.value = "";
	}
});

function openForm() {
	document.getElementById("myForm").style.display = "block";
}

function closeForm() {
	document.getElementById("myForm").style.display = "none";

}

function validateUserLogin() {

	var emailRegex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;

	var email = document.getElementById("emailId").value.trim();
	var dni = document.getElementById("dniId").value.trim();

	validado = false;

	if (email.length == 0 || dni.lenght == 0) {

		alert("Todos los campos son requeridos");
		validado = false;
		
	} else {
		
		validado = true;
	} 
	
	if (emailRegex.test(email) == false) {

		alert("Por favor, ingrese un correo electrónico válido");
		validado = false;

	}else {
		
		validado = true;
	}
	
	if(validado == true) {

		$.ajax({
			type: "GET",
			contentType: "application/json",
			url: 'http://localhost:8040/idat/Login/Validar',
			data: { email: email, dni: parseInt(dni) },
			success: function(response) {

				if (response == "Cliente") {

					location.href = "http://localhost:8040/idat/Principal"

				} else if (response == "Admin") {

					location.href = "http://localhost:8040/idat/Administrador/Principal"

				} else if (response == "JefeVentas") {

					location.href = "http://localhost:8040/idat/JefeVentas/Principal"

				} else if (response == "Recepcionista") {

					location.href = "http://localhost:8040/idat/Recepcionista/Principal"

				} else {

					alert(response)
				}
			}
		});
	}
}