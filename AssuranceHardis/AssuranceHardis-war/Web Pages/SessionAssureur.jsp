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
        <jsp:useBean id="Assureur" scope="session" class="Modele.Assureur"></jsp:useBean>
        <jsp:useBean id="listOffreAssureur" scope="request" class="java.util.List"></jsp:useBean>
        <jsp:useBean id="ListCourtier" scope="request" class="java.util.List"></jsp:useBean>
            <link href="StyleSheets/style.css" rel="stylesheet" type="text/css"/>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>DashBoard Assureur</title>
        </head>
        <header class ="header1">
        <div class = "" id = "navbar">
            <nav class="navbar navbar-expand-lg">
                <img src = "img/sobrero.png" style = "height : 70px">  </img>
                <a class="navbar-brand" href="#">Sombrero</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav" style="display: flex; justify-content: flex-end">
                    <ul class="navbar-nav">

                        <li> <form> <button type="submit" class="form-control btn1 btn1-primary submit px-3">home</button>
                            <input type="hidden" name="action" value="home"></form></li>
                        <li> <form> <button type="submit" class="form-control btn1 btn1-primary submit px-3">Recherche</button>
                            <input type="hidden" name="action" value="RechercherOffre"></form></li>
                        <li> <form> <button type="submit" class="form-control btn1 btn1-primary submit px-3">Créer une offre</button>
                            <input type="hidden" name="action" value="CreerOffreAssureur"></form></li>
                        <li> <form> <button type="submit" class="form-control btn1 btn1-primary submit px-3">Se déconnecter</button>
                            <input type="hidden" name="action" value="Deconnexion"></form></li>
                    </ul>
                </div>
            </nav>
        </div>
            
            
        </header>

        <body>
        <% Assureur a = Assureur;%>

        <% List<Offre> listeOffreAssureur = listOffreAssureur;%>
        <% List<Courtier> listeCourtierPartenaire = ListCourtier;%>

        <h4>Bienvenue sur votre espace <%=a.getLoginUserService()%></h4>
        
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
 <footer class="footer-1">
          
          <div class="container">
            <div class="row">
              <div class="col-md-4 pr-md-5">
                <a href="#" class="footer-site-logo d-block mb-4">Sombrero</a>
                <p>Comparateur d'assurance depuis approximativement 2 semaines / situé nul part car l'appli est trash</p>
              </div>
              <div class="col-md">
                <ul class="list-unstyled nav-links">
                  <li><a href="#">Home</a></li>
                  <li><a href="#">A propos</a></li>
                  <li><a href="#"></a></li>
                  <li><a href="#"></a></li>
                  <li><a href="#">Contact</a></li>
                </ul>
              </div>
              <div class="col-md">
                <ul class="list-unstyled nav-links">
                  <li><a href="#">Nos clients</a></li>
                  <li><a href="#">Nos courtiers</a></li>
                  <li><a href="#">Nos assureurs</a></li>
                  <li><a href="#">Nos avantages</a></li>
                  <li><a href="#">Actus</a></li>
                </ul>
              </div>
              <div class="col-md">
                <ul class="list-unstyled nav-links">
                  <li><a href="#">Privacy Policy</a></li>
                  <li><a href="#">Terms &amp; Conditions</a></li>
                  <li><a href="#">Partners</a></li>
                </ul>
              </div>
              <div class="col-md text-md-center">
                <ul class="social list-unstyled">
                  <li><a href="#"><span class="icon-instagram"></span></a></li>
                  <li><a href="#"><span class="icon-twitter"></span></a></li>
                  <li><a href="#"><span class="icon-facebook"></span></a></li>
                  <li><a href="#"><span class="icon-pinterest"></span></a></li>
                  <li><a href="#"><span class="icon-dribbble"></span></a></li>
                </ul>
                <p class=""><a href="#" class="btn btn-tertiary">Contactez-nous :)</a></p>
              </div>
            </div> 
    
            <div class="row ">
              <div class="col-12 text-center">
                <div class="copyright mt-5 pt-5">
                  <p><small>&copy; 2022 All Rights Reserved.</small></p>
                </div>
              </div>
            </div> 
          </div>
          
        </footer>
</html>
