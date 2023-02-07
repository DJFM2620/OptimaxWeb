<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="<c:url value='/CSS/Plantillas/Listar.css'/>">
<link rel="stylesheet"
	href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">

<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.15.6/xlsx.core.min.js"></script>

<title>Listado de Articulos</title>
</head>
<body onload="checkItemsOnLoad()">
	<%@include file="/WEB-INF/views/shared/tab.jsp"%>
	<div class="main">
		<div>
			<button class="New" onclick="location.href='<c:url value = "/Articulo/Registrar"/>'"><span class="las la-user-plus"></span> <span>NUEVO</span></button>
		</div>
		
		<table class="Table"  id="Table">
			<thead class="Table_Head">
				<tr>
					<th><b>ID</b></th>
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
				<c:if test="${isPageable == true}">
					<c:forEach var="art" items="${bArticulo.content}">
						<tr>
							<td>${art.codArticulo}</td>
							<td>${art.precio}</td>
							<td>${art.stock}</td>
							<td>${art.color.nombre}</td>
							<td data-format="@">${art.marcaMontura.nombre_Marca}</td>
							<td>${art.tipoMaterialMontura.nombre_Materia}</td>
							<td>${art.tipoModeloMontura.forma_Modelo}</td>
							<td>
								<c:set var="typeImage" value="${fn:substringAfter(art.imagen,'.')}" /> 
								<img src="data:image/${typeImage};base64,${art.getBase64Imagen()}">
							</td>
							<td>
								<button class="Button_Edit" onclick="location.href='<c:url value ="/Articulo/Editar/${art.codArticulo}"/>'">
									<span class="las la-edit"></span><span>Editar</span>
								</button>
								<button class="Button_Delete" onclick="location.href='<c:url value = "/Articulo/Eliminar/${art.codArticulo}"/>'">
									<span class="las la-trash-alt"></span><span>Borrar </span>
								</button>
							</td>
						</tr>
						
					</c:forEach>
				</c:if>
				
				<c:if test="${isPageable == false}">
					<c:forEach var="art" items="${bArticulo}">
						<tr>
							<td>${art.codArticulo}</td>
							<td>${art.precio}</td>
							<td>${art.stock}</td>
							<td>${art.color.nombre}</td>
							<td>${art.marcaMontura.nombre_Marca}</td>
							<td>${art.tipoMaterialMontura.nombre_Materia}</td>
							<td>${art.tipoModeloMontura.forma_Modelo}</td>
							<td>
								<c:set var="typeImage" value="${fn:substringAfter(articulo.imagen,'.')}" /> 
								<img src="data:image/${typeImage};base64,${art.getBase64Imagen()}">
							</td>
							<td>
								<button class="Button_Edit" onclick="location.href='<c:url value ="/Articulo/Editar/${art.codArticulo}"/>'">
									<span class="las la-edit"></span><span>Editar</span>
								</button>
								<button class="Button_Delete" onclick="location.href='<c:url value = "/Articulo/Eliminar/${art.codArticulo}"/>'">
									<span class="las la-trash-alt"></span><span>Borrar </span>
								</button>
							</td>
						</tr>		
					</c:forEach>
				</c:if>
			</tbody>
		</table>
		
		<div class="Menu">
		
			<div class="Filter_Item">
				<div class="Filter_Marca_Header" onclick="openFilter('filter-toggle-marca', 'Filter_Marca_Contents_ID')">
					<span style="cursor: pointer;"><b>Marcas</b></span>
					<span style="cursor: pointer;" class="las la-angle-down"></span>
				</div>
				<input type="checkbox" class="filter-toggle" id="filter-toggle-marca">
				<div class="Filter_Contents Filter_Marca_Contents" id="Filter_Marca_Contents_ID">
					<c:forEach var="marca" items="${bMarcas}">
						<div>	
							<input class="input_filter" type="checkbox" id="input_${marca.nombre_Marca}">
							<span class="item_filter" id="item_${marca.nombre_Marca}" 
								onclick="selectOptionMarcaFilter('input_${marca.nombre_Marca}', 'item_${marca.nombre_Marca}')">${marca.nombre_Marca}</span>
						</div>
					</c:forEach>
				</div>
			</div>
			
			<div class="Filter_Item">
				<div class="Filter_Precio_Header" onclick="openFilter('filter-toggle-precio', 'Filter_Precio_Contents_ID')">
					<span style="cursor: pointer;"><b>Precios</b></span>
					<span style="cursor: pointer;" class="las la-angle-down"></span>
				</div>
				
				<input type="checkbox" class="filter-toggle" id="filter-toggle-precio">
				<div class="Filter_Contents Filter_Precio_Contents" id="Filter_Precio_Contents_ID">
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
			
			<div class="Filter_Item">
				<div class="Filter_Modelo_Header" onclick="openFilter('filter-toggle-modelo', 'Filter_Modelo_Contents_ID')">
					<span style="cursor: pointer;"><b>Modelos</b></span>
					<span style="cursor: pointer;" class="las la-angle-down"></span>
				</div>
				
				<input type="checkbox" class="filter-toggle" id="filter-toggle-modelo">
				<div class="Filter_Contents Filter_Modelo_Contents" id="Filter_Modelo_Contents_ID">
					<c:forEach var="modelo" items="${bModelos}">
						<div>	
							<input class="input_filter" type="checkbox" id="input_${modelo.forma_Modelo}">
							<span class="item_filter" id="item_${modelo.forma_Modelo}" 
								onclick="selectOptionModeloFilter('input_${modelo.forma_Modelo}', 'item_${modelo.forma_Modelo}')">${modelo.forma_Modelo}</span>
						</div>
					</c:forEach>
				</div>
				
			</div>
			
			<div class="Filter_Item">
				<div class="Filter_Material_Header" onclick="openFilter('filter-toggle-material', 'Filter_Material_Contents_ID')">
					<span style="cursor: pointer;"><b>Materiales</b></span>
					<span style="cursor: pointer;" class="las la-angle-down"></span>
				</div>
				
				<input type="checkbox" class="filter-toggle" id="filter-toggle-material">
				<div class="Filter_Contents Filter_Material_Contents" id="Filter_Material_Contents_ID">
					<c:forEach var="material" items="${bMateriales}">
						<div>	
							<input class="input_filter" type="checkbox" id="input_${material.nombre_Materia}">
							<span class="item_filter" id="item_${material.nombre_Materia}" 
								onclick="selectOptionMaterialFilter('input_${material.nombre_Materia}', 'item_${material.nombre_Materia}')">${material.nombre_Materia}</span>
						</div>
					</c:forEach>
				</div>
			</div>
			
			<div class="Filter_Item">
				<div class="Filter_Color_Header" onclick="openFilter('filter-toggle-color', 'Filter_Color_Contents_ID')">
					<span style="cursor: pointer;"><b>Colores</b></span>
					<span style="cursor: pointer;" class="las la-angle-down"></span>
				</div>
				
				<input type="checkbox" class="filter-toggle" id="filter-toggle-color">
				<div class="Filter_Contents Filter_Color_Contents" id="Filter_Color_Contents_ID">
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
	
		<div class="Pagination">
			<button id="firstPage" onclick="goFirstPage()" type="button"><span class="las la-angle-double-left"></span></button>
			<button id="previousPage" onclick="goPreviousPage()" type="button"><span class="las la-angle-left"></span></button>
			
			<c:if test="${lastPage > 10}">
				<c:if test="${(lastPage - currentPage) <= 10}">
					<c:forEach var = "i" begin="${currentPage}" end="${lastPage}">
						<button id="page_${i}" onclick="selectPage('page_${i}')" type="button">${i}</button>
					</c:forEach>
				</c:if>
				
				<c:if test="${(lastPage - currentPage) > 10}">
					<c:forEach var = "i" begin="${currentPage}" end="${currentPage + 4}">
						<button id="page_${i}" onclick="selectPage('page_${i}')" type="button">${i}</button>
					</c:forEach>
					<div>
						<p>...</p>
					</div>
					<c:forEach var = "i" begin="1" end="5" step="1">
						<button id="page_${lastPage - (5 - i)}" onclick="selectPage('page_${lastPage - (5 - i)}')" type="button">${lastPage - (5 - i)}</button>
					</c:forEach>
				</c:if>
			</c:if>
			
			<c:if test="${lastPage <= 10}">
				<c:forEach var = "i" begin="1" end="${lastPage}">
					<button id="page_${i}" onclick="selectPage('page_${i}')" type="button">${i}</button>
				</c:forEach>
			</c:if>
			
			<button id="nextPage" onclick="goNextPage(${lastPage})" type="button"><span class="las la-angle-right"></span></button>
			<button id="lastPage" onclick="goLastPage(${lastPage})" type="button"><span class="las la-angle-double-right"></span></button>
		</div>	
	
	</div>
	
	<script type="text/javascript" src="/idat/JS/Listar.js"></script>
</body>
</html>