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
        <jsp:useBean id="AssureurJSP" scope="session" class="Modele.Assureur"></jsp:useBean>
        <jsp:useBean id="listOffreAssureur" scope="request" class="java.util.List"></jsp:useBean>
        <jsp:useBean id="ListCourtier" scope="request" class="java.util.List"></jsp:useBean>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DashBoard Assureur</title>
    </head>
    <body>
         <% Assureur a= AssureurJSP;%>
         
         <% List<Offre> listeOffreAssureur= listOffreAssureur;%>
         <% List<Courtier> listeCourtierPartenaire= ListCourtier;%>
         
        <h1>Bienvenue sur votre espace <%=a.getLoginUserService()%></h1>
        <form>
        <button class="button login__submit">
            <span class="button__text">Home</span>
            <i class="button__icon fas fa-chevron-right"></i>
	</button>
            
              <input type="hidden" name="action" value="home">
        </form>
        
         <form method="get" action="AssuranceServlet">
            <input type="hidden" name="action" value="RechercherOffre">
            <input type="submit" value="Les Offres" />            
        </form>
        
        <form method="get" action="AssuranceServlet">
            <input type="hidden" name="action" value="CreerOffreAssureur">
            <input type="submit" value="Créer une offre" />            
        </form>
        <form method="get" action="AssuranceServlet">
            <input type="hidden" name="action" value="Deconnexion">
            <input type="submit" value="Se deconnnecter" />   
        </form>
        
            
            <div id="TableauOffresAssureur">
            <h2>Totalités des offre de l'assureur</h2>
            <table>
                <tr><td>Type d'Offre</td>
                    <td>Description de l'offre</td>
                    <td>Prix de l'offre</td>
                    <td>Le type de produit</td>
                </tr>
                    <% 
                        for(Offre OffrePartenaire : listeOffreAssureur){
                    %>  <tr><td><%=OffrePartenaire.getTypeOffre() %></td>
                            <td><%=OffrePartenaire.getDescriptionOffreContractuelle()%></td>
                            <td><%=OffrePartenaire.getPrixOffre() %></td>                       
                            <td><%=OffrePartenaire.getLeTypeDeProduit().getNomTypeProduit() %></td>
                            
                        </tr>
                       <%}%>
            </table>
        </div>
            
            
        </div>
            
            <div id="TableauCourtierPartenaire">
            <h2>Totalités des courtier partenaires</h2>
            <table>
                <tr><td>Nom</td>
                    <td>Prenom</td>
                    <td>Date de naissance</td>
                    <td>Ville</td>
                    <td>Mail</td>
                </tr>
                    <% 
                        for(Courtier CourtierPartenaire : listeCourtierPartenaire){
                    %>  <tr><td><%= CourtierPartenaire.getNomCourtier() %></td>
                            <td><%= CourtierPartenaire.getPrenomCourtier() %></td>
                            <td><%= CourtierPartenaire.getDateNaissanceCourtier()  %></td>                       
                            <td><%= CourtierPartenaire.getVilleCourtier() %></td>
                            <td><%= CourtierPartenaire.getMailCourtier() %></td>
                            
                        </tr>
                       <% } %>
            </table>
        </div>
        
    </body>
</html>
