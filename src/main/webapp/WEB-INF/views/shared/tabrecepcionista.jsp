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
                    <a onclick="location.href='<c:url value='/citas_listar'/>'">
                        <i class="fa fa-laptop fa-2x"></i>
                        <span class="nav-text">
                            Citas
                        </span>
                    </a>
                    
                </li>
            

              
                
              
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