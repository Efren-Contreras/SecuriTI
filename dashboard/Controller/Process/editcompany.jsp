<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../Connections/mysql.jsp" %>
<%
    //Conseguir Parámetros
    Object idCompany = request.getParameter("idCompany");
    String info = request.getParameter("formtype");
    if (info.equals("name")){
        String namenew = request.getParameter("name");
        String query = "UPDATE companies SET name='"+namenew+"' WHERE idCompany="+idCompany;
        try {
            Statement st = null;
            st = conn.createStatement();
            int i = st.executeUpdate(query);
            response.sendRedirect("../../../dashboard.jsp");
        } catch (Exception e) {
            out.print(e);
            out.print("<br>"+query);
        }
    }
    else if (info.equals("contact")) {
        String contactnew = request.getParameter("contact");
        String query = "UPDATE companies SET contact='"+contactnew+"' WHERE idCompany="+idCompany;
        try {
            Statement st = null;
            st = conn.createStatement();
            int i = st.executeUpdate(query);
            response.sendRedirect("../../../dashboard.jsp");
        } catch (Exception e) {
            out.print(e);
            out.print("<br>"+query);
        }
    }
    else if (info.equals("telephone")) {
        String telnew = request.getParameter("tel");
        String query = "UPDATE companies SET numerTel='"+telnew+"' WHERE idCompany="+idCompany;
        try {
            Statement st = null;
            st = conn.createStatement();
            int i = st.executeUpdate(query);
            response.sendRedirect("../../../dashboard.jsp");
        } catch (Exception e) {
            out.print(e);
            out.print("<br>"+query);
        }
    }
    else if (info.equals("email")) {
        String emailnew = request.getParameter("email");
        String query = "UPDATE companies SET email='"+emailnew+"' WHERE idCompany="+idCompany;
        try {
            Statement st = null;
            st = conn.createStatement();
            int i = st.executeUpdate(query);
            response.sendRedirect("../../../dashboard.jsp");
        } catch (Exception e) {
            out.print(e);
            out.print("<br>"+query);
        }
    }
    else if (info.equals("address")) {
        String addressnew = request.getParameter("address");
        String query = "UPDATE companies SET address='"+addressnew+"' WHERE idCompany="+idCompany;
        try {
            Statement st = null;
            st = conn.createStatement();
            int i = st.executeUpdate(query);
            response.sendRedirect("../../../dashboard.jsp");
        } catch (Exception e) {
            out.print(e);
            out.print("<br>"+query);
        }
    }
    else
        response.sendRedirect("../../../dashboard.jsp#failed");

%>