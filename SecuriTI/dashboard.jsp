<%@ page contentType="text/html; charset=UTF-8" %>
<% 
	Object name = session.getAttribute("name");	
	if (name != null){
		String idpage = request.getParameter("idpage");
%>
<!DOCTYPE html>
<html lang="es">
<head>
	<title>Principal</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="IE=Edge">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
</head>
<body>
	<%@ include file="navbar.html" %>
	<%
	if (idpage==null || idpage.equals("productos")){
		%>
		<div class="container-fluid">
			<ul class="nav">Bienvenido: &emsp;
				<li class="nav-item"><div><a class="nav-item"><% out.print(name);%></a></div></li>
			</ul>
		</div>
		<%@include file="dashboard/productos.jsp" %>
		<%
	}
	else if (idpage.equals("precios")){
		%>
		<%@include file="dashboard/precios.jsp" %>
		<%
	}
	else if (idpage.equals("cuentas")){
		%>
		<%@include file="dashboard/cuentas.jsp" %>
		<%
	}
	%>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
		integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
		crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"
		integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN4zfuZxLkoj1gXtW8ANNCe9d5Y3eG5eD"
		crossorigin="anonymous"></script>
		
</body>
</html>
<%
	}
	else {
        response.sendRedirect("../../index.jsp");
	}
%>