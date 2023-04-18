<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../Connections/mysql.jsp" %>
<%
    //Conseguir Parámetros
    Object idUser = request.getParameter("idusuario");
    String info = request.getParameter("formtype");
    if (info.equals("password")){
        String newpassword = request.getParameter("newpassword");
        String newpassword2 = request.getParameter("newpassword2");
        String query = "UPDATE users SET password=AES_ENCRYPT('"+newpassword+"', 'securiti') WHERE idUser="+idUser;
        if (newpassword.equals(newpassword2)){
            try {
                Statement st = null;
                st = conn.createStatement();
                int i = st.executeUpdate(query);
                response.sendRedirect("../../../dashboard.jsp?idpage=cuentas");
            } catch (Exception e) {
                out.print(e);
                out.print("<br>"+query);
            }
        }
        else {
            response.sendRedirect("../../../dashboard.jsp?idpage=cuentas");
        }
    }
    else if (info.equals("name")) {
        String namenew = request.getParameter("name");
        String query = "UPDATE users SET name='"+namenew+"' WHERE idUser="+idUser;
        try {
            Statement st = null;
            st = conn.createStatement();
            int i = st.executeUpdate(query);
            response.sendRedirect("../../../dashboard.jsp?idpage=cuentas");
        } catch (Exception e) {
            out.print(e);
            out.print("<br>"+query);
        }
    }
    else if (info.equals("username")) {
        String unamenew = request.getParameter("username");
        String query = "UPDATE users SET username='"+unamenew+"' WHERE idUser="+idUser;
        try {
            Statement st = null;
            st = conn.createStatement();
            int i = st.executeUpdate(query);
            response.sendRedirect("../../../dashboard.jsp?idpage=cuentas");
        } catch (Exception e) {
            out.print(e);
            out.print("<br>"+query);
        }
    }
    else if (info.equals("email")) {
        String emailnew = request.getParameter("email");
        String query = "UPDATE users SET email='"+emailnew+"' WHERE idUser="+idUser;
        try {
            Statement st = null;
            st = conn.createStatement();
            int i = st.executeUpdate(query);
            response.sendRedirect("../../../dashboard.jsp?idpage=cuentas");
        } catch (Exception e) {
            out.print(e);
            out.print("<br>"+query);
        }
    }
    else if (info.equals("userlevel")) {
        String userlevelnew = request.getParameter("userlevel");
        String query = "UPDATE users SET userlevel='"+userlevelnew+"' WHERE idUser="+idUser;
        try {
            Statement st = null;
            st = conn.createStatement();
            int i = st.executeUpdate(query);
            response.sendRedirect("../../../dashboard.jsp?idpage=cuentas");
        } catch (Exception e) {
            out.print(e);
            out.print("<br>"+query);
        }
    }
    else
        response.sendRedirect("../../../dashboard.jsp?idpage=cuentas#failed");

%>