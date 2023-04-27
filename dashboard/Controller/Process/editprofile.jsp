<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.net.URLEncoder" %>
<%@ include file="../Connections/mysql.jsp" %>
<%
    Object idUser = session.getAttribute("idUser");
    Object password = session.getAttribute("password");
    String info = request.getParameter("formtype");
    PreparedStatement statement = null;
    if (info != null) {
        String query = null;
        boolean redirect = true;
        switch (info) {
            case "password":
                String oldPassword = request.getParameter("oldpassword");
                String newPassword = request.getParameter("newpassword");
                String newPassword2 = request.getParameter("newpassword2");
                if (oldPassword.equals(password) && newPassword.equals(newPassword2)) {
                    query = "UPDATE users SET password=AES_ENCRYPT(?, 'securiti') WHERE idUser=?";
                    statement = conn.prepareStatement(query);
                    statement.setString(1, newPassword);
                    statement.setObject(2, idUser);
                } else {
                    redirect = false;
                }
                break;
            case "name":
                String newName = request.getParameter("name");
                query = "UPDATE users SET name=? WHERE idUser=?";
                statement = conn.prepareStatement(query);
                statement.setString(1, newName);
                statement.setObject(2, idUser);
                break;
            case "username":
                String newUsername = request.getParameter("username");
                query = "UPDATE users SET username=? WHERE idUser=?";
                statement = conn.prepareStatement(query);
                statement.setString(1, newUsername);
                statement.setObject(2, idUser);
                break;
            case "email":
                String newEmail = request.getParameter("email");
                query = "UPDATE users SET email=? WHERE idUser=?";
                statement = conn.prepareStatement(query);
                statement.setString(1, newEmail);
                statement.setObject(2, idUser);
                break;
            default:
                redirect = false;
                break;
        }
        if (redirect && query != null) {
            try {
                int result = statement.executeUpdate();
                // Agregar registro en la tabla logs
                Object nameSession = session.getAttribute("name");
                String action = "<b>Actualizó</b> su información de usuario";
                String queryLogs = "INSERT INTO logs(userName, dateLog, action) VALUES (?, NOW(), ?)";
                try {
                    PreparedStatement pstLogs = conn.prepareStatement(queryLogs);
                    pstLogs.setString(1, (String)nameSession);
                    pstLogs.setString(2, action);
                    int j = pstLogs.executeUpdate();
                    session.invalidate();
                    response.sendRedirect("../../../index.jsp?error=" + URLEncoder.encode("Cerrado de Sesión Forzado por actualización de datos", "UTF-8"));
                } catch (Exception e) {
                    out.print(e);
                    out.print("<br>" + queryLogs);
                }
            } catch (Exception e) {
                out.print(e);
                out.print("<br>" + query);
            }
        } else {
            response.sendRedirect("../../../index.jsp?error=" + URLEncoder.encode("Algo salió mal", "UTF-8"));
        }
    } else {
        response.sendRedirect("../../../index.jsp?error=" + URLEncoder.encode("Algo salió mal", "UTF-8"));
    }
%>
