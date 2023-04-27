<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.net.URLEncoder" %>
<%@ include file="../Connections/mysql.jsp" %>

<%
    //Conseguir Parámetros
    String username = request.getParameter("username");
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String query = "INSERT INTO users (name, username, email, password, userlevel) " +
                   "VALUES (?, ?, ?, aes_encrypt(?, 'securiti'), 'default')";

    //Validación y redireccionamiento
    if (username != null && name != null && email != null && password != null){
        //MySQL
        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, name);
            ps.setString(2, username);
            ps.setString(3, email);
            ps.setString(4, password);
            int i = ps.executeUpdate();
            // Agregar registro en la tabla logs
            Object nameSession = session.getAttribute("name");
            String action = "<b>Registró</b> un nuevo usuario: " + name + " (" + username + ")";
            String queryLogs = "INSERT INTO logs(userName, dateLog, action) VALUES (?, NOW(), ?)";
            try {
                PreparedStatement pstLogs = conn.prepareStatement(queryLogs);
                pstLogs.setString(1, (String)nameSession);
                pstLogs.setString(2, action);
                int j = pstLogs.executeUpdate();
                response.sendRedirect("../../../dashboard.jsp?idpage=cuentas#users");
            } catch (Exception e) {
                out.print(e);
                out.print("<br>" + queryLogs);
            }
        } catch (SQLException e) {
            out.print(e.getMessage());
            out.print("<br>Consulta: " + query);
            response.sendRedirect("../../../dashboard.jsp?idpage=cuentas&error=Username+o+Correo+Repetido#register");
        }
    }
    else {
        response.sendRedirect("../../../dashboard.jsp?idpage=cuentas#register?error=" + URLEncoder.encode("Algún Input Estaba Vacío", "UTF-8"));
    }
%>