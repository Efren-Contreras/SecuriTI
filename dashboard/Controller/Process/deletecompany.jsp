<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../Connections/mysql.jsp" %>
<%
    String idalter = request.getParameter("idCompany");
    String query2 = "DELETE FROM workstations WHERE idCompany = ?";
    String query3 = "DELETE FROM servers WHERE idCompany = ?";
    String query = "DELETE FROM companies WHERE idCompany = ?";
    try {
        PreparedStatement ps = null;
        ps = conn.prepareStatement(query2);
        ps.setString(1, idalter);
        int i = ps.executeUpdate();
        ps = conn.prepareStatement(query3);
        ps.setString(1, idalter);
        int o = ps.executeUpdate();
        ps = conn.prepareStatement(query);
        ps.setString(1, idalter);
        int u = ps.executeUpdate();
        response.sendRedirect("../../../dashboard.jsp");
    } catch (Exception e) {
        out.print(e);
        out.print("<br>"+query);
    }
%>
