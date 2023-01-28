function EnviarDNI() {

	var ClienteDNI = document.getElementById('dni').value;

	location.href = "/Buscarcitapordni?code=" + ClienteDNI;
}

function CitasDni(dni) {

	$.ajax({
		type: "GET",
		url: "Cita/Dni",
		data: { dni: dni.value },
		success: function(bCitas) {

			var html = "";

			$.each(bCitas, function(index, cita) {

				html +=
					"<tr>"+
						"<td id=codigo"+cita.cod_Cita+">" + cita.cod_Cita + "</td>"+
						"<td>" + cita.hora + "</td>"+
						"<td>" + cita.fecha + "</td>"+
					"</tr>";
			});
			$("#TBody").html(html);
		}
	})
}
