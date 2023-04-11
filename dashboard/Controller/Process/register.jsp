<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../Connections/mysql.jsp" %>
<%
    //Conseguir Parámetros
    String username = request.getParameter("username");
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String query = "INSERT INTO usuarios (name, username, email, password, userlevel) "+
    "VALUES ('"+name+"','"+username+"', '"+email+"', aes_encrypt('"+password+"', 'securiti'), 'default')";
    //Validación y redireccionamiento
    if (username!="null" && name!="null" && email!="null" && password!="null"){
        //MySQL
        try {
            Statement st = null;
            st = conn.createStatement();
            int i = st.executeUpdate(query);
            response.sendRedirect("../../../dashboard.jsp?idpage=cuentas#success");
        } catch (Exception e){
            out.print(e.getMessage());
            out.print("<br>Consulta: "+query);
        }
    }
    else {
        response.sendRedirect("../../index.jsp");
    }
%>