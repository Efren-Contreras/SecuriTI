<%@ page contentType="text/html; charset=UTF-8" %>

  <!--bototes de filtros-->  
  
  <nav class="navbar navbar-expand-lg navbar-light" style="background-color: white;">
    <div class="container-fluid">
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
<div class="collapse navbar-collapse" id="navbarTogglerDemo01">

  <div style="display: flex;">

    <ul class="navbar-nav">
      <li class="nav-item" style="margin: 2%;" >
        <div>
          <select class="btn" style="border: 1px solid black;" name="" id="" style="flex: 1;">
            <option value="">Responsable</option>
            <option value="">a-g</option>
            <option value="">h-p</option>
            <option value="">o-z</option>
          </select>
        </div>
      </li>
      <li class="nav-item" style="margin: 2%;">
        <div>
          <button class="btn" style="border: 1px solid black;" type="button" data-bs-toggle="collapse"
            data-bs-target="#collapseEquipo" aria-expanded="false" aria-controls="collapseExample">
            Equipo
          </button>
          <div class="collapse" style="border: 1px solid black; border-radius: 10px; " id="collapseEquipo">
            <div>
              <input type="text" class="form-control">
            </div>
          </div>
        </div>
      </li>
      <li class="nav-item" style="margin: 2%;">
        <div>
          <button class="btn" style="border: 1px solid black;" type="button" data-bs-toggle="collapse"
            data-bs-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
            Fabricante
          </button>
          <div class="collapse" style="border: 1px solid black; border-radius: 10px;" id="collapseExample">
            <div>
              <input type="text" class="form-control">
            </div>
          </div>
        </div>

      </li>
      <li class="nav-item" style="margin: 2%;">
        <div>
          <button class="btn" style="border: 1px solid black;" type="button" data-bs-toggle="collapse"
            data-bs-target="#collapseSo" aria-expanded="false" aria-controls="collapseExample">
            S.O
          </button>
          <div class="collapse" style="border: 1px solid black; border-radius: 10px;" id="collapseSo">
            <div>
              <input type="text" class="form-control">
            </div>
          </div>
        </div>
      </li>
      <li class="nav-item" style="margin: 2%;">
        <div>
          <button class="btn" style="border: 1px solid black;" type="button" data-bs-toggle="collapse"
            data-bs-target="#collapseRam" aria-expanded="false" aria-controls="collapseExample">
            Ram
          </button>
          <div class="collapse" style="border: 1px solid black; border-radius: 10px;" id="collapseRam">
            <div>
              <input type="text" class="form-control">
            </div>
          </div>
        </div>

      </li>
      <li class="nav-item" style="margin: 2%;">
        <div >
          <select style="border: 1px solid black;" class="btn" name="" id="" style="flex: 1;">
            <option value="">Cantidad de Almac.</option>
            <option value="">160gb</option>
            <option value="">256gb</option>
            <option value="">500gb</option>
            <option value="">1tb</option>
            <option value="">2tb</option>
          </select>
        </div>
      </li>
      <li class="nav-item" style="margin-top: 2%;">
        <div class="container-fluid" style="display: flex;">
          <input type="search" placeholder="Buscar"><svg xmlns="http://www.w3.org/2000/svg" width="20" height="30"
            fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
            <path
              d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
          </svg>
        </div>
      </li>
     

        </ul>

  </div>

