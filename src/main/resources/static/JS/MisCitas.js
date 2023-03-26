function EnviarDNI() {

	var ClienteDNI = document.getElementById('dni').value;

	location.href = "/Buscarcitapordni?code=" + ClienteDNI;
}

function CitasDni(dni, url, pagina) {

	$.ajax({
		type: "GET",
		url: url,
		data: { dni: dni.value },
		success: function(bCitas) {

			var html = "";
			//MisPedidos

			if(pagina == "MisCitas"){
			
				$.each(bCitas, function(index, cita) {
	
					html +=
						"<tr>"+
							"<td id=codigo"+cita.cod_Cita+">" + cita.cod_Cita + "</td>"+
							"<td>" + cita.hora + "</td>"+
							"<td>" + cita.fecha + "</td>"+
						"</tr>";
				});
				
			}else {
			
				$.each(bCitas, function(index, cita) {
	
					html +=
						"<tr>"+
							"<td id=codigo"+cita.cod_Cita+">" + cita.cod_Cita + "</td>"+
							"<td>" + cita.hora + "</td>"+
							"<td>" + cita.fecha + "</td>"+
							"<td>" + cita.cliente.nombres + "</td>"+
							"<td>" + cita.cliente.dni + "</td>"+
							"<td>" + cita.cliente.apellidop + "</td>"+
						"</tr>";
				});
			}
			$("#TBody").html(html);
		}
	})
}
