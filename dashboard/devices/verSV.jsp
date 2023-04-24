<%@ page contentType="text/html; charset=UTF-8" %>
<nav class="navbar navbar-light" style="background: #68C4F6;">
	<img src="../../resources/IMG/securiTI.png" alt="">
</nav>
<div class="container-fluid" style="margin-top: 1%; width: 60%;" >
	<table class="table"  style="font-size: 15px; border: 1px solid black;" id="tabla">
		<tbody>
			<% 
			String sql = "SELECT servers.*, users.name 'nameuser' " +
			"FROM servers LEFT JOIN users ON servers.username = users.username WHERE idServer = ? ORDER BY dateReg"; 
			try { 
				PreparedStatement st = null; 
				ResultSet rs = null;
				st = conn.prepareStatement(sql); 
				st.setString(1, idDevice);
				rs = st.executeQuery();
				int counter = 0;
				while (rs.next()) {
					counter++;
			%>
			<tr style="background-image: linear-gradient(to left top, #5faaf2, #55afef, #4fb4ea, #4fb8e5, #53bbdf);">
				<th>Datos Generales</th>
				<th></th>
			</tr>
			<tr>
				<td>Nombre del dispositivo</td>
				<td><%=rs.getString("name")%></td>
			</tr>
			<tr>
				<td>Tipo de Uso</td>
				<td><%=rs.getString("usedFor")%></td>
			</tr>
			<tr>
				<td>Fabricante</td>
				<td><%=rs.getString("manufacturer")%></td>
			</tr>
			<tr>
				<td>Modelo</td>
				<td><%=rs.getString("model")%></td>
			</tr>
			<tr>
				<td>Serial</td>
				<td><%=rs.getString("serial")%></td>
			</tr>
			<tr>
				<td>Sistema Operativo</td>
				<td><%=rs.getString("so")%></td>
			</tr>
			<tr>
				<td>Mac Address</td>
				<td><%=rs.getString("macAddress")%></td>
			</tr>
			<tr>
				<td>Memoria Ram</td>
				<td><%=rs.getString("ram")%>GB</td>
			</tr>
			<tr>
				<td>Almacenamiento</td>
				<td><%=rs.getString("typeStorage")%> <%=rs.getString("storage")%>GB</td>
			</tr>
			<tr>
				<td>Ultima revisión</td>
				<td><%=rs.getString("dateReg")%></td>
			</tr>
			<tr>
				<td>Revisado por</td>
				<% String nameuser = rs.getString("nameuser"); %>
				<td><%= nameuser != null ? nameuser : "Usuario Eliminado o Inexistente" %></td>
			</tr>
			<tr>
				<td>Observaciones</td>
				<td></td>
			</tr>
			<% } } catch (Exception e) { %>			
			<tr style="background-image: linear-gradient(to left top, #5faaf2, #55afef, #4fb4ea, #4fb8e5, #53bbdf);">
				<th>Datos Generales</th>
				<th>Error al consultar datos</th>
			</tr>
			<%}%>
		</tbody>
	</table>
</div>

<div class="container my-4" id="Historico" style="display: none;">
	<h1 class="text-center mb-4">Histórico del Servidor</h1>

	<div class="table-responsive">
		<table class="table table-bordered" style="border-color: black;">
			<thead>
				<tr>
					<th>Fecha de Modificación</th>
					<th>Modificado Por</th>
					<th>Tipo de Uso</th>
					<th>Fabricante</th>
					<th>Modelo</th>
					<th>Serial</th>
					<th>S.O.</th>
					<th>MAC Address</th>
					<th>RAM</th>
					<th>Almacenamiento</th>
					<th>Observaciones</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</tbody>
		</table>
	</div>

</div>

<div style="margin-left: 20%;" id="desb">
	<a class="btn btn-primary" style="text-decoration: none; color: black;" 
		href="../../../dashboard.jsp?idCompany=<%=idCompany%>&idpage=dispositivos#server">Volver</a>
	<button class="btn" style="color: black; background: #8EB6CB;" onclick="imprimir()">Imprimir</button>
	<button class="btn btn-info" onclick="verCambios()">Ver Cambios</button>
</div>

<button id="Vertabla" style="display: none;" onclick="verTabla()" class="btn btn-success ms-5 mt-5">Volver</button>


<script>
	function imprimir(){
	    var tabla = document.getElementById("tabla");
	    var desb = document.getElementById("desb").style.display ='none';
	    window.print();
	    var desb = document.getElementById("desb").style.display ='block';
	}

	function verCambios(){
		var tabla = document.getElementById("tabla").style.display = 'none';
		var historico = document.getElementById('Historico').style.display = 'block';
		document.getElementById('Vertabla').style.display = 'block';
		var desb = document.getElementById("desb").style.display ='none';

	}
	function verTabla(){
		window.location.reload();
	}
</script>