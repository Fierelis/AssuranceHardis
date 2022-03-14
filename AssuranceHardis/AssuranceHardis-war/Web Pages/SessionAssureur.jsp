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
        <jsp:useBean id="listOffreAssureur" scope="request" class="java.util.List"></jsp:useBean>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DashBoard Assureur</title>
    </head>
    <body>
         <% Assureur a= AssureurJSP;%>
         <% List<Offre> listeOffre= ListeAllOffre;%>
         <% List<Offre> listeOffreAssureur= listOffreAssureur;%>
         
        <h1>Bienvenue sur votre espace <%=a.getLoginUserService()%></h1>
        
         
        
        <form method="get" action="AssuranceServlet">
            <input type="hidden" name="action" value="CreerOffreAssureur">
            <input type="submit" value="Créer une offre" />            
        </form>
        <form method="get" action="AssuranceServlet">
            <input type="hidden" name="action" value="Deconnexion">
            <input type="submit" value="Se deconnnecter" />   
        </form>
        
        <div id="TableauOffres">
            <h2>Totalités des offre</h2>
            <table>
                <tr><td>Type d'Offre</td>
                    <td>Description de l'offre</td>
                    <td>Prix de l'offre</td>
                    <td>Le type de produit</td>
                </tr>
                    <% 
                       List<Offre> ListeFiltreeOffres=listeOffre;
                        for(Offre OffrePartenaire : ListeFiltreeOffres){
                    %>  <tr><td><%=OffrePartenaire.getTypeOffre() %></td>
                            <td><%=OffrePartenaire.getDescriptionOffreContractuelle()%></td>
                            <td><%=OffrePartenaire.getPrixOffre() %></td>                       
                            <td><%=OffrePartenaire.getLeTypeDeProduit().getNomTypeProduit() %></td>
                            
                        </tr>
                       <%}%>
            </table><br>
        </div>
            
            <div id="TableauOffresAssureur">
            <h2>Totalités des offre</h2>
            <table>
                <tr><td>Type d'Offre</td>
                    <td>Description de l'offre</td>
                    <td>Prix de l'offre</td>
                    <td>Le type de produit</td>
                </tr>
                    <% 
                       List<Offre> ListeOffreAssureur=listeOffreAssureur;
                        for(Offre OffrePartenaire : ListeOffreAssureur){
                    %>  <tr><td><%=OffrePartenaire.getTypeOffre() %></td>
                            <td><%=OffrePartenaire.getDescriptionOffreContractuelle()%></td>
                            <td><%=OffrePartenaire.getPrixOffre() %></td>                       
                            <td><%=OffrePartenaire.getLeTypeDeProduit().getNomTypeProduit() %></td>
                            
                        </tr>
                       <%}%>
            </table>
        </div>
        
    </body>
</html>
