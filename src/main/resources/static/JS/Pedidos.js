function OrdenesDni(dni, url, pagina) {

	$.ajax({
		type: "GET",
		url: url,
		data: { dni: dni.value },
		success: function(bOrden) {

			var html = "";
			
			if(pagina == "MisPedidos"){
			
				$.each(bOrden, function(index, orden) {

					html +=
						"<tr>" +
							"<td id=codigo" + orden.cod_pedido + ">" + orden.cod_pedido + "</td>" +
							"<td>" + orden.fecha + "</td>" +
							"<td>" + orden.estadopedido.estado + "</td>" +
							"<td>" +
							"<button onclick='Detalle(document.getElementById(`codigo" + orden.cod_pedido + "`))'>DETALLE</button>" +
							"</td>"+
						"</tr>"
				});
			
			}else {
				$.each(bOrden, function(index, orden) {
	
					html +=
						"<tr>" +
							"<td id=codigo" + orden.cod_pedido + ">" + orden.cod_pedido + "</td>" +
							"<td>" + orden.fecha + "</td>" +
							"<td>" + orden.cliente.nombres + "</td>" +
							"<td>" + orden.cliente.apellidop + "</td>" +
							"<td>" + orden.cliente.dni + "</td>" +
							"<td>" + orden.estadopedido.estado + "</td>" +
							"<td>" +
							"<button onclick='Detalle(document.getElementById(`codigo" + orden.cod_pedido + "`))'>DETALLE</button>" +
							         
							"<button class='Edit_Button' onclick='EditarPedido(" + orden.cod_pedido + ")'>"+
								"EDITAR"+
							"</button>"+
							"</td>"+
						"</tr>"
				});
			}
			
			
			$("#TBody").html(html);
			
		}
	})
}

function EditarPedido(pedido){
	
	location.href= "http://localhost:8040/idat/Pedido/Editar/" + pedido
}

function Detalle(codPedido) {

	$.ajax({
		type: "GET",
		url: "/idat/Pedido/Detalle",
		data: { codigoPedido: codPedido.innerHTML },
		success: function(bDetalles) {

			var html = "";
			var subtotal = 0;
			var igv = 0;
			var delivery = 5;
			var total = 0;

			$("#Detail_ID").text("Detalle de Pedido | N# de Orden: " + bDetalles[0].ordenpedido.cod_pedido);

			$.each(bDetalles, function(index, detalle) {

				html +=
					"<div class='Item'>" +
					"<span>" + detalle.articulo.codArticulo + "</span>" +
					"<span>" + detalle.articulo.precio + "</span>" +
					"<span>" + detalle.cantidad + "</span>" +
					"<span>" + detalle.subtotal + "</span>" +

					"<img src='data:image/png;base64," + detalle.articulo.imagen + "'>" +
					"</div>";

				subtotal += detalle.subtotal;
			});
			$("#Detail_Content").html(html);

			igv = subtotal * 0.18;
			total = subtotal + igv + delivery;

			$("#Info_SubTotal").text(subtotal);
			$("#Info_IGV").text(igv);
			$("#Info_Delivery").text("S/5");
			$("#Info_Total").text(total);
		}
	})
}

function exportToExcel(nameExcel) {
  
	var table = document.getElementById("Table");
	var wb = XLSX.utils.table_to_book(table);
	XLSX.writeFile(wb, nameExcel+'.xlsx');
}