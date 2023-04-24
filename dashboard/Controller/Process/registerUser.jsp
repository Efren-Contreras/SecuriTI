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
            response.sendRedirect("../../../dashboard.jsp?idpage=cuentas#users");
        } catch (SQLException e) {
            out.print(e.getMessage());
            out.print("<br>Consulta: " + query);
        }
    }
    else {
        response.sendRedirect("../../../dashboard.jsp?idpage=cuentas#register?error=" + URLEncoder.encode("Algún Input Estaba Vacío", "UTF-8"));
    }
%>