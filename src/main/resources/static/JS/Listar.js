//Seleccionamos a todos los inputs hijos de "range-input" que son los Input de tipo Rango
const rangeInput = document.querySelectorAll(".range-input input"),

//Seleccionamos a todos los inputs hijos de "price-input" que son el Input del max y min precio
priceInput = document.querySelectorAll(".price-input input"),

//Seleccionamos al slider y al progress
range = document.querySelector(".slider .progress");

let priceGap = 10; //Definimos el espacio entre los precios

priceInput.forEach(input => { // //Recorremos los dos inputs, max y min

	input.addEventListener("input", e => { //Cuando se agrege un nuevo valor al input
		let minPrice = parseInt(priceInput[0].value), //Obtenemos el valor del input y lo convertimos
		maxPrice = parseInt(priceInput[1].value); //Lo mismo

		if ((maxPrice - minPrice >= priceGap) && maxPrice <= rangeInput[1].max) {
			//Validamos si la diferencia entre los precios es mayor o igual al espacio entre precios
			//5000 - 1000 (4000) mayor o igual que 2000 Y 20000(Precio Maximo) es menor o igual que max

			if (e.target.className === "input-min") {
				//Validamos si el input del listener tiene como clase a "input-min"

				rangeInput[0].value = minPrice; //Agarramos al range input que contiene el minimo y le seteamos el nuevo minimo

				range.style.left = ((minPrice / rangeInput[0].max) * 100) + "%";
				//Modificamos el primer slider cuando se ingrese un nuevo valor al input minimo
			} else {
				rangeInput[1].value = maxPrice;
				range.style.right = 100 - (maxPrice / rangeInput[1].max) * 100 + "%";
				//Modificamos el primer slider cuando se ingrese un nuevo valor al input maximo
			}
		}
	});
});

rangeInput.forEach(input => { //Recorremos los range input seleccionados

	input.addEventListener("input", e => { //Cuando el input de tipo range cambie...

		let minVal = parseInt(rangeInput[0].value), //Se obtiene el valor del RANGE minimo
		maxVal = parseInt(rangeInput[1].value); //Se obtiene el valor del RANGE maximo

		if ((maxVal - minVal) < priceGap) { // si 5000 - 1000(4000) es menor que el espacio entre precios
			//if(4000 < 2000)

			if (e.target.className === "range-min") { //Validamos que el input tenga como clase a "range-min"

				rangeInput[0].value = maxVal - priceGap
				//Al primer input rango le seteamos el valor de 5000 - 2000 = 3000
				//Esta formula sirve para mantener el espacio entre los rangos min y max

			} else {
				rangeInput[1].value = minVal + priceGap;
				//Al segundo input rango le seteamos el valor de 0 + 2000 = 2000
			}
		} else { //Si es mayor, entonces:
			priceInput[0].value = minVal;
			//Seteamos el valor del primer input del precio minimo el valor minimo

			priceInput[1].value = maxVal;
			//Seteamos el valor del primer input del precio maximo el valor maximo

			range.style.left = ((minVal / rangeInput[0].max) * 100) + "%";
			//Movemos la barrita del slider hasta el valor del precio cuando se reduzca

			range.style.right = 100 - (maxVal / rangeInput[1].max) * 100 + "%";
			//Movemos la barrita del slider hasta el valor del precio cuando se aumente
		}
	});
});

function openFilter(InputID, ContentsID) {
    
    var element = document.getElementById(InputID);
    var contents = document.getElementById(ContentsID);
    
    if(element.checked == true){
	
		element.checked = false;
		contents.style.display = "none";
	 
	}else {
		
		element.checked = true;
		contents.style.display = "inline";
	}
}

