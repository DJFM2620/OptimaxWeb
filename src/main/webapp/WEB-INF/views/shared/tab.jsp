<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="<c:url value='/css/sidebar.css'/>" rel="stylesheet"/>


</head>
<body>
<div class="area"></div><nav class="main-menu">
            <ul>
            
            	<li class="has-subnav">
                    <a onclick="location.href='<c:url value='/articulo_listar'/>'">
                        <i class="fa fa-laptop fa-2x"></i>
                        <span class="nav-text">
                            Articulos
                        </span>
                    </a>
                    
                </li>
            

                <li class="has-subnav">
                    <a onclick="location.href='<c:url value='/empleado_listado'/>'">
                        <i class="fa fa-laptop fa-2x"></i>
                        <span class="nav-text">
                            Empleados
                        </span>
                    </a>
                    
                </li>
                <li class="has-subnav">
                    <a onclick="location.href='<c:url value='/CargosEmpleados'/>'">
                       <i class="fa fa-list fa-2x"></i>
                        <span class="nav-text">
                            Cargos
                        </span>
                    </a>
                    
                </li>
                <li class="has-subnav">
                    <a onclick="location.href='<c:url value='/distrito_listar'/>'">
                       <i class="fa fa-list fa-2x"></i>
                        <span class="nav-text">
                            Distritos
                        </span>
                    </a>
                </li>
                <li class="has-subnav">
                    <a onclick="location.href='<c:url value='/MarcasArticulos'/>'">
                       <i class="fa fa-list fa-2x"></i>
                        <span class="nav-text">
                            Marca
                        </span>
                    </a>
                    
                </li>
                <li class="has-subnav">
                    <a onclick="location.href='<c:url value='/MaterialArticulos'/>'">
                       <i class="fa fa-list fa-2x"></i>
                        <span class="nav-text">
                           Material
                        </span>
                    </a>
                    
                </li>
                <li class="has-subnav">
                    <a onclick="location.href='<c:url value='/ModelosArticulos'/>'">
                       <i class="fa fa-list fa-2x"></i>
                        <span class="nav-text">
                            Modelo
                        </span>
                    </a>
                    
                </li>
                 <li class="has-subnav">
                    <a onclick="location.href='<c:url value='/cliente_listar'/>'">
                       <i class="fa fa-list fa-2x"></i>
                        <span class="nav-text">
                            Cliente
                        </span>
                    </a>
                    
                </li>
                 <li class="has-subnav">
                    <a onclick="location.href='<c:url value='/empleado_registrar'/>'">
                       <i class="fa fa-list fa-2x"></i>
                        <span class="nav-text">
                            Registro empleados
                        </span>
                    </a>
                    
                </li>
                 <li class="has-subnav">
                    <a onclick="location.href='<c:url value='/RegistrarCargoEmpleado'/>'">
                       <i class="fa fa-list fa-2x"></i>
                        <span class="nav-text">
                           Registro Cargos
                        </span>
                    </a>
                    
                </li>
                
                <li class="has-subnav">
                    <a onclick="location.href='<c:url value='/distrito_registrar'/>'">
                       <i class="fa fa-list fa-2x"></i>
                        <span class="nav-text">
                           Registro Distritos
                        </span>
                    </a>
                    
                </li>
                <li class="has-subnav">
                    <a onclick="location.href='<c:url value='/RegistrarMarcaArticulo'/>'">
                       <i class="fa fa-list fa-2x"></i>
                        <span class="nav-text">
                           Registro marca
                        </span>
                    </a>
                </li>
                <li class="has-subnav">
                    <a onclick="location.href='<c:url value='/RegistrarmaterialArticulo'/>'">
                       <i class="fa fa-list fa-2x"></i>
                        <span class="nav-text">
                           Registro Material
                        </span>
                    </a>
                    
                </li>
                <li class="has-subnav">
                    <a onclick="location.href='<c:url value='/RegistrarModeloArticulo'/>'">
                       <i class="fa fa-list fa-2x"></i>
                        <span class="nav-text">
                           Registro Modelo
                        </span>
                    </a>
                    
                </li>
                <li class="has-subnav">
                    <a onclick="location.href='<c:url value='/articulo_registrar'/>'">
                       <i class="fa fa-list fa-2x"></i>
                        <span class="nav-text">
                           Registro Articulo
                        </span>
                    </a>
                    
                </li>
                <li class="has-subnav">
                
                
                
              
            </ul>

            <ul class="logout">
                <li>
                   <a onclick="location.href='<c:url value='/principal'/>'">
                         <i class="fa fa-power-off fa-2x"></i>
                        <span class="nav-text">
                            Logout
                        </span>
                    </a>
                </li>  
            </ul>
        </nav>
        
        
        
</body>
</html>