<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="Controller/Connections/mysql.jsp" %>
<% 
	Object userlevel = session.getAttribute("userlevel");
	if (userlevel.equals("admin") || userlevel.equals("root") ){
		String idusuario = request.getParameter("iduser");
%>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar Usuario</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>

<body style="background-image: linear-gradient(to bottom, #5faaf2, #55afef, #4fb4ea, #4fb8e5, #53bbdf);">
    <div class="container-fluid">
        <div class="card" style="padding-left: 10%; padding-right: 10%; width: 55%; margin-left: 25%; margin-top: 2%; background-image: linear-gradient(to right bottom, #5faaf2, #6db3e7, #82badb, #9bc0d1, #b5c4c9);">
            <div class="mx-auto">
                <img src="../resources/IMG/securiTI.png">
            </div>
            <div class="card-title mx-auto">
                <h3>Editar información del usuario</h3>
            </div>
            <%
                String sql = "SELECT * FROM users WHERE idUser="+idusuario;
                try {
                    PreparedStatement st = null;
                    ResultSet rs = null;
                    st = conn.prepareStatement(sql);
                    rs = st.executeQuery();
                    while (rs.next()) {
            %>
            <div class="mb-3">
                <label for="nombre" class="form-label">Nombre</label>
                <div style="display: flex;">
                    <input disabled type="text" class="form-control" id="nombre" 
                    style="height: 2.0%;" value='<%=rs.getString("name")%>'>
                    <button type="button" style="margin-left: 2%;" class="h4 btn btn-info" data-bs-toggle="modal"
                        data-bs-target="#modalname">Editar</button>
                </div>
            </div>
            <div class="mb-3">
                <label for="correo" class="form-label">Username</label>
                <div style="display: flex; width: 88%;">
                    <input disabled type="username" class="form-control" id="username" 
                        style="height: 2.0%;" value='<%=rs.getString("username")%>'>
                </div>
            </div>
            <div class="mb-3">
                <label for="mensaje" class="form-label">Correo</label>
                <div style="display: flex;">
                    <input disabled type="email" class="form-control" id="correo" 
                    style="height: 2.0%;" value='<%=rs.getString("email")%>'>
                    <button type="button" style="margin-left: 2%;" class="h4 btn btn-info" data-bs-toggle="modal"
                        data-bs-target="#modalcorreo">Editar</button>
                </div>
            </div>
            <div class="mb-3">
                <label for="mensaje" class="form-label">Contraseña</label>
                <div style="display: flex;">
                    <input disabled type="button" class="form-control" id="password"
                        style="height: 2.0%;">
                    <button type="button" style="margin-left: 2%;" class="h4 btn btn-info" data-bs-toggle="modal"
                        data-bs-target="#modalcontraseña">Editar</button>
                </div>
            </div>
            <div class="mb-3">
                <label for="mensaje" class="form-label">Nivel de Acceso</label>
                <div style="display: flex;">
                    <input disabled type="button" class="form-control" id="userlevel" 
                    style="height: 2.0%;" value="<%=rs.getString("userlevel")%>">
                    <button type="button" style="margin-left: 2%;" class="h4 btn btn-info" data-bs-toggle="modal"
                        data-bs-target="#modalacceso">Editar</button>
                </div>
            </div>
            <div class="mb-3">
                <a href="../../../dashboard.jsp?idpage=cuentas#users" class="btn btn-secondary">Volver</a>
            </div>
            <%
                    }
                } catch (Exception e) {
                    out.print(e);
                    out.print("<br>"+sql);
                }
            %>
        </div>
    </div>

    <!-- Modal de nombre -->
    <div class="container-fluid">
        <div class="modal fade" id="modalname" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <!-- Formulario -->
                        <form action="Controller/Process/edituser.jsp?formtype=name" method="post">
                            <input type="hidden"  class="form-control" id="idusuario" name="idusuario" value="<%=idusuario%>">
                            <div class="mb-3">
                                <label for="nombre" class="form-label">Nombre Nuevo</label>
                                <input required  autocomplete="off" type="text" class="form-control" id="name" name="name">
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


    <!-- Modal de Username -->
    <div class="container-fluid">

        <div class="modal fade" id="modalusername" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <!-- Formulario -->
                        <form action="Controller/Process/edituser.jsp?formtype=username" method="post">
                            <input type="hidden" class="form-control" id="idusuario" name="idusuario" value="<%=idusuario%>">
                            <div class="mb-3">
                                <label for="" class="form-label">Username Nuevo</label>
                                <input required  autocomplete="off" type="text" class="form-control" id="username" name="username">
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


    <!-- Modal de Correo -->
    <div class="container-fluid">

        <div class="modal fade" id="modalcorreo" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <!-- Formulario -->
                        <form action="Controller/Process/edituser.jsp?formtype=email" method="post">
                            <input type="hidden" class="form-control" id="idusuario" name="idusuario" value="<%=idusuario%>">
                            <div class="mb-3">
                                <label for="" class="form-label">Correo Nuevo</label>
                                <input required autocomplete="off" type="email" class="form-control" id="inputEmail" name="email">
                            </div>
                            <div class="modal-footer">
                                <button type="submit" class="btn btn-primary" id="btnEnviar">Enviar</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal de Contraseña -->
    <div class="container-fluid">

        <div class="modal fade" id="modalcontraseña" tabindex="-1" aria-labelledby="exampleModalLabel"
            aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <!-- Formulario -->
                        <form action="Controller/Process/edituser.jsp?formtype=password" method="post">
                            <input type="hidden" class="form-control" id="idusuario" name="idusuario" value="<%=idusuario%>">
                            <div class="mb-3">
                                <label for="" class="form-label">Contraseña Nueva</label>
                                <input required autocomplete="off" type="password" class="form-control" id="newpassword" name="newpassword">
                            </div>
                            <div class="mb-3">
                                <label for="" class="form-label">Repita Contraseña</label>
                                <input required autocomplete="off" type="password" class="form-control" id="newpassword2" name="newpassword2" onkeyup="inab()">
                            </div>
                            <div class="alert alert-danger" role="alert" id="alertano">
                                Las contraseñas no coinciden
                            </div>
                            <div class="alert alert-success" role="alert" id="alertasi">
                                Las contraseñas coinciden
                            </div>
                            <div class="modal-footer">
                                <button type="submit" class="btn btn-primary" onclick="igualdad()" id="desb">Enviar</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <!-- Modal de nivel de acceso -->
    <div class="container-fluid">
        <div class="modal fade" id="modalacceso" tabindex="-1" aria-labelledby="exampleModalLabel"
            aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <!-- Formulario -->
                        <form action="Controller/Process/edituser.jsp?formtype=userlevel" method="post">
                            <input type="hidden" class="form-control" id="idusuario" name="idusuario" value="<%=idusuario%>">
                            <div class="mb-3">
                                <label for="mensaje" class="form-label">Nivel de Acceso</label>
                                <select class="form-select" aria-label="Default select example" name="userlevel">
                                    <option selected hidden disabled>Elegir un nivel de acceso</option>
                                    <option value="default">Usuario</option>
                                    <option value="admin">Administrador</option>
                                </select>
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
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
		integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
		crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"
		integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN4zfuZxLkoj1gXtW8ANNCe9d5Y3eG5eD"
		crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" 
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" 
		crossorigin="anonymous"></script>
</body>


<script>

document.getElementById('inputEmail').addEventListener('input', validarEmail);
document.getElementById("alertano").style.display = 'none';
document.getElementById("alertasi").style.display = 'none';

function validarEmail() {
    var inputEmail = document.getElementById('inputEmail');
    const btnEditar = document.getElementById('btnEnviar');
    if (inputEmail.checkValidity()) {
        btnEnviar.removeAttribute('disabled'); // Habilita el botón de envío
    } else {
        btnEnviar.setAttribute('disabled', 'disabled'); // Deshabilita el botón de envío
    }
}

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
   } else{
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

</html>

<%
	}
	else {
        response.sendRedirect("../dashboard.jsp");
	}
%>