function checkItemsOnLoad(){
	
	var URL = location.href; // Almacenamos la URL actual
	var url_Principal = "http://localhost:8040/idat/Articulo/Listar";

	if(URL != url_Principal){
		var items_split = URL.split('?'); //Separamos la URL, el path principal de los parametros que son divididos por el "?"
	
		/*
			Separamos el segundo elemento, que es el que contiene a los parametros, del array 
			separado (la URL), para separar los parametros
		*/
		items_split = items_split[1].split('&');
		
		var items = document.querySelectorAll(".item_filter"); // Obtenemos todos los items del filtro
		
		// Declaramos las variables que almacenaran los precios
		var minimoPrecio;
		var maximoPrecio;
		
		for(var i = 0; i < items_split.length; i++){ //Recorremos los parametros de la URL
			
			// Recorremos los items para comprar el parametro de la URL con cada item del filtro
			for(var j = 0; j < items.length; j++){ 
				if( items_split[i].includes(items[j].innerText) ){ // Validamos que el item del filtro exista en la URL
					
					// Si existe, entonces, marcamos su checkbox
					var elemento = document.getElementById("input_" +items[j].innerText);
					elemento.checked = true;
				}	
			}
			
			// Validamos que la URL spliteada tenga los parametros de precio
			if(items_split[i].includes("minimo")){
				 
				minimoPrecio = items_split[i];
			}
			if(items_split[i].includes("maximo")){
				
				maximoPrecio = items_split[i];
			}
		}
		// Dividimos los precios en dos y transformamos a un array | minimo=150 ---> {minimo, 150}
		minimoPrecio = minimoPrecio.split("="); 
		maximoPrecio = maximoPrecio.split("=");
		
		// Obtenemos los elementos de los precios
		document.getElementById("input-min").value = minimoPrecio[1]; // Les seteamos el valor del precio
		document.getElementById("input-max").value = maximoPrecio[1];
	}
}

function selectOptionMarcaFilter(input_marca, item_marca){
	
	var input = document.getElementById(input_marca);
	var item = document.getElementById(item_marca);
	var url = location.href; // Almacenamos la URL actual
	
    if(input.checked == true){
	
		input.checked = false;

		var marca = "marcas=" + item.innerText; // El parametro a eliminar

		var index = url.indexOf(marca); // Almacenamos el indice actual del parametro a eliminar
		var cant_marca = marca.length; // Almacenamos la cantidad de caracteres del parametro
		
		// Validamos que la suma entre el indice y la cantidad de caracteres sea menor a la longitud de la URL
		// Es decir si el indice es 50 y la cantidad de caracteres del parametro es 10, siendo la longitud total de la url 90
		// Entonces, 50 + 10 = 60  ||  Y 60 < 90  ||  Por lo tanto, Hay mas de un parametro por delante del parametro seleccionado
		// Finalmente, eliminamos el parametro con el "&" por delante.
		if( (index + cant_marca) < url.length ){ 
			
			url = url.split(marca+'&').toString(); // Hacemos un split para eliminar el parametro con su "&" por delante

			// Finalmente, reemplazamos la coma que se genera por la separacion de la URL en 2, por un caracter vacio, y asi 
			// uniendo las partes separadas
			
			location.href = url.replace(",", ""); // Hacemos que se carge la pagina nuevamente, pero con la "," reemplazada

		// Validamos que la suma entre el indice y la cantidad de caracteres sea mayor o igual a la longitud de la URL
		// Es decir si el indice es 77 y la cantidad de caracteres del parametro es 13, siendo la longitud total de la url 90
		// Entonces, 77 + 13 = 90  ||  Y 90 >= 90  ||  Por lo tanto, Ya no hay mas parametros por delante del parametro seleccionado
		// Finalmente, eliminamos el parametro con el "&" por detras.
		}else if( (index + cant_marca) >= url.length ){
			
			url = url.split('&'+marca).toString(); // Hacemos un split para eliminar el parametro con su "&" por detras
			url = url.split('/Filtro?'+marca).toString();
			
			// Finalmente, reemplazamos la coma que se genera por la separacion de la URL en 2, por un caracter vacio, y asi 
			// uniendo las partes separadas
			location.href = url.replace(",", ""); // Hacemos que se carge la pagina nuevamente, pero con la "," reemplazada
		}
	
	}else {
		
		input.checked = true;
		
		var url_Principal = "http://localhost:8040/idat/Articulo/Listar";
		
		if(location.href == url_Principal){ //If (/idat/Articulo/Listar == /idat/Articulo/Listar )
			
			location.href = url+ "/Filtro?marcas=" + item.innerText;
		
		}else {
			
			location.href = url + "&marcas=" + item.innerText;
		}
	}
}

