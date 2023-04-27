<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../Connections/mysql.jsp" %>
<%@ page import="java.io.*, java.util.*" %>
<%
    // Obtener parámetros
    String name = request.getParameter("name");
    String contact = request.getParameter("contact");
    String telephone = request.getParameter("telephone");
    String email = request.getParameter("email");
    String address = request.getParameter("address");
    // Obtener el usuario de la sesión
    String userName = (String) session.getAttribute("name");
    // Validación y redireccionamiento
    if (name!=null && contact!=null && telephone!=null && email!=null && address!=null) {
        // Completar el query con los valores faltantes
        String query = "INSERT INTO companies(name, contact, numertel, email, address) "+
        "VALUES (?, ?, ?, ?, ?)";
        // Ejecutar consulta en MySQL
        try {
            PreparedStatement pst = conn.prepareStatement(query);
            pst.setString(1, name);
            pst.setString(2, contact);
            pst.setString(3, telephone);
            pst.setString(4, email);
            pst.setString(5, address);
            int i = pst.executeUpdate();
            // Agregar actividad en la tabla logs
            String logQuery = "INSERT INTO logs(userName, dateLog, action) VALUES (?, NOW(), ?)";
            PreparedStatement logPst = conn.prepareStatement(logQuery);
            logPst.setString(1, userName);
            logPst.setString(2, "<b>Registró</b> una nueva empresa: " + name);
            logPst.executeUpdate();
            response.sendRedirect("../../../dashboard.jsp");
        } catch (Exception e){
            out.print(e.getMessage());
            out.print("<br>Consulta: "+query);
        }
    } else {
        response.sendRedirect("../../../dashboard.jsp");
    }
%>
