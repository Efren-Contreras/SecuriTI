<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="Controller/Connections/mysql.jsp" %>
<%
  String idCompany = request.getParameter("idCompany");
  String nameCompany = request.getParameter("nameCompany");
%>
<div class="container-fluid overflow-auto" id="barra">
  <div class="row flex-nowrap">
		<!-- Panel Izquierdo -->
    <div class="col-auto col-md-3 col-xl-2 px-sm-2 px-0 bg-dark">
      <div class="d-flex flex-column align-items-center align-items-sm-start px-3 pt-2 text-white min-vh-100">
        <span class="fs-5 d-none d-sm-inline fs-3 text-uppercase"><%=nameCompany%></span>
        <ul class="nav nav-pills flex-column mb-sm-auto mb-0 align-items-center align-items-sm-start" id="menu">
          <li class="nav-item">
            <a href="#workstation" class="nav-link align-middle px-0 text-white">
              <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-pc-display" viewBox="0 0 16 16">
                <path d="M8 1a1 1 0 0 1 1-1h6a1 1 0 0 1 1 1v14a1 1 0 0 1-1 1H9a1 1 0 0 1-1-1V1Zm1 13.5a.5.5 0 1 0 1 0 .5.5 0 0 0-1 0Zm2 0a.5.5 0 1 0 1 0 .5.5 0 0 0-1 0ZM9.5 1a.5.5 0 0 0 0 1h5a.5.5 0 0 0 0-1h-5ZM9 3.5a.5.5 0 0 0 .5.5h5a.5.5 0 0 0 0-1h-5a.5.5 0 0 0-.5.5ZM1.5 2A1.5 1.5 0 0 0 0 3.5v7A1.5 1.5 0 0 0 1.5 12H6v2h-.5a.5.5 0 0 0 0 1H7v-4H1.5a.5.5 0 0 1-.5-.5v-7a.5.5 0 0 1 .5-.5H7V2H1.5Z" />
              </svg>
              <span class="ms-1 d-none d-sm-inline">WorkStation</span>
            </a>
          </li>
          <li>
            <a href="#server" class="nav-link px-0 align-middle text-white">
              <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-server" viewBox="0 0 16 16">
                <path d="M1.333 2.667C1.333 1.194 4.318 0 8 0s6.667 1.194 6.667 2.667V4c0 1.473-2.985 2.667-6.667 2.667S1.333 5.473 1.333 4V2.667z" />
                <path d="M1.333 6.334v3C1.333 10.805 4.318 12 8 12s6.667-1.194 6.667-2.667V6.334a6.51 6.51 0 0 1-1.458.79C11.81 7.684 9.967 8 8 8c-1.966 0-3.809-.317-5.208-.876a6.508 6.508 0 0 1-1.458-.79z" />
                <path d="M14.667 11.668a6.51 6.51 0 0 1-1.458.789c-1.4.56-3.242.876-5.21.876-1.966 0-3.809-.316-5.208-.876a6.51 6.51 0 0 1-1.458-.79v1.666C1.333 14.806 4.318 16 8 16s6.667-1.194 6.667-2.667v-1.665z" />
              </svg>
              <span class="ms-1 d-none d-sm-inline">Servidor</span>
            </a>
          </li>
        </ul>
      </div>
    </div>
    <div class="col py-3">

      <div id="workstation">
        <!--bototes de filtros-->
        <nav class="navbar navbar-expand-md navbar-light bg-light" id="filtros">
          <div class="container-fluid">
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
              <div class="d-flex align-items-center">
                <div class="input-group me-2">
                  <input type="text" class="form-control" placeholder="Nombre del equipo" id="filName">
                </div>
                <div class="input-group me-2">
                  <input type="text" class="form-control" placeholder="Responsable" id="filName1">
                </div>
                <div class="input-group me-2">
                  <input type="text" class="form-control" placeholder="Fabricante" id="filName2">
                </div>
                <div class="input-group me-2">
                  <input type="text" class="form-control" placeholder="Modelo" id="filName3">
                </div>
              </div>
            </div>
          </div>
        </nav>
        <!--Tabla de dispositivos-->
        <div class="container-fluid" id="tdisp">
          <h1>WorkStation Registrados</h1>
          <div class="table-responsive" style="margin-top: 2%; text-align: center;">
            <table class="table" id="tabla">
              <thead style="background-color: #3C99D2; color: white;">
                <tr>
                  <th class="d-none d-sm-table-cell" scope="col">Dispositivo</th>
                  <th class="col" scope="col">Nombre</th>
                  <th class="d-none d-sm-table-cell" scope="col">Responsable</th>
                  <th class="d-none d-sm-table-cell" scope="col">Fabricante</th>
                  <th class="d-none d-sm-table-cell" scope="col">Modelo</th>
                  <th class="d-none d-sm-table-cell" scope="col">Serial</th>
                  <th class="d-none d-sm-table-cell" scope="col">S. O.</th>
                  <th class="d-none d-sm-table-cell" scope="col">MAC</th>
                  <th class="d-none d-sm-table-cell" scope="col">RAM</th>
                  <th class="d-none d-sm-table-cell" scope="col">Almacenamiento</th>
                  <th class="col-3" scope="col">Acciones</th>
                </tr>
              </thead>
              <tbody class="fw-bold" style="background: #B5C4C9;" id="busquedaWs">        
                <% 
                String sql = "SELECT * FROM workstations WHERE idCompany = ? ORDER BY dateReg"; 
                try { 
                  PreparedStatement st = null; 
                  ResultSet rs = null;
                  st = conn.prepareStatement(sql); 
                  st.setString(1, idCompany);
                  rs = st.executeQuery();
                  int counter = 0;
                  while (rs.next()) {
                      counter++;
                %>
                <tr>
                  <td class="d-none d-sm-table-cell"><b><%=counter%></b></td>
                  <td class="col" scope="col"><b><%=rs.getString("name")%></b></td>
                  <td class="d-none d-sm-table-cell"><%=rs.getString("assignedOfWorkStation")%></td>
                  <td class="d-none d-sm-table-cell"><%=rs.getString("manufacturer")%></td>
                  <td class="d-none d-sm-table-cell"><%=rs.getString("model")%></td>
                  <td class="d-none d-sm-table-cell"><%=rs.getString("serial")%></td>
                  <td class="d-none d-sm-table-cell"><%=rs.getString("so")%></td>
                  <td class="d-none d-sm-table-cell"><%=rs.getString("macAddress")%></td>
                  <td class="d-none d-sm-table-cell"><%=rs.getString("ram")%>GB</td>
                  <td class="d-none d-sm-table-cell"><%=rs.getString("storage")%>GB <%=rs.getString("typeStorage")%></td>
                  <form method="post">
                    <td class="col-3">
                      <input name="idDevice" type="hidden" value='<%=rs.getString("idWorkstations")%>'>
                      <input name="idCompany" type="hidden" value='<%=rs.getString("idCompany")%>'>
                      <input name="nameCompany" type="hidden" value='<%=nameCompany%>'>
                      <button formaction="dashboard/alterdispositivo.jsp?deviceType=WorkStation" type="submit" class="btn btn-info" 
                      data-bs-target="" data-bs-toggle="modal">Editar</button>
                      <button formaction="dashboard/verInfoDev.jsp?deviceType=WorkStation" type="submit" class="btn btn-warning ms-1" 
                      data-bs-toggle="modal" data-bs-target="#">Ver</button>
                      <% if (userlevel.equals("root") || userlevel.equals("admin") ){ %>
                      <button type="button" class="btn btn-danger ms-1" data-bs-toggle="modal" 
                      data-bs-target="#eliminarWS<%=counter%>">Eliminar</button>
                      <% } %>	
                    </td>
                    <!--Eliminar Dispositivo-->
                    <div class="modal fade" id="eliminarWS<%=counter%>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                      <div class="modal-dialog">
                        <div class="modal-content" style="border: black 2px solid; border-radius: 20px;">
                          <div style="text-align: center;">
                            <h2>Alerta</h2>
                          </div>
                          <div class="modal-body"> Esta seguro que quiere eliminar este dispositivo? </div>
                          <div style="display: flex; margin-bottom: 2%; margin-right: 1%;">
                            <button formaction="dashboard/Controller/Process/deletedevice.jsp?deleteType=WorkStation" type="submit" class="btn" style="background-color: #00BE62; width: 50%;  border-radius: 30px; margin-left: 10px; margin-right: 10px;" data-bs-dismiss="modal">Si</button>
                            <button type="button" class="btn" style="background: #F10018; width: 50%;  border-radius: 30px;" data-bs-dismiss="modal" aria-label="Close">No</button>
                          </div>
                        </div>
                      </div>
                    </div>
                  </form>
                </tr>
                <% } } catch (Exception e) { %>
                <tr>
                  <td class="col" scope="col">Error Obteniendo los datos</td>
                  <td class="d-none d-sm-table-cell"></td>
                  <td class="d-none d-sm-table-cell"></td>
                  <td class="d-none d-sm-table-cell"></td>
                  <td class="d-none d-sm-table-cell"></td>
                  <td class="d-none d-sm-table-cell"></td>
                  <td class="d-none d-sm-table-cell"></td>
                  <td class="d-none d-sm-table-cell"></td>
                  <td class="d-none d-sm-table-cell"></td>
                  <td class="d-none d-sm-table-cell"></td>
                </tr>
                <% } %>
              </tbody>
            </table>
          </div>
        </div>
      </div>

      <div id="server">
        <!--bototes de filtros de servidores -->
        <nav class="navbar navbar-expand-md navbar-light bg-light" id="filtros2">
          <div class="container-fluid">
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
              <div class="d-flex align-items-center">
                <div class="input-group me-2">
                  <input type="text" class="form-control" placeholder="Nombre del equipo" id="filName12">
                </div>
                <div class="input-group me-2">
                  <input type="text" class="form-control" placeholder="Tipo de Uso" id="filName11">
                </div>
                <div class="input-group me-2">
                  <input type="text" class="form-control" placeholder="Fabricante" id="filName22">
                </div>
                <div class="input-group me-2">
                  <input type="text" class="form-control" placeholder="Modelo" id="filName32">
                </div>
              </div>
            </div>
          </div>
        </nav>
        <!--Tabla de Servidores-->
        <div id="Servidores">
          <div class="container-fluid">
            <h1>Servidores Registrados</h1>
            <div class="table-responsive" style="margin-top: 2%; text-align: center;">
              <table class="table" id="tabla2">
                <thead style="background-color: #3C99D2; color: white;">
                  <tr>
                    <th class="d-none d-sm-table-cell" scope="col">Dispositivo</th>
                    <th class="col-sm" scope="col" scope="col">Nombre</th>
                    <th class="d-none d-sm-table-cell" scope="col">Tipo de uso</th>
                    <th class="d-none d-sm-table-cell" scope="col">Fabricante</th>
                    <th class="d-none d-sm-table-cell" scope="col">Modelo</th>
                    <th class="d-none d-sm-table-cell" scope="col">Serial</th>
                    <th class="d-none d-sm-table-cell" scope="col">S. O.</th>
                    <th class="d-none d-sm-table-cell" scope="col">Mac</th>
                    <th class="d-none d-sm-table-cell" scope="col">Ram</th>
                    <th class="d-none d-sm-table-cell" scope="col">Almacenamiento</th>
                    <th class="col-3" scope="col" scope="col" style="width: 1%;">Acciones</th>
                  </tr>
                </thead>
                <tbody class="fw-bold" style="background: #B5C4C9;">                
                  <% 
                  sql = "SELECT * FROM servers WHERE idCompany = "+idCompany+" ORDER BY dateReg"; 
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
                    <td class="d-none d-sm-table-cell"><b><%=counter%></b></td>
                    <td class="col-sm" scope="col"><b><%=rs.getString("name")%></b></td>
                    <td class="d-none d-sm-table-cell"><%=rs.getString("usedFor")%></td>
                    <td class="d-none d-sm-table-cell"><%=rs.getString("manufacturer")%></td>
                    <td class="d-none d-sm-table-cell"><%=rs.getString("model")%></td>
                    <td class="d-none d-sm-table-cell"><%=rs.getString("serial")%></td>
                    <td class="d-none d-sm-table-cell"><%=rs.getString("so")%></td>
                    <td class="d-none d-sm-table-cell"><%=rs.getString("macAddress")%></td>
                    <td class="d-none d-sm-table-cell"><%=rs.getString("ram")%>GB</td>
                    <td class="d-none d-sm-table-cell"><%=rs.getString("storage")%>GB <%=rs.getString("typeStorage")%></td>
                    <form method="post">
                      <td class="col-3" scope="col">
                        <input name="idDevice" type="hidden" value='<%=rs.getString("idServer")%>'>
                        <input name="idCompany" type="hidden" value='<%=rs.getString("idCompany")%>'>
                        <input name="nameCompany" type="hidden" value='<%=nameCompany%>'>
                        <button formaction="dashboard/alterdispositivo.jsp?deviceType=Server" type="submit" class="btn btn-info" 
                        data-bs-target="" data-bs-toggle="modal">Editar</button>
                        <button formaction="dashboard/verInfoDev.jsp?deviceType=Server" type="submit" class="btn btn-warning ms-1" 
                        data-bs-toggle="modal" data-bs-target="#">Ver</button>
                        <% if (userlevel.equals("root") || userlevel.equals("admin") ){ %>
                        <button type="button" class="btn btn-danger ms-1" data-bs-toggle="modal" 
                        data-bs-target="#eliminarServ<%=counter%>">Eliminar</button>
                        <% } %>	
                      </td>
                        <!--ELiminar Server-->
                        <div class="modal fade" id="eliminarServ<%=counter%>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                          <div class="modal-dialog">
                            <div class="modal-content" style="border: black 2px solid; border-radius: 20px;">
                              <div style="text-align: center;">
                                <h2>Alerta</h2>
                              </div>
                              <div class="modal-body"> Esta seguro que quiere eliminar este Servidor? </div>
                              <div style="display: flex; margin-bottom: 2%; margin-right: 1%;">
                                <button formaction="dashboard/Controller/Process/deletedevice.jsp?deleteType=Server" type="submit" class="btn" style="background-color: #00BE62; width: 50%;  border-radius: 30px; margin-left: 10px; margin-right: 10px;" data-bs-dismiss="modal">Si</button>
                                <button type="button" class="btn" style="background: #F10018; width: 50%;  border-radius: 30px;" data-bs-dismiss="modal" aria-label="Close">No</button>
                              </div>
                            </div>
                          </div>
                        </div>
                    </form>
                    <% } } catch (Exception e) { %>
                    <tr>
                      <td class="col" scope="col">Error Obteniendo los datos</td>
                      <td class="d-none d-sm-table-cell"></td>
                      <td class="d-none d-sm-table-cell"></td>
                      <td class="d-none d-sm-table-cell"></td>
                      <td class="d-none d-sm-table-cell"></td>
                      <td class="d-none d-sm-table-cell"></td>
                      <td class="d-none d-sm-table-cell"></td>
                      <td class="d-none d-sm-table-cell"></td>
                      <td class="d-none d-sm-table-cell"></td>
                      <td class="d-none d-sm-table-cell"></td>
                    </tr>
                    <% } %>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>

