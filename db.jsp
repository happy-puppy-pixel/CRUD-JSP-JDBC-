<%@ page import="java.sql.*" %>
<%
String url = "jdbc:mysql://localhost:3306/clientdb?useSSL=false&serverTimezone=UTC";
String user = "root";      
String password = "";
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection(url, user, password);
%>
