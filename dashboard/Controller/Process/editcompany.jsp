<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../Connections/mysql.jsp" %>
<%
    //Conseguir Parámetros
    String idCompany = request.getParameter("idCompany");
    String info = request.getParameter("formtype");
    // Definir variable para almacenar la nueva información
    String newInfo = "";
    String query = "";

    // Actualizar la información basándose en el tipo de información proporcionada
    switch (info) {
        case "name":
            newInfo = request.getParameter("name");
            query = "UPDATE companies SET name=? WHERE idCompany=?";
            break;
        case "contact":
            newInfo = request.getParameter("contact");
            query = "UPDATE companies SET contact=? WHERE idCompany=?";
            break;
        case "telephone":
            newInfo = request.getParameter("tel");
            query = "UPDATE companies SET numerTel=? WHERE idCompany=?";
            break;
        case "email":
            newInfo = request.getParameter("email");
            query = "UPDATE companies SET email=? WHERE idCompany=?";
            break;
        case "address":
            newInfo = request.getParameter("address");
            query = "UPDATE companies SET address=? WHERE idCompany=?";
            break;
        default:
            response.sendRedirect("../../../dashboard.jsp#failed");
            return;
    }

    // Validar que se haya proporcionado la nueva información
    if (newInfo.isEmpty()) {
        response.sendRedirect("../../../dashboard.jsp#failed");
        return;
    }
    try {
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setString(1, newInfo);
        ps.setString(2, idCompany);
        int i = ps.executeUpdate();
        response.sendRedirect("../../../dashboard.jsp");
    } catch (Exception e) {
        out.print(e);
        out.print("<br>"+query);
    }
%>
