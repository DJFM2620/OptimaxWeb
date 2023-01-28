<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="<c:url value='/CSS/Lentes.css'/>">
<link rel="stylesheet" href="<c:url value='/CSS/Plantillas/NavBar.css'/>">
<link rel="stylesheet"
	href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">

<meta charset="ISO-8859-1">
<title>Lentes</title>

</head>
<body onload="OnLoadBody()">
	
	<div class="NavBar">
		<div class="NavBar_Content">
			<div>
				<p>OPTIMAX</p>
			</div>
			<div class="NavBar_Menu">
				<ul>
					<li><a href="<c:url value='/Principal'/>">Inicio</a></li>
					<li><a href="<c:url value='/Lentes'/>">Lentes</a></li>
					<li><a href="<c:url value='/MisPedidos'/>">Mis pedidos</a></li>
					<li><a href="<c:url value='/Cita'/>">Registrar una cita</a></li>
					<li><a href="<c:url value='/MisCitas'/>">Mis citas</a></li>
				</ul>
				<button type="button" id="openButton" onclick="AbrirModal()">CARRITO</button>
			</div>
		</div>
	</div>

	<div class="Header">
		<div class="Separator"></div>
    	<p>LENTES</p>
    	<div class="Separator"></div>    
	</div>
	
	<div class="Main">
	
		<div class="Grid">
			<div class="Grid_Items">
				<c:if test="${isPageable == true}">
					<c:forEach var="art" items="${bArticulo.content}">
		
						<div class="Item">
						
							<c:set var="typeImage" value="${fn:substringAfter(art.imagen,'.')}" />
							<img src="data:image/${typeImage};base64,${art.getBase64Imagen()}"
								onclick="DetailProduct(document.getElementById('articuloID${art.codArticulo}').value)" />
		
							<div class="Item_Flex">
								<label>Codigo:
									<input type="text" name="codigoarticulo" id="articuloID${art.codArticulo}" value="${art.codArticulo}" disabled="disabled">
								</label> 
								
								<input type="text" value="${art.marcaMontura.nombre_Marca}"  disabled="disabled" readonly>
								
								<label>S/${art.precio}</label>
		
								<button type="button" onclick="AddtoCart(document.getElementById('articuloID${art.codArticulo}').value)">
									AGREGAR AL CARRITO
								</button>
							</div>
							
						</div>
						
					</c:forEach>
				</c:if>
				
				<c:if test="${isPageable == false}">
					<c:forEach var="art" items="${bArticulo}">
		
						<div class="Item">
		
							<c:set var="typeImage" value="${fn:substringAfter(art.imagen,'.')}" />
		
							<img src="data:image/${typeImage};base64,${art.getBase64Imagen()}"
								onclick="DetailProduct(document.getElementById('articuloID${art.codArticulo}').value)" />
		
							<div class="Item_Flex">
								<label>Codigo:
									<input type="text" name="codigoarticulo" id="articuloID${art.codArticulo}" value="${art.codArticulo}" disabled="disabled">
								</label> 
								
								<input type="text" value="${art.marcaMontura.nombre_Marca}"  disabled="disabled" readonly>
								
								<label>S/${art.precio}</label>
		
								<button type="button" onclick="AddtoCart(document.getElementById('articuloID${art.codArticulo}').value)">
									AGREGAR AL CARRITO
								</button>
							</div>
						</div>
					</c:forEach>
				</c:if>
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

		<div class="Menu_Filter">
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
		
		<div class="Cart" id="Cart">
			<div class="Cart_Content">
			
				<button class="CloseModal" onclick="CerrarModal()">CERRAR</button>
				
				<div class="Cart_Content_Total">
					<div>
                        <span>SUBTOTAL: </span>
    					<input type="text" id="SubTotalOrder" value="0">
                    </div>
                    
    				<div>
                        <span>IGV (18%): </span>
    					<input type="text" id="IGVOrder" value="0">
                    </div>
                    
    				<div>
                        <span>DELIVERY: </span>
    					<input type="text" id="DeliveryOrder" value="5">
                    </div>
                    
    				<div>
                        <span>TOTAL A PAGAR: </span>
    					<input type="text" id="TotalOrder" value="0">
                    </div>
				</div>				
				
				<form method="post" action="/idat/Lentes">
					<c:forEach var="art" items="${bCarrito}">
						
						<c:set var="Articulo" value="document.getElementById('${art.codArticulo}')" />
						<c:set var="Cantidad" value="document.getElementById('CantidadArt${art.codArticulo}')" />
						<c:set var="Precio" value="document.getElementById('PrecioArt${art.codArticulo}')" />
						<c:set var="SubTotal" value="document.getElementById('SubTotal${art.codArticulo}')" />
					
						<div class="Cart_Body_Flex">
							<input type="text" class="Articulo" id="CodigoArt${art.codArticulo}" value="${art.codArticulo}" readonly /> 
							
							<c:set var="typeImage" value="${fn:substringAfter(art.imagen,'.')}" />
							<img src="data:image/${typeImage};base64,${art.getBase64Imagen()}"/>
							 
							<input type="text" id="marca" readonly/> 
							<input type="number" id="CantidadArt${art.codArticulo}" value="1" onchange="Calcular(${Precio},${Cantidad},${SubTotal})" name="Quantity" class="numero"/> 
							<input type="text" id="PrecioArt${art.codArticulo}" value="${art.precio}" onchange="Calcular(${Precio},${Cantidad},${SubTotal})" readonly /> 
							<input type="text" class="SubTotales" id="SubTotal${art.codArticulo}" value="${art.precio}" readonly />
	
							<c:set var="Articulo" value="document.getElementById('${art.codArticulo}').innerHTML" />
							<c:set var="Cantidad" value="document.getElementById('cantidad${art.codArticulo}').value" />
							<c:set var="Precio" value="document.getElementById('precio${art.codArticulo}').innerHTML" />
	
							<button type="button" onclick="location.href='<c:url value='/Lentes/Carrito/Eliminar?code=${art.codArticulo}'/>'">
								<span class="las la-trash-alt"></span>
							</button>
						</div>
					</c:forEach>
					<div class="Cart_Footer">
						<input type="text" name="PostTotalOrder" hidden="true">
						<button type="submit" id="btnOrder">Realizar Pedido</button>
					</div>
				</form>
			</div>
		</div>
		
	</div>
	
	<%@include file="/WEB-INF/views/shared/Footer.jsp"%>
	
	<script type="text/javascript" src="/idat/JS/Lentes.js"></script>
</body>
</html>