<%@ page import="java.sql.*" %>
<%@ include file="db.jsp" %>
<%
    // hna mni knwrk 3la  bouton "Enregistrer"
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String nom = request.getParameter("nom");
        String prenom = request.getParameter("prenom");
        int age = Integer.parseInt(request.getParameter("age"));

        // Insertion dans la base
        PreparedStatement ps = con.prepareStatement("INSERT INTO clients(nom, prenom, age) VALUES(?, ?, ?)");
        ps.setString(1, nom);
        ps.setString(2, prenom);
        ps.setInt(3, age);
        ps.executeUpdate();

        con.close();
        //rojo3 L la page principale
        response.sendRedirect("index.jsp");
    }
%>
<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <title>Ajouter Client</title>
  <link rel="stylesheet"
        href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
</head>
<body class="bg-light p-5">

<div class="container">
  <div class="card shadow col-md-6 offset-md-3">
    <div class="card-header bg-success text-white text-center">
      <h3>Ajouter un Client</h3>
    </div>
    <div class="card-body">
      <form method="post">
        <div class="form-group">
          <label><b>Nom :</b></label>
          <input type="text" name="nom" class="form-control" placeholder="Entrez le nom" required>
        </div>
        <div class="form-group">
          <label><b>Prenom :</b></label>
          <input type="text" name="prenom" class="form-control" placeholder="Entrez le prenom" required>
        </div>
        <div class="form-group">
          <label><b>Age :</b></label>
          <input type="number" name="age" class="form-control" placeholder="Entrez l'age" required>
        </div>

        <div class="text-center">
          <button type="submit" class="btn btn-success">Enregistrer</button>
          <a href="index.jsp" class="btn btn-secondary">Annuler</a>
        </div>
      </form>
    </div>
  </div>
</div>
</body>
</html>
