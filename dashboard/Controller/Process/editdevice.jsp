<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../Connections/mysql.jsp" %>
<%
    // Obtener parámetros
    String deviceType = request.getParameter("deviceType");
    String idcomp = request.getParameter("idCompany");
    String idDevice = request.getParameter("idDevice");
    String nameCompany = request.getParameter("nameCompany");
    String info = request.getParameter("formtype");

    if (deviceType.equals("workstation")) {
        // Actualizar información de la estación de trabajo
        String columnName = info;
        String newValue = request.getParameter(columnName);

        switch (info) {
            case "name":
                columnName = "name";
                break;
            case "assignedOfWorkStation":
                columnName = "assignedOfWorkStation";
                break;
            case "manufacturer":
                columnName = "manufacturer";
                break;
            case "model":
                columnName = "model";
                break;
            case "serial":
                columnName = "serial";
                break;
            case "so":
                columnName = "so";
                break;
            case "macAddress":
                columnName = "macAddress";
                break;
            case "ram":
                columnName = "ram";
                break;
            case "storage":
                columnName = "storage";
                break;
            case "typeStorage":
                columnName = "typeStorage";
                break;
            case "observations":
                columnName = "observations";
                break;
            default:
                out.print("No se encontró lo que buscaba");
                return;
        }

        // Actualizar la columna correspondiente en la base de datos
        String query = "UPDATE workstations SET " + columnName + "=?, dateReg = NOW(), username=? WHERE idWorkStations=?";
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, newValue);
            ps.setString(2, session.getAttribute("username").toString());
            ps.setString(3, idDevice);
            int i = ps.executeUpdate();

            String user = (String)session.getAttribute("name");
            String activity = "<b>Editó " + deviceType + " ("+info+")</b> con ID " + idDevice + " de la compañía " + nameCompany;
            String logQuery = "INSERT INTO logs (userName, dateLog, action) VALUES (?, NOW(), ?)";
            PreparedStatement psx = conn.prepareStatement(logQuery);
            psx.setString(1, user);
            psx.setString(2, activity);
            psx.executeUpdate();
            response.sendRedirect("../../../dashboard.jsp?idpage=dispositivos&nameCompany="+nameCompany+"&idCompany=" + idcomp + "#workstation");
        } catch (Exception e) {
            out.print(e);
            out.print("<br>"+query);
        }
    } else if (deviceType.equals("server")) {
        // Actualizar información del servidor
        String columnName = info;
        String newValue = request.getParameter(columnName);
        switch (info) {
            case "name":
                columnName = "name";
                break;
            case "usedFor":
                columnName = "usedFor";
                break;
            case "manufacturer":
                columnName = "manufacturer";
                break;
            case "model":
                columnName = "model";
                break;
            case "serial":
                columnName = "serial";
                break;
            case "so":
                columnName = "so";
                break;
            case "macAddress":
                columnName = "macAddress";
                break;
            case "ram":
                columnName = "ram";
                break;
            case "storage":
                columnName = "storage";
                break;
            case "typeStorage":
                columnName = "typeStorage";
                break;
            case "observations":
                columnName = "observations";
                break;
            default:
                out.print("No se encontró lo que buscaba");
                return;
        }
        // Actualizar la columna correspondiente en la base de datos
        String query = "UPDATE servers SET " + columnName + "=?, dateReg = NOW(), username=? WHERE idServer=?";
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, newValue);
            ps.setString(2, session.getAttribute("username").toString());
            ps.setString(3, idDevice);
            int i = ps.executeUpdate();  

            String user = (String)session.getAttribute("name");
            String activity = "<b>Editó " + deviceType + " ("+info+")</b> con ID " + idDevice + " de la compañía " + nameCompany;
            String logQuery = "INSERT INTO logs (userName, dateLog, action) VALUES (?, NOW(), ?)";
            PreparedStatement psx = conn.prepareStatement(logQuery);
            psx.setString(1, user);
            psx.setString(2, activity);
            psx.executeUpdate();
            response.sendRedirect("../../../dashboard.jsp?idpage=dispositivos&nameCompany="+nameCompany+"&idCompany=" + idcomp + "#server");
        } catch (Exception e) {
            out.print(e);
            out.print("<br>"+query);
        }
    }
%>