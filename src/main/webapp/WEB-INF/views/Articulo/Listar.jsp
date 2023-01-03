<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="<c:url value='/CSS/Articulo/Listar.css'/>">
<link rel="stylesheet"
	href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">

<title>Listado de Articulos</title>
</head>
<body onload="checkItemsOnLoad()">
	<%@include file="/WEB-INF/views/shared/tab.jsp"%>
	<div class="main">
		<div>
			<button class="New" onclick="location.href='<c:url value = "/Articulo/Registrar"/>'"><span class="las la-user-plus"></span> <span>NUEVO</span></button>
			<button class="Filter"><span class="las la-filter"></span> <span>FILTER</span></button>
			<input type="text" placeholder="Buscar..." class="Search">
		</div>
		
		<table class="Table">
			<thead class="Table_Head">
				<tr>
					<th>ID</th>
					<th><b>Precio</b></th>
					<th><b>Stock</b></th>
					<th><b>Color</b></th>
					<th><b>Marca</b></th>
					<th><b>Material</b></th>
					<th><b>Modelo</b></th>
					<th><b>Imagen</b></th>
					<th><b>Opciones</b></th>
				</tr>
			</thead>
			<tbody class="Table_Body">
				<c:forEach var="articulo" items="${bArticulo}">
					<tr>
						<td>${articulo.codArticulo}</td>
						<td>${articulo.precio}</td>
						<td>${articulo.stock}</td>
						<td>${articulo.color.nombre}</td>
						<td>${articulo.marcaMontura.nombre_Marca}</td>
						<td>${articulo.tipoMaterialMontura.nombre_Materia}</td>
						<td>${articulo.tipoModeloMontura.forma_Modelo}</td>
						<td>
							<c:set var="typeImage" value="${fn:substringAfter(articulo.imagen,'.')}" /> 
							<img src="data:image/${typeImage};base64,${articulo.getBase64Imagen()}">
						</td>
						<td>
							<button class="Button_Edit" onclick="location.href='<c:url value ="/Articulo/Editar/${articulo.codArticulo}"/>'">
								<span class="las la-edit"></span><span>Editar</span>
							</button>
							<button class="Button_Delete" onclick="location.href='<c:url value = "/Articulo/Eliminar/${articulo.codArticulo}"/>'">
								<span class="las la-trash-alt"></span><span>Borrar </span>
							</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<div class="Menu_Filter">
		
			<div class="Filter_Marca">
				<div class="Filter_Marca_Header" onclick="openFilter('filter-toggle-marca')">
					<span style="cursor: pointer;"><b>Marcas</b></span>
					<span style="cursor: pointer;" class="las la-angle-down"></span>
				</div>
				<input type="checkbox" id="filter-toggle-marca">
				<div class="Filter_Marca_Contents">
					<c:forEach var="marca" items="${bMarcas}">
						<div>	
							<input class="input_filter" type="checkbox" id="input_${marca.nombre_Marca}">
							<span class="item_filter" id="item_${marca.nombre_Marca}" 
								onclick="selectOptionMarcaFilter('input_${marca.nombre_Marca}', 'item_${marca.nombre_Marca}')">${marca.nombre_Marca}</span>
						</div>
					</c:forEach>
				</div>
			</div>
			
			<div class="Filter_Precio">
				<div class="Filter_Precio_Header" onclick="openFilter('filter-toggle-precio')">
					<span style="cursor: pointer;"><b>Precios</b></span>
					<span style="cursor: pointer;" class="las la-angle-down"></span>
				</div>
				
				<input type="checkbox" id="filter-toggle-precio">
				<div class="Filter_Precio_Contents">
					<div class="wrapper">
				      	<div class="price-input">
				        	<div class="field">
				          		<span>Min</span>
				          		<input type="number" id="input-min" class="input-min" value="0">
				        	</div>
				        	<div class="separator">-</div>
				        	<div class="field">
				          		<span>Max</span>
				          		<input type="number" id="input-max" class="input-max" value="${mapPrecioMaximo}">
				        	</div>
				      	</div>
				      	<div class="slider">
					        <div class="progress"></div>
				    	</div>
				      	<div class="range-input">
				        	<input type="range" class="range-min" min="0" max="${mapPrecioMaximo}" value="0" step="1">
				        	<input type="range" class="range-max" min="0" max="${mapPrecioMaximo}" value="${mapPrecioMaximo}" step="1">
				      	</div>
				      	<button type="button" class="button_filter_price" onclick="clicPriceFilter()"> FILTRAR </button>
				    </div>
				</div>
			</div>
			
			<div class="Filter_Modelo">
				<div class="Filter_Modelo_Header" onclick="openFilter('filter-toggle-modelo')">
					<span style="cursor: pointer;"><b>Modelos</b></span>
					<span style="cursor: pointer;" class="las la-angle-down"></span>
				</div>
				
				<input type="checkbox" id="filter-toggle-modelo">
				<div class="Filter_Modelo_Contents">
					<c:forEach var="modelo" items="${bModelos}">
						<div>	
							<input class="input_filter" type="checkbox" id="input_${modelo.forma_Modelo}">
							<span class="item_filter" id="item_${modelo.forma_Modelo}" 
								onclick="selectOptionModeloFilter('input_${modelo.forma_Modelo}', 'item_${modelo.forma_Modelo}')">${modelo.forma_Modelo}</span>
						</div>
					</c:forEach>
				</div>
				
			</div>
			
			<div class="Filter_Material">
				<div class="Filter_Material_Header" onclick="openFilter('filter-toggle-material')">
					<span style="cursor: pointer;"><b>Materiales</b></span>
					<span style="cursor: pointer;" class="las la-angle-down"></span>
				</div>
				
				<input type="checkbox" id="filter-toggle-material">
				<div class="Filter_Material_Contents">
					<c:forEach var="material" items="${bMateriales}">
						<div>	
							<input class="input_filter" type="checkbox" id="input_${material.nombre_Materia}">
							<span class="item_filter" id="item_${material.nombre_Materia}" 
								onclick="selectOptionMaterialFilter('input_${material.nombre_Materia}', 'item_${material.nombre_Materia}')">${material.nombre_Materia}</span>
						</div>
					</c:forEach>
				</div>
			</div>
			
			<div class="Filter_Color">
				<div class="Filter_Color_Header" onclick="openFilter('filter-toggle-color')">
					<span style="cursor: pointer;"><b>Colores</b></span>
					<span style="cursor: pointer;" class="las la-angle-down"></span>
				</div>
				
				<input type="checkbox" id="filter-toggle-color">
				<div class="Filter_Color_Contents">
					<c:forEach var="color" items="${bColores}">
						<div>	
							<input class="input_filter" type="checkbox" id="input_${color.nombre}">
							<span class="item_filter" id="item_${color.nombre}" 
								onclick="selectOptionColorFilter('input_${color.nombre}', 'item_${color.nombre}')">${color.nombre}</span>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript" src="/idat/JS/Listar.js"></script>

</body>
</html>