<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../Connections/mysql.jsp" %>
<%@ page import="java.io.*, java.util.*" %>
<%
    // Obtener parámetros
	Object username = session.getAttribute("username");
    String deviceType = request.getParameter("deviceType");
    String idCompany = request.getParameter("idCompany");
    String nameCompany = request.getParameter("nameCompany");

    if (deviceType.equals("Workstation") || deviceType.equals("Server")){
        String name = request.getParameter("name");
        String manufacturer = request.getParameter("manufacturer");
        String model = request.getParameter("model");
        String serial = request.getParameter("serial");
        String so = request.getParameter("so");
        String macAddress = request.getParameter("macAddress");
        String ram = request.getParameter("ram");
        String storage = request.getParameter("storage");
        String typeStorage = request.getParameter("typeStorage");
        String observations = request.getParameter("observations");
        String tableName = deviceType.equals("Workstation") ? "workstations" : "servers";
        String assignedOfWorkStation = "";
        String usedFor = "";
        String query = "INSERT INTO "+tableName+" (idCompany, username, name, macAddress, storage, typeStorage, manufacturer, model, ram, serial, so, observations, dateReg";

        if (deviceType.equals("Workstation")){
            assignedOfWorkStation = request.getParameter("assignedOfWorkStation");
            query += ", assignedOfWorkStation";
        } else if (deviceType.equals("Server")){
            usedFor = request.getParameter("usedFor");
            query += ", usedFor";
        }
        query += ") VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, NOW(), ?)";
        PreparedStatement st = null;
        st = conn.prepareStatement(query);
        st.setInt(1, Integer.parseInt(idCompany));
        st.setObject(2, username);
        st.setString(3, name);
        st.setString(4, macAddress);
        st.setString(5, storage);
        st.setString(6, typeStorage);
        st.setString(7, manufacturer);
        st.setString(8, model);
        st.setString(9, ram);
        st.setString(10, serial);
        st.setString(11, so);
        st.setString(12, observations);
        try {
            if (deviceType.equals("Workstation")){
                st.setString(13, assignedOfWorkStation);
                int i = st.executeUpdate();

                String user = (String)session.getAttribute("name");
                String activity = "<b>Registró " + deviceType + "</b> con nombre " + name + " de la compañía " + nameCompany;
                String logQuery = "INSERT INTO logs (userName, dateLog, action) VALUES (?, NOW(), ?)";
                PreparedStatement psx = conn.prepareStatement(logQuery);
                psx.setString(1, user);
                psx.setString(2, activity);
                psx.executeUpdate();
                response.sendRedirect("../../../dashboard.jsp?idpage=dispositivos&nameCompany="+nameCompany+"&idCompany=" + idCompany + "#workstation");
            } else if (deviceType.equals("Server")){
                st.setString(13, usedFor);
                int i = st.executeUpdate();

                String user = (String)session.getAttribute("name");
                String activity = "<b>Registró " + deviceType + "</b> con nombre " + name + " en la compañía " + nameCompany;
                String logQuery = "INSERT INTO logs (userName, dateLog, action) VALUES (?, NOW(), ?)";
                PreparedStatement psx = conn.prepareStatement(logQuery);
                psx.setString(1, user);
                psx.setString(2, activity);
                psx.executeUpdate();
                response.sendRedirect("../../../dashboard.jsp?idpage=dispositivos&nameCompany="+nameCompany+"&idCompany=" + idCompany + "#server");
            }
        } catch (SQLException e){
            out.print(e.getMessage());
            out.print("<br>Consulta: "+st);
        } finally {
            if (st != null) {
                try {
                    st.close();
                } catch (SQLException e) {
                    out.print(e.getMessage());
                }
            }
        }
    } else {
        response.sendRedirect("../../../dashboard.jsp");
    }
%>