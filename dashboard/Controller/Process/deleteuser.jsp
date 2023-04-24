<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../Connections/mysql.jsp" %>
<%
    String idalter = request.getParameter("iduser");
    String query = "DELETE FROM users WHERE iduser = ?";
    try {
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setInt(1, Integer.parseInt(idalter));
        int i = ps.executeUpdate();
        response.sendRedirect("../../../dashboard.jsp?idpage=cuentas#users");
    } catch (SQLException e) {
        out.print(e);
        out.print("<br>" + query);
    }
%>