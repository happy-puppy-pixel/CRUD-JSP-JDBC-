<%@ page import="java.sql.*" %>
<%@ include file="db.jsp" %>

<%
   
    String idParam = request.getParameter("id");
    if (idParam == null || idParam.trim().isEmpty()) {
        out.println("<h3 style='color:red;'> Erreur : ID non trouvé !</h3>");
        return;
    }
    int id = Integer.parseInt(idParam);

   
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String nom = request.getParameter("nom");
        String prenom = request.getParameter("prenom");
        int age = Integer.parseInt(request.getParameter("age"));

        PreparedStatement ps = con.prepareStatement(
            "UPDATE clients SET nom=?, prenom=?, age=? WHERE id=?"
        );
        ps.setString(1, nom);
        ps.setString(2, prenom);
        ps.setInt(3, age);
        ps.setInt(4, id);
        ps.executeUpdate();

        con.close();
        response.sendRedirect("index.jsp");
        return;
    }

   
    PreparedStatement ps2 = con.prepareStatement("SELECT * FROM clients WHERE id=?");
    ps2.setInt(1, id);
    ResultSet rs = ps2.executeQuery();

    if (!rs.next()) {
        out.println("<h3 style='color:red;'> Client introuvable !</h3>");
        con.close();
        return;
    }
%>

<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <title>Modifier Client</title>
  <link rel="stylesheet"
        href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
</head>
<body class="bg-light p-5">

<div class="container">
  <div class="card shadow col-md-6 offset-md-3">
    <div class="card-header bg-warning text-white text-center">
      <h3>Modifier le Client</h3>
    </div>
    <div class="card-body">
      <form method="post">
        <div class="form-group">
          <label><b>Nom :</b></label>
          <input type="text" name="nom" class="form-control"
                 value="<%= rs.getString("nom") %>" required>
        </div>
        <div class="form-group">
          <label><b>Prenom :</b></label>
          <input type="text" name="prenom" class="form-control"
                 value="<%= rs.getString("prenom") %>" required>
        </div>
        <div class="form-group">
          <label><b>Age :</b></label>
          <input type="number" name="age" class="form-control"
                 value="<%= rs.getInt("age") %>" required>
        </div>

        <div class="text-center">
          <button type="submit" class="btn btn-warning text-white">Modifier</button>
          <a href="index.jsp" class="btn btn-secondary">Annuler</a>
        </div>
      </form>
    </div>
  </div>
</div>

</body>
</html>
