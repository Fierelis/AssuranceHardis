<%-- 
    Document   : VoirOffre
    Created on : 14 mars 2022, 16:48:21
    Author     : alex_
--%>

<%@page import="Modele.Offre"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:useBean id="Offre" scope="request" class="Modele.Offre"></jsp:useBean>

        <title>Offre</title>
    </head>
    <% Offre o= Offre;%>
    <body>
        <h1>Offre <%=o.getTypeOffre()%> </h1>
        
        <label for="PrixOffre">Description : <span class="requis"></span></label>
        <label for="PrixOffre"><%=o.getDescriptionOffreContractuelle()%> <span class="requis"></span></label>
        <br>
        <label for="PrixOffre">Raison Social de l'assureur : <span class="requis"></span></label>
        <label for="PrixOffre"><%=o.getRSAssureurPartenaire()%> <span class="requis"></span></label>
        <br>
        <label for="PrixOffre">Type de l'offre : <span class="requis"></span></label>
        <label for="PrixOffre"><%=o.getTypeOffre()%> <span class="requis"></span></label>
        <br>
        <label for="PrixOffre">Type de produit : <span class="requis"></span></label>
        <label for="PrixOffre"><%=o.getLeTypeDeProduit().getNomTypeProduit() %> <span class="requis"></span></label>
        <br>
        <label for="PrixOffre">Prix de l'offre : <span class="requis"></span></label>
        <label for="PrixOffre"><%=o.getPrixOffre()%> € <span class="requis"></span></label>
        <br>
    </body>
</html>
