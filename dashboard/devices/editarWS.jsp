<%@ page contentType="text/html; charset=UTF-8" %>
<div class="container-fluid">
	<div class="card" style="padding-left: 10%; border: 1px solid black; padding-right: 10%; width: 55%; margin-left: 25%; margin-top: 2%; margin-bottom: 3%; background-image: linear-gradient(to right bottom, #5faaf2, #6db3e7, #82badb, #9bc0d1, #b5c4c9);">
		<div class="mx-auto">
			<img src="../resources/IMG/securiTI.png">
		</div>
		<div class="card-title mx-auto">
			<h2>Editar información del Dispositivo</h2>
		</div>
		<%
        String sql = "SELECT * FROM workstations WHERE idCompany="+idCompany+" AND idWorkstations="+idDevice;
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
				<input disabled type="text" class="form-control" style="height: 2.0%;" value='<%=rs.getString("name")%>' required>
				<button type="button" style="margin-left: 2%;" class="h4 btn btn-info" data-bs-toggle="modal" data-bs-target="#modalname">Editar</button>
			</div>
		</div>
		<div class="mb-3">
			<label for="correo" class="form-label">Responsable</label>
			<div style="display: flex;">
				<input disabled type="text" class="form-control" style="height: 2.0%;" value='<%=rs.getString("assignedOfWorkStation")%>' required>
				<button type="button" style="margin-left: 2%;" class="h4 btn btn-info" data-bs-toggle="modal" data-bs-target="#modalResp">Editar</button>
			</div>
		</div>
		<div class="mb-3">
			<label for="mensaje" class="form-label">Fabricante</label>
			<div style="display: flex;">
				<input disabled type="text" class="form-control" style="height: 2.0%;" value='<%=rs.getString("manufacturer")%>' required>
				<button type="button" style="margin-left: 2%;" class="h4 btn btn-info" data-bs-toggle="modal" data-bs-target="#modalFabricante">Editar</button>
			</div>
		</div>
		<div class="mb-3">
			<label for="mensaje" class="form-label">Modelo</label>
			<div style="display: flex;">
				<input disabled type="text" class="form-control" style="height: 2.0%;" value='<%=rs.getString("model")%>' required>
				<button type="button" style="margin-left: 2%;" class="h4 btn btn-info" data-bs-toggle="modal" data-bs-target="#modalModelo">Editar</button>
			</div>
		</div>
		<div class="mb-3">
			<label for="mensaje" class="form-label">Serial</label>
			<div style="display: flex;">
				<input disabled type="text" class="form-control" style="height: 2.0%;" value='<%=rs.getString("serial")%>' required>
				<button type="button" style="margin-left: 2%;" class="h4 btn btn-info" data-bs-toggle="modal" data-bs-target="#modalSerial">Editar</button>
			</div>
		</div>
		<div class="mb-3">
			<label for="mensaje" class="form-label">Sistema Operativo</label>
			<div style="display: flex;">
				<input disabled type="text" class="form-control" style="height: 2.0%;" value='<%=rs.getString("so")%>' required>
				<button type="button" style="margin-left: 2%;" class="h4 btn btn-info" data-bs-toggle="modal" data-bs-target="#modalSO">Editar</button>
			</div>
		</div>
		<div class="mb-3">
			<label for="mensaje" class="form-label">MAC Address</label>
			<div style="display: flex;">
				<input disabled type="text" class="form-control" style="height: 2.0%;" value='<%=rs.getString("macAddress")%>' required>
				<button type="button" style="margin-left: 2%;" class="h4 btn btn-info" data-bs-toggle="modal" data-bs-target="#modalMac">Editar</button>
			</div>
		</div>
		<div class="mb-3">
			<label for="mensaje" class="form-label">RAM</label>
			<div style="display: flex;">
				<input disabled type="number" class="form-control" style="height: 2.0%;" value='<%=rs.getString("ram")%>' required>
				<button type="button" style="margin-left: 2%;" class="h4 btn btn-info" data-bs-toggle="modal" data-bs-target="#modalRam">Editar</button>
			</div>
		</div>
		<div class="mb-3">
			<label for="mensaje" class="form-label">Almacenamiento</label>
			<div style="display: flex;">
				<input disabled type="number" class="form-control" style="height: 2.0%;" value='<%=rs.getString("storage")%>' required>
				<button type="button" style="margin-left: 2%;" class="h4 btn btn-info" data-bs-toggle="modal" data-bs-target="#modalAlm">Editar</button>
			</div>
		</div>
		<div class="mb-3">
			<label for="mensaje" class="form-label">Tipo de Almacenamiento</label>
			<div style="display: flex;">
				<input disabled type="text" class="form-control" style="height: 2.0%;" value='<%=rs.getString("typeStorage")%>' required>
				<button type="button" style="margin-left: 2%;" class="h4 btn btn-info" data-bs-toggle="modal" data-bs-target="#modalTipAlm">Editar</button>
			</div>
		</div>
		<div class="mb-3">
			<label for="mensaje" class="form-label">Observaciones</label>
			<div style="display: flex;">
				<input disabled type="text" class="form-control" style="height: 2.0%;" value='<%=rs.getString("observations")%>' required>
				<button type="button" style="margin-left: 2%;" class="h4 btn btn-info" data-bs-toggle="modal" data-bs-target="#modalObs">Editar</button>
			</div>
		</div>
		<a type="button" class="btn btn-primary" style="width: 30%; margin-bottom: 3%;" 
		href='../../../dashboard.jsp?idCompany=<%=idCompany%>&idpage=dispositivos&nameCompany=<%=nameCompany%>#workstation'>Volver</a>
	</div>
	<%
        }
    } catch (Exception e) {
        out.print(e);
        out.print("<br>"+sql);
    }
	%>
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
					<form method="post" action="Controller/Process/editdevice.jsp?deviceType=workstation&formtype=name" id="myForm1">
						<input type="hidden" id="idDevice" name="idDevice" value='<%=idDevice%>'>
						<input type="hidden" id="nameCompany" name="nameCompany" value='<%=nameCompany%>'>
						<input type="hidden" id="idCompany" name="idCompany" value='<%=idCompany%>'>
						<div class="mb-3">
							<label for="nombre" class="form-label">Nombre Nuevo</label>
                            <input autocomplete="off" disabled required type="text" class="form-control" id="show" name="name">
						</div>
                        <div class="form-check mb-3">
                          <input class="form-check-input" type="checkbox" id="agreeCheckbox">
                          <label class="form-check-label" for="agreeCheckbox">Estoy de acuerdo con modificar el siguiente campo</label>
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
<!-- Modal de Responsable -->
<div class="container-fluid">
	<div class="modal fade" id="modalResp" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<!-- Formulario -->
					<form method="post" action="Controller/Process/editdevice.jsp?deviceType=workstation&formtype=assignedOfWorkStation" id="myForm1">
						<input type="hidden" id="idDevice" name="idDevice" value='<%=idDevice%>'>
						<input type="hidden" id="nameCompany" name="nameCompany" value='<%=nameCompany%>'>
						<input type="hidden" id="idCompany" name="idCompany" value='<%=idCompany%>'>
						<div class="mb-3">
							<label for="" class="form-label">Responsable</label>
                            <input autocomplete="off" disabled required type="text" class="form-control" id="show" name="assignedOfWorkStation">
						</div>
                        <div class="form-check mb-3">
                          <input class="form-check-input" type="checkbox" id="agreeCheckbox">
                          <label class="form-check-label" for="agreeCheckbox">Estoy de acuerdo con modificar el siguiente campo</label>
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
<!-- Modal de Fabricante -->
<div class="container-fluid">
	<div class="modal fade" id="modalFabricante" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<!-- Formulario -->
					<form method="post" action="Controller/Process/editdevice.jsp?deviceType=workstation&formtype=manufacturer" id="myForm1">
						<input type="hidden" id="idDevice" name="idDevice" value='<%=idDevice%>'>
						<input type="hidden" id="nameCompany" name="nameCompany" value='<%=nameCompany%>'>
						<input type="hidden" id="idCompany" name="idCompany" value='<%=idCompany%>'>
						<div class="mb-3">
							<label for="" class="form-label">Fabricante</label>
                            <input autocomplete="off" disabled required type="text" class="form-control" id="show" name="manufacturer">
						</div>
                        <div class="form-check mb-3">
                          <input class="form-check-input" type="checkbox" id="agreeCheckbox">
                          <label class="form-check-label" for="agreeCheckbox">Estoy de acuerdo con modificar el siguiente campo</label>
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
<!-- Modal de Modelo -->
<div class="container-fluid">
	<div class="modal fade" id="modalModelo" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<!-- Formulario -->
					<form method="post" action="Controller/Process/editdevice.jsp?deviceType=workstation&formtype=model" id="myForm1">
						<input type="hidden" id="idDevice" name="idDevice" value='<%=idDevice%>'>
						<input type="hidden" id="nameCompany" name="nameCompany" value='<%=nameCompany%>'>
						<input type="hidden" id="idCompany" name="idCompany" value='<%=idCompany%>'>
						<div class="mb-3">
							<label for="" class="form-label">Modelo</label>
                            <input autocomplete="off" disabled required type="text" class="form-control" id="show" name="model">
						</div>
                        <div class="form-check mb-3">
                          <input class="form-check-input" type="checkbox" id="agreeCheckbox">
                          <label class="form-check-label" for="agreeCheckbox">Estoy de acuerdo con modificar el siguiente campo</label>
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
<!-- Modal de Serial -->
<div class="container-fluid">
	<div class="modal fade" id="modalSerial" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<!-- Formulario -->
					<form method="post" action="Controller/Process/editdevice.jsp?deviceType=workstation&formtype=serial" id="myForm1">
						<input type="hidden" id="idDevice" name="idDevice" value='<%=idDevice%>'>
						<input type="hidden" id="nameCompany" name="nameCompany" value='<%=nameCompany%>'>
						<input type="hidden" id="idCompany" name="idCompany" value='<%=idCompany%>'>
						<div class="mb-3">
							<label for="" class="form-label">Serial</label>
                            <input autocomplete="off" disabled required type="text" class="form-control" id="show" name="serial">
						</div>
                        <div class="form-check mb-3">
                          <input class="form-check-input" type="checkbox" id="agreeCheckbox">
                          <label class="form-check-label" for="agreeCheckbox">Estoy de acuerdo con modificar el siguiente campo</label>
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
<!-- Modal de Sistema Operativo-->
<div class="container-fluid">
	<div class="modal fade" id="modalSO" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<!-- Formulario -->
					<form method="post" action="Controller/Process/editdevice.jsp?deviceType=workstation&formtype=so" id="myForm1">
						<input type="hidden" id="idDevice" name="idDevice" value='<%=idDevice%>'>
						<input type="hidden" id="nameCompany" name="nameCompany" value='<%=nameCompany%>'>
						<input type="hidden" id="idCompany" name="idCompany" value='<%=idCompany%>'>
						<div class="mb-3">
							<label for="" class="form-label">Sistema Operativo</label>
                            <input autocomplete="off" disabled required type="text" class="form-control" id="show" name="so">
						</div>
                        <div class="form-check mb-3">
                          <input class="form-check-input" type="checkbox" id="agreeCheckbox">
                          <label class="form-check-label" for="agreeCheckbox">Estoy de acuerdo con modificar el siguiente campo</label>
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
<!-- Modal de Mac Address -->
<div class="container-fluid">
	<div class="modal fade" id="modalMac" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<!-- Formulario -->
					<form method="post" action="Controller/Process/editdevice.jsp?deviceType=workstation&formtype=macAddress" id="myForm1">
						<input type="hidden" id="idDevice" name="idDevice" value='<%=idDevice%>'>
						<input type="hidden" id="nameCompany" name="nameCompany" value='<%=nameCompany%>'>
						<input type="hidden" id="idCompany" name="idCompany" value='<%=idCompany%>'>
						<div class="mb-3">
							<label for="" class="form-label">MAC Address</label>
                            <input autocomplete="off" disabled required type="text" class="form-control" id="show" name="macAddress" minlength="17">
						</div>
                        <div class="form-check mb-3">
                          <input class="form-check-input" type="checkbox" id="agreeCheckbox">
                          <label class="form-check-label" for="agreeCheckbox">Estoy de acuerdo con modificar el siguiente campo</label>
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
<!-- Modal de Ram -->
<div class="container-fluid">
	<div class="modal fade" id="modalRam" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<!-- Formulario -->
					<form method="post" action="Controller/Process/editdevice.jsp?deviceType=workstation&formtype=ram" id="myForm1">
						<input type="hidden" id="idDevice" name="idDevice" value='<%=idDevice%>'>
						<input type="hidden" id="nameCompany" name="nameCompany" value='<%=nameCompany%>'>
						<input type="hidden" id="idCompany" name="idCompany" value='<%=idCompany%>'>
						<div class="mb-3">
							<label for="" class="form-label">RAM</label>
                            <input autocomplete="off" disabled required type="number" class="form-control" id="show" name="ram">
						</div>
                        <div class="form-check mb-3">
                          <input class="form-check-input" type="checkbox" id="agreeCheckbox">
                          <label class="form-check-label" for="agreeCheckbox">Estoy de acuerdo con modificar el siguiente campo</label>
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
<!-- Modal de Almacenamiento -->
<div class="container-fluid">
	<div class="modal fade" id="modalAlm" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<!-- Formulario -->
					<form method="post" action="Controller/Process/editdevice.jsp?deviceType=workstation&formtype=storage" id="myForm1">
						<input type="hidden" id="idDevice" name="idDevice" value='<%=idDevice%>'>
						<input type="hidden" id="nameCompany" name="nameCompany" value='<%=nameCompany%>'>
						<input type="hidden" id="idCompany" name="idCompany" value='<%=idCompany%>'>
						<div class="mb-3">
							<label for="" class="form-label">Almacenamiento</label>
                            <input autocomplete="off" disabled required type="number" class="form-control" id="show" name="storage">
						</div>
                        <div class="form-check mb-3">
                          <input class="form-check-input" type="checkbox" id="agreeCheckbox">
                          <label class="form-check-label" for="agreeCheckbox">Estoy de acuerdo con modificar el siguiente campo</label>
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
 <!-- Modal de Tipo de almacenamiento -->
 <div class="container-fluid">

	<div class="modal fade" id="modalTipAlm" tabindex="-1" aria-labelledby="exampleModalLabel"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<!-- Formulario -->
					<form method="post" action="Controller/Process/editdevice.jsp?deviceType=workstation&formtype=typeStorage" id="myForm1">
						<input type="hidden" id="idDevice" name="idDevice" value='<%=idDevice%>'>
						<input type="hidden" id="nameCompany" name="nameCompany" value='<%=nameCompany%>'>
						<input type="hidden" id="idCompany" name="idCompany" value='<%=idCompany%>'>
						<div class="mb-3">
							<select class="form-select" id="show" name="typeStorage" required disabled>
								<option selected disabled value="">Tipo de almacenamiento</option>
								<option value="SSD">SSD</option>
								<option value="HDD">HDD</option>
							</select>
						</div>
						<div class="form-check mb-3">
							<input class="form-check-input" type="checkbox" id="agreeCheckbox">
							<label class="form-check-label" for="agreeCheckbox">Estoy de acuerdo con modificar el siguiente campo</label>
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
<!-- Modal de Observaciones -->
<div class="container-fluid">

	<div class="modal fade" id="modalObs" tabindex="-1" aria-labelledby="exampleModalLabel"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<!-- Formulario -->
					<form method="post" action="Controller/Process/editdevice.jsp?deviceType=workstation&formtype=observations" id="myForm1">
						<input type="hidden" id="idDevice" name="idDevice" value='<%=idDevice%>'>
						<input type="hidden" id="nameCompany" name="nameCompany" value='<%=nameCompany%>'>
						<input type="hidden" id="idCompany" name="idCompany" value='<%=idCompany%>'>
						<div class="mb-3">
							<label for="" class="form-label">Observaciones</label>
							<br>
							<textarea disabled autocomplete="off" name="observations" id="show" cols="55" rows="5"></textarea>
						</div>
						<div class="form-check mb-3">
							<input class="form-check-input" type="checkbox" id="agreeCheckbox">
							<label class="form-check-label" for="agreeCheckbox">Estoy de acuerdo con modificar el siguiente campo</label>
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