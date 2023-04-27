<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="Controller/Connections/mysql.jsp" %>
<%@ page import="java.io.*, java.util.*" %>
<%@ page import="java.text.*" %>

<%
    String idDevice = request.getParameter("idDevice");
    String idCompany = request.getParameter("idCompany");
    String deviceType = request.getParameter("deviceType");
    String nameCompany = request.getParameter("nameCompany");
%>
<!DOCTYPE html>
<html lang="es">

<head>
    <title>Visualizar Dispositivo</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <link rel="stylesheet" href="resources/CSS/principal.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
</head>

<body class="text-zoom">
    <%
	if (deviceType.equals("WorkStation")){
		%>
		<%@include file="devices/verWS.jsp" %>
		<%
	}
	else if (deviceType.equals("Server")){
		%>
		<%@include file="devices/verSV.jsp" %>
		<%
	}
    else {
		%>
        <h1>Error de Consulta: Ese Tipo de Dispositivo no existe</h1>
		<%
    }
	%>
    <script src="resources/JS/scripts.jsp"></script>
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