<%-- 
    Document   : CompteCourtier
    Created on : 10 mars 2022, 09:49:44
    Author     : alex_
--%>

<%@page import="Modele.Entreprise"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="StyleSheets/style.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:useBean id="Entreprise" scope="request" class="Modele.Entreprise"></jsp:useBean>
        <title>JSP Page</title>
    </head>
    <header class ="header1">
        <div class = "" id = "navbar">
            <nav class="navbar navbar-expand-lg">
                <img src = "img/sobrero.png" style = "height : 30px">  </img>
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
        <center>
        <h1>Informations Entreprise</h1>
        
        <%Entreprise EBoite = Entreprise; 
        %>
          
  <section class="ftco-section">

            <div class="container">

                <div class="row justify-content-center">
                    <div class="col-md-12 col-lg-10">
                        <form class="signin-form">
                            <div class="wrap d-md-flex">
                                <div class="text-wrapp p-4 p-lg-5">



                                    <div class="form-group mb-3">
                                        <label class="label" for="LoginEntreprise">N°Utilisateur</label>
                                        <input type="text" class="form-control" name="IdEntreprise" readonly="readonly" value="<%=EBoite.getId()%>" required>
                                    </div>
                                    <div class="form-group mb-3">
                                        <label class="label" for="LoginEntreprise">Identifiant</label>
                                        <input type="text" class="form-control" name ="LoginEntreprise" value="<%=EBoite.getLogin() %>" required>
                                    </div>
                                    <div class="form-group mb-3">
                                        <label class="label" for="name">Mot de passe</label>
                                        <input type="password" class="form-control" name ="MdpEntreprise" value="<%=EBoite.getMdp()%>" id ="monmdp" required>
                                        <input type="checkbox" onclick="myFunctionP()"> Voir le mot de passe
                                    </div>
                                    <div class="form-group mb-3">
                                        <label class="label" for="name">Raison Sociale</label>
                                        <input type="text" class="form-control" name="NomEntreprise" value="<%=EBoite.getRaisonSocialeEntreprise() %>" required>
                                    </div>
                                     <br/>


                                </div>
                                <div class="login-wrap p-4 p-lg-5">




                                    <div class="form-group">
                                        <div class="form-group mb-3">
                                            <label class="label" for="Email">Adresse mail</label>
                                            <input type="text" class="form-control" name ="MailEntreprise" value="<%=EBoite.getMail() %>" required>
                                        </div>

                                        <div class="form-group">
                                            <div class="form-group mb-3">
                                                <label class="label" for="SiegeSocial">Siège sociale</label>
                                                <input type="text" class="form-control" name ="SiegeSocialEntreprise" value="<%=EBoite.getSiegeSocialEntreprise() %>"required>
                                            </div>

                                            <div class="form-group mb-3">
                                                <label class="label" for="Iban">Taille de l'entreprise</label>
                                                <select class="js-multiple-select form-control" name ="TailleEntreprise" value="<%=EBoite.getTailleEntreprise() %>">
                                                    <option>Petite</option>
                                                    <option>Moyenne</option>
                                                    <option>Grande</option>

                                                </select>
                                            </div>

                                            <div class="form-group">
                                                <div class ="row justify content-center">
                                                    <button type="hidden" class="form-control btn btn-primary submit px-3">Valider les changements</button>
                                                    <input type="hidden" name="action" value="ModifierInfoEntreprise">
                                                </div>

                                            </div>



                                        </div>

                                    </div>

                                </div>
                            </div>
                        </form>
                    </div>
                    </section>

                    <script src="js/jquery.min.js"></script>
                    <script src="js/popper.js"></script>
                    <script src="js/bootstrap.min.js"></script>
                    <script src="js/main.js"></script>
                    <script>
                                            function myFunctionP() {
                                                var x = document.getElementById("monmdp");
                                                if (x.type === "password") {
                                                    x.type = "text";
                                                } else {
                                                    x.type = "password";
                                                }
                                            }</script>

        
        <form>
            
                   
            <input type="hidden" name="action" value="ModifierInfoEntreprise">
            <input id="valid" type="submit" name="Valider" value="Valider les changements">
       </center>
        </form>
            <footer class="footer-1">
          
          <div class="container">
            <div class="row">
              <div class="col-md-4 pr-md-5">
                <a href="#" class="footer-site-logo d-block mb-4">Sombrero</a>
                <p>Comparateur d'assuranceh</p>
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
