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
            <link href="StyleSheets/style.css" rel="stylesheet" type="text/css"/>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>DashBoard Assureur</title>
        </head>
        <body>
        <% Assureur a = AssureurJSP;%>

        <% List<Offre> listeOffreAssureur = listOffreAssureur;%>
        <% List<Courtier> listeCourtierPartenaire = ListCourtier;%>

        <h4>Bienvenue sur votre espace <%=a.getLoginUserService()%></h4>
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
              <form>
            <button class="button login__submit">
                <span class="button__text">Compte Assureur</span>
                <i class="button__icon fas fa-chevron-right"></i>
            </button>

            <input type="hidden" name="action" value="CompteAssureur">
        </form>
        <form method="get" action="AssuranceServlet">
            <input type="hidden" name="action" value="CreerOffreAssureur">
            <input type="submit" value="Créer une offre" />            
        </form>
        <form method="get" action="AssuranceServlet">
            <input type="hidden" name="action" value="Deconnexion">
            <input type="submit" value="Se deconnnecter" />   
        </form>
        <div class ="row">
            <div class ="col-md-6">
                 <div id="TableauOffresAssureur">
                    <h4 class="text-center mb-4">Vos courtiers partenaires</h4>
                    <div class="table-wrap">
                    <table class ="table">
                         <thead class="thead-primary">
                        <tr><th>Type d'Offre</th>
                            <th>Description de l'offre</th>
                            <th>Prix de l'offre</th>
                            <th>Le type de produit</th>
                        </tr>
                         </thead>
                        <tbody> 
                        <%
                            for (Offre OffrePartenaire : listeOffreAssureur) {
                        %>  <tr><td><%=OffrePartenaire.getTypeOffre()%></td>
                            <td><%=OffrePartenaire.getDescriptionOffreContractuelle()%></td>
                            <td><%=OffrePartenaire.getPrixOffre()%></td>                       
                            <td><%=OffrePartenaire.getLeTypeDeProduit().getNomTypeProduit()%></td>

                        </tr>
                        <%}%>
                        </tbody>
                    </table>
                        </div>
                </div>
            </div>

            

            <div class="col-md-6">
               <div id="TableauCourtierPartenaire">
                <h4 class="text-center mb-4">Vos courtiers partenaires</h4>
                <div class="table-wrap">
                    <table class="table">
                        <thead class="thead-primary">
                            <tr>
                                <th>Nom</th>
                                <th>Prénom</th>
                                <th>Date de naissance</th>
                                <th>Ville</th>
                                <th>Mail</th>

                            </tr>
                        </thead>
                        <tbody>
                            <%
                                for (Courtier CourtierPartenaire : listeCourtierPartenaire) {
                            %> 
                            <tr>
                                <td><%= CourtierPartenaire.getNomCourtier()%></td>
                                <td><%= CourtierPartenaire.getPrenomCourtier()%></td>
                                <td><%= CourtierPartenaire.getDateNaissanceCourtier()%></td>                       
                                <td><%= CourtierPartenaire.getVilleCourtier()%></td>
                                <td><%= CourtierPartenaire.getMailCourtier()%></td>

                            </tr>
                            <%}%>

                            
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        
</div>

</body>
</html>
