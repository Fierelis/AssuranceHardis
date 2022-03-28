
<%-- 
    Document   : CreerOffreCourtier
    Created on : 10 mars 2022, 09:46:21
    Author     : alexa
--%>

<%@page import="Modele.Courtier"%>
<%@page import="Modele.Offre"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <jsp:useBean id="OffreJSP" scope="request" class="Modele.Offre"></jsp:useBean>
         <jsp:useBean id="Courtier" scope="request" class="Modele.Courtier"></jsp:useBean>
         <link href="StyleSheets/style.css" rel="stylesheet" type="text/css"/>
        <title>Creation d'offre</title>

    </head>
    <header class ="header1">
        <div class = "" id = "navbar">
            <nav class="navbar navbar-expand-lg">
               <img src = "img/sobrero.png" style = "height : 30px">  </img>
                <a class="navbar-brand" href="#">Sombrero</a>
               
                  <%Offre offer = OffreJSP;
            Courtier cour = Courtier;%>
                <!-- <img src = ".jpg" style = "height : 70px">  </img> -->
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
                            <input type="hidden" name="action" value="CreerOffreCourtier"></form></li>
                            <li> <form> <button type="submit" class="form-control btn1 btn1-primary submit px-3">CompteCourtier</button>
                            <input type="hidden" name="action" value="CompteCourtier"></form></li>
                        <li> <form> <button type="submit" class="form-control btn1 btn1-primary submit px-3">Se déconnecter</button>
                            <input type="hidden" name="action" value="Deconnexion"></form></li>
                    </ul>
                </div>
                
            </nav>
        </div>
            
            
        </header>
    <body>
      
<section class="ftco-section">

                <div class="container">
                    
                    <div class="row justify-content-center">
                         <div class="text-wrapp p-4 p-lg-5">
                        <div class="col-md-12 col-lg-10" style = "width :100%">
                            <form class="signin-form">
          
  
     
      <!--  <form method="get" action="AssuranceServlet"> -->
            
                <legend>Informations Offre</legend>     
                <label class="label" for="TypeOffre">Type d'offre : </label>
                <input class="form-control" type="text" name="TypeOffre" readonly='readonly' value="<%=offer.getTypeOffre() %>">     
                
                <input class="label" type="hidden" name="courtier" readonly='readonly' value="<%=cour.getId() %>">
                <input class="form-control" type="hidden" name="assureur" readonly='readonly' value="<%=offer.getLAssurance().getId() %>">       
                       
                <label class="label" for="TypeProduit">Type de produit :</label>
                <input class="form-control" name="TypeProduit" readonly='readonly' value="<%=offer.getLeTypeDeProduit().getNomTypeProduit() %>">  
                
                <label class="label" for="Description">Description : </label>
                <input class="form-control" type="text" name="Description" readonly='readonly' value="<%=offer.getDescriptionOffreContractuelle() %>" size="40" maxlength="45" />
              
                <label class="label" for="LAssureur">Assureur : </label>
                <input class="form-control" type='text' name='LAssureur' readonly='readonly' value='<%=offer.getLAssurance().getRaisonSocialeAssureur() %>'>

                <label class="label" for="Prix">Prix de l'offre de l'assureur </label>
                <input class="form-control" type="text" name="Prix" readonly='readonly' Value="<%=offer.getPrixOffre() %>" size="40" maxlength="100" /> 
                
                   <label class="label" for="PrixOffre">Prix négocié auprès de l'assureur </label>
                <input class="form-control" type="text" name="PrixOffre" Value="" size="40" maxlength="100" /> 
            
                
               
           <div class ="row justify content-center"> 
            <button type="submit" class="form-control btn btn-primary submit px-3">Créer L'offre</button>
             <input type="hidden" name="action" value="FormCreerOffreCourtierVia">
           </div>
        </form>
                        </div>
                  </div>
                    </div>
                </div>
                </section>
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

