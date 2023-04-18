<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../Connections/mysql.jsp" %>
<%
    String idalter = request.getParameter("idCompany");
    String query = "DELETE FROM companies WHERE idCompany = "+idalter;
    try {
        Statement st = null;
        st = conn.createStatement();
        int i = st.executeUpdate(query);
        response.sendRedirect("../../../dashboard.jsp#success");
    } catch (Exception e) {
        out.print(e);
        out.print("<br>"+query);
    }
%>