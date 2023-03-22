<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../Connections/mysql.jsp" %>
<%
    //Conseguir Parámetros
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String remember = request.getParameter("rememberme");
    //Validación y redireccionamiento
    if (username!="null" && password!="null"){
        //MySQL
        try {
            PreparedStatement ps = null;
            ResultSet rs = null;
            String query = "SELECT name, username, email, CAST(AES_DECRYPT(password, 'securiti') AS char) 'password', userlevel " + 
            "FROM usuarios "+
            "WHERE username='"+username+"' AND password=AES_ENCRYPT('"+password+"', 'securiti')";
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            if (rs.next()){
                session.setAttribute("username", rs.getString("username"));
                session.setAttribute("name", rs.getString("name"));
                session.setAttribute("email", rs.getString("email"));
                session.setAttribute("userlevel", rs.getString("userlevel"));
                if (remember=="null"){
                    session.setMaxInactiveInterval(600);
                }
                else {
                    session.setMaxInactiveInterval(-1);
                }
                response.sendRedirect("../../dashboard.jsp");
            }
            else {
                /*
                request.setAttribute("errorMsg", "Usuario o contraseña no encontrado");
                RequestDispatcher rd = request.getRequestDispatcher("/");
                rd.forward(request, response);
                */
                response.sendRedirect("../../index.jsp?error=Usuario+o+contrase%C3%B1a+no+encontrado");
            }
        } catch (Exception e){
            out.print("<b>Error: </b>"+e+"<br>");
        }
    }
    else {
        response.sendRedirect("../../index.jsp");
    }
%>