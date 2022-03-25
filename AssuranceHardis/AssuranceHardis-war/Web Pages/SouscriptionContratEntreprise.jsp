
<%-- 
    Document   : SouscriptionContrat
    Created on : 15 mars 2022, 16:58:15
    Author     : alex_
--%>

<%@page import="Modele.Offre"%>
<%@page import="Modele.Entreprise"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:useBean id="ContratJSP" scope="request" class="Modele.Offre"></jsp:useBean>
         <jsp:useBean id="EntrepriseJSP" scope="request" class="Modele.Entreprise"></jsp:useBean>
         <link href="StyleSheets/style.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
     <header class ="header1">
          <%    Entreprise Boite = EntrepriseJSP;
                      Offre offer = ContratJSP;   %>
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
                         <li> <form> <button type="submit" class="form-control btn1 btn1-primary submit px-3">Mon Compte</button>
                            <input type="hidden" name="action" value="CompteEntreprise"></form></li>
                        <li> <li> <form> <button type="submit" class="form-control btn1 btn1-primary submit px-3">Se déconnecter</button>
                            <input type="hidden" name="action" value="Deconnexion"></form></li>
                    </ul>
                </div>
            </nav>
        </div>
            
            
        </header>
    <body>
        <div class="row justify-content-center">
            <div class="col-md-12 col-lg-10">
                <form class="signin-form">
                    <div class="wrap d-md-flex">
                        
                        <div class="text-wrapp p-4 p-lg-5">
                             <div class="d-flex">
                                    <div class="w-100">
                                        <h3 class="mb-4">Confirmer la souscription</h3>
                                        <h3 class="mb-4">Vos infos</h3>
                                    </div>

                                </div>

                            <label class="label"  for='mail'>Adresse contact</label>
                            <input type='text' class="form-control" name='mail' readonly='readonly' value='<%=Boite.getMail() %>'>

                            <label class="label" for='mail'>Raison sociale</label>
                            <input type='text' class="form-control" name='NomEntreprise' readonly='readonly' value='<%=Boite.getRaisonSocialeEntreprise() %>'>

                            <label class="label" for='mail'>Siège social</label>
                            <input type='text'  class="form-control" name='Siège social' readonly='readonly' value='<%=Boite.getSiegeSocialEntreprise() %>'>     
                           
                            <input type='hidden' name='numEntreprise' value='<%=Boite.getId() %>'>


                        </div>
                        <div class="text-wrapp p-4 p-lg-5">
 <div class="d-flex">
                                    <div class="w-100">
                                        <h3 class="mb-4">Infos contrat</h3>
                                    </div>

                                </div>


                            <label class="label" for='assureur'>Assureur</label>
                            <input type='text' class="form-control" name='assureur' readonly='readonly' value='<%=offer.getLAssurance().getRaisonSocialeAssureur() %>'>

                            <label class="label" for='Produit'>Produit</label>
                            <input type='text' class="form-control" name='Produit' readonly='readonly' value='<%=offer.getLeTypeDeProduit().getNomTypeProduit()%>'>

                            <label class="label" for='typeoffre'>Offre</label>
                            <input type='text' class="form-control" name='typeoffre' readonly='readonly' value='<%=offer.getTypeOffre()%>'>

                            <label class="label" for='description'>Description Contrat</label>
                            <input type='text' class="form-control" name='description' readonly='readonly' value='<%=offer.getDescriptionOffreContractuelle()%>'> 

                            <label class="label" for='Prix'>Prix</label>
                            <input type='text' class="form-control" name='Prix' readonly='readonly' value='<%=offer.getPrixOffre()%>'> 

                            <input type='hidden' name='numOffre' value='<%=offer.getId()%>'>

                            <label class="label" for='set'>Durée de souscription au contrat : </label>
                            <select class="js-multiple-select form-control" name='combo'>
                                <option name='combo' value='6'>6 mois</option>
                                <option name='combo' value='12'>12 mois</option>
                                <option name='combo' value='24'>24 mois</option>
                            </select>


                                    <div class ="row justify content-center">
                            <input type='hidden' name='action' value='validerSouscription'>
                            <button type="submit" class="form-control btn btn-primary submit px-3" name='Souscrire' value='Souscrire'>Valider la Souscription</button>
                                    </div>

                        </div>
                </form>
            </div>
        </div>
        </div>

<footer class="footer-1">
          
          <div class="container">
            <div class="row">
              <div class="col-md-4 pr-md-5">
                <a href="#" class="footer-site-logo d-block mb-4">Sombrero</a>
                <p>Comparateur d'assurance</p>
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
