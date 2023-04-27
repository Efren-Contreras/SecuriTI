<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../Connections/mysql.jsp" %>
<%
    String idalter = request.getParameter("idDevice");
    String idcomp = request.getParameter("idCompany");
    String deleteType = request.getParameter("deleteType");
    String nameCompany = request.getParameter("nameCompany");
    String idColumnName = deleteType.equals("WorkStation") ? "idWorkStations" : "idServer";
    String tableName = deleteType.equals("WorkStation") ? "workstations" : "servers";
    String historyTableName = deleteType.equals("WorkStation") ? "historyworkstations" : "historyservers";

    String query = "DELETE FROM " + tableName + " WHERE " + idColumnName + " = ?";
    String query2 = "DELETE FROM " + historyTableName + " WHERE " + idColumnName + " = ?";
    try {
        PreparedStatement st = conn.prepareStatement(query2);
        st.setInt(1, Integer.parseInt(idalter));
        int y = st.executeUpdate();

        st = conn.prepareStatement(query);
        st.setInt(1, Integer.parseInt(idalter));
        int i = st.executeUpdate();

        String user = (String)session.getAttribute("name");
        String activity = "<b>Eliminó " + deleteType + "</b> con ID " + idalter + " de la compañía " + nameCompany;
        String logQuery = "INSERT INTO logs (userName, dateLog, action) VALUES (?, NOW(), ?)";
        PreparedStatement ps = conn.prepareStatement(logQuery);
        ps.setString(1, user);
        ps.setString(2, activity);
        ps.executeUpdate();

        if (deleteType.equals("WorkStation")) {
            response.sendRedirect("../../../dashboard.jsp?idpage=dispositivos&nameCompany="+nameCompany+"&idCompany=" + idcomp + "#workstation");
        } else if (deleteType.equals("Server")) {
            response.sendRedirect("../../../dashboard.jsp?idpage=dispositivos&nameCompany="+nameCompany+"&idCompany=" + idcomp + "#server");
        }
    } catch (SQLException e) {
        out.print(e);
        out.print("<br>" + query);
    }
%>
