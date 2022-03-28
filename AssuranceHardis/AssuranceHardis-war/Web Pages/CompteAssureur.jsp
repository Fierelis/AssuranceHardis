<%-- 
    Document   : CompteCourtier
    Created on : 10 mars 2022, 09:49:44
    Author     : alex_
--%>

<%@page import="Modele.Assureur"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:useBean id="Assureur" scope="request" class="Modele.Assureur"></jsp:useBean>
            <title>JSP Page</title>
            <link href="StyleSheets/style.css" rel="stylesheet" type="text/css"/>
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
                            <li> <form> <button type="submit" class="form-control btn1 btn1-primary submit px-3">Créer une offre</button>
                                    <input type="hidden" name="action" value="CreerOffreAssureur"></form></li>
                                    <li> <form> <button type="submit" class="form-control btn1 btn1-primary submit px-3">Compte Assureur</button>
                            <input type="hidden" name="action" value="CompteAssureur"></form></li>
                            <li> <form> <button type="submit" class="form-control btn1 btn1-primary submit px-3">Se déconnecter</button>
                                    <input type="hidden" name="action" value="Deconnexion"></form></li>
                        </ul>
                    </div>
                </nav>
            </div>


        </header>
    </head>
    <body>

    <%Assureur Assur = Assureur;%>

    <section class="ftco-section">

        <div class="container">


            <div class="row justify-content-center">



                <div class="text-wrapp p-4 p-lg-5">

                    <form class="signin-form">
                            <div class="w-100">
                                        <h3 class="mb-4">Vos informations : <%=Assur.getRaisonSocialeAssureur()%></h3>
                                    </div>

                        <label class="label" name="IdAssur">Identifiant :</label>
                        <input class="form-control" type="text" name="IdAssur" readonly="readonly" value="<%=Assur.getId()%>">

                        <label class="label" name="RaisonSocialeAssur">Raison Sociale : </label>             
                        <input class="form-control" type="text" name="RaisonSocialeAssur" value="<%=Assur.getRaisonSocialeAssureur()%>">

                        <label class="label" name="SiegeSocialAssur">RSiege Social : </label>             
                        <input class="form-control" type="text" name="SiegeSocialAssur" value="<%=Assur.getSiegeSocialAssureur()%>">

                        <label class="label" name="DateCreationAssur">Date Création : </label>  
                        <input class="form-control" type="date" name="DateCreationAssur" readonly="readonly" value="<%=Assur.getDateCreation()%>">

                        <label class="label" name="DateCreationAssur">SIREN : </label>  
                        <input class="form-control" type="number" name="SirenAssur" readonly="readonly" value="<%=Assur.getSirenAssureur()%>">

                        <label class="label" name="MailAssur"> Mail : </label>               
                        <input class="form-control" type="text" name="MailAssur" value="<%=Assur.getMailAssureur()%>">

                        <label class="label" name="LoginAssur">Login : </label>           
                        <input class="form-control" type="text" name="LoginAssur" value="<%=Assur.getLoginUserService()%>">

                        <label class="label" name="MdpAssur">Mot de Passe : </label> 
                        <input class="form-control" type="password" name="MdpAssur" id ="monmdp" value="<%=Assur.getPasswordUserService()%>">
                        <input type="checkbox" onclick="myFunctionP()"> Voir le mot de passe
                        <br>




                        <input type="hidden" name="action" value="ModifierInfoAssureur">
                        <button type="submit" name="action" class="form-control btn btn-primary submit px-3">Valider les modifications</button>


                    </form>
                </div>


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
</body>
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
</html>
