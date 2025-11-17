<%@ page import="java.sql.*" %>
<%
try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    out.println("<h3 style='color:green;'>✅ Driver MySQL chargé avec succès !</h3>");
} catch (Exception e) {
    out.println("<h3 style='color:red;'>❌ Erreur : " + e.getMessage() + "</h3>");
}
%>
