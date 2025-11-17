<%@ page import="java.sql.*" %>
<%@ include file="db.jsp" %>

<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <title>Gestion des Clients</title>
  <link rel="stylesheet"
        href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
</head>
<body class="bg-light p-5">

<div class="container">
  <div class="card shadow">
    <div class="card-header bg-primary text-white text-center">
      <h3>Liste des Clients</h3>
    </div>
    <div class="card-body">
      <!-- hna fin kndiro recherche -->
      <form class="form-inline mb-3" method="get" action="index.jsp">
        <input type="text" name="key" class="form-control mr-2"
               value="<%= request.getParameter("key")==null?"":request.getParameter("key") %>"
               placeholder="Rechercher par nom ou prénom...">
        <button type="submit" class="btn btn-primary">Chercher</button>
        <a href="add.jsp" class="btn btn-success ml-2">+ Ajouter</a>
      </form>

      <!-- hna Tableau -->
      <table class="table table-bordered table-striped text-center">
        <thead class="thead-dark">
          <tr>
            <th>ID</th>
            <th>Nom</th>
            <th>Prenom</th>
            <th>Age</th>
            <th>Actions</th>
          </tr>
        </thead>
        <tbody>
          <%
            String key = request.getParameter("key");
            PreparedStatement ps;
            if (key != null && !key.trim().isEmpty()) {
              ps = con.prepareStatement("SELECT * FROM clients WHERE nom LIKE ? OR prenom LIKE ?");
              ps.setString(1, "%" + key + "%");
              ps.setString(2, "%" + key + "%");
            } else {
              ps = con.prepareStatement("SELECT * FROM clients");
            }
            ResultSet rs = ps.executeQuery();
            boolean vide = true;
            while (rs.next()) {
              vide = false;
          %>
          <tr>
            <td><%= rs.getInt("id") %></td>
            <td><%= rs.getString("nom") %></td>
            <td><%= rs.getString("prenom") %></td>
            <td><%= rs.getInt("age") %></td>
            <td>
              <a href="edit.jsp?id=<%= rs.getInt("id") %>" class="btn btn-warning btn-sm">Modifier</a>
              <a href="delete.jsp?id=<%= rs.getInt("id") %>"
                 class="btn btn-danger btn-sm"
                 onclick="return confirm('Supprimer ce client ?')">Supprimer</a>
            </td>
          </tr>
          <%
            }
            if (vide) {
          %>
          <tr><td colspan="5" class="text-center text-muted">Aucun client trouvé</td></tr>
          <%
            }
            con.close();
          %>
        </tbody>
      </table>
    </div>
  </div>
</div>

</body>
</html>
