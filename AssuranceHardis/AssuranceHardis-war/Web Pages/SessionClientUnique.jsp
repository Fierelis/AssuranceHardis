

<%-- 
    Document   : SessionClientUnique
    Created on : 8 mars 2022, 11:00:01
    Author     : alex_
--%>

<%@page import="Modele.UtilisateurService"%>
<%@page import="java.util.List"%>
<%@page import="Modele.Contrat"%>
<%@page import="Modele.ClientUnique"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:useBean id="ClientUnique" scope="session" class="Modele.ClientUnique"></jsp:useBean>
       <jsp:useBean id="ListeContrat" scope="request" class="java.util.List"></jsp:useBean> 
       <link href="StyleSheets/style.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
   <header class ="header1">
        <div class = "" id = "navbar">
            <nav class="navbar navbar-expand-lg">
               <img src = "img/sobrero.png" style = "height : 70px">  </img>
                <a class="navbar-brand" href="#">Sombrero</a>
        <%ClientUnique ClientU = ClientUnique;

        %>
               
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav" style="display: flex; justify-content: flex-end">
                    <ul class="navbar-nav">

                        <li> <form> <button type="submit" class="form-control btn1 btn1-primary submit px-3">home</button>
                            <input type="hidden" name="action" value="home"></form></li>
                        <li> <form> <button type="submit" class="form-control btn1 btn1-primary submit px-3">Rechercher une offre</button>
                            <input type="hidden" name="action" value="RechercherOffre"></form></li>
                        
                            <li> <form> <button type="submit" class="form-control btn1 btn1-primary submit px-3">Mon compte</button>
                            <input type="hidden" name="action" value="CompteClient"></form></li>
                        <li> <form> <button type="submit" class="form-control btn1 btn1-primary submit px-3">Se déconnecter</button>
                            <input type="hidden" name="action" value="Deconnexion"></form></li>
                    </ul>
                </div>
            </nav>
        </div>
            
            
        </header>
        
        <body>
        
        <h1 class="text-center mb-4" >Bonjour <%=ClientU.getPrenom()%></h1>
        
        <div id="TableauAssureursPartenaires">
               <div class ="row justify-content-center">
            <div class ="col-md-12">
                 <div id="TableauAssureursPartenaires">
                    <h4 class="text-center mb-4">Mes Contrats en cours</h4>
                    <div class="table-wrap">
                    <table class ="table">
                         <thead class="thead-primary">
                        <tr><th>Assureur</th>
                            <th>Type de contrat</th>
                            <th>Produit</th>
                            <th>Date de souscription</th>
                            <th>Durée de couverture</th>
                        </tr>
                         </thead>
                        <tbody> 
                      <% 
                       List<Contrat> ListeContrats = ListeContrat;
                       if (!ListeContrats.isEmpty()){
                        for(Contrat ContratSouscrits : ListeContrats){
                        %>  <tr>
                            <td><%=ContratSouscrits.getLoffreDuContrat().getLAssurance().getRaisonSocialeAssureur() %></td>
                            <td><%=ContratSouscrits.getLoffreDuContrat().getTypeOffre() %></td>
                            <td><%=ContratSouscrits.getLoffreDuContrat().getLeTypeDeProduit().getNomTypeProduit() %></td>
                            <td><%=ContratSouscrits.getDateContrat() %></td>
                            <td><%=ContratSouscrits.getDureeContrat()+" mois"%></td>
                           
                            <td>
                                <form>
                                    <button class="form-control btn1 btn1-primary submit px-3" name="contrat" value="<%=ContratSouscrits.getId()%>">Résilier</button> 
                                    <input type="hidden" name="action" value="ResilierContratClient">
                                </form>
                            </td>
                            
                            <td>
                                <form>
                                    <button class="form-control btn1 btn1-primary submit px-3" download='C:\\Users\\alex_\\Downloads\\FactureContrat_"+ RSAssureur +".pdf' name="IdContrat" value="<%=ContratSouscrits.getId()%>">Télécharger Facture</button> 
                                    <input type="hidden" name="action" value="printClient">
                                </form>
                            </td>  
                            
                            </tr>
                       <%   }
                        }
                        else { %>
                        <tr>
                        <td>No data</td>
                        <td>No data</td>
                        <td>No data</td>
                        <td>No data</td>
                        <td>No data</td>
                        </tr>
                        <%}
                       
                       %>
                        </tbody>
                    </table>
                        </div>
                </div>
            </div>
               </div>
           
        </div>
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
    </body>
    
</html>