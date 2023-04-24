<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../Connections/mysql.jsp" %>
<%
    //Conseguir Parámetros
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String remember = request.getParameter("rememberme");
    if (username != null && password != null && !username.isEmpty() && !password.isEmpty()) { 
        // Agregamos validación para evitar valores nulos y vacíos
        try {
            String query = "SELECT idUser, name, username, email, CAST(AES_DECRYPT(password, 'securiti') AS char) 'password', userlevel " + 
                "FROM users " +
                "WHERE username=? AND password=AES_ENCRYPT(?, 'securiti')"; 
            // Usamos '?' para los parámetros en la consulta para evitar inyecciones SQL
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()){
                session.setAttribute("idUser", rs.getInt("idUser"));
                session.setAttribute("username", rs.getString("username"));
                session.setAttribute("name", rs.getString("name"));
                session.setAttribute("email", rs.getString("email"));
                session.setAttribute("userlevel", rs.getString("userlevel"));
                session.setAttribute("password", password);
                session.setMaxInactiveInterval(remember == null ? 600 : -1); 
                // Simplificamos la condición para establecer el tiempo de expiración de la sesión
                response.sendRedirect("../../../dashboard.jsp");
            }
            else {
                response.sendRedirect("../../../index.jsp?error=Usuario+o+contrase%C3%B1a+no+encontrado");
            }
        } catch (Exception e) {
            out.print("<b>Error: </b>"+e+"<br>");
        }
    }
    else {
        response.sendRedirect("../../../index.jsp");
    }
%>