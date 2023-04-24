<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../Connections/mysql.jsp" %>
<%
    // Obtener parámetros
    String idUser = request.getParameter("idusuario");
    String info = request.getParameter("formtype");

    // Definir variables para los campos a actualizar
    String field = "";
    String newValue = "";

    // Actualizar la información basándose en el tipo de información proporcionada
    switch (info) {
        case "password":
            String newPassword = request.getParameter("newpassword");
            String newPassword2 = request.getParameter("newpassword2");
            if (newPassword.equals(newPassword2)) {
                field = "password";
                newValue = "AES_ENCRYPT(?, 'securiti')";
            } else {
                response.sendRedirect("../../../dashboard.jsp?idpage=cuentas#users");
            }
            break;

        case "name":
            field = "name";
            newValue = "?";
            break;

        case "username":
            field = "username";
            newValue = "?";
            break;

        case "email":
            field = "email";
            newValue = "?";
            break;

        case "userlevel":
            field = "userlevel";
            newValue = "?";
            break;

        default:
            response.sendRedirect("../../../dashboard.jsp?idpage=cuentas#users");
            break;
    }

    // Actualizar la base de datos
    if (!field.isEmpty()) {
        String query = "UPDATE users SET " + field + "=" + newValue + " WHERE idUser=?";
        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, request.getParameter(field));
            ps.setString(2, idUser);
            ps.executeUpdate();
        } catch (Exception e) {
            out.print(e);
        }
    }

    response.sendRedirect("../../../dashboard.jsp?idpage=cuentas#users");
%>
