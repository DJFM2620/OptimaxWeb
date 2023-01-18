Culqi.publicKey = 'pk_test_c45c56aa6dc7d27c';

Culqi.init();

Culqi.settings({
	currency: 'PEN',
	amount: 3500, // Este parámetro es requerido para realizar pagos yape
	order: 'Aquí inserta el order id' // Este parámetro es requerido para realizar pagos con pagoEfectivo, billeteras y Cuotéalo
});

Culqi.options({
	paymentMethods: {
		tarjeta: true,
		bancaMovil: false,
		agente: false,
		billetera: false,
		cuotealo: false,
		yape: false
	}
});

const btn_continuar = document.getElementById("btn_continuar");

btn_continuar.addEventListener("click", function(e) {

	var validado = false;
	var celular = document.getElementById("celular");
	var email = document.getElementById("email");
	var dni = document.getElementById("dni");
	var ruc = document.getElementById("ruc");
	
	if (celular.value.length == 9) {

		validado = true;
	} else {
		validado = false;
		alert("El celular debe tener 9 digitos!");
	}

	if (dni.value.length == 8) {

		validado = true;
	} else {
		validado = false;
		alert("El dni debe tener 8 digitos!");
	}

	if (ruc.value.length > 0) {
		if (ruc.value.length == 11) {

			validado = true;
		} else {
			validado = false;
			alert("El celular RUC debe tener 9 digitos!");
		}
	}

	if (email.value.indexOf("@") == -1) {

		validado = false;
		alert("Ingrese una direccion de correo electronico valida!");
	} else {
		validado = true;
	}

	if (validado == true) {

		document.getElementById("Data_Payment_Gateway").style.pointerEvents = "auto";
		document.getElementById("Data_Payment_Gateway").style.opacity = "1";
	}
});

const btn_pagar = document.getElementById("btn_pagar");

Culqi.validationPaymentMethods();
var paymentTypeAvailable = Culqi.paymentOptionsAvailable;

btn_pagar.addEventListener("click", function(e) {

	if (paymentTypeAvailable.token.available) {
		paymentTypeAvailable.token.generate();
	}
	e.preventDefault();
});

function culqi() {
	if (Culqi.token) {
		const token = Culqi.token.id;
		var monto = document.getElementById("amount").value;
		var nuevoMonto;

		if (monto.includes(".") == true) {

			nuevoMonto = monto.split(".");
			nuevoMonto = nuevoMonto.join("");
		} else {
			nuevoMonto = monto + "00";
		}
		var email = document.getElementById("card[email]").value;

		var newData = {
			"nombres": document.getElementById("nombres").value,
			"apellidop": document.getElementById("apellidop").value,
			"celular": document.getElementById("celular").value,
			"email": document.getElementById("email").value,
			"dni" : document.getElementById("dni").value,
			"ruc": document.getElementById("ruc").value,
			"direccion": document.getElementById("direccion").value,
			"distrito" : document.getElementById("distritos").value,
			"apellidom": document.getElementById("apellidom").value,
			"monto": nuevoMonto,
			"moneda": "PEN",
			"email": email,
			"token": token
		};

		$.ajax({
			type: "POST",
			contentType: "application/json",
			url: 'http://localhost:8040/idat/Pasarela',
			data: JSON.stringify(newData),
			success: function(result) {

				$("#InputPs").val(result);

			}, error: function(xhr, status, error) {

				$("#InputPs").val(error);
			}
		});
	} else {
		console.log("Error : ", Culqi.error);
	}
}