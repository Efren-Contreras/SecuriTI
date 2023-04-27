<%@ page contentType="text/html; charset=UTF-8" %>
<% 
	Object name = session.getAttribute("name");
	Object username = session.getAttribute("username");
	Object email = session.getAttribute("email");
	Object password = session.getAttribute("password");
	Object userlevel = session.getAttribute("userlevel");
	Object idUser = session.getAttribute("idUser");
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
	<link rel="stylesheet" href="resources/CSS/principal.css">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
</head>
<body class="text-zoom">
	<%@ include file="navbar.jsp" %>
	<%
	if (idpage==null || idpage.equals("empresas")){
		%>
		<%@include file="dashboard/empresas.jsp" %>
		<%
	}
	else if (idpage.equals("logs")){
		%>
		<%@include file="dashboard/logs.jsp" %>
		<%
	}
	else if (idpage.equals("cuentas")){
		%>
		<%@include file="dashboard/cuentas.jsp" %>
		<%
	}
	else if (idpage.equals("dispositivos")){
		%>
		<%@include file="dashboard/dispositivo.jsp" %>
		<%
	}
	%>
	<script src="resources/JS/scripts.jsp"></script>
	<script src="resources/JS/buscarWS.js"></script>
	<script src="resources/JS/buscarSV.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
		integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
		crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"
		integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN4zfuZxLkoj1gXtW8ANNCe9d5Y3eG5eD"
		crossorigin="anonymous"></script>
</body>
<style>
	html {
		font-size: 16px;
	}

	body {
		font-size: 1rem;
	}

	h1 {
		font-size: 2rem;
	}
</style>
</html>
<%
	}
	else {
        response.sendRedirect("index.jsp");
	}
%>