<% if (userlevel.equals("root") || userlevel.equals("admin") ){ %>
      <div id="workstation" class="position-fixed bottom-0 end-0">
        <button class="btn" data-bs-toggle="modal" data-bs-target="#agregarWS" style="border-radius: 50px;" id="botonDisp">
          <svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" fill="currentColor" class="bi bi-plus-circle" viewBox="0 0 16 16">
            <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
            <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z" />
          </svg>
        </button>
      </div>
      <div id="server" class="position-fixed bottom-0 end-0">
        <button class="btn" data-bs-toggle="modal" data-bs-target="#agregarServ" style="border-radius: 50px;">
          <svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" fill="currentColor" class="bi bi-plus-circle" viewBox="0 0 16 16">
            <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
            <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z" />
          </svg>
        </button>
      </div>
<% } %>	

      <!-- Modal Agregar WorkStation-->
      <div class="modal fade" id="agregarWS" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content" style="background-image: linear-gradient(to left top, #5faaf2, #55afef, #4fb4ea, #4fb8e5, #53bbdf);">
            <div class="modal-header">
              <h1 class="modal-title fs-5" id="exampleModalLabel">Agregar Dispositivo</h1>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
              <form method="post" action="dashboard/Controller/Process/registerDevice.jsp?deviceType=Workstation">
                <input name="idCompany" type="hidden" value='<%=idCompany%>'>
                <input name="nameCompany" type="hidden" value='<%=nameCompany%>'>
                <div class="row">
                  <div class="col-md-6">
                    <div class="mb-3">
                      <label for="nombreEquipo" class="form-label">Nombre del equipo</label>
                      <input type="text" class="form-control" id="nombreEquipo" name="name" required>
                    </div>
                    <div class="mb-3">
                      <label for="responsable" class="form-label">Responsable</label>
                      <input type="text" class="form-control" id="responsable" name="assignedOfWorkStation" required>
                    </div>
                    <div class="mb-3">
                      <label for="fabricante" class="form-label">Fabricante</label>
                      <input type="text" class="form-control" id="fabricante" name="manufacturer" required>
                    </div>
                    <div class="mb-3">
                      <label for="fabricante" class="form-label">Modelo</label>
                      <input type="text" class="form-control" id="model" name="model" required>
                    </div>
                    <div class="mb-3">
                      <label for="sistemaOperativo" class="form-label">Sistema Operativo</label>
                      <input type="text" class="form-control" id="sistemaOperativo" name="so" required>
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="mb-3">
                      <label for="serial" class="form-label">Serial</label>
                      <input type="text" class="form-control" id="serial" name="serial" required>
                    </div>
                    <div class="mb-3">
                      <label for="macAddress" class="form-label">Mac Address</label>
                      <input type="text" class="form-control" id="macAddress" name="macAddress" placeholder="00:1e:c2:9e:28:6b" minlength="17"  required>
                    </div>
                    <div class="mb-3">
                      <label for="ram" class="form-label">Memoria RAM</label>
                      <div class="input-group">
                        <input type="number" class="form-control" id="ram" name="ram">
                        <span class="input-group-text">GB</span>
                      </div>
                    </div>
                    <div class="mb-3">
                      <label for="almacenamiento" class="form-label">Almacenamiento</label>
                      <div class="input-group">
                        <input required type="number" class="form-control" id="almacenamiento" placeholder="GB" name="storage">
                        <select class="form-select" id="tipo-almacenamiento" name="typeStorage" required>
                          <option selected disabled value="">Tipo de almacenamiento</option>
                          <option value="SSD">SSD</option>
                          <option value="HDD">HDD</option>
                        </select>
                      </div>
                    </div>
                  </div>
                  <div class="mb-3">
                    <label for="observaciones" class="form-label">Observaciones</label>
                    <textarea class="form-control" id="observaciones" name="observations" rows="4"></textarea>
                  </div>
                  <div class="text-center">
                    <button type="submit" class="btn btn-primary">Enviar</button>
                  </div>
                </div>
              </form>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>
          </div>
        </div>
      </div>
      <!-- Modal Agregar Servidor-->
      <div class="modal fade" id="agregarServ" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content" style="background-image: linear-gradient(to left top, #5faaf2, #55afef, #4fb4ea, #4fb8e5, #53bbdf);">
            <div class="modal-header">
              <h1 class="modal-title fs-5" id="exampleModalLabel">Agregar Servidor</h1>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
              <form style="color: black;" action="dashboard/Controller/Process/registerDevice.jsp?deviceType=Server" method="post">
                <input name="idCompany" type="hidden" value='<%=idCompany%>'>
                <input name="nameCompany" type="hidden" value='<%=nameCompany%>'>
                <div class="row">
                  <div class="col-md-6">
                    <div class="mb-3">
                      <label for="nombre-equipo" class="form-label">Nombre del Servidor</label>
                      <input type="text" class="form-control" id="nombre-equipo" name="name" required>
                    </div>
                    <div class="mb-3">
                      <label for="uso" class="form-label">Tipo de uso</label>
                      <input type="text" class="form-control" id="uso" name="usedFor">
                    </div>
                    <div class="mb-3">
                      <label for="fabricante" class="form-label">Fabricante</label>
                      <input type="text" class="form-control" id="fabricante" name="manufacturer" required>
                    </div>
                    <div class="mb-3">
                      <label for="modelo" class="form-label">Modelo</label>
                      <input type="text" class="form-control" id="modelo" name="model">
                    </div>
                    <div class="mb-3">
                      <label for="serial" class="form-label">Serial</label>
                      <input type="text" class="form-control" id="serial" name="serial" required>
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="mb-3">
                      <label for="so" class="form-label">Sistema Operativo</label>
                      <input type="text" class="form-control" id="so" name="so">
                    </div>
                    <div class="mb-3">
                      <label for="mac-address" class="form-label">Mac Address</label>
                      <input type="text" class="form-control" id="mac-address"  name="macAddress" placeholder="00:1e:c2:9e:28:6b" minlength="17"  required>
                    </div>
                    <div class="mb-3">
                      <label for="ram" class="form-label">Memoria RAM</label>
                      <div class="input-group">
                        <input type="number" class="form-control" id="ram" name="ram" required>
                        <span class="input-group-text">GB</span>
                      </div>
                    </div>
                    <div class="mb-3">
                      <label for="almacenamiento" class="form-label">Almacenamiento</label>
                      <div class="input-group">
                        <input type="number" class="form-control" id="almacenamiento" placeholder="Cantidad en GB" name="storage" >
                        <select class="form-select" id="tipo-almacenamiento" name="typeStorage" required>
                          <option selected disabled value="">Tipo de almacenamiento</option>
                          <option value="SSD">SSD</option>
                          <option value="HDD">HDD</option>
                        </select>
                      </div>
                    </div>
                    <div class="mb-3">
                      <label for="observaciones" class="form-label">Observaciones</label>
                      <textarea class="form-control" id="observaciones" name="observations" rows="4" required></textarea>
                    </div>
                  </div>
                </div>
                <div class="text-center">
                  <button id="submit-btn" type="submit" class="btn btn-primary">Enviar</button>
                </div>
              </form>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>
          </div>
        </div>
      </div>
      

      <style>
        table {
          font-size: 14px;
        }
      </style>
    </div>
  </div>
</div>
<script>
  // Obtener la ID de la URL
  const urlHash = window.location.hash.substring(1);
  // Ocultar todos los divs excepto los especificados
  const divsToHide = ["workstation", "server", "register"];
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
      window.history.pushState(null, null, '?idpage=dispositivos&idCompany=<%=idCompany%>&nameCompany=<%=nameCompany%>' + '#' + linkHash); // Actualizar la URL
    });
  });
</script>