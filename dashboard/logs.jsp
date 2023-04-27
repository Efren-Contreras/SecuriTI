<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="Controller/Connections/mysql.jsp" %>
<div class="container-fluid">
    <div class="table-responsive">
        <table class="table table-striped table-hover mt-5">
            <thead class="bg-gradient" style="background-image: linear-gradient(to bottom, #5faaf2, #55afef, #4fb4ea, #4fb8e5, #53bbdf);">
                <tr>
                    <th>Fecha y Hora</th>
                    <th>Usuario</th>
                    <th>Realizó</th>
                </tr>
            </thead>
            <tbody>
                <% 
                String sql = "SELECT * FROM logs ORDER BY idLog DESC"; 
                try { 
                    PreparedStatement ps = conn.prepareStatement(sql);
                    ResultSet rs = ps.executeQuery();
                    while (rs.next()) {
                        String dateLog = rs.getString("dateLog");
                        String userName = rs.getString("userName");
                        String action = rs.getString("action");
                %>
                <tr>
                    <td class="col-1"><%= dateLog %></td>
                    <td class="col-1"><%= userName %></td>
                    <td><%= action %></td>
                </tr>
                <% } } catch (Exception e) { %>
                <tr>
                    <td><%=e.getMessage()%></td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>
</div>
