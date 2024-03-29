<%@ page contentType="text/html; charset=UTF-8" %>
<%
	String error = request.getParameter("error");
%>
<!DOCTYPE html>
<html lang="es">
<head>
	<title>SecuriTI Login</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="IE=Edge">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
		integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
</head>
<body>
	<div>
		<div  id="ocultar" class="container-sm" style="width: 40%;">
			<form method="post" action="dashboard/Controller/Process/login.jsp" style="margin: 25px ;" id="login">
				<div class="mb-3">
					<div class="grid text-center">
						<div class="img-fluid"><a href="index.jsp"><img src="resources/IMG/securiTI.png"></a></div>
						<h1>Iniciar Sesión</h1>
					</div>
				</div>
				<div class="mb-3">
					<label for="exampleInputEmail1" class="form-label">Nombre del Usuario</label>
					<input required autocomplete="off" name="username" type="text" class="form-control" id="inputSinEspacios"
						aria-describedby="emailHelp">
				</div>
				<div class="mb-3">
					<label for="exampleInputPassword1" class="form-label">Contraseña</label>
					<input required name="password" type="password" class="form-control" id="exampleInputPassword1">
				</div>
				<div class="mb-3 form-check">
					<input name="rememberme" type="checkbox" class="form-check-input" id="exampleCheck1">
					<label class="form-check-label" for="exampleCheck1">Recordar Sesión</label>
				</div>
				<p id="mensajeError" style="color: red;">
					<%
						if(error!=null){
							%>
						<svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
							<symbol id="check-circle-fill" fill="currentColor" viewBox="0 0 16 16">
								<path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
							</symbol>
							<symbol id="info-fill" fill="currentColor" viewBox="0 0 16 16">
								<path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zm.93-9.412-1 4.705c-.07.34.029.533.304.533.194 0 .487-.07.686-.246l-.088.416c-.287.346-.92.598-1.465.598-.703 0-1.002-.422-.808-1.319l.738-3.468c.064-.293.006-.399-.287-.47l-.451-.081.082-.381 2.29-.287zM8 5.5a1 1 0 1 1 0-2 1 1 0 0 1 0 2z"/>
							</symbol>
							<symbol id="exclamation-triangle-fill" fill="currentColor" viewBox="0 0 16 16">
								<path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
							</symbol>
							</svg>
						<div class="mb-3">
							<div class="form-check-label" for="exampleCheck1">
							<label class="alert alert-danger d-flex align-items-center" role="alert" >
							<svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Danger:"><use xlink:href="#exclamation-triangle-fill"/></svg>
							<%out.print("Alerta: ¡"+error+"!");%></label>
						</div>
					</div>
							<%
						}
					%>
				</p>
				<button type="submit" class="btn btn-primary">Iniciar Sesión</button>
			</form>
		</div>
		<script src="resources/JS/scripts.jsp"></script>
		<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
			integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
			crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"
			integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN4zfuZxLkoj1gXtW8ANNCe9d5Y3eG5eD"
			crossorigin="anonymous"></script>
</body>

</html>