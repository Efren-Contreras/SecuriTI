<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="Controller/Connections/mysql.jsp" %>
<div class="table-responsive" style="margin-top: 2%; margin-right: 3%; margin-left: 2%; text-align: center;">
    <table class="table">
        <thead style="background: #1D5B70; color: white;">
            <tr>
                <th class="d-flex" scope="col">Empresa</th>
                <th class="d-none d-sm-table-cell" scope="col">Contacto</th>
                <th class="d-none d-sm-table-cell" scope="col">Teléfono</th>
                <th class="d-none d-sm-table-cell" scope="col">Correo</th>
                <th class="d-none d-sm-table-cell" scope="col">Dirección</th>
                <th class="d-flex" scope="col" style="width: 1%;">Acciones</th>
            </tr>
        </thead>
        <tbody>
            <% 
            String sql = "SELECT * FROM companies ORDER BY name ASC"; 
            try { 
                PreparedStatement st=null; 
                ResultSet rs = null; 
                st = conn.prepareStatement(sql); 
                rs = st.executeQuery();
                int counter = 0;
                while (rs.next()) {
                    counter++;
            %>
            <tr>
                <th class="d-flex"><%=rs.getString("name")%></th>
                <td class="d-none d-sm-table-cell"><%=rs.getString("contact")%></td>
                <td class="d-none d-sm-table-cell"><%=rs.getString("numerTel")%></td>
                <td class="d-none d-sm-table-cell"><%=rs.getString("email")%></td>
                <td class="d-none d-sm-table-cell"><%=rs.getString("address")%></td>
                <form method="post">
                    <td class="d-flex">
                        <input name="idCompany" type="hidden" value='<%=rs.getString("idCompany")%>'>
                        <button formaction="dashboard/alterempresa.jsp" 
                        type="submit" class="btn btn-info" data-bs-target="#editar" data-bs-toggle="modal">Editar</button>
                        <button formaction="dashboard.jsp?idpage=dispositivos" 
                        type="submit" class="btn btn-warning ms-1" data-bs-toggle="modal" data-bs-target="#ver">Ver</button>
                        <button type="button" class="btn btn-danger ms-1" data-bs-toggle="modal" data-bs-target="#eliminar<%=counter%>">Eliminar</button>
                    </td>
                    <!--ELiminar-->
                    <div class="modal fade" id="eliminar<%=counter%>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content" style="border: black 2px solid; border-radius: 20px;">
                                <div style="text-align: center;">
                                    <h2>Alerta</h2>
                                </div>
                                <div class="modal-body">
                                    Esta seguro que quiere eliminar la empresa?
                                </div>
                                <div style="display: flex; margin-bottom: 2%; margin-right: 1%;">
                                    <button formaction="dashboard/Controller/Process/deletecompany.jsp" type="submit" class="btn"
                                        style="background-color: #00BE62; width: 50%; border-radius: 30px; margin-left: 10px; margin-right: 10px;"
                                        data-bs-dismiss="modal">Si</button>
                                    <button type="button" class="btn" style="background: #F10018; width: 50%;  border-radius: 30px;"
                                        data-bs-dismiss="modal" aria-label="Close">No</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </tr>
                <% } 
            } catch (Exception e) { %>
            <tr>
                <td style="flex-wrap: wrap;">Error al obtener datos</td>
                <td style="flex-wrap: wrap;"></td>
                <td style="flex-wrap: wrap;"></td>
                <td style="flex-wrap: wrap;"></td>
                <td style="flex-wrap: wrap;"></td>
                <td style="display: flex;">
                    <button type="button" class="btn btn-info">Editar</button>
                    <button type="button" class="btn btn-warning ms-1" data-bs-toggle="modal" data-bs-target="#ver">Ver</button>
                    <button type="button" class="btn btn-danger ms-1" data-bs-toggle="modal" data-bs-target="#eliminar">Eliminar</button>
                </td>
            </tr>
            <% } %>
        </tbody>
    </table>
</div>

<!-- Botón de Agregar -->
<div class="position-fixed bottom-0 end-0">
    <button class="btn" data-bs-toggle="modal" data-bs-target="#agregar" style="border-radius: 100%;">
        <img src="../resources/IMG/add.svg" width="70px">
    </button>
</div>

<!-- Formulario agregar -->
<div class="container-fluid">
    <div class="modal fade" id="agregar" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header" style="background-color: #4893B9;">
                    <h5 class="modal-title text-white">Agregar Empresa</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body" style="background-color: #4893B9;">
                    <form method="post" action="dashboard/Controller/Process/registerCompany.jsp">
                        <div class="mb-3">
                            <label for="name" class="form-label">Empresa</label>
                            <input required type="text" class="form-control" id="name" name="name">
                        </div>
                        <div class="mb-3">
                            <label for="contact" class="form-label">Denominacion</label>
                            <input required type="text" class="form-control" id="contact" name="contact">
                        </div>
                        <div class="mb-3">
                            <label for="telephone" class="form-label">Telefono</label>
                            <!-- Validar Teléfono pendiente -->
                            <input required type="tel" class="form-control" id="telephone" 
                                name="telephone" minlength="10" maxlength="10" pattern="[0-9]{10}">
                        </div>
                        <div class="mb-3">
                            <label for="email" class="form-label">Correo</label>
                            <input required type="email" class="form-control" id="email" name="email">
                        </div>  
                        <div class="mb-3">
                            <label for="address" class="form-label">Dirección</label>
                            <input required type="text" class="form-control" id="address" name="address">
                        </div>
                        <div class="modal-footer" style="background-color: #4893B9;">
                            <button type="submit" class="btn btn-primary">Agregar Empresa</button>
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
  
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
    crossorigin="anonymous"></script>