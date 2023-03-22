<%@ page contentType="text/html; charset=UTF-8" %>
<div class="container-fluid">
    <div class="row flex-nowrap">
        <div class="col-auto col-md-3 col-xl-2 px-sm-2 px-0 bg-dark">
            <div class="d-flex flex-column align-items-center align-items-sm-start px-3 pt-2 text-white min-vh-100">
                <a href="#" class="d-flex align-items-center pb-3 mb-md-0 me-md-auto text-white text-decoration-none">
                    <span class="fs-5 d-none d-sm-inline">Menu</span>
                </a>
                <ul class="nav nav-pills flex-column mb-sm-auto mb-0 align-items-center align-items-sm-start" id="menu">
                    <li>
                        <a href="#" class="nav-link px-0 align-middle" onclick="verUsuario();">
                            <i class="fs-4 bi-table"></i> <span class="ms-1 d-none d-sm-inline">Usuarios</span></a>
                    </li>
                    <li>
                        <a href="#collapseExample" data-bs-toggle="collapse" class="nav-link px-0 align-middle"
                            role="button" aria-expanded="false" aria-controls="collapseExample">
                            <i class="bi bi-person-circle"></i>
                            <span class="ms-1 d-none d-sm-inline">Cuenta</span>
                        </a>
                        <div class="collapse" id="collapseExample">
                            <ul class="show nav flex-column ms-1">
                                <li class="w-100">
                                    <a href="#ver" class="nav-link px-0" onclick="verCuenta();">
                                        <span class="d-none d-sm-inline"> -> Ver Cuenta</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="#editar" class="nav-link px-0"><span class="d-none d-sm-inline"
                                            onclick="EditarCuenta();"> -> Editar
                                            Cuenta</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <li>
                        <a href="#submenu2" data-bs-toggle="collapse" class="nav-link px-0 align-middle"
                            onclick="VerForm();">
                            <i class="fs-4 bi-bootstrap"></i> <span class="ms-1 d-none d-sm-inline">Crear
                                Cuenta</span></a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="col py-3">
            <!-- Ver usuarios -->
            <div id="usua">
                <div class="container-fluid">
                    <h1>Lista de los usuarios</h1>
                    <div class="card" style="width: 18rem;">
                        <div class="card-body">
                            <h5 class="card-title">Descripción</h5>
                            <p class="card-text">introducir información.</p>
                        </div>
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item">Ocupación</li>
                            <li class="list-group-item">Empresa</li>
                            <li class="list-group-item">Equipos</li>
                        </ul>
                        <div class="card-body">
                            <button type="button" class="btn btn-info">Editar</button>
                            <button type="button" class="btn btn-danger">Eliminar</button>
                        </div>
                    </div>

                </div>
            </div>
            <!-- Ver cuentas -->
            <div id="CuentaVer">
                <div class="card w-75 mb-3">
                    <div class="card-body">
                        <img class="rounded float-start"
                            src="https://static.vecteezy.com/system/resources/previews/002/318/271/non_2x/user-profile-icon-free-vector.jpg"
                            alt="" width="15%" height="15%">
                        <h1>Usuario Conectado</h1>
                        <h5 class="card-title">Nombre:</h5>
                        <p class="card-text">Cargo de:</p>
                    </div>
                </div>
            </div>
            <!-- editar cuenta -->
            <div id="CuentaEditar">

                <h1>Prueba de edición</h1>

            </div>
            <!-- Formulario de registro de usuarios -->
            <form method="post" action="/Java/Process/register.jsp" style="padding: 0 30%;" id="FormVer">
                <div class="mb-3">
                    <div class="grid text-center">
                        <div class="img-fluid"><img src="Fichero/IMG/securiTI.png"></div>
                        <h1>Registrar Usuario</h1>
                    </div>
                </div>
                <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">Nombre Completo</label>
                    <input autocomplete="off" required name="name" type="text" class="form-control" id=""
                        aria-describedby="emailHelp">
                </div>
                <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">Usuario</label>
                    <input autocomplete="off" required name="username" type="text" class="form-control" id=""
                        aria-describedby="emailHelp">
                </div>
                <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">Correo</label>
                    <input autocomplete="off" required name="email" type="email" class="form-control" id=""
                        aria-describedby="emailHelp">
                </div>
                <div class="mb-3">
                    <label for="exampleInputPassword1" class="form-label">Password</label>
                    <input required required name="password" type="password" class="form-control"
                        id="exampleInputPassword1">
                </div>
                <div class="mb-3 form-check">
                    <input name="rememberme" type="checkbox" class="form-check-input" id="exampleCheck1">
                </div>
                <button type="submit" class="btn btn-primary">Crear cuenta</button>
            </form>
        </div>
    </div>
</div>
<script type="text/javascript">
    document.getElementById("FormVer").style.display = 'none';
    document.getElementById("usua").style.display = 'block';
    document.getElementById("CuentaVer").style.display = 'none';
    document.getElementById("CuentaEditar").style.display = 'none';
    function VerForm() {
        document.getElementById("FormVer").style.display = 'block';
        document.getElementById("usua").style.display = 'none';
        document.getElementById("CuentaVer").style.display = 'none';
        document.getElementById("CuentaEditar").style.display = 'none';
    }

    function verUsuario() {
        document.getElementById("usua").style.display = 'block';
        document.getElementById("FormVer").style.display = 'none';
        document.getElementById("CuentaVer").style.display = 'none';
        document.getElementById("CuentaEditar").style.display = 'none';
    }

    function verCuenta() {
        document.getElementById("CuentaVer").style.display = 'block';
        document.getElementById("usua").style.display = 'none';
        document.getElementById("FormVer").style.display = 'none';
        document.getElementById("CuentaEditar").style.display = 'none';
    }

    function EditarCuenta() {
        document.getElementById("CuentaEditar").style.display = 'block';
        document.getElementById("usua").style.display = 'none';
        document.getElementById("FormVer").style.display = 'none';
        document.getElementById("CuentaVer").style.display = 'none';
    }
</script>