<%@ page contentType="text/html; charset=UTF-8" %>
<div class="table-responsive" style="margin-top: 2%; margin-right: 3%; margin-left: 2%; text-align: center;">
    <table class="table">
        <thead style="background: #1D5B70; color: white;">
            <tr>
                <th scope="col">Logo</th>
                <th scope="col">Empresa</th>
                <th scope="col">Encargado</th>
                <th scope="col">Telefono</th>
                <th scope="col">Correo</th>
                <th scope="col">Direccion</th>
                <th scope="col" style="width: 1%;">Acciones</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <th style="width: 1%; flex-wrap: wrap;"><img src="../resources/IMG/securiTI.png" alt=""></th>
                <td style="width: 2%; flex-wrap: wrap;">SecuriTI</td>
                <td style="width: 2%; flex-wrap: wrap;">Sergio Uriel Suaste Acosta </td>
                <td style="width: 1%; flex-wrap: wrap;">5545821698</td>
                <td style="width: 0%; flex-wrap: wrap;">sergio26110191@gmail.com</td>
                <td style="width: 3%; flex-wrap: wrap;">Jesus Gonzalez Ortega No.85 Benito Juarez Barron</td>
                <td style="width: 5%; display: flex;">
                    <button type="button" class="btn btn-info" data-bs-target="#editar"
                        data-bs-toggle="modal">Editar</button>
                    <button type="button" class="btn btn-warning" style="margin: 1%;" data-bs-toggle="modal"
                        data-bs-target="#ver">Ver</button>
                    <button type="button" class="btn btn-danger" data-bs-toggle="modal"
                        data-bs-target="#eliminar">Eliminar</button>
                </td>
            </tr>
        </tbody>
    </table>
</div>

<div class="position-absolute bottom-60 end-0">
    <button style="border: none; background: none; margin-right: 20px;" data-bs-toggle="modal"
        data-bs-target="#agregar">
        <img src="../resources/IMG/add.svg" alt="Imagen del botón" style="max-width: 20%; max-height: 20%;">
    </button>
</div>



<!-- Formulario agregar -->
<div class="container-fluid">
    <div class="modal fade" id="agregar" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header" style="background-color: #4893B9;">
                    <h5>Agregar Empresa</h5>
                </div>
                <div class="modal-body" style="background-color: #4893B9;">
                    <form>
                        <div class="mb-3">
                            <label for="nombre" class="form-label">Logo</label>
                            <input type="file" class="form-control" id="" name="">
                        </div>
                        <div class="mb-3">
                            <label for="correo" class="form-label">Empresa</label>
                            <input type="text" class="form-control" id="" name="">
                        </div>
                        <div class="mb-3">
                            <label for="correo" class="form-label">Denominacion</label>
                            <input type="text" class="form-control" id="" name="">
                        </div>
                        <div class="mb-3">
                            <label for="correo" class="form-label">Telefono</label>
                            <input type="tel" class="form-control" id="" name="" minlength="10" maxlength="10">
                        </div>
                        <div class="mb-3">
                            <label for="correo" class="form-label">Correo</label>
                            <input type="email" class="form-control" id="" name="">
                        </div>
                        <div class="mb-3">
                            <label for="mensaje" class="form-label">Dirección</label>
                            <input type="text" class="form-control" id="" name="">
                        </div>
                        <div class="" style="background-color: #4893B9;">
                            <button type="submit" class="btn btn-lg"
                                style="margin: 3%; margin-left: 35%; background-color: #C9CBC8; color: black;" >Agregar
                                Empresa</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Formulario editar -->
    <div class="container-fluid">

        <div class="modal fade" id="editar" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header" style="background-color: #4893B9;">
                        <h5>Editar Empresa</h5>
                    </div>
                    <div class="modal-body" style="background-color: #4893B9;">
                        <form style="color: black;">
                            <div class="mb-3">
                                <label for="nombre" class="form-label">Cambiar Logo</label>
                                <input type="file" class="form-control" id="" name="">
                            </div>
                            <div class="mb-3">
                                <label for="correo" class="form-label">Cambiar Nombre de la Empresa</label>
                                <input type="text" class="form-control" id="" name="">
                            </div>
                            <div class="mb-3">
                                <label for="correo" class="form-label">Cambiar Denominacion</label>
                                <input type="text" class="form-control" id="" name="">
                            </div>
                            <div class="mb-3">
                                <label for="correo" class="form-label">Cambiar Numero de Telefono</label>
                                <input type="tel" class="form-control" id="" name="" minlength="10" maxlength="10">
                            </div>
                            <div class="mb-3">
                                <label for="correo" class="form-label">Cambiar Correo</label>
                                <input type="email" class="form-control" id="" name="">
                            </div>
                            <div class="mb-3">
                                <label for="mensaje" class="form-label">Cambiar Direccion</label>
                                <input type="text" class="form-control" id="" name="">
                            </div>
                        </form>
                    </div>
                    <div class="" style="background-color: #4893B9;">
                        <button type="submit" class="btn btn-lg"
                            style="background-color: #C9CBC8; color: black; margin: 3%; margin-left: 35%;">Editar
                            Empresa</button>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <!--ELiminar-->

    <div class="modal fade" id="eliminar" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content" style="border: black 2px solid; border-radius: 20px;">
                <div style="text-align: center;">
                    <h2>Alerta</h2>
                </div>
                <div class="modal-body">
                    Esta seguro que quiere eliminar la empresa?
                </div>
                <div style="display: flex; margin-bottom: 2%; margin-right: 1%;">
                    <button type="button" class="btn"
                        style="background-color: #00BE62; width: 50%;  border-radius: 30px; margin-left: 10px; margin-right: 10px;"
                        data-bs-dismiss="modal">Si</button>
                    <button type="button" class="btn" style="background: #F10018; width: 50%;  border-radius: 30px;"
                        data-bs-dismiss="modal" aria-label="Close">No</button>
                </div>
            </div>
        </div>
    </div>
</div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>