<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page language="java" import="java.sql.*" %>
<%
    /*connetion sera nuestra conexion a la bd*/
    Connection conn = null;

    /*parametros para la conexion*/
    String driver = "com.mysql.jdbc.Driver";
    String url = "jdbc:mysql://localhost:3306/securiti1_sistema";
    String usuario = "securiti1";
    String clave = "YBb+68GFw=";
    
    /*procedimiento de la conexión*/
    try{
        Class.forName(driver);
        conn = DriverManager.getConnection(url, usuario, clave);
    } catch (Exception conx){
        out.print(conx+"<br>");
    }
%>