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

    // Validación y redireccionamiento
    if (name!=null && contact!=null && telephone!=null && email!=null && address!=null) {
        // Completar el query con los valores faltantes
        String query = "INSERT INTO companies(name, contact, numertel, email, address) "+
        "VALUES ('"+name+"', '"+contact+"', '"+telephone+"', '"+email+"', '"+address+"')";

        // Ejecutar consulta en MySQL
        try {
            Statement st = null;
            st = conn.createStatement();
            int i = st.executeUpdate(query);
            response.sendRedirect("../../../dashboard.jsp");
        } catch (Exception e){
            out.print(e.getMessage());
            out.print("<br>Consulta: "+query);
        }
    } else {
        String query = "INSERT INTO companies(name, contact, numertel, email, address)"+
        "values ('"+name+"', '"+contact+"', '"+telephone+"', '"+email+"', '"+address+"')";
        out.print("<br>Consulta: "+query);
    }
%>