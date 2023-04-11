<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../Connections/mysql.jsp" %>
<%
    String idalter = request.getParameter("iduser");
    String query = "DELETE FROM usuarios WHERE iduser = "+idalter;
    try {
        Statement st = null;
        st = conn.createStatement();
        int i = st.executeUpdate(query);
        response.sendRedirect("../../../dashboard.jsp?idpage=cuentas#success");
    } catch (Exception e) {
        out.print(e);
        out.print("<br>"+query);
    }
%>