function selectOptionModeloFilter(input_modelo, item_modelo){
	
	var input = document.getElementById(input_modelo);
	var item = document.getElementById(item_modelo);
	var url = location.href;
	
    if(input.checked == true){
	
		input.checked = false;

		var modelo = "modelos=" + item.innerText;

		var index = url.indexOf(modelo);
		var cant_modelo = modelo.length; 
		
		if( (index + cant_modelo) < url.length ){ 
			
			url = url.split(modelo+'&').toString();

			location.href = url.replace(",", "");

		}else if( (index + cant_modelo) >= url.length ){
			
			url = url.split('&'+modelo).toString();
			url = url.split('/Filtro?'+modelo).toString();
			
			location.href = url.replace(",", "");
		}
	
	}else {
		
		input.checked = true;
		
		var url_Principal = "http://localhost:8040/idat/Articulo/Listar";
		
		if(location.href == url_Principal){ //If (/idat/Articulo/Listar == /idat/Articulo/Listar )
			
			location.href = url+ "/Filtro?modelos=" + item.innerText;
		
		}else {
			
			location.href = url + "&modelos=" + item.innerText;
		}
	}
}

function selectOptionMaterialFilter(input_material, item_material){
	
	var input = document.getElementById(input_material);
	var item = document.getElementById(item_material);
	var url = location.href;

    if(input.checked == true){
	
		input.checked = false;

		var materiales = "materiales=" + item.innerText;

		var index = url.indexOf(materiales);
		var cant_materiales = materiales.length; 
		
		if( (index + cant_materiales) < url.length ){
			
			url = url.split(materiales+'&').toString(); 

			location.href = url.replace(",", ""); 
			
		}else if( (index + cant_materiales) >= url.length ){
			
			url = url.split('&'+materiales).toString();
			url = url.split('/Filtro?'+materiales).toString();
			
			location.href = url.replace(",", "");
		}
	
	}else {
		
		input.checked = true;
		
		var url_Principal = "http://localhost:8040/idat/Articulo/Listar";
		
		if(location.href == url_Principal){
			
			location.href = url+ "/Filtro?materiales=" + item.innerText;
		
		}else {
			
			location.href = url + "&materiales=" + item.innerText;
		}
	}
}

function selectOptionColorFilter(input_color, item_color){
	
	var input = document.getElementById(input_color);
	var item = document.getElementById(item_color);
	var url = location.href;

    if(input.checked == true){
	
		input.checked = false;

		var colores = "colores=" + item.innerText;

		var index = url.indexOf(colores);
		var cant_colores = colores.length; 
		
		if( (index + cant_colores) < url.length ){
			
			url = url.split(colores+'&').toString(); 

			location.href = url.replace(",", ""); 
			
		}else if( (index + cant_colores) >= url.length ){
			
			url = url.split('&'+colores).toString();
			url = url.split('/Filtro?'+colores).toString();
			
			location.href = url.replace(",", "");
		}
	
	}else {
		
		input.checked = true;
		
		var url_Principal = "http://localhost:8040/idat/Articulo/Listar";
		
		if(location.href == url_Principal){
			
			location.href = url+ "/Filtro?colores=" + item.innerText;
		
		}else {
			
			location.href = url + "&colores=" + item.innerText;
		}
	}
}

