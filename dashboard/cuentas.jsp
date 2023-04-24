<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="Controller/Connections/mysql.jsp" %>
<div class="container-fluid">
	<div class="row flex-nowrap">
		<!-- Panel Izquierdo -->
		<div class="col-auto col-md-3 col-xl-2 px-sm-2 px-0 bg-dark">
			<div class="d-flex flex-column align-items-center align-items-sm-start px-3 pt-2 text-white min-vh-100">
				<a class="d-flex align-items-center pb-3 mb-md-0 me-md-auto text-white text-decoration-none">
					<span class="fs-5 d-none d-sm-inline">Menu</span>
				</a>
				<ul class="nav nav-pills flex-column mb-sm-auto mb-0 align-items-center align-items-sm-start" id="menu">
					<li class="nav-item">
						<a href="#profile" class="nav-link px-0 align-middle" role="button"
							aria-expanded="false" aria-controls="collapseExample">
							<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor"
								class="bi bi-person-circle" viewBox="0 0 16 16">
								<path
									d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z" />
								<path fill-rule="evenodd"
									d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z" />
							</svg><span class="ms-1 d-none d-sm-inline">Perfil</span>
						</a>
					</li>
					<% if (userlevel.equals("root") || userlevel.equals("admin") ){ %>
					<li class="nav-item">
						<a href="#users" class="nav-link px-0 align-middle">
							<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-people-fill" viewBox="0 0 16 16">
								<path d="M7 14s-1 0-1-1 1-4 5-4 5 3 5 4-1 1-1 1H7Zm4-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6Zm-5.784 6A2.238 2.238 0 0 1 5 13c0-1.355.68-2.75 1.936-3.72A6.325 6.325 0 0 0 5 9c-4 0-5 3-5 4s1 1 1 1h4.216ZM4.5 8a2.5 2.5 0 1 0 0-5 2.5 2.5 0 0 0 0 5Z"/>
							</svg><span class="ms-1 d-none d-sm-inline">Usuarios</span></a>
					</li>
					<li class="nav-item">
						<a href="#register" class="nav-link px-0 align-middle">
							<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-person-fill-add" viewBox="0 0 16 16">
								<path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7Zm.5-5v1h1a.5.5 0 0 1 0 1h-1v1a.5.5 0 0 1-1 0v-1h-1a.5.5 0 0 1 0-1h1v-1a.5.5 0 0 1 1 0Zm-2-6a3 3 0 1 1-6 0 3 3 0 0 1 6 0Z"/>
								<path d="M2 13c0 1 1 1 1 1h5.256A4.493 4.493 0 0 1 8 12.5a4.49 4.49 0 0 1 1.544-3.393C9.077 9.038 8.564 9 8 9c-5 0-6 3-6 4Z"/>
							</svg><span class="ms-1 d-none d-sm-inline">Crear Cuenta</span></a>
					</li>
					<% } %>					
				</ul>
			</div>
		</div>

		<div class="col py-3">
			<!-- Ver users -->
			<div id="users">
				<div class="container-fluid">
					<h1>Lista de Usuarios</h1>
					<div class="card-group">
						<% 
						String sql = "SELECT * FROM users WHERE username !='ROOT'"; 
						try { 
							PreparedStatement st=null; 
							ResultSet rs = null; 
							st = conn.prepareStatement(sql); 
							rs = st.executeQuery();
							int counter = 0;
							while (rs.next()) {
								counter++;
						%>
							<div class="p-1" style="width: 32%;">
								<form method="post">
									<div class="card w-90">
										<div class="card-body" style="background: #3C99D2; color: white;">
											<h5 class="card-title"><%=rs.getString("username")%></h5>
											<p class="card-text">
												<input name="iduser" type="hidden" value="<%=rs.getString("idUser")%>">
											</p>
										</div>
										<ul class="list-group list-group-flush">
											<li class="list-group-item" style="background:#B5C4C9;">Nombre: <%=rs.getString("name")%>
											</li>
											<li class="list-group-item" style="background:#B5C4C9;">Contacto: <%=rs.getString("email")%>
											</li>
										</ul>
										<div class="card-body" style="background:#B5C4C9;">
											<button formaction="dashboard/alteruser.jsp" type="submit"
												class="btn btn-info">Editar
											</button>
											<button
												type="button" data-bs-toggle="modal" class="btn btn-danger"
												data-bs-target="#eliminar<%=counter%>">Eliminar
											</button>
										</div>
									</div>

									<div class="modal fade" id="eliminar<%=counter%>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
										<div class="modal-dialog">
											<div class="modal-content" style="border: black 2px solid; border-radius: 20px;">
												<div style="text-align: center;">
													<h2>Alerta</h2>
												</div>
												<p>¿Desea realmente eliminar este Usuario?</p>
												<div style="display: flex; margin-bottom: 2%; margin-right: 1%;">
													<button formaction="dashboard/Controller/Process/deleteuser.jsp" type="submit" class="btn"
														style="background-color: #00BE62; width: 50%;  border-radius: 30px; margin-left: 10px; margin-right: 10px;"
														data-bs-dismiss="modal">Si</button>
													<button type="button" class="btn" style="background: #F10018; width: 50%;  border-radius: 30px;"
														data-bs-dismiss="modal" aria-label="Close">No</button>
												</div>
											</div>
										</div>
									</div>
								</form>
							</div>
							<% } } catch (Exception e){ %>
								<div class="col-sm-6">
									<div style="display: flex; flex-wrap: wrap;">
										<div style="margin-left: 1%; margin-top: 1%;">
											<form method="post" style="margin-right: 2%;">
												<div class="card" style="width: 18rem;">
													<div class="card-body">
														<h5 class="card-title">Empleado</h5>
														<p class="card-text"><input name="iduser" type="hidden"
																disabled value=""></p>
													</div>
													<ul class="list-group list-group-flush">
														<li class="list-group-item">Nombre: </li>
														<li class="list-group-item">Contacto: </li>
													</ul>
													<div class="card-body">
														<button formaction="dashboard/alteruser.jsp"
															type="submit" class="btn btn-info">Editar</button>
														<button
															formaction="dashboard/Controller/Process/deleteuser.jsp"
															type="submit"
															class="btn btn-danger">Eliminar</button>
													</div>
												</div>
											</form>
										</div>
									</div>
								</div>
								<% } %>
					</div>
				</div>
			</div>

			<!-- Ver Perfil -->
			<div id="profile" class="card mb-3">
				<div class="table-responsive">
					<table class="table">
						<tbody>
							<tr>
								<th scope="row">Nombre:</th>
								<td><%=name%></td>
								<td>
									<button type="button" class="btn btn-info" data-bs-toggle="modal" data-bs-target="#formularioModal0">
										Editar
									</button>
								</td>
							</tr>
							<tr>
								<th scope="row">Username:</th>
								<td><%=username%></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">Email:</th>
								<td><%=email%></td>
								<td>
									<button type="button" class="btn btn-info" data-bs-toggle="modal" data-bs-target="#formularioModal2">
										Editar
									</button>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<button type="button" class="btn btn-info" data-bs-toggle="modal" data-bs-target="#contraseña">
					Cambiar Contraseña
				</button>
			</div>
			

			<!-- Form Para editar info de la cuenta-->
			<div class="container-fluid">
				<div class="modal fade" id="formularioModal0" tabindex="-1" aria-labelledby="exampleModalLabel0"
					aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<!-- Formularios -->
								<form action="dashboard/Controller/Process/editprofile.jsp?formtype=name"
									method="post">
									<div class="mb-3">
										<label for="nombre" class="form-label">Nombre</label>
										<input type="text" class="form-control" id="name" name="name" required>
									</div>
									<div class="modal-footer">
										<button type="submit" class="btn btn-primary">Enviar</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
				<div class="modal fade" id="formularioModal2" tabindex="-1" aria-labelledby="exampleModalLabel2"
					aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<!-- Formularios -->
								<form action="dashboard/Controller/Process/editprofile.jsp?formtype=email"
									method="post">
									<div class="mb-3">
										<label for="nombre" class="form-label">Email</label>
										<input type="email" class="form-control" id="email" name="email"
											required>
									</div>
									<div class="modal-footer">
										<button type="submit" class="btn btn-primary">Enviar</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- Formulario de cambio de contraseña de users -->
			<div class="container-fluid">
				<div class="modal fade" id="contraseña" tabindex="-1" aria-labelledby="exampleModalLabel"
					aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<!-- Formulario -->
								<form action="dashboard/Controller/Process/editprofile.jsp?formtype=password"
									method="post">
									<div class="mb-3">
										<label for="passwordold" class="form-label">Contraseña actual</label>
										<input type="password" class="form-control" id="inputContrasenaold"
											name="oldpassword" required>
										<p id="mensajeErrorPass" style="color: red;"></p>
									</div>
									<div class="mb-3">
										<label for="passwordn" class="form-label">Contraseña Nueva</label>
										<input type="password" class="form-control" id="newpass"
											name="newpassword" required>
									</div>
									<div class="mb-3">
										<label for="passwordn" class="form-label">Repite la contraseña
											nueva</label>
										<input type="password" class="form-control" id="newpass2"
											name="newpassword2" onkeyup="inab()" required>
									</div>
									<div class="alert alert-danger" role="alert" id="alertano">
										Las contraseñas no coinciden
									</div>
									<div class="alert alert-success" role="alert" id="alertasi">
										Las contraseñas coinciden
									</div>
									<div class="modal-footer">
										<button id="editpassword" type="submit" class="btn btn-primary" onclick="igualdad()">Enviar</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- Formulario de registro de users -->
			<%
				String error = request.getParameter("error");
			%>
			<div class="center" style="width: 80%;" id="register">
				<form method="post" action="dashboard/Controller/Process/registerUser.jsp">
					<div class="mb-3">
						<div class="grid text-center">
							<div class="img-fluid"><img src="resources/IMG/securiTI.png"></div>
							<h1>Registrar Usuario</h1>
						</div>
					</div>
					<div class="mb-3">
						<label for="exampleInputEmail1" class="form-label">Nombre Completo</label>
						<input autocomplete="off" required name="name" type="text" class="form-control" id="namereg"
							aria-describedby="emailHelp">
					</div>
					<div class="mb-3">
						<label for="exampleInputEmail1" class="form-label">Nombre de Usuario</label>
						<input autocomplete="off" required name="username" type="text" class="form-control"
							id="inputSinEspacios" aria-describedby="emailHelp" maxlength="30">
					</div>
					<div class="mb-3">
						<label for="exampleInputEmail1" class="form-label">Correo</label>
						<input autocomplete="off" required name="email" type="email" class="form-control" id="emailreg"
							aria-describedby="emailHelp" maxlength="30">
					</div>
					<div class="mb-3">
						<label for="exampleInputPassword1" class="form-label">Contraseña</label>
						<input required required name="password" type="password" class="form-control"
							id="passwordreg">
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
					<button type="submit" class="btn btn-primary">Crear cuenta</button>
				</form>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	document.getElementById("alertano").style.display = 'none';
	document.getElementById("alertasi").style.display = 'none';

	// Obtener la ID de la URL
	const urlHash = window.location.hash.substring(1);

	// Ocultar todos los divs excepto los especificados
	const divsToHide = ["users", "profile", "register"];
	const allDivs = document.querySelectorAll("div");
	for (let i = 0; i < allDivs.length; i++) {
		const divId = allDivs[i].id;
		if (divsToHide.includes(divId)) {
			if (divId !== urlHash) {
			allDivs[i].style.display = "none";
			} else {
			allDivs[i].style.display = "block";
			}
		}
	}

	// Agregar evento click a los enlaces con href que comiencen con #
	const links = document.querySelectorAll('a[href^="#"]');
	links.forEach(function(link) {
		link.addEventListener('click', function(event) {
			event.preventDefault(); // Evitar que el enlace redirija la página
			const linkHash = this.getAttribute('href').substring(1); // Obtener la ID del enlace
			for (let i = 0; i < allDivs.length; i++) {
			const divId = allDivs[i].id;
			if (divsToHide.includes(divId)) {
				if (divId === linkHash) {
				allDivs[i].style.display = "block"; // Mostrar el div correspondiente
				} else {
				allDivs[i].style.display = "none"; // Ocultar los demás divs
				}
			}
			}
			window.history.pushState(null, null, '#' + linkHash); // Actualizar la URL
		});
	});

	function igualdad() {
		var contra1 = document.getElementById("newpassword").value;
		var contr2 = document.getElementById("newpassword2").value;
		if (contra1 != contr2) {
			window.alert("Las contraseñas no coinciden");
		} else{
			window.alert("Cambio Exitoso");
		}
	}

	function inab() {
		var contra1 = document.getElementById("newpassword").value;
		var contr2 = document.getElementById("newpassword2").value;
		var desb = document.getElementById("desb");
		if (contra1 != contr2) {
			desb.disabled = true;
			document.getElementById("alertano").style.display = 'block';
			document.getElementById("alertasi").style.display = 'none';
		} else {
			desb.disabled = false;
			document.getElementById("alertano").style.display = 'none';
			document.getElementById("alertasi").style.display = 'block';
		}

		if(contra1 && contr2 ==''){
			document.getElementById("alertano").style.display = 'none';
			document.getElementById("alertasi").style.display = 'none';
		}
	}

</script>