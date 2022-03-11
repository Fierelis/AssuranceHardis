<%-- 
    Document   : SessionEntreprise
    Created on : 8 mars 2022, 11:00:15
    Author     : alex_
--%>

<%@page import="Modele.Entreprise"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:useBean id="Entreprise" scope="request" class="Modele.Entreprise"></jsp:useBean>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dashboard Client</title>
    </head>
    <body>
        <% Entreprise e= Entreprise;%>
        <h1>Bienvenue sur votre espace <%= e.getNom()%> </h1>
        
        <form method="get" action="AssuranceServlet">
            <input type="hidden" name="action" value="RechercherOffre">
            <input type="submit" value="Rechercher une nouvelle offre" />            
        </form>
        <form method="get" action="AssuranceServlet">
            <input type="hidden" name="action" value="Deconnexion">
            <input type="submit" value="Se deconnnecter" />         
        </form>
    </body>
</html>
