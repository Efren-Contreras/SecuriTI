<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../Connections/mysql.jsp" %>
<%
    String idalter = request.getParameter("iduser");
    String query = "DELETE FROM users WHERE iduser = ?";
    try {
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setInt(1, Integer.parseInt(idalter));
        int i = ps.executeUpdate();
        
        // Agregar registro en la tabla logs
        Object name = session.getAttribute("name");
        String action = "<b>Eliminó</b> al usuario con ID: " + idalter;
        String queryLogs = "INSERT INTO logs(userName, dateLog, action) VALUES (?, NOW(), ?)";
        try {
            PreparedStatement pstLogs = conn.prepareStatement(queryLogs);
            pstLogs.setString(1, (String)name);
            pstLogs.setString(2, action);
            int j = pstLogs.executeUpdate();
            response.sendRedirect("../../../dashboard.jsp?idpage=cuentas#users");
        } catch (Exception e) {
            out.print(e);
            out.print("<br>"+queryLogs);
        }
    } catch (SQLException e) {
        out.print(e);
        out.print("<br>" + query);
    }
%>