function clicPriceFilter(){
	
	var min = document.getElementById("input-min").value;
	var max = document.getElementById("input-max").value;
	
	var url = location.href;
	var url_Principal = "http://localhost:8040/idat/Articulo/Listar";
		
	if(url.includes("minimo")){

		var items_split = url.split('?');
		items_split = items_split[1].split('&');

		// Declaramos las variables que almacenaran los precios
		var minimoPrecio;
		var maximoPrecio;
		
		for(var i = 0; i < items_split.length; i++){
			
			// Validamos que la URL spliteada tenga los parametros de precio
			if(items_split[i].includes("minimo")){ 
				
				minimoPrecio = items_split[i]; //Añadimos dichos parametros al array creado anteriormente 
			}
			if(items_split[i].includes("maximo")){
				
				maximoPrecio = items_split[i]; //Añadimos dichos parametros al array creado anteriormente
			}
		}
		
		var index = url.indexOf(maximoPrecio);
		var cant_url_max = maximoPrecio.length;
		
		if( (index + cant_url_max) < url.length ){
			
			url = url.split(minimoPrecio+"&"+maximoPrecio+"&").toString();

			url = url.replace(",", "");
			
			location.href = url + "&minimo=" + min + "&maximo=" + max;
			
		}else if( (index + cant_url_max) >= url.length ){
			
			/*
				Hay dos posibles caso, que tengan mas parametros por detras o no, entonces, se procede a hacer el split
				en los dos casos, no hay problemas, ya que el split buscara exactamente, lo que se ingreso como parametro, en
				la URL, si no esta igual lo pasara por alto e ira al siguiente split. Es como un if pero sin if XD
			*/			
			url = url.split("&"+minimoPrecio+"&"+maximoPrecio).toString();
			url = url.split("?"+minimoPrecio+"&"+maximoPrecio).toString();
			
			url = url.replace(",", "");
			
			if(url == (url_Principal+"/Filtro")){
			
				location.href = url+ "?minimo=" + min + "&maximo=" + max;
			
			}else {
				
				location.href = url + "&minimo=" + min + "&maximo=" + max;
			}
		}
	}else {
		if(location.href == url_Principal){
		
			location.href = url+ "/Filtro?minimo=" + min + "&maximo=" + max;
		
		}else {
			
			location.href = url + "&minimo=" + min + "&maximo=" + max;
		}
	}	
}


function goFirstPage() {

	var url = location.href;
	var url_Principal = "http://localhost:8040/idat/Articulo/Listar";

	if (url.includes("pagina")) {

		var items_split = url.split('?');
		items_split = items_split[1].split('&');

		// Declaramos la variable que almacenara la pagina
		/*var minimoPrecio;
		var maximoPrecio;*/
		var pagina;

		for (var i = 0; i < items_split.length; i++) {

			// Validamos que la URL spliteada tenga el parametro de pagina
			if (items_split[i].includes("pagina")) {

				pagina = items_split[i]; //Añadimos dicho parametro al array creado anteriormente 
			}
		}
		var index = url.indexOf(pagina);
		var cant_url_pagina = pagina.length;

		if ((index + cant_url_pagina) < url.length) {

			url = url.split(pagina + "&").toString();

			url = url.replace(",", "");

			location.href = url + "&pagina=1";

		} else if ((index + cant_url_pagina) >= url.length) {

			/*
				Hay dos posibles caso, que tengan mas parametros por detras o no, entonces, se procede a hacer el split
				en los dos casos, no hay problemas, ya que el split buscara exactamente, lo que se ingreso como parametro, en
				la URL, si no esta igual lo pasara por alto e ira al siguiente split. Es como un if pero sin if XD
			*/
			url = url.split("&" + pagina).toString();
			url = url.split("?" + pagina).toString();

			url = url.replace(",", "");

			if (url == (url_Principal + "/Filtro")) {

				location.href = url + "?pagina=1";

			} else {

				location.href = url + "&pagina=1";
			}
		}
	} else {
		if (location.href == url_Principal) {

			location.href = url + "/Filtro?pagina=1";

		} else {

			location.href = url + "&pagina=1";
		}
	}
}

