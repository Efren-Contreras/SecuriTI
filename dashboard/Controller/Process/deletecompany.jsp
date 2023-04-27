<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../Connections/mysql.jsp" %>
<%
    String idalter = request.getParameter("idCompany");
    String nameCompany = request.getParameter("nameCompany");
    String query1 = "DELETE FROM historyworkstations WHERE idWorkStations IN (SELECT idWorkStations FROM workstations WHERE idCompany = ?)";
    String query2 = "DELETE FROM historyservers WHERE idServer IN (SELECT idServer FROM servers WHERE idCompany = ?)";
    String query3 = "DELETE FROM workstations WHERE idCompany = ?";
    String query4 = "DELETE FROM servers WHERE idCompany = ?";
    String query5 = "DELETE FROM companies WHERE idCompany = ?";
    String user = (String)session.getAttribute("name");
    try {
        PreparedStatement ps = null;
        ps = conn.prepareStatement(query1);
        ps.setString(1, idalter);
        int i = ps.executeUpdate();
        ps = conn.prepareStatement(query2);
        ps.setString(1, idalter);
        int o = ps.executeUpdate();
        ps = conn.prepareStatement(query3);
        ps.setString(1, idalter);
        int u = ps.executeUpdate();
        ps = conn.prepareStatement(query4);
        ps.setString(1, idalter);
        int v = ps.executeUpdate();
        ps = conn.prepareStatement(query5);
        ps.setString(1, idalter);
        int w = ps.executeUpdate();
        
        // Agregar actividad en la tabla logs
        String activity = "<b>Eliminó</b> la <b>compañía</b> con nombre: " + nameCompany;
        String logQuery = "INSERT INTO logs (userName, dateLog, action) VALUES (?, NOW(), ?)";
        ps = conn.prepareStatement(logQuery);
        ps.setString(1, user);
        ps.setString(2, activity);
        ps.executeUpdate();
        
        response.sendRedirect("../../../dashboard.jsp");
    } catch (Exception e) {
        out.print(e);
        out.print("<br>"+query1);
    }
%>
