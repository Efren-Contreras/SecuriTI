<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="Controller/Connections/mysql.jsp" %>
<% 
  Object userlevel = session.getAttribute("userlevel");
  if (userlevel.equals("admin") || userlevel.equals("root") ) {
    String idCompany = request.getParameter("idCompany");
%>
<html lang="es">
  <head>
    <meta charset="UTF-8">
    <title>Modificar información de la Empresa</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
  </head>
  <body style="background-image: linear-gradient(to bottom, #5faaf2, #6db3e7, #82badb, #9bc0d1, #b5c4c9);">
    <div class="container-fluid">
      <div class="card mx-auto" style="width: 40%; margin-top: 3%; border-radius: 16px; background-image: linear-gradient(to right bottom, #5faaf2, #6db3e7, #82badb, #9bc0d1, #b5c4c9);">
        <img class="mx-auto" src="../resources/IMG/securiTI.png" width="40%"> 
        <div class="card-header">
          <h5>Cambiar información de la Empresa</h5>
        </div>
        <%
          String sql = "SELECT * FROM companies WHERE idCompany="+idCompany;
          try {
              PreparedStatement st = null;
              ResultSet rs = null;
              st = conn.prepareStatement(sql);
              rs = st.executeQuery();
              while (rs.next()) {
        %>
        <div class="card-body">
          <div class="mx-auto">
            <div class="mb-3">
              <label for="" class="form-label">Nombre de la Empresa</label>
              <div class="input-group">
                <input disabled type="text" class="form-control" id="" value='<%=rs.getString("name")%>'>
                <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                data-bs-target="#modalempresa">Editar</button>
              </div>
            </div>
            <div class="mb-3">
              <label for="" class="form-label">Contacto</label>
              <div class="input-group">
                <input disabled type="text" class="form-control" id="" value='<%=rs.getString("contact")%>'>
                <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                data-bs-target="#modalContacto">Editar</button>
              </div>
            </div>
            <div class="mb-3">
              <label for="" class="form-label">Teléfono</label>
              <div class="input-group">
                <input disabled type="tel" class="form-control" id="" minlength="10" maxlength="10" value='<%=rs.getString("numertel")%>'>
                <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                data-bs-target="#modalTelefono">Editar</button>
              </div>
            </div>
            <div class="mb-3">
              <label for="" class="form-label">Correo</label>
              <div class="input-group">
                <input disabled type="email" class="form-control" id="" value='<%=rs.getString("email")%>'>
                <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                data-bs-target="#modalCorreo">Editar</button>
              </div>
            </div>
            <div class="mb-3">
              <label for="" class="form-label">Dirección</label>
              <div class="input-group">
                <input disabled type="text" class="form-control" id="" value='<%=rs.getString("address")%>'>
                <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                data-bs-target="#modalDireccion">Editar</button>
              </div>
            </div>
            <a href="../../../dashboard.jsp" class="btn btn-secondary float-end">Volver a la página anterior</a>
          </div>
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
    <!-- Modal de Nombre de la empresa -->
    <div class="container-fluid">
      <div class="modal fade" id="modalempresa" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog">
              <div class="modal-content">
                  <div class="modal-header">
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <div class="modal-body">
                      <!-- Formulario -->
                      <form action="Controller/Process/editcompany.jsp?formtype=name" method="post" id="myForm1">
                          <input type="hidden" class="form-control" id="idCompany" name="idCompany" value='<%=idCompany%>'>
                          <div class="mb-3">
                              <label for="" class="form-label">Nombre de la empresa</label>
                              <input disabled required type="text" class="form-control" id="show" name="name">
                          </div>
                          <div class="form-check mb-3">
                            <input class="form-check-input" type="checkbox" id="agreeCheckbox">
                            <label class="form-check-label" for="agreeCheckbox">Estoy de acuerdo con modificar el siguiente campo</label>
                          </div>
                          <div class="modal-footer">
                              <button disabled type="submit" class="btn btn-primary">Enviar</button>
                          </div>
                      </form>
                  </div>
              </div>
          </div>
      </div>
    </div>


    <!-- Modal de Contacto -->
    <div class="container-fluid">

      <div class="modal fade" id="modalContacto" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog">
              <div class="modal-content">
                  <div class="modal-header">
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <div class="modal-body">
                      <!-- Formulario -->
                      <form action="Controller/Process/editcompany.jsp?formtype=contact" method="post" id="myForm1">
                          <input type="hidden" class="form-control" id="idCompany" name="idCompany" value='<%=idCompany%>'>
                          <div class="mb-3">
                              <label for="" class="form-label">Contacto</label>
                              <input disabled required type="text" class="form-control" id="show" name="contact">
                          </div>
                          <div class="form-check mb-3">
                            <input class="form-check-input" type="checkbox" id="agreeCheckbox">
                            <label class="form-check-label" for="agreeCheckbox">Estoy de acuerdo con modificar el siguiente campo</label>
                          </div>
                          <div class="modal-footer">
                              <button disabled type="submit" class="btn btn-primary">Enviar</button>
                          </div>
                      </form>
                  </div>
              </div>
          </div>
      </div>

    </div>

    <!-- Modal de Telefono -->
    <div class="container-fluid">

      <div class="modal fade" id="modalTelefono" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog">
              <div class="modal-content">
                  <div class="modal-header">
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <div class="modal-body">
                      <!-- Formulario -->
                      <form action="Controller/Process/editcompany.jsp?formtype=telephone" method="post" id="myForm1">
                          <input type="hidden" class="form-control" id="idCompany" name="idCompany" value='<%=idCompany%>'>
                          <div class="mb-3">
                              <label for="" class="form-label">Teléfono</label>
                              <input disabled required type="text" class="form-control" id="show" name="tel">
                          </div>
                          <div class="form-check mb-3">
                            <input class="form-check-input" type="checkbox" id="agreeCheckbox">
                            <label class="form-check-label" for="agreeCheckbox">Estoy de acuerdo con modificar el siguiente campo</label>
                          </div>
                          <div class="modal-footer">
                              <button disabled type="submit" class="btn btn-primary">Enviar</button>
                          </div>
                      </form>
                  </div>
              </div>
          </div>
      </div>
    </div>

    <!-- Modal de Correo -->
    <div class="container-fluid">

      <div class="modal fade" id="modalCorreo" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog">
              <div class="modal-content">
                  <div class="modal-header">
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <div class="modal-body">
                      <!-- Formulario -->
                      <form action="Controller/Process/editcompany.jsp?formtype=email" method="post" id="myForm1">
                          <input type="hidden" class="form-control" id="idCompany" name="idCompany" value='<%=idCompany%>'>
                          <div class="mb-3">
                              <label for="" class="form-label">Correo</label>
                              <input disabled required type="email" class="form-control" id="show" name="email">
                          </div>
                          <div class="form-check mb-3">
                            <input class="form-check-input" type="checkbox" id="agreeCheckbox">
                            <label class="form-check-label" for="agreeCheckbox">Estoy de acuerdo con modificar el siguiente campo</label>
                          </div>
                          <div class="modal-footer">
                              <button disabled type="submit" class="btn btn-primary">Enviar</button>
                          </div>
                      </form>
                  </div>
              </div>
          </div>
      </div>
    </div>

    <!-- Modal de Direccion -->
    <div class="container-fluid">

      <div class="modal fade" id="modalDireccion" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog">
              <div class="modal-content">
                  <div class="modal-header">
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <div class="modal-body">
                      <!-- Formulario -->
                      <form action="Controller/Process/editcompany.jsp?formtype=address" method="post" id="myForm1">
                          <input type="hidden" class="form-control" id="idCompany" name="idCompany" value='<%=idCompany%>'>
                          <div class="mb-3">
                              <label for="" class="form-label">Direccion</label>
                              <input disabled required type="text" class="form-control" id="show" name="address">
                          </div>
                          <div class="form-check mb-3">
                            <input class="form-check-input" type="checkbox" id="agreeCheckbox">
                            <label class="form-check-label" for="agreeCheckbox">Estoy de acuerdo con modificar el siguiente campo</label>
                          </div>
                          <div class="modal-footer">
                              <button disabled type="submit" class="btn btn-primary">Enviar</button>
                          </div>
                      </form>
                  </div>
              </div>
          </div>
      </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous">
    </script>

    <script>
      // Obtener todos los formularios con el mismo ID
      var forms = document.querySelectorAll('#myForm1');
      
      // Iterar sobre cada formulario
      forms.forEach(function(form) {
        // Obtener los elementos del formulario por su nombre
        var nameInput = form.querySelector('[id="show"]');
        var agreeCheckbox = form.querySelector('#agreeCheckbox');
        var submitButton = form.querySelector('[type="submit"]');
      
        // Habilitar o deshabilitar el campo de entrada y el botón de envío según el estado del checkbox
        agreeCheckbox.addEventListener('change', function() {
          if (agreeCheckbox.checked) {
            nameInput.disabled = false;
            submitButton.disabled = false;
          } else {
            nameInput.disabled = true;
            submitButton.disabled = true;
          }
        });
      });
    </script>
  </body>
</html>
<%
	}
	else {
        response.sendRedirect("../dashboard.jsp");
	}
%>