function goPreviousPage() {

	var url = location.href;
	var url_Principal = "http://localhost:8040/idat/Articulo/Listar";

	if (url.includes("pagina")) {

		var items_split = url.split('?');
		items_split = items_split[1].split('&');

		// Declaramos la variable que almacenara la pagina
		var pagina;

		for (var i = 0; i < items_split.length; i++) {

			// Validamos que la URL spliteada tenga el parametro de pagina
			if (items_split[i].includes("pagina")) {

				pagina = items_split[i]; // Añadimos dicho parametro a la variable creada anteriormente 
			}
		}

		var pagina_index = pagina.split("="); // Obtenemos la pagina actual 

		if (pagina_index[1] > 1) { // Validamos que la pagina actual sea mayor a 1, si no validamos se ira a numeros negativos

			var index = url.indexOf(pagina);
			var cant_url_pagina = pagina.length;

			if ((index + cant_url_pagina) < url.length) {

				url = url.split(pagina + "&").toString();

				url = url.replace(",", "");

				location.href = url + "&pagina=" + (pagina_index[1] - 1); // Le restamos 1

			} else if ((index + cant_url_pagina) >= url.length) {

				/*
					Hay dos posibles caso, que tengan mas parametros por detras o no, entonces, se procede a hacer el split
					en los dos casos, no hay problemas, ya que el split buscara exactamente, lo que se ingreso como parametro, en
					la URL, si no esta igual lo pasara por alto e ira al siguiente split. Es como un if pero sin if XD
				*/
				url = url.split("&" + pagina).toString();
				url = url.split("?" + pagina).toString();

				url = url.replace(",", "");

				pagina = pagina.split("="); // Obtenemos la pagina actual

				if (url == (url_Principal + "/Filtro")) {

					location.href = url + "?pagina=" + (pagina_index[1] - 1);

				} else {

					location.href = url + "&pagina=" + (pagina_index[1] - 1);
				}
			}
		}
	}
}

function goNextPage(LastPage) {

	var url = location.href;
	var url_Principal = "http://localhost:8040/idat/Articulo/Listar";

	if (url.includes("pagina")) {

		var items_split = url.split('?');
		items_split = items_split[1].split('&');

		// Declaramos la variable que almacenara la pagina
		var pagina;

		for (var i = 0; i < items_split.length; i++) {

			// Validamos que la URL spliteada tenga el parametro de pagina
			if (items_split[i].includes("pagina")) {

				pagina = items_split[i]; // Añadimos dicho parametro a la variable creada anteriormente 
			}
		}
		var pagina_index = pagina.split("="); // Obtenemos la pagina actual 

		if (pagina_index[1] < LastPage) { // Validamos que la pagina actual sea mayor a 1, si no validamos se ira a numeros negativos

			var index = url.indexOf(pagina);
			var cant_url_pagina = pagina.length;

			if ((index + cant_url_pagina) < url.length) {

				url = url.split(pagina + "&").toString();

				url = url.replace(",", "");

				location.href = url + "&pagina=" + (parseInt(pagina_index[1]) + 1); // Le aumentamos 1

			} else if ((index + cant_url_pagina) >= url.length) {

				/*
					Hay dos posibles caso, que tengan mas parametros por detras o no, entonces, se procede a hacer el split
					en los dos casos, no hay problemas, ya que el split buscara exactamente, lo que se ingreso como parametro, en
					la URL, si no esta igual lo pasara por alto e ira al siguiente split. Es como un if pero sin if XD
				*/
				url = url.split("&" + pagina).toString();
				url = url.split("?" + pagina).toString();

				url = url.replace(",", "");

				pagina = pagina.split("="); // Obtenemos la pagina actual

				if (url == (url_Principal + "/Filtro")) {

					location.href = url + "?pagina=" + (parseInt(pagina_index[1]) + 1);

				} else {

					location.href = url + "&pagina=" + (parseInt(pagina_index[1]) + 1);
				}
			}
		}
	} else {
		if (location.href == url_Principal) {
			/*
				 Si esta el parametro pagina=2 en la URL significa que el usuario esta en la ventana principal de "Lentes"
				 Por lo tanto, si quiere ir a la siguiente pagina, esta sera la numero 2
			*/
			location.href = url + "/Filtro?pagina=2";
		}
	}
}