</div>
  </div>
  </nav>

  <!--Tabla de dispositivos-->
  <div>
    <div class="container-fluid">
      <div class="table-responsive">
        <table class="table" style="text-align: center;">
          <thead style="background: #1D5C70; color: white; ">
            <tr>
              <th>Id</th>
              <th>Nombre</th>
              <th>Responsable</th>
              <th>Equipo</th>
              <th>Fabricante</th>
              <th>Modelo</th>
              <th>Serial</th>
              <th>S.O</th>
              <th>Mac</th>
              <th>Ram</th>
              <th>Almacenamiento</th>
              <th style="width: 0%;">Acciones</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <th style="width: 0%; flex-wrap: wrap;">123456</th>
              <td style="width: 0.5%; flex-wrap: wrap;">Desktop-5utapqv</td>
              <td style="width: 0.5%; flex-wrap: wrap;">Sergio Uriel Suaste Acosta</td>
              <td style="width: 0%; flex-wrap: wrap;">Laptop</td>
              <td style="width: 0%; flex-wrap: wrap;">Lenovo</td>
              <td style="width: 0.5%; flex-wrap: wrap;">L1G76AV#227</td>
              <td style="width: 0%; flex-wrap: wrap;">MXL7021W06</td>
              <td style="width: 0.5%; flex-wrap: wrap;">Window 10</td>
              <td style="width: 0.6%; flex-wrap: wrap;">DC-4A-3E-90-7A-F4</td>
              <td style="width: 0%; flex-wrap: wrap;">8gb</td>
              <td style="width: 0%; flex-wrap: wrap;">Hdd 500gb</td>
              <td style="width: 1%; display: flex;">
                <button class="btn btn-info" data-bs-target="#editar" data-bs-toggle="modal">Editar</button>
                <button class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#ver"><a
                    style="text-decoration: none; color: black;" href="ver.html">Ver</a></button>
                <button class="btn" style="background-color: #F10018;" data-bs-toggle="modal"
                  data-bs-target="#eliminar">Eliminar</button>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  </div>

  <div class="position-fixed bottom-0 end-0">
    <button class="btn" data-bs-toggle="modal" data-bs-target="#agregar" style="border-radius: 100%;">
      <img src="../resources/IMG/add.svg" width="70px">
    </button>
  </div>


  <!-- Formulario agregar -->
  <div class="container-fluid">

    <div class="modal fade" id="agregar" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog shadow-lg p-3 mb-5 bg-body rounded">
        <div class="modal-content">
          <div class="modal-body" style="background-color: #4890B6;">
            <div>
              <h5 style="color: black;">Agregar Dispositivos</h5>
            </div>
            <form style="color: black;">
              <div class="mb-3">
                <label for="" class="form-label">Nombre del equipo</label>
                <input type="text" class="form-control" id="" name="">
              </div>
              <div class="mb-3">
                <label for="" class="form-label">Responsable</label>
                <input type="text" class="form-control" id="" name="">
              </div>
              <div class="mb-3">
                <label for="" class="form-label">Equipo</label>
                <select name="" id="">
                  <option value="">----------</option>
                  <option value="">Laptop</option>
                  <option value="">Desktop</option>
                  <option value="">Impresora</option>
                </select>
              </div>
              <div class="mb-3">
                <label for="" class="form-label">Fabricante</label>
                <select name="" id="">
                  <option value="">---</option>
                  <option value="">Hp</option>
                  <option value="">Acer</option>
                  <option value="">Apple</option>
                  <option value="">Toshiba</option>
                  <option value="">Dell</option>
                  <option value="">Asus</option>
                  <option value="">Samsumg</option>
                  <option value="">otro</option>
                </select>
              </div>
              <div class="mb-3">
                <label for="" class="form-label">Sistema Operativo</label>
                <select name="" id="">
                  <option value="">---</option>
                  <option value="">Windows 95</option>
                  <option value="">Windows xp</option>
                  <option value="">Windows 7</option>
                  <option value="">Windows 8</option>
                  <option value="">Windows 10</option>
                  <option value="">Windows 11</option>
                  <option value="">Mac</option>
                  <option value="">Linux</option>
                </select>
              </div>
              <div class="mb-3">
                <label for="" class="form-label">Serial</label>
                <input type="text" class="form-control" id="" name="" minlength="17" maxlength="17">
              </div>
              <div class="mb-3">
                <label for="" class="form-label">Mac Address</label>
                <input type="text" class="form-control" id="" name="" placeholder="00:1e:c2:9e:28:6b" minlength="12"
                  maxlength="12">
              </div>
              <div class="mb-3">
                <label for="" class="form-label">Memoria Ram</label>
                <select name="" id="">
                  <option value="">---</option>
                  <option value="">2gb</option>
                  <option value="">4gb</option>
                  <option value="">8gb</option>
                  <option value="">16gb</option>
                  <option value="">32gb</option>
                </select>
              </div>
              <div class="mb-3">
                <label for="" class="form-label">Tipo de Almacenamiento</label>
                <select name="" id="">
                  <option value="">---</option>
                  <option value="">Hdd</option>
                  <option value="">Sdd</option>
                  <option value="">Otro</option>
                </select>
              </div>
              <div class="mb-3">
                <label for="" class="form-label">Almacenamiento</label>
                <select name="" id="">
                  <option value="">---</option>
                  <option value="">160gb</option>
                  <option value="">240gb</option>
                  <option value="">250gb</option>
                  <option value="">320gb</option>
                  <option value="">480gb</option>
                  <option value="">500gb</option>
                  <option value="">960gb</option>
                  <option value="">1Tb</option>
                  <option value="">2Tb</option>
                  <option value="">otro</option>
                </select>
              </div>
              <div class="mb-3">
                <label for="" class="form-label">Observaciones</label>
                <textarea name="" id="" cols="30" style="height: 90px;" placeholder="Escribir.."></textarea>
              </div>
            </form>
          </div>
          <div class="" style="background-color: #4890B6;">
            <button type="submit" class="btn btn-lg"
              style="margin: 3%; margin-left: 35%; background-color: #C9CBC8; color: black;">Agregar
              Dispositivo</button>
          </div>
        </div>
      </div>
    </div>


    <!-- Formulario editar -->
    <div class="container-fluid">
      <div class="modal fade" id="editar" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog shadow-lg p-3 mb-5 bg-body rounded">
          <div class="modal-content">
            <div class="modal-body" style="background-color: #4890B6;">
              <div>
                <button type="button" class="btn-close " data-bs-dismiss="modal" aria-label="Close"></button>
                <h5 style="color: black;">Cambiar informacion de Dispositivos</h5>
              </div>
              <form style="color: black;">
                <div class="mb-3">
                  <label for="" class="form-label">Nombre del equipo</label>
                  <input type="text" class="form-control" id="" name="">
                </div>
                <div class="mb-3">
                  <label for="" class="form-label">Responsable</label>
                  <input type="text" class="form-control" id="" name="">
                </div>
                <div class="mb-3">
                  <label for="" class="form-label">Equipo</label>
                  <select name="" id="">
                    <option value="">----------</option>
                    <option value="">Laptop</option>
                    <option value="">Desktop</option>
                    <option value="">Impresora</option>
                  </select>
                </div>
                <div class="mb-3">
                  <label for="" class="form-label">Fabricante</label>
                  <select name="" id="">
                    <option value="">---</option>
                    <option value="">Hp</option>
                    <option value="">Acer</option>
                    <option value="">Apple</option>
                    <option value="">Toshiba</option>
                    <option value="">Dell</option>
                    <option value="">Asus</option>
                    <option value="">Samsumg</option>
                    <option value="">otro</option>
                  </select>
                </div>
                <div class="mb-3">
                  <label for="" class="form-label">Sistema Operativo</label>
                  <select name="" id="">
                    <option value="">---</option>
                    <option value="">Windows 95</option>
                    <option value="">Windows xp</option>
                    <option value="">Windows 7</option>
                    <option value="">Windows 8</option>
                    <option value="">Windows 10</option>
                    <option value="">Windows 11</option>
                    <option value="">Mac</option>
                    <option value="">Linux</option>
                  </select>
                </div>
                <div class="mb-3">
                  <label for="" class="form-label">Serial</label>
                  <input type="text" class="form-control" id="" name="" minlength="17" maxlength="17">
                </div>
                <div class="mb-3">
                  <label for="" class="form-label">Mac Address</label>
                  <input type="text" class="form-control" id="" name="" placeholder="00:1e:c2:9e:28:6b" minlength="12"
                    maxlength="12">
                </div>
                <div class="mb-3">
                  <label for="" class="form-label">Memoria Ram</label>
                  <select name="" id="">
                    <option value="">---</option>
                    <option value="">2gb</option>
                    <option value="">4gb</option>
                    <option value="">8gb</option>
                    <option value="">16gb</option>
                    <option value="">32gb</option>
                  </select>
                </div>
                <div class="mb-3">
                  <label for="" class="form-label">Tipo de Almacenamiento</label>
                  <select name="" id="">
                    <option value="">---</option>
                    <option value="">Hdd</option>
                    <option value="">Sdd</option>
                    <option value="">Otro</option>
                  </select>
                </div>
                <div class="mb-3">
                  <label for="" class="form-label">Almacenamiento</label>
                  <select name="" id="">
                    <option value="">---</option>
                    <option value="">160gb</option>
                    <option value="">240gb</option>
                    <option value="">250gb</option>
                    <option value="">320gb</option>
                    <option value="">480gb</option>
                    <option value="">500gb</option>
                    <option value="">960gb</option>
                    <option value="">1Tb</option>
                    <option value="">2Tb</option>
                    <option value="">otro</option>
                  </select>
                </div>
                <div class="mb-3">
                  <label for="" class="form-label">Observaciones</label>
                  <textarea name="" id="" cols="30" style="height: 90px;" placeholder="Escribir.."></textarea>
                </div>
              </form>
            </div>
            <div class="" style="background-color: #4890B6;">
              <button type="submit" class="btn btn-lg"
                style="background-color: #C9CBC8; color: black; margin: 3%; margin-left: 35%;">Actualizar
                dispositivo</button>
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
            Esta seguro que quiere eliminar este dispositivo?
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

  <script>



  </script>