<%-- 
    Document   : SessionAssureur
    Created on : 8 mars 2022, 11:01:00
    Author     : alex_
--%>

<%@page import="Modele.Courtier"%>
<%@page import="Modele.Offre"%>
<%@page import="java.util.List"%>
<%@page import="Modele.Assureur"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:useBean id="AssureurJSP" scope="request" class="Modele.Assureur"></jsp:useBean>
        <jsp:useBean id="ListeAllOffre" scope="request" class="java.util.List"></jsp:useBean>
        <jsp:useBean id="ListCourtier" scope="request" class="java.util.List"></jsp:useBean>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DashBoard Assureur</title>
    </head>
    <body>
         <% Assureur a= AssureurJSP;%>
         <% List<Offre> listeOffre= ListeAllOffre;%>
         <% List<Courtier> listeCourtier= ListCourtier;%>
         
        <h1>Bienvenue sur votre espace <%=a.getLoginUserService() %></h1>
        
        <select name="Affichage">                  
            <option value ="Petite">Afficher les offres de contrats disponible</option>   
            <option value ="Moyenne">Afficher les courtiers partenaires</option>   
            <option value ="Grande">Afficher les clients souscripteurs</option>   
        </select><br />   
        
    </body>
</html>