function goLastPage(LastPage) {

	var url = location.href;
	var url_Principal = "http://localhost:8040/idat/Articulo/Listar";

	if (url.includes("pagina")) {

		var items_split = url.split('?');
		items_split = items_split[1].split('&');

		// Declaramos la variable que almacenara la pagina
		var pagina;

		for (var i = 0; i < items_split.length; i++) {

			// Validamos que la URL spliteada tenga el parametro de pagina
			if (items_split[i].includes("pagina")) {

				pagina = items_split[i]; //Añadimos dicho parametro al array creado anteriormente 
			}
		}
		var index = url.indexOf(pagina);
		var cant_url_pagina = pagina.length;

		if ((index + cant_url_pagina) < url.length) {

			url = url.split(pagina + "&").toString();

			url = url.replace(",", "");

			location.href = url + "&pagina=" + LastPage;

		} else if ((index + cant_url_pagina) >= url.length) {

			/*
				Hay dos posibles caso, que tengan mas parametros por detras o no, entonces, se procede a hacer el split
				en los dos casos, no hay problemas, ya que el split buscara exactamente, lo que se ingreso como parametro, en
				la URL, si no esta igual lo pasara por alto e ira al siguiente split. Es como un if pero sin if XD
			*/
			url = url.split("&" + pagina).toString();
			url = url.split("?" + pagina).toString();

			url = url.replace(",", "");

			if (url == (url_Principal + "/Filtro")) {

				location.href = url + "?pagina=" + LastPage;

			} else {

				location.href = url + "&pagina=" + LastPage;
			}
		}
	} else {
		if (location.href == url_Principal) {

			location.href = url + "/Filtro?pagina=" + LastPage;

		} else {

			location.href = url + "&pagina=" + LastPage;
		}
	}
}

function selectPage(ButtonID) {

	var button = document.getElementById(ButtonID);
	var url = location.href;
	var url_Principal = "http://localhost:8040/idat/Articulo/Listar";

	if (url.includes("pagina")) {

		var items_split = url.split('?');
		items_split = items_split[1].split('&');

		// Declaramos la variable que almacenara la pagina
		/*var minimoPrecio;
		var maximoPrecio;*/
		var pagina;

		for (var i = 0; i < items_split.length; i++) {

			// Validamos que la URL spliteada tenga el parametro de pagina
			if (items_split[i].includes("pagina")) {

				pagina = items_split[i]; //Añadimos dicho parametro al array creado anteriormente 
			}
		}
		var index = url.indexOf(pagina);
		var cant_url_pagina = pagina.length;

		if ((index + cant_url_pagina) < url.length) {

			url = url.split(pagina + "&").toString();

			url = url.replace(",", "");

			location.href = url + "&pagina=" + button.innerText;

		} else if ((index + cant_url_pagina) >= url.length) {

			/*
				Hay dos posibles caso, que tengan mas parametros por detras o no, entonces, se procede a hacer el split
				en los dos casos, no hay problemas, ya que el split buscara exactamente, lo que se ingreso como parametro, en
				la URL, si no esta igual lo pasara por alto e ira al siguiente split. Es como un if pero sin if XD
			*/
			url = url.split("&" + pagina).toString();
			url = url.split("?" + pagina).toString();

			url = url.replace(",", "");

			if (url == (url_Principal + "/Filtro")) {

				location.href = url + "?pagina=" + button.innerText;

			} else {

				location.href = url + "&pagina=" + button.innerText;
			}
		}
	} else {
		if (location.href == url_Principal) {

			location.href = url + "/Filtro?pagina=" + button.innerText;

		} else {

			location.href = url + "&pagina=" + button.innerText;
		}
	}
}

function exportToExcel(nameExcel) {
  
	var table = document.getElementById("Table");
	var wb = XLSX.utils.table_to_book(table);
	XLSX.writeFile(wb, nameExcel+'.xlsx');
}