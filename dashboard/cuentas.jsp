<%@ page contentType="text/html; charset=UTF-8" %>
	<%@ include file="Controller/Connections/mysql.jsp" %>
		<div class="container-fluid">
			<div class="row flex-nowrap">
				<!-- Panel Izquierdo -->
				<div class="col-auto col-md-3 col-xl-2 px-sm-2 px-0 bg-dark">
					<div
						class="d-flex flex-column align-items-center align-items-sm-start px-3 pt-2 text-white min-vh-100">
						<a href="#"
							class="d-flex align-items-center pb-3 mb-md-0 me-md-auto text-white text-decoration-none">
							<span class="fs-5 d-none d-sm-inline">Menu</span>
						</a>
						<ul class="nav nav-pills flex-column mb-sm-auto mb-0 align-items-center align-items-sm-start"
							id="menu">
							<li>
								<a href="#collapseExample" data-bs-toggle="collapse" class="nav-link px-0 align-middle"
									role="button" aria-expanded="false" aria-controls="collapseExample"
									onclick="verCuenta()">
									<i class="bi bi-person-circle"></i>
									<span class="ms-1 d-none d-sm-inline">Perfil</span>
								</a>
							</li>
							<% if (userlevel.equals("root") || userlevel.equals("admin") ){ %>
								<li>
									<a href="#" class="nav-link px-0 align-middle" onclick="verUsuario();">
										<i class="fs-4 bi-table"></i> <span
											class="ms-1 d-none d-sm-inline">Usuarios</span></a>
								</li>
								<li>
									<a href="#submenu2" data-bs-toggle="collapse" class="nav-link px-0 align-middle"
										onclick="VerForm();">
										<i class="fs-4 bi-bootstrap"></i> <span class="ms-1 d-none d-sm-inline">Crear
											Cuenta</span></a>
								</li>
								<% } %>
						</ul>
					</div>
				</div>

				<div class="col py-3">
					<!-- Ver usuarios -->
					<div id="usua">
						<div class="container-fluid">
							<h1>Lista de los usuarios</h1>
							<div class="card-group">
								<% 
								String sql="SELECT * FROM usuarios WHERE idUser !=" +idUser; 
								try { 
									PreparedStatement
									st=null; 
									ResultSet rs=null; 
									st=conn.prepareStatement(sql); 
									rs=st.executeQuery();
									while (rs.next()) { %>
									<div class="p-1">
										<form method="post">
											<div class="card w-90">
												<div class="card-body">
													<h5 class="card-title">Empleado</h5>
													<p class="card-text">
														<input name="iduser" type="hidden"
															value="<%=rs.getString("idUser")%>">
													</p>
												</div>
												<ul class="list-group list-group-flush">
													<li class="list-group-item">Nombre: <%=rs.getString("name")%>
													</li>
													<li class="list-group-item">Nombre de Usuario:
														<%=rs.getString("username")%>
													</li>
													<li class="list-group-item">Contacto: <%=rs.getString("email")%>
													</li>
												</ul>
												<div class="card-body">
													<button formaction="dashboard/alteruser.jsp" type="submit"
														class="btn btn-info">Editar</button>
													<button formaction="dashboard/Controller/Process/deleteuser.jsp"
														type="submit" class="btn btn-danger">Eliminar</button>
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
					<div id="CuentaVer" class="card mb-3">
						<div class="row g-0">
							<div class="col-md-4">
								<img class="img-fluid rounded-start" src="resources/IMG/user2.png" alt="Usuario">
							</div>
							<div class="col-md-8">
								<div class="card-body">
									<h1 class="card-title">Tú Perfil</h1>
									<p class="h1">Nombre: <%=name%>
											<button type="button" class="h4 btn btn-info" data-bs-toggle="modal"
												data-bs-target="#formularioModal0">
												Editar
											</button>
									</p>
									<p class="h1">Username: <%=username%>
											<button type="button" class="h4 btn btn-info" data-bs-toggle="modal"
												data-bs-target="#formularioModal1">
												Editar
											</button>
									</p>
									<p class="h1">Email: <%=email%>
											<button type="button" class="h4 btn btn-info" data-bs-toggle="modal"
												data-bs-target="#formularioModal2">
												Editar
											</button>
									</p>
									<button type="button" class="h4 btn btn-info" data-bs-toggle="modal"
										data-bs-target="#contraseña">
										Cambiar Contraseña
									</button>
								</div>
							</div>
						</div>
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
						<div class="modal fade" id="formularioModal1" tabindex="-1" aria-labelledby="exampleModalLabel1"
							aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="btn-close" data-bs-dismiss="modal"
											aria-label="Close"></button>
									</div>
									<div class="modal-body">
										<!-- Formularios -->
										<form action="dashboard/Controller/Process/editprofile.jsp?formtype=username"
											method="post">
											<div class="mb-3">
												<label for="username" class="form-label">Username</label>
												<input type="username" class="form-control" id="username"
													name="username" required>
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

					<!-- Formulario de cambio de contraseña de usuarios -->
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
												<input type="password" class="form-control" id="nombre"
													name="oldpassword" required>
											</div>
											<div class="mb-3">
												<label for="passwordn" class="form-label">Contraseña Nueva</label>
												<input type="password" class="form-control" id="correo"
													name="newpassword" required>
											</div>
											<div class="mb-3">
												<label for="passwordn" class="form-label">Repite la contraseña
													nueva</label>
												<input type="password" class="form-control" id="correo"
													name="newpassword2" required>
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

					<!-- Formulario de registro de usuarios -->
					<div class="center" style="width: 80%;">
						
							<form method="post" action="dashboard/Controller/Process/register.jsp" id="FormVer">
								<div class="mb-3">
									<div class="grid text-center">
										<div class="img-fluid"><img src="resources/IMG/securiTI.png"></div>
										<h1>Registrar Usuario</h1>
									</div>
								</div>
								<div class="mb-3">
									<label for="exampleInputEmail1" class="form-label">Nombre Completo</label>
									<input autocomplete="off" required name="name" type="text" class="form-control"
										id="" aria-describedby="emailHelp">
								</div>
								<div class="mb-3">
									<label for="exampleInputEmail1" class="form-label">Nombre de Usuario</label>
									<input autocomplete="off" required name="username" type="text" class="form-control"
										id="" aria-describedby="emailHelp" maxlength="30">
								</div>
								<div class="mb-3">
									<label for="exampleInputEmail1" class="form-label">Correo</label>
									<input autocomplete="off" required name="email" type="email" class="form-control"
										id="" aria-describedby="emailHelp" maxlength="30">
								</div>
								<div class="mb-3">
									<label for="exampleInputPassword1" class="form-label">Contraseña</label>
									<input required required name="password" type="password" class="form-control"
										id="exampleInputPassword1">
								</div>
								<div class="mb-3 form-check">
									<input name="accept" type="checkbox" class="form-check-input" id="exampleCheck1">
									Acepto Crear Cuenta
								</div>
								<button type="submit" class="btn btn-primary">Crear cuenta</button>
							</form>
						
					</div>
				</div>
			</div>
		</div>
		<script type="text/javascript">
			document.getElementById("FormVer").style.display = 'none';
			document.getElementById("usua").style.display = 'none';
			document.getElementById("CuentaVer").style.display = 'block';

			function VerForm() {
				document.getElementById("usua").style.display = 'none';
				document.getElementById("CuentaVer").style.display = 'none';
				document.getElementById("FormVer").style.display = 'block';
			}

			function verUsuario() {
				document.getElementById("FormVer").style.display = 'none';
				document.getElementById("CuentaVer").style.display = 'none';
				document.getElementById("usua").style.display = 'block';
			}

			function verCuenta() {
				document.getElementById("usua").style.display = 'none';
				document.getElementById("FormVer").style.display = 'none';
				document.getElementById("CuentaVer").style.display = 'block';
			}
		</script>